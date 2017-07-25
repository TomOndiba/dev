CREATE procedure [privy].[InvoiceRefresh]
(
  @LoadStart datetime
, @DebugLevel tinyint = 0
, @RowsAffected int = null out
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		privy.InvoiceRefresh
DESCRIPTION:		Merges any changes from the QlikView source into the staging area ready for consumption by the
					QV-to-IDW ETL process
ORIGIN DATE:		13-JUN-2017
ORIGINAL AUTHOR:	Greg M. Lucas

Returns
=======
@@Error - always zero on success

Additional Notes
================

REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		13-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------
002		13-JUL-2017		GML		BSR-101	Revised Uniquifier logic to prefer most recently updated active duplicate
------- ------------	------	-------	-----------------------------------------------------------------------------
003		25-JUL-2017		GML		BSR-132	Further revised Uniquifier logic mark all non-preferred dupes as inactive
------- ------------	------	-------	-----------------------------------------------------------------------------

**********************************************************************************************************************/
--</CommentHeader>

begin
	set nocount on;

	--! Journal Constants
	declare @SEVERITY_CRITICAL int = 1;
	declare @SEVERITY_SEVERE int = 2;
	declare @SEVERITY_MAJOR int = 4;
	declare @SEVERITY_MODERATE int = 8;
	declare @SEVERITY_MINOR int = 16;
	declare @SEVERITY_CONCURRENCY int = 32;
	declare @SEVERITY_INFORMATION int = 256;
	declare @SEVERITY_SUCCESS int = 512;
	declare @SEVERITY_DEBUG int = 1024;

	--! Standard/ExceptionHandler variables
	declare	@_FunctionName nvarchar(255) = quotename(object_schema_name(@@procid)) + '.' + quotename(object_name(@@procid));
	declare	@_Error int = 0;
	declare @_RowCount int = 0;
	declare @_ReturnValue int = 0;
	declare	@_Message nvarchar(512);
	declare	@_ErrorContext nvarchar(512);
	declare	@_SprocStartTime datetime = getdate()
	declare	@_StepStartTime datetime
	declare	@_StepEndTime datetime
	declare	@_Step varchar(128);
	declare	@_ProgressMessage varchar(2000)
	declare	@_ExceptionId int
	declare @_JournalOnOff varchar(3) = log4.GetJournalControl(@_FunctionName, null);
	declare @_Severity smallint = @SEVERITY_INFORMATION;
	declare @_ProgressLog nvarchar(max);
	declare @_RowsAffected int = 0;
	declare @_JobName nvarchar(128) = 'QlikView Staging Data' ;

	set @_ProgressMessage = @_FunctionName
			+ ' starting at ' + coalesce(convert(varchar(24), @_SprocStartTime, 120), '') + ' with inputs: '
			+ char(10) + '    @LoadStart   : ' + coalesce(convert(varchar(24), @LoadStart, 120), '')
			+ char(10) + '    @DebugLevel      : ' + coalesce(cast(@DebugLevel as varchar(16)), 'NULL')
			+ char(10)
	set @_ProgressLog = @_ProgressMessage;

	/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
	/**/ if @DebugLevel > 5
	/**/     begin
	/**/         raiserror('', 0, 1) with nowait;
	/**/         raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
	/**/     end
	/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

	--! Find out if we are already in a transaction
	declare	@_TxnIsExternal bit = case when @@trancount > 0 then 1 else 0 end;

	begin try
		--!
		--!
		--!
		set @_Step = 'Collect Load Parameters';
		set @_StepStartTime = getdate();

		declare @_ParameterSource varchar(200), @_DataCaptureStart datetime, @_DataCaptureEnd datetime;
		select
			  @_ParameterSource = ModuleName
			, @_DataCaptureStart = DataCaptureStart
			, @_DataCaptureEnd = DataCaptureEnd
		from
			privy.GetLoadParameters(@_FunctionName)

		set @_ProgressMessage = 'Load Parameter Values:'
				+ char(10) + '    Parameter Value Source  : ' + coalesce(@_ParameterSource, 'NULL')
				+ char(10) + '    Data Capture Start      : ' + coalesce(convert(varchar(24), @_DataCaptureStart, 120), '')
				+ char(10) + '    Data Capture End        : ' + coalesce(convert(varchar(24), @_DataCaptureEnd, 120), '')
				+ char(10) + cast(datediff(millisecond, @_StepStartTime, getdate()) as varchar(16)) + ' milliseconds to fetch load parameters'
				+ char(10)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 5
		/**/     begin
		/**/         raiserror('', 0, 1) with nowait;
		/**/         raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/**/     end
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

		if @_DataCaptureStart is null
			raiserror('Load Parameter: Data Capture Start cannot be null', 16, 1);

		if @_DataCaptureStart is null
			raiserror('Load Parameter: Data Capture Start cannot be null', 16, 1);

		--!
		--!
		--!
		set @_Step = 'Collect Runtime Parameters';
		set @_StepStartTime = getdate();

		declare @_UnmappedPaymentTerm varchar(50) = (select TEKST from [$(Icopal_profBIS)].dbo.FLEXPARAMS where PARAMTYPE = 'DWH' and PARAMNAVN = 'PAYMENT_UNMAPPED') ;
		declare @_UnmappedProductCategory varchar(50) = (select TEKST from [$(Icopal_profBIS)].dbo.FLEXPARAMS where PARAMTYPE = 'DWH' and PARAMNAVN = 'SA_UNMAPPED_ITEM') ;
		declare @_ExcludeFromQlikViewProductCategory varchar(50) = (select TEKST from [$(Icopal_profBIS)].dbo.FLEXPARAMS where PARAMTYPE = 'DWH' and PARAMNAVN = 'SALES_NOT_QLIKVIEW') ;
		declare @_ExcludeFromQlikViewCustomerCategory varchar(50) = (select TEKST from [$(Icopal_profBIS)].dbo.FLEXPARAMS where PARAMTYPE = 'DWH' and PARAMNAVN = 'CUSTOMER_NOT_EXPORTED') ;

		set @_ProgressMessage = 'Parameter Values:'
				+ char(10) + '    Unmapped Payment Term                    : ' + coalesce(@_UnmappedPaymentTerm, 'NULL')
				+ char(10) + '    Unmapped Product Category                : ' + coalesce(@_UnmappedProductCategory, 'NULL')
				+ char(10) + '    Exclude From QlikView Product Category   : ' + coalesce(@_ExcludeFromQlikViewProductCategory, 'NULL')
				+ char(10) + '    Exclude From QlikView Customer Category  : ' + coalesce(@_ExcludeFromQlikViewCustomerCategory, 'NULL')
				+ char(10) + cast(datediff(millisecond, @_StepStartTime, getdate()) as varchar(16)) + ' milliseconds to fetch runtime parameters'
				+ char(10)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 5
		/**/     begin
		/**/         raiserror('', 0, 1) with nowait;
		/**/         raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/**/     end
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

		--!
		--!
		--!
		set @_Step = 'Generate Working Values';
		set @_StepStartTime = getdate();

		declare @_UnmappedPaymentTermId int ;
		if len(@_UnmappedPaymentTerm) > 0 and isnumeric(@_UnmappedPaymentTerm) = 1
			set @_UnmappedPaymentTermId = cast(@_UnmappedPaymentTerm as int)

		declare @_UnmappedProductCategoryId int ;
		if len(@_UnmappedProductCategory) > 0 and isnumeric(@_UnmappedProductCategory) = 1
			set @_UnmappedProductCategoryId = cast(@_UnmappedProductCategory as int)

		declare @_ExcludeFromQlikViewProductCategoryId int ;
		if len(@_ExcludeFromQlikViewProductCategory) > 0 and isnumeric(@_ExcludeFromQlikViewProductCategory) = 1
			set @_ExcludeFromQlikViewProductCategoryId = cast(@_ExcludeFromQlikViewProductCategory as int)
		else
			set @_ExcludeFromQlikViewProductCategoryId = -2 ;

		if @_ExcludeFromQlikViewProductCategoryId is null
			raiserror('Product Category Id to exclude from QlikView extract cannot be identified', 16, 1);

		declare @_ExcludeFromQlikViewCustomerCategoryId int ;
		if len(@_ExcludeFromQlikViewCustomerCategory) > 0 and isnumeric(@_ExcludeFromQlikViewCustomerCategory) = 1
			set @_ExcludeFromQlikViewCustomerCategoryId = cast(@_ExcludeFromQlikViewCustomerCategory as int)
		else
			set @_ExcludeFromQlikViewCustomerCategoryId = -2 ;

		if @_ExcludeFromQlikViewCustomerCategoryId is null
			raiserror('Customer Category Id to exclude from QlikView extract cannot be identified', 16, 1);

		set @_ProgressMessage = 'Working Values:'
				+ char(10) + '    Unmapped Payment Term Id                    : ' + coalesce(cast(@_UnmappedPaymentTermId as varchar(16)), 'NULL')
				+ char(10) + '    Unmapped Product Category Id                : ' + coalesce(cast(@_UnmappedProductCategoryId as varchar(16)), 'NULL')
				+ char(10) + '    Exclude From QlikView Product Category Id   : ' + coalesce(cast(@_ExcludeFromQlikViewProductCategoryId as varchar(16)), 'NULL')
				+ char(10) + '    Exclude From QlikView Customer Category Id  : ' + coalesce(cast(@_ExcludeFromQlikViewCustomerCategoryId as varchar(16)), 'NULL')
				+ char(10) + cast(datediff(millisecond, @_StepStartTime, getdate()) as varchar(16)) + ' milliseconds to generate working values'
				+ char(10)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 5
		/**/     begin
		/**/         raiserror('', 0, 1) with nowait;
		/**/         raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/**/     end
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

		--! If there no outer transaction, use an explicit transaction so we can roll this piece back if required 
		if @_TxnIsExternal = 0 begin tran;

		set @_Step = 'Upsert Main'
		set @_StepStartTime = getdate();

		;with sourceCte
		as
		(
			--! The following columns are defined as NOT NULL on the source table: REC_ID, SYSTEM_ID, SITE_SOLD, INVOICE_NUMBER, INVOICE_LINE_NUMBER
			--! In the first pass we use REC_ID (a GUID) to uniquely identify each source record.  Then later, we use the following columns to de-dupe:
			--! SYSTEM_ID, INVOICE_NUMBER, ORDER_NUMBER, INVOICE_LINE_NUMBER, ORDER_LINE_NUMBER
			select
				  inv.REC_ID
				, inv.SYSTEM_ID
				, inv.INVOICE_DATE
				, inv.INVOICE_NUMBER as [INVOICE_NUMBER]
				, inv.INVOICE_LINE_NUMBER as [INVOICE_LINE_NUMBER]
				, coalesce(inv.ORDER_NUMBER, '') as [ORDER_NUMBER]
				, coalesce(inv.ORDER_LINE_NUMBER, '') as [ORDER_LINE_NUMBER]
				, coalesce(tgt.Uniqueifier, 1) as [Uniqueifier] -- assume no dupes on new records for now (we check properly later)
				-----------------------------------------------------------------------------------------------------------------------
				, coalesce(inv.INVOICE_TYPE, '') as [INVOICE_TYPE]
				, case coalesce(inv.INVOICE_TYPE, '')
					when '1' then 'TODO: Define Invoice Type (' + coalesce(inv.INVOICE_TYPE, '') + ')'
					when '2' then 'TODO: Define Invoice Type (' + coalesce(inv.INVOICE_TYPE, '') + ')'
					when '9' then 'TODO: Define Invoice Type (' + coalesce(inv.INVOICE_TYPE, '') + ')'
					when '' then 'Not Specified At Source'
					else 'Lookup Not Found (' + coalesce(inv.INVOICE_TYPE, '') + ')'
				  end as [InvoiceTypeName]
				-----------------------------------------------------------------------------------------------------------------------
				, inv.SITE_SOLD as [LOCAL_SITE_SOLD]
				, ssite.SITE_ID -- Don't need to collect SBU from this as per V_SA_INVOICE as we will expose SiteKey in the view later
				-----------------------------------------------------------------------------------------------------------------------
				, coalesce(inv.ITEM_NO, '') as [ITEM_NO]
				, coalesce(pCat.ITEM_CATEGORY_ID, @_UnmappedProductCategoryId) as [ITEM_CATEGORY_ID]
				, EnvPcat.ENV_CATEGORY_ID
				-----------------------------------------------------------------------------------------------------------------------
				, coalesce(inv.SOLD_TO, '') as [SOLD_TO_CUSTOMER_NO]
				, coalesce(inv.SHIP_TO, '') as [SHIP_TO_CUSTOMER_NO]
				-----------------------------------------------------------------------------------------------------------------------
				, coalesce(inv.SALESPERSON_ID, '') as [SALESPERSON_ID]
				, coalesce(inv.SALESPERSON_NAME, '') as [SALESPERSON_NAME]
				-----------------------------------------------------------------------------------------------------------------------
				, inv.DELIVERY_DATE
				, inv.EXPECTED_PAYMENT_DATE
				, inv.ACTUAL_PAYMENT_DATE
				, coalesce(inv.DELIVERY_TERM, '') as [LOCAL_DELIVERY_TERM] -- probably unrelated to PU_DELIVERYTERM which is empty anyway
				, coalesce(inv.DELIVERY_TERM_TEXT, '') as [LOCAL_DELIVERY_TERM_TEXT]
				, coalesce(lpt.PAYMENTTERM_ID, @_UnmappedPaymentTermId) as [PAYMENT_TERM_ID]
				, coalesce(inv.PAYMENT_TERM, '') as [LOCAL_PAYMENT_TERM]
				, coalesce(inv.PAYMENT_TERM_TEXT, '') as [LOCAL_PAYMENT_TERM_TEXT]
				-----------------------------------------------------------------------------------------------------------------------
				, inv.INVOICE_QUANTITY
				, coalesce(inv.INVOICE_UOM, '') as [INVOICE_UOM]
				, inv.STATISTIC_QUANTITY
				, coalesce( inv.STATISTIC_UOM, '') as [STATISTIC_UOM]
				, inv.QUANTITY
				-----------------------------------------------------------------------------------------------------------------------
				, coalesce(inv.UOM, '') as [LOCAL_UOM]
				, coalesce(lUom.HARMONIZED_UOM, '') as [LOCAL_UOM_HARMONIZED]
				, lUom.FACTOR as [LOCAL_UOM_FACTOR]
				-----------------------------------------------------------------------------------------------------------------------
				, inv.INVOICE_AMOUNT
				, inv.LOCAL_AMOUNT
				, inv.GROUP_AMOUNT
				, coalesce(inv.INVOICE_CURRENCY, '') as [INVOICE_CURRENCY]
				, coalesce(inv.LOCAL_CURRENCY, '') as [LOCAL_CURRENCY]
				-----------------------------------------------------------------------------------------------------------------------
				, inv.LINE_DISCOUNT_AMOUNT
				, inv.INVOICE_DISCOUNT_AMOUNT
				, inv.LINE_BONUS_AMOUNT
				, inv.BONUS_SHARE_AMOUNT
				, inv.STD_COST
				, inv.STD_FREIGHT
				---------------------------------------------------------------------------------------------------
				--! Encapsulate ALL non-key columns into a hash value to speed up CDC checks during susbseqent loads
				, privy.InvoiceDeltaHash
					(
					  coalesce(tgt.Uniqueifier, 1)
					, inv.SYSTEM_ID
					, inv.INVOICE_NUMBER
					, inv.ORDER_NUMBER
					, inv.INVOICE_LINE_NUMBER
					, inv.ORDER_LINE_NUMBER
					, inv.INVOICE_DATE
					, inv.INVOICE_TYPE
					, case coalesce(inv.INVOICE_TYPE, '')
						when '1' then 'TODO: Define Invoice Type (' + coalesce(inv.INVOICE_TYPE, '') + ')'
						when '2' then 'TODO: Define Invoice Type (' + coalesce(inv.INVOICE_TYPE, '') + ')'
						when '9' then 'TODO: Define Invoice Type (' + coalesce(inv.INVOICE_TYPE, '') + ')'
						when '' then 'Not Specified At Source'
						else 'Lookup Not Found (' + coalesce(inv.INVOICE_TYPE, '') + ')'
					  end -- InvoiceTypeName
					, inv.SITE_SOLD
					, ssite.SITE_ID
					, inv.ITEM_NO
					, coalesce(pCat.ITEM_CATEGORY_ID, @_UnmappedProductCategoryId)
					, EnvPcat.ENV_CATEGORY_ID
					, inv.SOLD_TO
					, inv.SHIP_TO
					, inv.SALESPERSON_ID
					, inv.SALESPERSON_NAME
					, inv.DELIVERY_DATE
					, inv.EXPECTED_PAYMENT_DATE
					, inv.ACTUAL_PAYMENT_DATE
					, inv.DELIVERY_TERM
					, inv.DELIVERY_TERM_TEXT
					, coalesce(lpt.PAYMENTTERM_ID, @_UnmappedPaymentTermId)
					, inv.PAYMENT_TERM
					, inv.PAYMENT_TERM_TEXT
					, inv.INVOICE_QUANTITY
					, inv.INVOICE_UOM
					, inv.STATISTIC_QUANTITY
					, inv.STATISTIC_UOM
					, inv.QUANTITY
					, inv.UOM
					, lUom.HARMONIZED_UOM
					, lUom.FACTOR
					, inv.INVOICE_AMOUNT
					, inv.LOCAL_AMOUNT
					, inv.GROUP_AMOUNT
					, inv.INVOICE_CURRENCY
					, inv.LOCAL_CURRENCY
					, inv.LINE_DISCOUNT_AMOUNT
					, inv.INVOICE_DISCOUNT_AMOUNT
					, inv.LINE_BONUS_AMOUNT
					, inv.BONUS_SHARE_AMOUNT
					, inv.STD_COST
					, inv.STD_FREIGHT
					) as [EtlDeltaHash]
				---------------------------------------------------------------------------------------------------
				, coalesce(tgt.Uniqueifier, 1) as [CurrentUniqueifier]
			from
				[$(Icopal_profBIS)].dbo.SA_INVOICE as inv
			inner join [$(Icopal_profBIS)].dbo.PU_LINK_SITE as ssite
				on ssite.SYSTEM_ID = inv.SYSTEM_ID
				and ssite.LOCAL_SITE = inv.SITE_SOLD
			inner join [$(Icopal_profBIS)].dbo.MD_SITE as msite
				on msite.SITE_ID = ssite.SITE_ID
			--! Make sure we can filter for just invoices belonging to SBUs where SABIS is true
			inner join [$(Icopal_profBIS)].dbo.MD_SBU as sbu
				on sbu.SBU   = msite.SBU
			left outer join [$(Icopal_profBIS)].dbo.PU_LINK_UOM as lUom
				on lUom.SYSTEM_ID = inv.SYSTEM_ID
				and lUom.LOCAL_UOM = inv.UOM
			left outer join [$(Icopal_profBIS)].dbo.SA_LINK_ITEM as pCat
				on pCat.SYSTEM_ID = inv.SYSTEM_ID
				and pCat.ITEM_NO = inv.ITEM_NO
			left outer join [$(Icopal_profBIS)].dbo.SA_LINK_ENV as EnvPcat
				on EnvPcat.SYSTEM_ID = inv.SYSTEM_ID
				and EnvPcat.ITEM_NO = inv.ITEM_NO
			left outer join [$(Icopal_profBIS)].dbo.SA_LINK_CUSTOMER as lcc 
				on lcc.SYSTEM_ID = inv.SYSTEM_ID
				and lcc.CUSTOMER_NO = inv.SHIP_TO
			left outer join [$(Icopal_profBIS)].dbo.PU_LINK_PAYMENTTERM as lpt
				on lpt.SYSTEM_ID = inv.SYSTEM_ID
				and lpt.PAYMENT_TERM = inv.PAYMENT_TERM
			left join stg.Invoice as tgt
				on tgt.REC_ID = inv.REC_ID
			where
					inv.INVOICE_DATE between @_DataCaptureStart and @_DataCaptureEnd
				--! Replicate all the filters used in Icopal_profBIS.dbo.V_SA_INVOICE (except date)
				and sbu.SABIS = 'Y'
				and inv.INVOICE_TYPE in ('1', '2', '9')
				and isnull(pCat.ITEM_CATEGORY_ID, -1) <> @_ExcludeFromQlikViewProductCategoryId
				and isnull(lcc.CUSTOMER_CATEGORY_ID, -1) <> @_ExcludeFromQlikViewCustomerCategoryId
		)
		merge into stg.Invoice as tgt
		using sourceCte as src
			on src.REC_ID = tgt.REC_ID
		when not matched by target
			then insert
			(  
			  EtlDeltaHash
			, EtlCreatedOn
			, EtlCreatedBy
			, EtlUpdatedOn
			, EtlUpdatedBy
			, EtlDeletedOn
			, EtlDeletedBy
			, IsDeleted
			, REC_ID
			, SYSTEM_ID
			, INVOICE_DATE
			, INVOICE_NUMBER
			, INVOICE_LINE_NUMBER
			, ORDER_NUMBER
			, ORDER_LINE_NUMBER
			, INVOICE_TYPE
			, InvoiceTypeName
			, LOCAL_SITE_SOLD
			, SITE_ID
			, ITEM_NO
			, ITEM_CATEGORY_ID
			, ENV_CATEGORY_ID
			, SOLD_TO_CUSTOMER_NO
			, SHIP_TO_CUSTOMER_NO
			, SALESPERSON_ID
			, SALESPERSON_NAME
			, DELIVERY_DATE
			, EXPECTED_PAYMENT_DATE
			, ACTUAL_PAYMENT_DATE
			, LOCAL_DELIVERY_TERM
			, LOCAL_DELIVERY_TERM_TEXT
			, PAYMENT_TERM_ID
			, LOCAL_PAYMENT_TERM
			, LOCAL_PAYMENT_TERM_TEXT
			, INVOICE_QUANTITY
			, INVOICE_UOM
			, STATISTIC_QUANTITY
			, STATISTIC_UOM
			, QUANTITY
			, LOCAL_UOM
			, LOCAL_UOM_HARMONIZED
			, LOCAL_UOM_FACTOR
			, INVOICE_AMOUNT
			, LOCAL_AMOUNT
			, GROUP_AMOUNT
			, INVOICE_CURRENCY
			, LOCAL_CURRENCY
			, LINE_DISCOUNT_AMOUNT
			, INVOICE_DISCOUNT_AMOUNT
			, LINE_BONUS_AMOUNT
			, BONUS_SHARE_AMOUNT
			, STD_COST
			, STD_FREIGHT
			)
			values
			(  
			  src.EtlDeltaHash
			, @LoadStart
			, @_FunctionName
			, @LoadStart
			, @_FunctionName
			, null -- EtlDeletedOn
			, null -- EtlDeletedBy
			, 'N' -- IsDeleted
			, src.REC_ID
			, src.SYSTEM_ID
			, src.INVOICE_DATE
			, src.INVOICE_NUMBER
			, src.INVOICE_LINE_NUMBER
			, src.ORDER_NUMBER
			, src.ORDER_LINE_NUMBER
			, src.INVOICE_TYPE
			, src.InvoiceTypeName
			, src.LOCAL_SITE_SOLD
			, src.SITE_ID
			, src.ITEM_NO
			, src.ITEM_CATEGORY_ID
			, src.ENV_CATEGORY_ID
			, src.SOLD_TO_CUSTOMER_NO
			, src.SHIP_TO_CUSTOMER_NO
			, src.SALESPERSON_ID
			, src.SALESPERSON_NAME
			, src.DELIVERY_DATE
			, src.EXPECTED_PAYMENT_DATE
			, src.ACTUAL_PAYMENT_DATE
			, src.LOCAL_DELIVERY_TERM
			, src.LOCAL_DELIVERY_TERM_TEXT
			, src.PAYMENT_TERM_ID
			, src.LOCAL_PAYMENT_TERM
			, src.LOCAL_PAYMENT_TERM_TEXT
			, src.INVOICE_QUANTITY
			, src.INVOICE_UOM
			, src.STATISTIC_QUANTITY
			, src.STATISTIC_UOM
			, src.QUANTITY
			, src.LOCAL_UOM
			, src.LOCAL_UOM_HARMONIZED
			, src.LOCAL_UOM_FACTOR
			, src.INVOICE_AMOUNT
			, src.LOCAL_AMOUNT
			, src.GROUP_AMOUNT
			, src.INVOICE_CURRENCY
			, src.LOCAL_CURRENCY
			, src.LINE_DISCOUNT_AMOUNT
			, src.INVOICE_DISCOUNT_AMOUNT
			, src.LINE_BONUS_AMOUNT
			, src.BONUS_SHARE_AMOUNT
			, src.STD_COST
			, src.STD_FREIGHT
			)
		--! If any value has changed or a previously soft-deleted record re-appears then update
		when matched and tgt.EtlDeltaHash <> src.EtlDeltaHash or (tgt.IsDeleted = 'Y' and src.CurrentUniqueifier = 1)
			then update set
					  tgt.EtlDeltaHash = src.EtlDeltaHash
					, tgt.EtlUpdatedOn = @LoadStart
					, tgt.EtlUpdatedBy = @_FunctionName
					, tgt.IsDeleted = case when src.CurrentUniqueifier > 1 then 'Y' else 'N' end
					, tgt.SYSTEM_ID = src.SYSTEM_ID
					, tgt.INVOICE_NUMBER = src.INVOICE_NUMBER
					, tgt.INVOICE_LINE_NUMBER = src.INVOICE_LINE_NUMBER
					, tgt.ORDER_NUMBER = src.ORDER_NUMBER
					, tgt.ORDER_LINE_NUMBER = src.ORDER_LINE_NUMBER
					, tgt.INVOICE_DATE = src.INVOICE_DATE
					, tgt.INVOICE_TYPE = src.INVOICE_TYPE
					, tgt.InvoiceTypeName = src.InvoiceTypeName
					, tgt.LOCAL_SITE_SOLD = src.LOCAL_SITE_SOLD
					, tgt.SITE_ID = src.SITE_ID
					, tgt.ITEM_NO = src.ITEM_NO
					, tgt.ITEM_CATEGORY_ID = src.ITEM_CATEGORY_ID
					, tgt.ENV_CATEGORY_ID = src.ENV_CATEGORY_ID
					, tgt.SOLD_TO_CUSTOMER_NO = src.SOLD_TO_CUSTOMER_NO
					, tgt.SHIP_TO_CUSTOMER_NO = src.SHIP_TO_CUSTOMER_NO
					, tgt.SALESPERSON_ID = src.SALESPERSON_ID
					, tgt.SALESPERSON_NAME = src.SALESPERSON_NAME
					, tgt.DELIVERY_DATE = src.DELIVERY_DATE
					, tgt.EXPECTED_PAYMENT_DATE = src.EXPECTED_PAYMENT_DATE
					, tgt.ACTUAL_PAYMENT_DATE = src.ACTUAL_PAYMENT_DATE
					, tgt.LOCAL_DELIVERY_TERM = src.LOCAL_DELIVERY_TERM
					, tgt.LOCAL_DELIVERY_TERM_TEXT = src.LOCAL_DELIVERY_TERM_TEXT
					, tgt.PAYMENT_TERM_ID = src.PAYMENT_TERM_ID
					, tgt.LOCAL_PAYMENT_TERM = src.LOCAL_PAYMENT_TERM
					, tgt.LOCAL_PAYMENT_TERM_TEXT = src.LOCAL_PAYMENT_TERM_TEXT
					, tgt.INVOICE_QUANTITY = src.INVOICE_QUANTITY
					, tgt.INVOICE_UOM = src.INVOICE_UOM
					, tgt.STATISTIC_QUANTITY = src.STATISTIC_QUANTITY
					, tgt.STATISTIC_UOM = src.STATISTIC_UOM
					, tgt.QUANTITY = src.QUANTITY
					, tgt.LOCAL_UOM = src.LOCAL_UOM
					, tgt.LOCAL_UOM_HARMONIZED = src.LOCAL_UOM_HARMONIZED
					, tgt.LOCAL_UOM_FACTOR = src.LOCAL_UOM_FACTOR
					, tgt.INVOICE_AMOUNT = src.INVOICE_AMOUNT
					, tgt.LOCAL_AMOUNT = src.LOCAL_AMOUNT
					, tgt.GROUP_AMOUNT = src.GROUP_AMOUNT
					, tgt.INVOICE_CURRENCY = src.INVOICE_CURRENCY
					, tgt.LOCAL_CURRENCY = src.LOCAL_CURRENCY
					, tgt.LINE_DISCOUNT_AMOUNT = src.LINE_DISCOUNT_AMOUNT
					, tgt.INVOICE_DISCOUNT_AMOUNT = src.INVOICE_DISCOUNT_AMOUNT
					, tgt.LINE_BONUS_AMOUNT = src.LINE_BONUS_AMOUNT
					, tgt.BONUS_SHARE_AMOUNT = src.BONUS_SHARE_AMOUNT
					, tgt.STD_COST = src.STD_COST
					, tgt.STD_FREIGHT = src.STD_FREIGHT
		--! If the REC_ID no longer exists at source, the Invoice date is within the capture range and the staging row isn't already inactive then soft-delete
		when not matched by source and (tgt.INVOICE_DATE between @_DataCaptureStart and @_DataCaptureEnd) and tgt.InvoiceKey >= 100 and tgt.IsDeleted = 'N'
			then update set
					  tgt.IsDeleted = 'Y'
					, tgt.EtlDeletedOn = @LoadStart
					, tgt.EtlDeletedBy = @_FunctionName
					, tgt.EtlUpdatedOn = @LoadStart
					, tgt.EtlUpdatedBy = @_FunctionName
		;

		set @RowsAffected = @@rowcount;
		set @_ProgressMessage = 'Step: "' +  @_Step + '" processed ' + coalesce(cast(@RowsAffected as varchar(16)), 'NULL') + ' row(s)'
				+ ' in ' + log4.FormatElapsedTime(@_StepStartTime, null, 3)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 4 raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

		--!
		--! We need to be able to uniqueify transactions that appear duplicated within
		--! QlikView and (new requirement) this needs to be based on last-change-wins
		--! where possible.  Because the QlikView source tables have no ETL audit columns
		--! the closest we can come to this is to pick out recent changes within our own
		--! process - so we have to rank the dupes in a separate step (by ETL Update time)
		--!
		set @_Step = 'Identify Unique Invoices'
		set @_StepStartTime = getdate();
		declare @_UniquifierRowsAffected int;
		--!
		--! Start by finding all duplicates based on SYSTEM_ID, INVOICE_NUMBER, ORDER_NUMBER, INVOICE_LINE_NUMBER and ORDER_LINE_NUMBER
		--!
		;with dupesCte
		as
		(
			select
				  SYSTEM_ID
				, INVOICE_NUMBER
				, ORDER_NUMBER
				, INVOICE_LINE_NUMBER
				, ORDER_LINE_NUMBER
				, count(*) as [DupeCount]
			from
				stg.Invoice
			group by
				  SYSTEM_ID
				, INVOICE_NUMBER
				, ORDER_NUMBER
				, INVOICE_LINE_NUMBER
				, ORDER_LINE_NUMBER
			having count(*) > 1
		)
		, uniqueifiedCte
		as
		(
			select
				  d.SYSTEM_ID
				, d.INVOICE_NUMBER
				, d.ORDER_NUMBER
				, d.INVOICE_LINE_NUMBER
				, d.ORDER_LINE_NUMBER
				, d.DupeCount
				, i.InvoiceKey
				, i.REC_ID
				, i.INVOICE_DATE
				, i.EtlUpdatedOn
				, row_number() over (partition by d.SYSTEM_ID, d.INVOICE_NUMBER, d.ORDER_NUMBER, d.INVOICE_LINE_NUMBER, d.ORDER_LINE_NUMBER order by i.INVOICE_DATE desc, i.EtlUpdatedOn desc, i.InvoiceKey desc) as [Uniqueifier]
			from
				dupesCte as d
			inner join stg.Invoice as i
				on i.SYSTEM_ID = d.SYSTEM_ID
				and i.INVOICE_NUMBER = d.INVOICE_NUMBER
				and i.ORDER_NUMBER = d.ORDER_NUMBER
				and i.INVOICE_LINE_NUMBER = d.INVOICE_LINE_NUMBER
				and i.ORDER_LINE_NUMBER = d.ORDER_LINE_NUMBER
		)
		, finalCte
		as
		(
			select
				  u.InvoiceKey
				, u.Uniqueifier
				, u.SYSTEM_ID
				, u.INVOICE_NUMBER
				, u.ORDER_NUMBER
				, u.INVOICE_LINE_NUMBER
				, u.ORDER_LINE_NUMBER
				, u.INVOICE_DATE
				, u.DupeCount
				, privy.InvoiceDeltaHash
					(
					  u.Uniqueifier
					, i.SYSTEM_ID
					, i.INVOICE_NUMBER
					, i.ORDER_NUMBER
					, i.INVOICE_LINE_NUMBER
					, i.ORDER_LINE_NUMBER
					, i.INVOICE_DATE
					, i.INVOICE_TYPE
					, i.InvoiceTypeName
					, i.LOCAL_SITE_SOLD
					, i.SITE_ID
					, i.ITEM_NO
					, i.ITEM_CATEGORY_ID
					, i.ENV_CATEGORY_ID
					, i.SOLD_TO_CUSTOMER_NO
					, i.SHIP_TO_CUSTOMER_NO
					, i.SALESPERSON_ID
					, i.SALESPERSON_NAME
					, i.DELIVERY_DATE
					, i.EXPECTED_PAYMENT_DATE
					, i.ACTUAL_PAYMENT_DATE
					, i.LOCAL_DELIVERY_TERM
					, i.LOCAL_DELIVERY_TERM_TEXT
					, i.PAYMENT_TERM_ID
					, i.LOCAL_PAYMENT_TERM
					, i.LOCAL_PAYMENT_TERM_TEXT
					, i.INVOICE_QUANTITY
					, i.INVOICE_UOM
					, i.STATISTIC_QUANTITY
					, i.STATISTIC_UOM
					, i.QUANTITY
					, i.LOCAL_UOM
					, i.LOCAL_UOM_HARMONIZED
					, i.LOCAL_UOM_FACTOR
					, i.INVOICE_AMOUNT
					, i.LOCAL_AMOUNT
					, i.GROUP_AMOUNT
					, i.INVOICE_CURRENCY
					, i.LOCAL_CURRENCY
					, i.LINE_DISCOUNT_AMOUNT
					, i.INVOICE_DISCOUNT_AMOUNT
					, i.LINE_BONUS_AMOUNT
					, i.BONUS_SHARE_AMOUNT
					, i.STD_COST
					, i.STD_FREIGHT
					) as [EtlDeltaHash]
			from
				uniqueifiedCte as u
			inner join stg.Invoice as i
				on i.InvoiceKey = u.InvoiceKey
		)
		update
			tgt
		set
			  tgt.Uniqueifier = src.Uniqueifier
			, tgt.DuplicateCount = src.DupeCount
			, tgt.EtlDeltaHash = src.EtlDeltaHash
			, tgt.EtlUpdatedBy = @_FunctionName
			---------------------------------------------------------------------------------------------------
			--! As we use EtlUpdatedOn to find recently updated duplicates only set this for the preferred record
			, tgt.EtlUpdatedOn = case when src.Uniqueifier = 1 then @LoadStart else tgt.EtlUpdatedOn end
			---------------------------------------------------------------------------------------------------
			--! Only the most preferred record of any duplicate should be active
			, tgt.IsDeleted = case
								when tgt.IsDeleted = 'Y' and src.Uniqueifier = 1 then 'N'
								when tgt.IsDeleted = 'N' and src.Uniqueifier > 1 then 'Y'
								else tgt.IsDeleted
							  end
			---------------------------------------------------------------------------------------------------
			, tgt.EtlDeletedOn = case
									when tgt.IsDeleted = 'Y' and src.Uniqueifier = 1 then null
									when tgt.IsDeleted = 'N' and src.Uniqueifier > 1 then @LoadStart
									else tgt.EtlDeletedOn 
								 end
			---------------------------------------------------------------------------------------------------
			, tgt.EtlDeletedBy = case
									when tgt.IsDeleted = 'Y' and src.Uniqueifier = 1 then null
									when tgt.IsDeleted = 'N' and src.Uniqueifier > 1 then @_FunctionName
									else tgt.EtlDeletedBy
								  end
			---------------------------------------------------------------------------------------------------
		from
			stg.Invoice as tgt
		inner join finalCte as src
			on src.InvoiceKey = tgt.InvoiceKey
		where
				tgt.Uniqueifier <> src.Uniqueifier
			or tgt.DuplicateCount <> src.DupeCount
			or tgt.EtlDeltaHash <> src.EtlDeltaHash

		set @_UniquifierRowsAffected = @@rowcount;
		set @_ProgressMessage = 'Step: "' +  @_Step + '" processed ' + coalesce(cast(@_UniquifierRowsAffected as varchar(16)), 'NULL') + ' row(s)'
				+ ' in ' + log4.FormatElapsedTime(@_StepStartTime, null, 3)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 4 raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

		--!
		--! Only commit transactions started within this procedure
		--!
		if @_TxnIsExternal = 0 and (xact_state() = 1 or @@trancount > 0) commit tran ;

		--!
		--! If we get here, every step completed successfully so report final state
		--!
		set @_Message = 'Completed all staging data preparation steps'
		set @_Error = 0 ;
	end try
	begin catch
		set @_ErrorContext = 'Failed to refresh Invoice dimension at step '
			+ coalesce('[' + @_Step + ']', 'NULL');

		--! If we have an uncommittable external transaction (see BOL), or a deadlock
		--! we can't do anything else until we roll that back. Alternatively, if we
		--! started the transaction we should roll it back otherwise or let the caller
		--! handle its own external txn 
		if (xact_state() = -1) or (xact_state() = 1 and error_number() = 1205) or (xact_state() = 1 and @_TxnIsExternal = 0)
			begin
				rollback tran;
				set @_ErrorContext = @_ErrorContext + ' (Forced roll back all changes)';
			end
		
		exec log4.ExceptionHandler
				  @ErrorContext   = @_ErrorContext
				, @ErrorProcedure = @_FunctionName
				, @ErrorNumber    = @_Error out
				, @ReturnMessage  = @_Message out
				, @ExceptionId    = @_ExceptionId out
	end catch

--/////////////////////////////////////////////////////////////////////////////////////////////////
EndProc:
--/////////////////////////////////////////////////////////////////////////////////////////////////

	if @_Error = 0
		begin
			set @_Step = 'OnComplete'
			set @_Severity = @SEVERITY_SUCCESS
			set @_Message = case when len(@_Message) > 450 then substring(@_Message, 1, 450) + '...' else coalesce(@_Message, @_Step) end
							+ ' in a total run time of ' + log4.FormatElapsedTime(@_SprocStartTime, null, 3)
			set @_ProgressLog = @_ProgressLog + char(10) + @_Message
		end
	else
		begin
			set @_Step = coalesce(@_Step, 'OnError')
			set @_Severity = @SEVERITY_SEVERE
			set @_Message = case when len(@_Message) > 450 then substring(@_Message, 1, 450) + '...' else coalesce(@_Message, @_Step) end
							+ ' after a total run time of ' + log4.FormatElapsedTime(@_SprocStartTime, null, 3)
			set @_ProgressLog = @_ProgressLog + char(10) + @_Message
		end

	if @DebugLevel != 0 and @_Severity = @SEVERITY_INFORMATION set @_Severity = @SEVERITY_DEBUG;

	/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
	/**/ if @DebugLevel > 4
	/**/	begin
	/**/		raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_Message) with nowait;
	/**/		raiserror('', 0, 1) with nowait;
	/**/	end
	/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

	if @_JournalOnOff = 'ON'
		exec log4.JournalWriter
				  @Task = @_JobName
				, @FunctionName = @_FunctionName
				, @StepInFunction = @_Step
				, @MessageText = @_Message
				, @ExtraInfo = @_ProgressLog
				, @Severity = @_Severity
				, @ExceptionId = @_ExceptionId

	--! Finally, throw an exception that will be detected by the caller
	if @_Error > 0 raiserror(@_Message, 16, 99);

	set nocount off;

	--! Return the value of @@ERROR (which will be zero on success)
	return (@_Error);
end
go
