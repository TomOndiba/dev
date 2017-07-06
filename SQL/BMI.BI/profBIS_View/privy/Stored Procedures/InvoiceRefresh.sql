create procedure [privy].[InvoiceRefresh]
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
			--! The following columns are defined as NOT NULL on the underlying table: REC_ID, SYSTEM_ID, SITE_SOLD, INVOICE_NUMBER, INVOICE_LINE_NUMBER
			--! We use the following columns to uniquely identify each row: SYSTEM_ID, INVOICE_NUMBER, ORDER_NUMBER, INVOICE_LINE_NUMBER, ORDER_LINE_NUMBER, INVOICE_DATE, Uniqueifier
			select
				  inv.REC_ID
				, inv.SYSTEM_ID
				, inv.INVOICE_DATE
				, inv.INVOICE_NUMBER as [INVOICE_NUMBER]
				, inv.INVOICE_LINE_NUMBER as [INVOICE_LINE_NUMBER]
				, coalesce(inv.ORDER_NUMBER, '') as [ORDER_NUMBER]
				, coalesce(inv.ORDER_LINE_NUMBER, '') as [ORDER_LINE_NUMBER]
				, row_number() over (partition by inv.SYSTEM_ID, inv.INVOICE_NUMBER, inv.ORDER_NUMBER, inv.INVOICE_LINE_NUMBER, inv.ORDER_LINE_NUMBER order by inv.INVOICE_DATE desc, inv.REC_ID) as [Uniqueifier]
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
				-----------------------------------------------------------------------------------------------------------------------
--				, coalesce(inv.MATERIAL_CHAR1, '') as [MATERIAL_CHAR1]
--				, inv.MATERIAL_CHAR1_VALUE
--				, coalesce(inv.MATERIAL_CHAR2, '') as [MATERIAL_CHAR2]
--				, inv.MATERIAL_CHAR2_VALUE
--				, coalesce(inv.MATERIAL_CHAR3, '') as [MATERIAL_CHAR3]
--				, inv.MATERIAL_CHAR3_VALUE
--				, coalesce(inv.MATERIAL_CHAR4, '') as [MATERIAL_CHAR4]
--				, inv.MATERIAL_CHAR4_VALUE
--				, coalesce(inv.MATERIAL_CHAR5, '') as [MATERIAL_CHAR5]
--				, inv.MATERIAL_CHAR5_VALUE
				---------------------------------------------------------------------------------------------------
				--! Encapsulate ALL non-key columns into a hash value to speed up CDC checks during susbseqent loads
				, convert(nvarchar(32), hashbytes('MD5'
					, coalesce(convert(varchar(24), inv.INVOICE_DATE, 120), 'INVOICE_DATE')
						+ coalesce(inv.INVOICE_TYPE, 'INVOICE_TYPE')
						+ case coalesce(inv.INVOICE_TYPE, '')
							when '1' then 'TODO: Define Invoice Type (' + coalesce(inv.INVOICE_TYPE, '') + ')'
							when '2' then 'TODO: Define Invoice Type (' + coalesce(inv.INVOICE_TYPE, '') + ')'
							when '9' then 'TODO: Define Invoice Type (' + coalesce(inv.INVOICE_TYPE, '') + ')'
							when '' then 'Not Specified At Source'
							else 'Lookup Not Found (' + coalesce(inv.INVOICE_TYPE, '') + ')'
						  end
						-----------------------------------------------------------------------------------------------------------------------
						+ coalesce(inv.SITE_SOLD, 'SITE_SOLD')
						+ coalesce(cast(ssite.SITE_ID as nvarchar(30)), 'SITE_ID') -- Don't need to collect SBU from this as per V_SA_INVOICE as we will expose SiteKey in the view later
						-----------------------------------------------------------------------------------------------------------------------
						+ coalesce(inv.ITEM_NO, 'ITEM_NO')
						+ coalesce(cast(coalesce(pCat.ITEM_CATEGORY_ID, @_UnmappedProductCategoryId) as varchar(30)), 'ITEM_CATEGORY_ID')
						+ coalesce(cast(EnvPcat.ENV_CATEGORY_ID as nvarchar(30)), 'ENV_CATEGORY_ID')
						-----------------------------------------------------------------------------------------------------------------------
						+ coalesce(inv.SOLD_TO, 'SOLD_TO')
						+ coalesce(inv.SHIP_TO, 'SHIP_TO')
						-----------------------------------------------------------------------------------------------------------------------
						+ coalesce(inv.SALESPERSON_ID, 'SALESPERSON_ID')
						+ coalesce(inv.SALESPERSON_NAME, 'SALESPERSON_NAME')
						-----------------------------------------------------------------------------------------------------------------------
						+ coalesce(convert(char(19), inv.DELIVERY_DATE, 120), 'DELIVERY_DATE')
						+ coalesce(convert(char(19), inv.EXPECTED_PAYMENT_DATE, 120), 'EXPECTED_PAYMENT_DATE')
						+ coalesce(convert(char(19), inv.ACTUAL_PAYMENT_DATE, 120), 'ACTUAL_PAYMENT_DATE')
						+ coalesce(inv.DELIVERY_TERM, 'DELIVERY_TERM')
						+ coalesce(inv.DELIVERY_TERM_TEXT, 'DELIVERY_TERM_TEXT')
						+ coalesce(cast(coalesce(lpt.PAYMENTTERM_ID, @_UnmappedPaymentTermId) as varchar(30)), 'PAYMENTTERM_ID')
						+ coalesce(inv.PAYMENT_TERM, 'PAYMENT_TERM')
						+ coalesce(inv.PAYMENT_TERM_TEXT, 'PAYMENT_TERM_TEXT')
						-----------------------------------------------------------------------------------------------------------------------
						+ coalesce(cast(inv.INVOICE_QUANTITY as nvarchar(30)), 'INVOICE_QUANTITY')
						+ coalesce(inv.INVOICE_UOM, 'INVOICE_UOM') 
						+ coalesce(cast(inv.STATISTIC_QUANTITY as nvarchar(30)), 'STATISTIC_QUANTITY')
						+ coalesce( inv.STATISTIC_UOM, 'STATISTIC_UOM')
						+ coalesce(cast(inv.QUANTITY as nvarchar(30)), 'QUANTITY')
						-----------------------------------------------------------------------------------------------------------------------
						+ coalesce(inv.UOM, 'UOM')
						+ coalesce(lUom.HARMONIZED_UOM, 'HARMONIZED_UOM')
						+ coalesce(cast(lUom.FACTOR as nvarchar(30)), 'FACTOR')
						-----------------------------------------------------------------------------------------------------------------------
						+ coalesce(cast(inv.INVOICE_AMOUNT as nvarchar(30)), 'INVOICE_AMOUNT')
						+ coalesce(cast(inv.LOCAL_AMOUNT as nvarchar(30)), 'LOCAL_AMOUNT')
						+ coalesce(cast(inv.GROUP_AMOUNT as nvarchar(30)), 'GROUP_AMOUNT')
						+ coalesce(inv.INVOICE_CURRENCY, 'INVOICE_CURRENCY')
						+ coalesce(inv.LOCAL_CURRENCY, 'LOCAL_CURRENCY')
						-----------------------------------------------------------------------------------------------------------------------
						+ coalesce(cast(inv.LINE_DISCOUNT_AMOUNT as nvarchar(30)), 'LINE_DISCOUNT_AMOUNT')
						+ coalesce(cast(inv.INVOICE_DISCOUNT_AMOUNT as nvarchar(30)), 'INVOICE_DISCOUNT_AMOUNT')
						+ coalesce(cast(inv.LINE_BONUS_AMOUNT as nvarchar(30)), 'LINE_BONUS_AMOUNT')
						+ coalesce(cast(inv.BONUS_SHARE_AMOUNT as nvarchar(30)), 'BONUS_SHARE_AMOUNT')
						+ coalesce(cast(inv.STD_COST as nvarchar(30)), 'STD_COST')
						+ coalesce(cast(inv.STD_FREIGHT as nvarchar(30)), 'STD_FREIGHT')), 2) as [EtlDeltaHash]
						-----------------------------------------------------------------------------------------------------------------------
--						+ coalesce(inv.MATERIAL_CHAR1, 'MATERIAL_CHAR1')
--						+ coalesce(cast(inv.MATERIAL_CHAR1_VALUE as nvarchar(30)), 'MATERIAL_CHAR1_VALUE')
--						+ coalesce(inv.MATERIAL_CHAR2, 'MATERIAL_CHAR2')
--						+ coalesce(cast(inv.MATERIAL_CHAR2_VALUE as nvarchar(30)), 'MATERIAL_CHAR2_VALUE')
--						+ coalesce(inv.MATERIAL_CHAR3, 'MATERIAL_CHAR3')
--						+ coalesce(cast(inv.MATERIAL_CHAR3_VALUE as nvarchar(30)), 'MATERIAL_CHAR3_VALUE')
--						+ coalesce(inv.MATERIAL_CHAR4, 'MATERIAL_CHAR4')
--						+ coalesce(cast(inv.MATERIAL_CHAR4_VALUE as nvarchar(30)), 'MATERIAL_CHAR4_VALUE')
--						+ coalesce(inv.MATERIAL_CHAR5, 'MATERIAL_CHAR5')
--						+ coalesce(cast(inv.MATERIAL_CHAR5_VALUE as nvarchar(30)), 'MATERIAL_CHAR5_VALUE')), 2) as [EtlDeltaHash]
				---------------------------------------------------------------------------------------------------
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
			where
					inv.INVOICE_DATE between @_DataCaptureStart and @_DataCaptureEnd
				--! Replicate all the filters used in Icopal_profBIS.dbo.V_SA_INVOICE (except date)
				and sbu.SABIS = 'Y'
				and inv.INVOICE_TYPE in ('1', '2', '9')
				and isnull(pCat.ITEM_CATEGORY_ID, -1) <> @_ExcludeFromQlikViewProductCategoryId
				and isnull(lcc.CUSTOMER_CATEGORY_ID, -1) <> @_ExcludeFromQlikViewCustomerCategoryId
--			and 
--				(
--						1 = 0
--					or (inv.SYSTEM_ID = 15 and inv.INVOICE_NUMBER = '3350489' and inv.INVOICE_LINE_NUMBER = '10' and inv.ITEM_NO = '102605') -- 20
--					or (inv.SYSTEM_ID = 15 and inv.INVOICE_NUMBER = '3150707' and inv.INVOICE_LINE_NUMBER = '10'and inv.ITEM_NO = '102605') -- 14
--					or (inv.SYSTEM_ID = 12 and inv.INVOICE_NUMBER = '170997' and inv.INVOICE_LINE_NUMBER = '1' and inv.ITEM_NO = '42820') -- 6
--					or (inv.SYSTEM_ID = 12 and inv.INVOICE_NUMBER = '170997' and inv.INVOICE_LINE_NUMBER = '10' and inv.ITEM_NO = '71170') -- 6
--					or (inv.SYSTEM_ID = 12 and inv.INVOICE_NUMBER = '170997' and inv.INVOICE_LINE_NUMBER = '2' and inv.ITEM_NO = '71150') -- 6
--					or (inv.SYSTEM_ID = 2 and inv.INVOICE_NUMBER = '001308113' and inv.INVOICE_LINE_NUMBER = '030' and inv.ITEM_NO = '23264')
--					or (inv.SYSTEM_ID = 2 and inv.INVOICE_NUMBER = '001505511' and inv.INVOICE_LINE_NUMBER = '005' and inv.ITEM_NO = '11092') -- 5
--					or (inv.SYSTEM_ID = 2 and inv.INVOICE_NUMBER = '001505511' and inv.INVOICE_LINE_NUMBER = '010' and inv.ITEM_NO = '11094') -- 5
--					or (inv.SYSTEM_ID = 2 and inv.INVOICE_NUMBER = '001505511' and inv.INVOICE_LINE_NUMBER = '015' and inv.ITEM_NO = '16282') -- 5
--					or (inv.SYSTEM_ID = 2 and inv.INVOICE_NUMBER = '001600622' and inv.INVOICE_LINE_NUMBER = '005' and inv.ITEM_NO = '22604') -- 5
--					or (inv.SYSTEM_ID = 2 and inv.INVOICE_NUMBER = '001308113' and inv.INVOICE_LINE_NUMBER = '030' and inv.ITEM_NO = '23264') -- 4
--					or (inv.SYSTEM_ID = 1 and inv.INVOICE_NUMBER = '0090748418' and inv.INVOICE_LINE_NUMBER = '000010' and inv.ITEM_NO = 'REBATE') -- 4
--					or (inv.SYSTEM_ID = 1 and inv.INVOICE_NUMBER = '0090751546' and inv.INVOICE_LINE_NUMBER = '000010' and inv.ITEM_NO = '3100407') -- 4
--					or (inv.SYSTEM_ID = 1 and inv.INVOICE_NUMBER = '0090751546' and inv.INVOICE_LINE_NUMBER = '000020' and inv.ITEM_NO = '3007163') -- 4
--				)
		)
		merge into stg.Invoice as tgt
		using sourceCte as src
			on src.SYSTEM_ID = tgt.SYSTEM_ID
			and src.INVOICE_NUMBER collate SQL_Latin1_General_CP1_CI_AS = tgt.INVOICE_NUMBER collate SQL_Latin1_General_CP1_CI_AS
			and src.ORDER_NUMBER collate SQL_Latin1_General_CP1_CI_AS = tgt.ORDER_NUMBER collate SQL_Latin1_General_CP1_CI_AS
			and src.INVOICE_LINE_NUMBER collate SQL_Latin1_General_CP1_CI_AS = tgt.INVOICE_LINE_NUMBER collate SQL_Latin1_General_CP1_CI_AS
			and src.ORDER_LINE_NUMBER collate SQL_Latin1_General_CP1_CI_AS = tgt.ORDER_LINE_NUMBER collate SQL_Latin1_General_CP1_CI_AS
			and src.Uniqueifier = tgt.Uniqueifier
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
			, Uniqueifier
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
			, src.Uniqueifier
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
		when matched and tgt.EtlDeltaHash <> src.EtlDeltaHash or tgt.IsDeleted = 'Y'
			then update set
					  tgt.EtlDeltaHash = src.EtlDeltaHash
					, tgt.EtlUpdatedOn = @LoadStart
					, tgt.EtlUpdatedBy = @_FunctionName
					, tgt.IsDeleted = 'N'
					, tgt.REC_ID = src.REC_ID
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
		when not matched by source and (tgt.INVOICE_DATE between @_DataCaptureStart and @_DataCaptureEnd) and tgt.InvoiceKey >= 100
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
exec sp_addextendedproperty 'MS_Description'
, 'Merges any changes from the QlikView source into the staging area ready for consumption by the QV-to-IDW ETL process'
, 'SCHEMA', 'privy', 'PROCEDURE', 'InvoiceRefresh', null, null;
go
