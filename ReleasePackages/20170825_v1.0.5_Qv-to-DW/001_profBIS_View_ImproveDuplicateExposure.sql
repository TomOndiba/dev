/*
Run this script on:

        DKSQL1.profBIS_View    -  This database will be modified

to synchronize it with:

        (local).profBIS_View

You are recommended to back up your database before running this script

Script created by SQL Compare version 12.3.3.4490 from Red Gate Software Ltd at 25/08/2017 09:16:51

*/
set noexec off
go
set numeric_roundabort off
go
set ansi_padding, ansi_warnings, concat_null_yields_null, arithabort, quoted_identifier, ansi_nulls on
go
set xact_abort on
go
set transaction isolation level serializable
go
begin transaction
go
if @@error <> 0 set noexec on
go
print N'Altering [etl].[OrderShippedNotInvoicedDelta]'
go
alter view [etl].[OrderShippedNotInvoicedDelta]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      etl.OrderShippedNotInvoicedDelta
DESCRIPTION:    Exposes changes to Orders shipped-not-invoiced (new, changed and deleted) in the format best suited to
				populate the Interim Data Warehouse/Mart
				Data Warehouse/Mart
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    14-JUN-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		14-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------
002		25-JUL-2017		GML		BSR-132	Revised filters to better reflect active/inactive duplicates
------- ------------	------	-------	-----------------------------------------------------------------------------
003		25-AUG-2017		GML		N/A		Revised filters to include recently loaded records that have already been
										superceded even though their first incarnation hasn't been marked as processed
------- ------------	------	-------	-----------------------------------------------------------------------------

**********************************************************************************************************************/
--</CommentHeader>

	select
		  ord.OrderShippedNotInvoicedKey																as [OrderShippedNotInvoicedKey]
		, ord.IsDeleted																					as [IsDeleted]
		--! Some standard entities (N/S, N/F, N/I etc) already have the correct DataSourceKey
		, case when ord.SYSTEM_ID = 100000 then ord.SYSTEM_ID else ord.SYSTEM_ID + 100100 end			as [DataSourceKey]
		, cast(ord.REC_ID as nvarchar(50))																as [QlikViewOrderShippedNotInvoicedKey]
		, ord.DuplicateCount																			as [LineCount]
		-----------------------------------------------------------------------------------------------------------------------
		, ord.ORDER_NUMBER																				as [OrderNumber]
		, case when isnumeric(ord.ORDER_LINE_NUMBER) = 1
			then cast(ord.ORDER_LINE_NUMBER as int)
			else 999999
		  end																							as [OrderLineNumber]
		, ord.ORDER_LINE_NUMBER																			as [NativeOrderLineNumber]
		, ord.SHIPPING_DOCUMENT																			as [NativeShippingDocumentKey]
		-----------------------------------------------------------------------------------------------------------------------
		--! If any Date is NULL, use "Not Specified at Source" (-1) for the date key
		, coalesce(cast(convert(char(8), ord.EXPECTED_INVOICE_DATE, 112) as int), -1)					as [ExpectedInvoiceDateKey]
		, ord.EXPECTED_INVOICE_DATE																		as [ExpectedInvoiceDate]
		-----------------------------------------------------------------------------------------------------------------------
		, ord.ORDER_TYPE																				as [NativeOrderType]
		, ord.OrderTypeName																				as [OrderTypeName]
		-----------------------------------------------------------------------------------------------------------------------
		, ord.LOCAL_SITE_SOLD																			as [LocalSellingSite]
		--! If SITE_ID is NULL, use "Not Specified at Source" (-1) and if there
		--! is no match in stg.Site then use "Lookup Not Found" (-2)
		, case when ord.SITE_ID is null then -1 else coalesce(s.SiteKey, -2) end						as [SiteKey]
		-----------------------------------------------------------------------------------------------------------------------
		--! If ITEM_NO is NULL, use "Not Specified at Source" (-1) and if there
		--! is no match in stg.Site then use "Lookup Not Found" (-2)
		, case when ord.ITEM_NO is null then -1 else coalesce(p.ProductKey, -2) end						as [ProductKey]
		-----------------------------------------------------------------------------------------------------------------------
		--! If SOLD_TO_CUSTOMER_NO is NULL, use "Not Specified at Source" (-1) and if there
		--! is no match in stg.Site then use "Lookup Not Found" (-2)
		, case when ord.SOLD_TO_CUSTOMER_NO is null then -1 else coalesce(soldc.CustomerKey, -2) end	as [SoldToCustomerKey]
		-----------------------------------------------------------------------------------------------------------------------
		--! If SHIP_TO_CUSTOMER_NO is NULL, use "Not Specified at Source" (-1) and if there
		--! is no match in stg.Site then use "Lookup Not Found" (-2)
		, case when ord.SHIP_TO_CUSTOMER_NO is null then -1 else coalesce(shipc.CustomerKey, -2) end	as [ShippedToCustomerKey]
		-----------------------------------------------------------------------------------------------------------------------
		, ord.SALESPERSON_ID																			as [NativeSalesPersonId]
		, ord.SALESPERSON_NAME																			as [NativeSalesPersonName]
		-----------------------------------------------------------------------------------------------------------------------
		, ord.SHIPPED_QUANTITY																			as [ShippedQuantityValue]
		, ord.SHIPPED_UOM																				as [ShippedQuantityUnitOfMeasure]
		, ord.STATISTIC_QUANTITY																		as [StatisticQuantityValue]
		, ord.STATISTIC_UOM																				as [StatisticQuantityUnitOfMeasure]
		, ord.QUANTITY																					as [Quantity]
		, ord.LOCAL_UOM																					as [LocalUnitOfMeasure]
		, ord.LOCAL_UOM_HARMONIZED																		as [LocalUnitOfMeasureHarmonised]
		, ord.LOCAL_UOM_FACTOR																			as [LocalUnitOfMeasureFactor]
		, ord.SHIPPED_AMOUNT																			as [ShippedAmount]
		, ord.LOCAL_AMOUNT																				as [LocalAmount]
		, ord.GROUP_AMOUNT																				as [GroupAmountEUR]
		, ord.SHIPPED_CURRENCY																			as [ShippedCurrency]
		, ord.LOCAL_CURRENCY																			as [LocalCurrency]
		, ord.LINE_DISCOUNT_AMOUNT																		as [LineDiscountAmount]
		, ord.ORDER_DISCOUNT_AMOUNT																		as [OrderDiscountAmount]
		, ord.LINE_BONUS_AMOUNT																			as [LineBonusAmount]
		, ord.BONUS_SHARE_AMOUNT																		as [BonusShareAmount]
	from
		stg.OrderShippedNotInvoiced as ord
	left join stg.OrderShippedNotInvoicedControl as ctrl
		on ctrl.OrderShippedNotInvoicedKey = ord.OrderShippedNotInvoicedKey
	left join stg.[Site] as s
		on s.NativeSiteKey = cast(ord.SITE_ID as nvarchar(50))
	left join stg.Product as p
		on p.NativeProductKey = ord.ITEM_NO
		and p.QlikViewSourceSystemId = ord.SYSTEM_ID
	left join stg.Customer as soldc
		on soldc.NativeCustomerKey = ord.SOLD_TO_CUSTOMER_NO
		and soldc.QlikViewSourceSystemId = ord.SYSTEM_ID
	left join stg.Customer as shipc
		on shipc.NativeCustomerKey = ord.SHIP_TO_CUSTOMER_NO
		and shipc.QlikViewSourceSystemId = ord.SYSTEM_ID
	where
			(ord.Uniqueifier = 1 and ctrl.OrderShippedNotInvoicedKey is null) --! New Orders (not yet added to control)
		or (ord.Uniqueifier = 1 and ctrl.PreviousDeltaHash <> ord.EtlDeltaHash) --! Existing Orders that have been updated
		or (ctrl.IsDeleted <> ord.IsDeleted) --! Orders that have been soft-deleted or (possibly) re-activated
		or (ctrl.OrderShippedNotInvoicedKey is null and ord.IsDeleted = 'Y') --! Records that have already been superceded even though their first incarnation hasn't been marked as processed (into CTRL tbl)
go
if @@error <> 0 set noexec on
go
print N'Altering [etl].[InvoiceDelta]'
go
alter view [etl].[InvoiceDelta]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      etl.InvoiceDelta
DESCRIPTION:    Exposes Invoice changes (new, changed and deleted) in the format best suited to populate the Interim
				Data Warehouse/Mart
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    13-JUN-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		13-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------
002		25-JUL-2017		GML		BSR-132	Revised filters to better reflect active/inactive duplicates
------- ------------	------	-------	-----------------------------------------------------------------------------
003		25-AUG-2017		GML		N/A		Revised filters to include recently loaded records that have already been
										superceded even though their first incarnation hasn't been marked as processed
------- ------------	------	-------	-----------------------------------------------------------------------------

**********************************************************************************************************************/
--</CommentHeader>

	select
		  i.InvoiceKey																				as [InvoiceKey]
		, i.IsDeleted																				as [IsDeleted]
		--! Some standard entities (N/S, N/F, N/I etc) already have the correct DataSourceKey
		, case when i.SYSTEM_ID = 100000 then i.SYSTEM_ID else i.SYSTEM_ID + 100100 end				as [DataSourceKey]
		, cast(i.REC_ID as nvarchar(50))															as [QlikViewInvoiceKey]
		, i.DuplicateCount																			as [LineCount]
		, cast(convert(char(8), i.INVOICE_DATE, 112) as int)										as [InvoiceDateKey]
		, i.INVOICE_DATE																			as [InvoiceDate]
		-----------------------------------------------------------------------------------------------------------------------
		, i.INVOICE_NUMBER																			as [InvoiceNumber]
		, case when isnumeric(i.INVOICE_LINE_NUMBER) = 1
			then cast(i.INVOICE_LINE_NUMBER as int)
			else 999999
		  end																						as [InvoiceLineNumber]
		, i.INVOICE_LINE_NUMBER																		as [NativeInvoiceLineNumber]
		-----------------------------------------------------------------------------------------------------------------------
		, i.ORDER_NUMBER																			as [OrderNumber]
		, case when isnumeric(i.ORDER_LINE_NUMBER) = 1
			then cast(i.ORDER_LINE_NUMBER as int)
			else 999999
		  end																						as [OrderLineNumber]
		, i.ORDER_LINE_NUMBER																		as [NativeOrderLineNumber]
		-----------------------------------------------------------------------------------------------------------------------
		, i.INVOICE_TYPE																			as [NativeInvoiceType]
		, i.InvoiceTypeName																			as [InvoiceTypeName]
		, i.LOCAL_SITE_SOLD																			as [LocalSellingSite]
		-----------------------------------------------------------------------------------------------------------------------
		--! If SITE_ID is NULL, use "Not Specified at Source" (-1) and if there
		--! is no match in stg.Site then use "Lookup Not Found" (-2)
		, case when i.SITE_ID is null then -1 else coalesce(s.SiteKey, -2) end						as [SiteKey]
		-----------------------------------------------------------------------------------------------------------------------
		--! If ITEM_NO is NULL, use "Not Specified at Source" (-1) and if there
		--! is no match in stg.Site then use "Lookup Not Found" (-2)
		, case when i.ITEM_NO is null then -1 else coalesce(p.ProductKey, -2) end					as [ProductKey]
		-----------------------------------------------------------------------------------------------------------------------
		--! If SOLD_TO_CUSTOMER_NO is NULL, use "Not Specified at Source" (-1) and if there
		--! is no match in stg.Site then use "Lookup Not Found" (-2)
		, case when i.SOLD_TO_CUSTOMER_NO is null then -1 else coalesce(soldc.CustomerKey, -2) end	as [SoldToCustomerKey]
		-----------------------------------------------------------------------------------------------------------------------
		--! If SHIP_TO_CUSTOMER_NO is NULL, use "Not Specified at Source" (-1) and if there
		--! is no match in stg.Site then use "Lookup Not Found" (-2)
		, case when i.SHIP_TO_CUSTOMER_NO is null then -1 else coalesce(shipc.CustomerKey, -2) end	as [ShippedToCustomerKey]
		-----------------------------------------------------------------------------------------------------------------------
		, i.SALESPERSON_ID																			as [NativeSalesPersonId]
		, i.SALESPERSON_NAME																		as [NativeSalesPersonName]
		-----------------------------------------------------------------------------------------------------------------------
		--! If any Date is NULL, use "Not Specified at Source" (-1) for the date key
		, coalesce(cast(convert(char(8), i.DELIVERY_DATE, 112) as int), -1)							as [DeliveryDateKey]
		, i.DELIVERY_DATE																			as [DeliveryDate]
		, coalesce(cast(convert(char(8), i.EXPECTED_PAYMENT_DATE, 112) as int), -1)					as [ExpectedPaymentDateKey]
		, i.EXPECTED_PAYMENT_DATE																	as [ExpectedPaymentDate]
		, coalesce(cast(convert(char(8), i.ACTUAL_PAYMENT_DATE, 112) as int), -1)					as [ActualPaymentDateKey]
		, i.ACTUAL_PAYMENT_DATE																		as [ActualPaymentDate]
		-----------------------------------------------------------------------------------------------------------------------
		, i.LOCAL_DELIVERY_TERM																		as [LocalDeliveryTerm]
		, i.LOCAL_DELIVERY_TERM_TEXT																as [LocalDeliveryTermText]
		-----------------------------------------------------------------------------------------------------------------------
		--! If PAYMENT_TERM_ID is NULL, use "Not Specified at Source" (-1) and if there
		--! is no match in stg.Site then use "Lookup Not Found" (-2)
		, case when i.PAYMENT_TERM_ID is null then -1 else coalesce(pt.PaymentTermKey, -2) end		as [PaymentTermKey]
		-----------------------------------------------------------------------------------------------------------------------
		, i.LOCAL_PAYMENT_TERM																		as [LocalPaymentTerm]
		, i.LOCAL_PAYMENT_TERM_TEXT																	as [LocalPaymentTermText]
		, i.INVOICE_QUANTITY																		as [InvoiceQuantityValue]
		, i.INVOICE_UOM																				as [InvoiceQuantityUnitOfMeasure]
		, i.STATISTIC_QUANTITY																		as [StatisticQuantityValue]
		, i.STATISTIC_UOM																			as [StatisticQuantityUnitOfMeasure]
		, i.QUANTITY																				as [Quantity]
		, i.LOCAL_UOM																				as [LocalUnitOfMeasure]
		, i.LOCAL_UOM_HARMONIZED																	as [LocalUnitOfMeasureHarmonised]
		, i.LOCAL_UOM_FACTOR																		as [LocalUnitOfMeasureFactor]
		, i.INVOICE_AMOUNT																			as [InvoiceAmount]
		, i.LOCAL_AMOUNT																			as [LocalAmount]
		, i.GROUP_AMOUNT																			as [GroupAmountEUR]
		, i.INVOICE_CURRENCY																		as [InvoiceCurrency]
		, i.LOCAL_CURRENCY																			as [LocalCurrency]
		, i.LINE_DISCOUNT_AMOUNT																	as [LineDiscountAmount]
		, i.INVOICE_DISCOUNT_AMOUNT																	as [InvoiceDiscountAmount]
		, i.LINE_BONUS_AMOUNT																		as [LineBonusAmount]
		, i.BONUS_SHARE_AMOUNT																		as [BonusShareAmount]
		, i.STD_COST																				as [StandardCost]
		, i.STD_FREIGHT																				as [StandardFreight]
	from
		stg.Invoice as i
	left join stg.InvoiceControl as ctrl
		on ctrl.InvoiceKey = i.InvoiceKey
	left join stg.[Site] as s
		on s.NativeSiteKey = cast(i.SITE_ID as nvarchar(50))
	left join stg.Product as p
		on p.NativeProductKey = i.ITEM_NO
		and p.QlikViewSourceSystemId = i.SYSTEM_ID
	left join stg.Customer as soldc
		on soldc.NativeCustomerKey = i.SOLD_TO_CUSTOMER_NO
		and soldc.QlikViewSourceSystemId = i.SYSTEM_ID
	left join stg.Customer as shipc
		on shipc.NativeCustomerKey = i.SHIP_TO_CUSTOMER_NO
		and shipc.QlikViewSourceSystemId = i.SYSTEM_ID
	left join stg.PaymentTerm as pt
		on pt.NativePaymentTermKey = cast(i.PAYMENT_TERM_ID as nvarchar(50))
	where
			(i.Uniqueifier = 1 and ctrl.InvoiceKey is null) --! New Invoices (not yet added to control)
		or (i.Uniqueifier = 1 and ctrl.PreviousDeltaHash <> i.EtlDeltaHash) --! Existing Invoices that have been updated
		or (ctrl.IsDeleted <> i.IsDeleted) --! Invoices that have been soft-deleted or (possibly) re-activated
		or (ctrl.InvoiceKey is null and i.IsDeleted = 'Y') --! Records that have already been superceded even though their first incarnation hasn't been marked as processed (into CTRL tbl)
go
if @@error <> 0 set noexec on
go
print N'Altering [etl].[OrderBacklogDelta]'
go
alter view [etl].[OrderBacklogDelta]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      etl.OrderBacklogDelta
DESCRIPTION:    Exposes changes to Orders shipped-not-invoiced (new, changed and deleted) in the format best suited to
				populate the Interim Data Warehouse/Mart
				Data Warehouse/Mart
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    15-JUN-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		15-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------
002		25-JUL-2017		GML		BSR-132	Revised filters to better reflect active/inactive duplicates
------- ------------	------	-------	-----------------------------------------------------------------------------
003		25-AUG-2017		GML		N/A		Revised filters to include recently loaded records that have already been
										superceded even though their first incarnation hasn't been marked as processed
------- ------------	------	-------	-----------------------------------------------------------------------------

**********************************************************************************************************************/
--</CommentHeader>

	select
		  ord.OrderBacklogKey																			as [OrderBacklogKey]
		, ord.IsDeleted																					as [IsDeleted]
		--! Some standard entities (N/S, N/F, N/I etc) already have the correct DataSourceKey
		, case when ord.SYSTEM_ID = 100000 then ord.SYSTEM_ID else ord.SYSTEM_ID + 100100 end			as [DataSourceKey]
		, cast(ord.REC_ID as nvarchar(50))																as [QlikViewOrderBacklogKey]
		, ord.DuplicateCount																			as [LineCount]
		-----------------------------------------------------------------------------------------------------------------------
		, ord.ORDER_NUMBER																				as [OrderNumber]
		, case when isnumeric(ord.ORDER_LINE_NUMBER) = 1
			then cast(ord.ORDER_LINE_NUMBER as int)
			else 999999
		  end																							as [OrderLineNumber]
		, ord.ORDER_LINE_NUMBER																			as [NativeOrderLineNumber]
		-----------------------------------------------------------------------------------------------------------------------
		--! If any Date is NULL, use "Not Specified at Source" (-1) for the date key
		, coalesce(cast(convert(char(8), ord.EXPECTED_INVOICE_DATE, 112) as int), -1)					as [ExpectedInvoiceDateKey]
		, ord.EXPECTED_INVOICE_DATE																		as [ExpectedInvoiceDate]
		-----------------------------------------------------------------------------------------------------------------------
		, ord.ORDER_TYPE																				as [NativeOrderType]
		, ord.OrderTypeName																				as [OrderTypeName]
		-----------------------------------------------------------------------------------------------------------------------
		, ord.LOCAL_SITE_SOLD																			as [LocalSellingSite]
		--! If SITE_ID is NULL, use "Not Specified at Source" (-1) and if there
		--! is no match in stg.Site then use "Lookup Not Found" (-2)
		, case when ord.SITE_ID is null then -1 else coalesce(s.SiteKey, -2) end						as [SiteKey]
		-----------------------------------------------------------------------------------------------------------------------
		--! If ITEM_NO is NULL, use "Not Specified at Source" (-1) and if there
		--! is no match in stg.Site then use "Lookup Not Found" (-2)
		, case when ord.ITEM_NO is null then -1 else coalesce(p.ProductKey, -2) end						as [ProductKey]
		-----------------------------------------------------------------------------------------------------------------------
		--! If SOLD_TO_CUSTOMER_NO is NULL, use "Not Specified at Source" (-1) and if there
		--! is no match in stg.Site then use "Lookup Not Found" (-2)
		, case when ord.SOLD_TO_CUSTOMER_NO is null then -1 else coalesce(soldc.CustomerKey, -2) end	as [SoldToCustomerKey]
		-----------------------------------------------------------------------------------------------------------------------
		--! If SHIP_TO_CUSTOMER_NO is NULL, use "Not Specified at Source" (-1) and if there
		--! is no match in stg.Site then use "Lookup Not Found" (-2)
		, case when ord.SHIP_TO_CUSTOMER_NO is null then -1 else coalesce(shipc.CustomerKey, -2) end	as [ShippedToCustomerKey]
		-----------------------------------------------------------------------------------------------------------------------
		, ord.SALESPERSON_ID																			as [NativeSalesPersonId]
		, ord.SALESPERSON_NAME																			as [NativeSalesPersonName]
		-----------------------------------------------------------------------------------------------------------------------
		, ord.ORDER_QUANTITY																			as [OrderQuantityValue]
		, ord.ORDER_UOM																					as [OrderQuantityUnitOfMeasure]
		, ord.STATISTIC_QUANTITY																		as [StatisticQuantityValue]
		, ord.STATISTIC_UOM																				as [StatisticQuantityUnitOfMeasure]
		, ord.QUANTITY																					as [Quantity]
		, ord.LOCAL_UOM																					as [LocalUnitOfMeasure]
		, ord.LOCAL_UOM_HARMONIZED																		as [LocalUnitOfMeasureHarmonised]
		, ord.LOCAL_UOM_FACTOR																			as [LocalUnitOfMeasureFactor]
		, ord.ORDER_AMOUNT																				as [OrderAmount]
		, ord.LOCAL_AMOUNT																				as [LocalAmount]
		, ord.GROUP_AMOUNT																				as [GroupAmountEUR]
		, ord.ORDER_CURRENCY																			as [OrderCurrency]
		, ord.LOCAL_CURRENCY																			as [LocalCurrency]
		, ord.LINE_DISCOUNT_AMOUNT																		as [LineDiscountAmount]
		, ord.ORDER_DISCOUNT_AMOUNT																		as [OrderDiscountAmount]
		, ord.LINE_BONUS_AMOUNT																			as [LineBonusAmount]
		, ord.BONUS_SHARE_AMOUNT																		as [BonusShareAmount]
	from
		stg.OrderBacklog as ord
	left join stg.OrderBacklogControl as ctrl
		on ctrl.OrderBacklogKey = ord.OrderBacklogKey
	left join stg.[Site] as s
		on s.NativeSiteKey = cast(ord.SITE_ID as nvarchar(50))
	left join stg.Product as p
		on p.NativeProductKey = ord.ITEM_NO
		and p.QlikViewSourceSystemId = ord.SYSTEM_ID
	left join stg.Customer as soldc
		on soldc.NativeCustomerKey = ord.SOLD_TO_CUSTOMER_NO
		and soldc.QlikViewSourceSystemId = ord.SYSTEM_ID
	left join stg.Customer as shipc
		on shipc.NativeCustomerKey = ord.SHIP_TO_CUSTOMER_NO
		and shipc.QlikViewSourceSystemId = ord.SYSTEM_ID
	where
			(ord.Uniqueifier = 1 and ctrl.OrderBacklogKey is null) --! New Orders (not yet added to control)
		or (ord.Uniqueifier = 1 and ctrl.PreviousDeltaHash <> ord.EtlDeltaHash) --! Existing Orders that have been updated
		or (ctrl.IsDeleted <> ord.IsDeleted) --! Orders that have been soft-deleted or (possibly) re-activated
		or (ctrl.OrderBacklogKey is null and ord.IsDeleted = 'Y') --! Records that have already been superceded even though their first incarnation hasn't been marked as processed (into CTRL tbl)
go
if @@error <> 0 set noexec on
go
print N'Altering [privy].[InvoiceRefresh]'
go
alter procedure [privy].[InvoiceRefresh]
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
003		25-JUL-2017		GML		BSR-132	Further revised Uniqueifier logic mark all non-preferred dupes as inactive
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

		if @_DataCaptureEnd is null
			raiserror('Load Parameter: Data Capture End cannot be null', 16, 1);

		--!
		--!
		--!
		set @_Step = 'Collect Runtime Parameters';
		set @_StepStartTime = getdate();

		declare @_UnmappedPaymentTerm varchar(50) = (select TEKST from [Icopal_profBIS].dbo.FLEXPARAMS where PARAMTYPE = 'DWH' and PARAMNAVN = 'PAYMENT_UNMAPPED') ;
		declare @_UnmappedProductCategory varchar(50) = (select TEKST from [Icopal_profBIS].dbo.FLEXPARAMS where PARAMTYPE = 'DWH' and PARAMNAVN = 'SA_UNMAPPED_ITEM') ;
		declare @_ExcludeFromQlikViewProductCategory varchar(50) = (select TEKST from [Icopal_profBIS].dbo.FLEXPARAMS where PARAMTYPE = 'DWH' and PARAMNAVN = 'SALES_NOT_QLIKVIEW') ;
		declare @_ExcludeFromQlikViewCustomerCategory varchar(50) = (select TEKST from [Icopal_profBIS].dbo.FLEXPARAMS where PARAMTYPE = 'DWH' and PARAMNAVN = 'CUSTOMER_NOT_EXPORTED') ;

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
				[Icopal_profBIS].dbo.SA_INVOICE as inv
			inner join [Icopal_profBIS].dbo.PU_LINK_SITE as ssite
				on ssite.SYSTEM_ID = inv.SYSTEM_ID
				and ssite.LOCAL_SITE = inv.SITE_SOLD
			inner join [Icopal_profBIS].dbo.MD_SITE as msite
				on msite.SITE_ID = ssite.SITE_ID
			--! Make sure we can filter for just invoices belonging to SBUs where SABIS is true
			inner join [Icopal_profBIS].dbo.MD_SBU as sbu
				on sbu.SBU   = msite.SBU
			left outer join [Icopal_profBIS].dbo.PU_LINK_UOM as lUom
				on lUom.SYSTEM_ID = inv.SYSTEM_ID
				and lUom.LOCAL_UOM = inv.UOM
			left outer join [Icopal_profBIS].dbo.SA_LINK_ITEM as pCat
				on pCat.SYSTEM_ID = inv.SYSTEM_ID
				and pCat.ITEM_NO = inv.ITEM_NO
			left outer join [Icopal_profBIS].dbo.SA_LINK_ENV as EnvPcat
				on EnvPcat.SYSTEM_ID = inv.SYSTEM_ID
				and EnvPcat.ITEM_NO = inv.ITEM_NO
			left outer join [Icopal_profBIS].dbo.SA_LINK_CUSTOMER as lcc 
				on lcc.SYSTEM_ID = inv.SYSTEM_ID
				and lcc.CUSTOMER_NO = inv.SHIP_TO
			left outer join [Icopal_profBIS].dbo.PU_LINK_PAYMENTTERM as lpt
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
if @@error <> 0 set noexec on
go
print N'Altering [privy].[OrderBacklogRefresh]'
go
alter procedure [privy].[OrderBacklogRefresh]
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
PROCEDURE NAME:		privy.OrderBacklogRefresh
DESCRIPTION:		Merges any changes from the QlikView source into the staging area ready for consumption by the
					QV-to-IDW ETL process
ORIGIN DATE:		15-JUN-2017
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
001		15-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------
002		14-JUL-2017		GML		BSR-102	Revised Uniquifier logic to prefer most recently updated active duplicate
------- ------------	------	-------	-----------------------------------------------------------------------------
003		25-JUL-2017		GML		BSR-132	Further revised Uniqueifier logic mark all non-preferred dupes as inactive
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
			+ char(10) + '    @DebugLevel  : ' + coalesce(cast(@DebugLevel as varchar(16)), 'NULL')
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

		if @_DataCaptureEnd is null
			raiserror('Load Parameter: Data Capture End cannot be null', 16, 1);

		--!
		--!
		--!
		set @_Step = 'Collect Runtime Parameters';
		set @_StepStartTime = getdate();

		declare @_UnmappedPaymentTerm varchar(50) = (select TEKST from [Icopal_profBIS].dbo.FLEXPARAMS where PARAMTYPE = 'DWH' and PARAMNAVN = 'PAYMENT_UNMAPPED') ;
		declare @_UnmappedProductCategory varchar(50) = (select TEKST from [Icopal_profBIS].dbo.FLEXPARAMS where PARAMTYPE = 'DWH' and PARAMNAVN = 'SA_UNMAPPED_ITEM') ;
		declare @_ExcludeFromQlikViewProductCategory varchar(50) = (select TEKST from [Icopal_profBIS].dbo.FLEXPARAMS where PARAMTYPE = 'DWH' and PARAMNAVN = 'SALES_NOT_QLIKVIEW') ;
		declare @_ExcludeFromQlikViewCustomerCategory varchar(50) = (select TEKST from [Icopal_profBIS].dbo.FLEXPARAMS where PARAMTYPE = 'DWH' and PARAMNAVN = 'CUSTOMER_NOT_EXPORTED') ;

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
			--! The following columns are defined as NOT NULL on the underlying table: REC_ID, SYSTEM_ID, SITE_SOLD
			--! We use the following columns to uniquely identify each row: SYSTEM_ID, ORDER_NUMBER, ORDER_LINE_NUMBER and Uniqueifier
			select
				  ord.REC_ID
				, ord.SYSTEM_ID
				, coalesce(ord.ORDER_NUMBER, '') as [ORDER_NUMBER]
				, coalesce(ord.ORDER_LINE_NUMBER, '') as [ORDER_LINE_NUMBER]
				, coalesce(tgt.Uniqueifier, 1) as [Uniqueifier] -- assume no dupes on new records for now (we check properly later)
				-----------------------------------------------------------------------------------------------------------------------
				, ord.EXPECTED_INVOICE_DATE
				, coalesce(ord.ORDER_TYPE, '') as [ORDER_TYPE]
				, case coalesce(ord.ORDER_TYPE, '')
					when '1' then 'TODO: Define Order Type (' + coalesce(ord.ORDER_TYPE, '') + ')'
					when '2' then 'TODO: Define Order Type (' + coalesce(ord.ORDER_TYPE, '') + ')'
					when '' then 'Not Specified At Source'
					else 'Lookup Not Found (' + coalesce(ord.ORDER_TYPE, '') + ')'
				  end as [OrderTypeName]
				-----------------------------------------------------------------------------------------------------------------------
				, ord.SITE_SOLD as [LOCAL_SITE_SOLD]
				, ssite.SITE_ID -- Don't need to collect SBU from this as per V_SA_ORDERSNI as we will expose SiteKey in the view later
				-----------------------------------------------------------------------------------------------------------------------
				, coalesce(ord.ITEM_NO, '') as [ITEM_NO]
				, coalesce(pCat.ITEM_CATEGORY_ID, @_UnmappedProductCategoryId) as [ITEM_CATEGORY_ID]
				, EnvPcat.ENV_CATEGORY_ID
				-----------------------------------------------------------------------------------------------------------------------
				, coalesce(ord.SOLD_TO, '') as [SOLD_TO_CUSTOMER_NO]
				, coalesce(ord.SHIP_TO, '') as [SHIP_TO_CUSTOMER_NO]
				-----------------------------------------------------------------------------------------------------------------------
				, coalesce(ord.SALESPERSON_ID, '') as [SALESPERSON_ID]
				, coalesce(ord.SALESPERSON_NAME, '') as [SALESPERSON_NAME]
				-----------------------------------------------------------------------------------------------------------------------
				, ord.ORDER_QUANTITY
				, coalesce(ord.ORDER_UOM, '') as [ORDER_UOM]
				, ord.STATISTIC_QUANTITY
				, coalesce(ord.STATISTIC_UOM, '') as [STATISTIC_UOM]
				, ord.QUANTITY
				-----------------------------------------------------------------------------------------------------------------------
				, coalesce(ord.UOM, '') as [LOCAL_UOM]
				, coalesce(lUom.HARMONIZED_UOM, '') as [LOCAL_UOM_HARMONIZED]
				, lUom.FACTOR as [LOCAL_UOM_FACTOR]
				-----------------------------------------------------------------------------------------------------------------------
				, ord.ORDER_AMOUNT
				, ord.LOCAL_AMOUNT
				, ord.GROUP_AMOUNT
				, coalesce(ord.ORDER_CURRENCY, '') as [ORDER_CURRENCY]
				, coalesce(ord.LOCAL_CURRENCY, '') as [LOCAL_CURRENCY]
				-----------------------------------------------------------------------------------------------------------------------
				, ord.LINE_DISCOUNT_AMOUNT
				, ord.ORDER_DISCOUNT_AMOUNT
				, ord.LINE_BONUS_AMOUNT
				, ord.BONUS_SHARE_AMOUNT
				-----------------------------------------------------------------------------------------------------------------------
				--! Encapsulate ALL non-key columns into a hash value to speed up CDC checks during susbseqent loads
				, privy.OrderBacklogDeltaHash
					(
					  coalesce(tgt.Uniqueifier, 1)
					, ord.SYSTEM_ID
					, ord.ORDER_NUMBER
					, ord.ORDER_LINE_NUMBER
					, ord.EXPECTED_INVOICE_DATE
					, ord.ORDER_TYPE
					, case coalesce(ord.ORDER_TYPE, '')
							when '1' then 'TODO: Define Order Type (' + coalesce(ord.ORDER_TYPE, '') + ')'
							when '2' then 'TODO: Define Order Type (' + coalesce(ord.ORDER_TYPE, '') + ')'
							when '' then 'Not Specified At Source'
							else 'Lookup Not Found (' + coalesce(ord.ORDER_TYPE, '') + ')'
						  end -- OrderTypeName
					, ord.SITE_SOLD 
					, ssite.SITE_ID-- Don't need to collect SBU from this as per V_SA_ORDER_BACKLOG as we will expose SiteKey in the view later
					, ord.ITEM_NO
					, coalesce(pCat.ITEM_CATEGORY_ID, @_UnmappedProductCategoryId)
					, EnvPcat.ENV_CATEGORY_ID
					, ord.SOLD_TO
					, ord.SHIP_TO
					, ord.SALESPERSON_ID
					, ord.SALESPERSON_NAME
					, ord.ORDER_QUANTITY
					, ord.ORDER_UOM
					, ord.STATISTIC_QUANTITY
					, ord.STATISTIC_UOM
					, ord.QUANTITY
					, ord.UOM
					, lUom.HARMONIZED_UOM
					, lUom.FACTOR
					, ord.ORDER_AMOUNT
					, ord.LOCAL_AMOUNT
					, ord.GROUP_AMOUNT
					, ord.ORDER_CURRENCY
					, ord.LOCAL_CURRENCY
					, ord.LINE_DISCOUNT_AMOUNT
					, ord.ORDER_DISCOUNT_AMOUNT
					, ord.LINE_BONUS_AMOUNT
					, ord.BONUS_SHARE_AMOUNT
					) as [EtlDeltaHash]
				---------------------------------------------------------------------------------------------------
				, coalesce(tgt.Uniqueifier, 1) as [CurrentUniqueifier]
			from
				[Icopal_profBIS].dbo.SA_ORDER_BACKLOG as ord
			inner join [Icopal_profBIS].dbo.PU_LINK_SITE as ssite
				on ssite.SYSTEM_ID = ord.SYSTEM_ID
				and ssite.LOCAL_SITE = ord.SITE_SOLD
			inner join [Icopal_profBIS].dbo.MD_SITE as msite
				on msite.SITE_ID = ssite.SITE_ID
			--! Make sure we can filter for just invoices belonging to SBUs where SABIS is true
			inner join [Icopal_profBIS].dbo.MD_SBU as sbu
				on sbu.SBU   = msite.SBU
			left outer join [Icopal_profBIS].dbo.SA_LINK_ITEM as pCat
				on pCat.SYSTEM_ID = ord.SYSTEM_ID
				and pCat.ITEM_NO = ord.ITEM_NO
			left outer join [Icopal_profBIS].dbo.SA_LINK_ENV as EnvPcat
				on EnvPcat.SYSTEM_ID = ord.SYSTEM_ID
				and EnvPcat.ITEM_NO = ord.ITEM_NO
			left outer join [Icopal_profBIS].dbo.PU_LINK_UOM as lUom
				on lUom.SYSTEM_ID = ord.SYSTEM_ID
				and lUom.LOCAL_UOM = ord.UOM
			left outer join [Icopal_profBIS].dbo.SA_LINK_CUSTOMER as lcc 
				on lcc.SYSTEM_ID = ord.SYSTEM_ID
				and lcc.CUSTOMER_NO = ord.SHIP_TO
			left join stg.OrderBacklog as tgt
				on tgt.REC_ID = ord.REC_ID
			where
					ord.EXPECTED_INVOICE_DATE between @_DataCaptureStart and @_DataCaptureEnd
				--! Replicate all the filters used in Icopal_profBIS.dbo.V_SA_INVOICE (except date)
				and sbu.SABIS = 'Y'
				and ord.ORDER_TYPE in ('1', '2')
				and isnull(pCat.ITEM_CATEGORY_ID, -1) <> @_ExcludeFromQlikViewProductCategoryId
				and isnull(lcc.CUSTOMER_CATEGORY_ID, -1) <> @_ExcludeFromQlikViewCustomerCategoryId
		)
		merge into stg.OrderBacklog as tgt
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
			, ORDER_NUMBER
			, ORDER_LINE_NUMBER
			, Uniqueifier
			, EXPECTED_INVOICE_DATE
			, ORDER_TYPE
			, OrderTypeName
			, LOCAL_SITE_SOLD
			, SITE_ID
			, ITEM_NO
			, ITEM_CATEGORY_ID
			, ENV_CATEGORY_ID
			, SOLD_TO_CUSTOMER_NO
			, SHIP_TO_CUSTOMER_NO
			, SALESPERSON_ID
			, SALESPERSON_NAME
			, ORDER_QUANTITY
			, ORDER_UOM
			, STATISTIC_QUANTITY
			, STATISTIC_UOM
			, QUANTITY
			, LOCAL_UOM
			, LOCAL_UOM_HARMONIZED
			, LOCAL_UOM_FACTOR
			, ORDER_AMOUNT
			, LOCAL_AMOUNT
			, GROUP_AMOUNT
			, ORDER_CURRENCY
			, LOCAL_CURRENCY
			, LINE_DISCOUNT_AMOUNT
			, ORDER_DISCOUNT_AMOUNT
			, LINE_BONUS_AMOUNT
			, BONUS_SHARE_AMOUNT
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
			, src.ORDER_NUMBER
			, src.ORDER_LINE_NUMBER
			, src.Uniqueifier
			, src.EXPECTED_INVOICE_DATE
			, src.ORDER_TYPE
			, src.OrderTypeName
			, src.LOCAL_SITE_SOLD
			, src.SITE_ID
			, src.ITEM_NO
			, src.ITEM_CATEGORY_ID
			, src.ENV_CATEGORY_ID
			, src.SOLD_TO_CUSTOMER_NO
			, src.SHIP_TO_CUSTOMER_NO
			, src.SALESPERSON_ID
			, src.SALESPERSON_NAME
			, src.ORDER_QUANTITY
			, src.ORDER_UOM
			, src.STATISTIC_QUANTITY
			, src.STATISTIC_UOM
			, src.QUANTITY
			, src.LOCAL_UOM
			, src.LOCAL_UOM_HARMONIZED
			, src.LOCAL_UOM_FACTOR
			, src.ORDER_AMOUNT
			, src.LOCAL_AMOUNT
			, src.GROUP_AMOUNT
			, src.ORDER_CURRENCY
			, src.LOCAL_CURRENCY
			, src.LINE_DISCOUNT_AMOUNT
			, src.ORDER_DISCOUNT_AMOUNT
			, src.LINE_BONUS_AMOUNT
			, src.BONUS_SHARE_AMOUNT
			)
		--! If any value has changed or a previously soft-deleted record re-appears then update
		when matched and tgt.EtlDeltaHash <> src.EtlDeltaHash or (tgt.IsDeleted = 'Y' and src.CurrentUniqueifier = 1)
			then update set
					  tgt.EtlDeltaHash = src.EtlDeltaHash
					, tgt.EtlUpdatedOn = @LoadStart
					, tgt.EtlUpdatedBy = @_FunctionName
					, tgt.IsDeleted = case when src.CurrentUniqueifier > 1 then 'Y' else 'N' end
					, tgt.SYSTEM_ID = src.SYSTEM_ID
					, tgt.ORDER_NUMBER = src.ORDER_NUMBER
					, tgt.ORDER_LINE_NUMBER = src.ORDER_LINE_NUMBER
					, tgt.EXPECTED_INVOICE_DATE = src.EXPECTED_INVOICE_DATE
					, tgt.ORDER_TYPE = src.ORDER_TYPE
					, tgt.OrderTypeName = src.OrderTypeName
					, tgt.LOCAL_SITE_SOLD = src.LOCAL_SITE_SOLD
					, tgt.SITE_ID = src.SITE_ID
					, tgt.ITEM_NO = src.ITEM_NO
					, tgt.ITEM_CATEGORY_ID = src.ITEM_CATEGORY_ID
					, tgt.ENV_CATEGORY_ID = src.ENV_CATEGORY_ID
					, tgt.SOLD_TO_CUSTOMER_NO = src.SOLD_TO_CUSTOMER_NO
					, tgt.SHIP_TO_CUSTOMER_NO = src.SHIP_TO_CUSTOMER_NO
					, tgt.SALESPERSON_ID = src.SALESPERSON_ID
					, tgt.SALESPERSON_NAME = src.SALESPERSON_NAME
					, tgt.ORDER_QUANTITY = src.ORDER_QUANTITY
					, tgt.ORDER_UOM = src.ORDER_UOM
					, tgt.STATISTIC_QUANTITY = src.STATISTIC_QUANTITY
					, tgt.STATISTIC_UOM = src.STATISTIC_UOM
					, tgt.QUANTITY = src.QUANTITY
					, tgt.LOCAL_UOM = src.LOCAL_UOM
					, tgt.LOCAL_UOM_HARMONIZED = src.LOCAL_UOM_HARMONIZED
					, tgt.LOCAL_UOM_FACTOR = src.LOCAL_UOM_FACTOR
					, tgt.ORDER_AMOUNT = src.ORDER_AMOUNT
					, tgt.LOCAL_AMOUNT = src.LOCAL_AMOUNT
					, tgt.GROUP_AMOUNT = src.GROUP_AMOUNT
					, tgt.ORDER_CURRENCY = src.ORDER_CURRENCY
					, tgt.LOCAL_CURRENCY = src.LOCAL_CURRENCY
					, tgt.LINE_DISCOUNT_AMOUNT = src.LINE_DISCOUNT_AMOUNT
					, tgt.ORDER_DISCOUNT_AMOUNT = src.ORDER_DISCOUNT_AMOUNT
					, tgt.LINE_BONUS_AMOUNT = src.LINE_BONUS_AMOUNT
					, tgt.BONUS_SHARE_AMOUNT = src.BONUS_SHARE_AMOUNT
		--! If the REC_ID no longer exists at source, the Invoice date is within the capture range and the staging row isn't already inactive then soft-delete
		when not matched by source and (tgt.EXPECTED_INVOICE_DATE between @_DataCaptureStart and @_DataCaptureEnd) and tgt.OrderBacklogKey >= 100 and tgt.IsDeleted = 'N'
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
		set @_Step = 'Identify Unique Orders'
		set @_StepStartTime = getdate();
		declare @_UniquifierRowsAffected int;
		--!
		--! Start by finding all duplicates based on SYSTEM_ID, ORDER_NUMBER and ORDER_LINE_NUMBER
		--!
		;with dupesCte
		as
		(
			select
				  SYSTEM_ID
				, ORDER_NUMBER
				, ORDER_LINE_NUMBER
				, count(*) as [DupeCount]
			from
				stg.OrderBacklog
			group by
				  SYSTEM_ID
				, ORDER_NUMBER
				, ORDER_LINE_NUMBER
			having count(*) > 1
		)
		, uniqueifiedCte
		as
		(
			select
				  d.SYSTEM_ID
				, d.ORDER_NUMBER
				, d.ORDER_LINE_NUMBER
				, d.DupeCount
				, ob.OrderBacklogKey
				, ob.REC_ID
				, ob.EXPECTED_INVOICE_DATE
				, ob.EtlUpdatedOn
				, row_number() over (partition by d.SYSTEM_ID, d.ORDER_NUMBER, d.ORDER_LINE_NUMBER order by ob.EXPECTED_INVOICE_DATE desc, ob.EtlUpdatedOn desc, ob.OrderBacklogKey desc) as [Uniqueifier]
			from
				dupesCte as d
			inner join stg.OrderBacklog as ob
				on ob.SYSTEM_ID = d.SYSTEM_ID
				and ob.ORDER_NUMBER = d.ORDER_NUMBER
				and ob.ORDER_LINE_NUMBER = d.ORDER_LINE_NUMBER
		)
		, finalCte
		as
		(
			select
				  u.OrderBacklogKey
				, u.Uniqueifier
				, u.SYSTEM_ID
				, u.ORDER_NUMBER
				, u.ORDER_LINE_NUMBER
				, u.EXPECTED_INVOICE_DATE
				, u.DupeCount
				, privy.OrderBacklogDeltaHash
					(
					  u.Uniqueifier
					, ord.SYSTEM_ID
					, ord.ORDER_NUMBER
					, ord.ORDER_LINE_NUMBER
					, ord.EXPECTED_INVOICE_DATE
					, ord.ORDER_TYPE
					, ord.OrderTypeName
					, ord.LOCAL_SITE_SOLD
					, ord.SITE_ID
					, ord.ITEM_NO
					, ord.ITEM_CATEGORY_ID
					, ord.ENV_CATEGORY_ID
					, ord.SOLD_TO_CUSTOMER_NO
					, ord.SHIP_TO_CUSTOMER_NO
					, ord.SALESPERSON_ID
					, ord.SALESPERSON_NAME
					, ord.ORDER_QUANTITY
					, ord.ORDER_UOM
					, ord.STATISTIC_QUANTITY
					, ord.STATISTIC_UOM
					, ord.QUANTITY
					, ord.LOCAL_UOM
					, ord.LOCAL_UOM_HARMONIZED
					, ord.LOCAL_UOM_FACTOR
					, ord.ORDER_AMOUNT
					, ord.LOCAL_AMOUNT
					, ord.GROUP_AMOUNT
					, ord.ORDER_CURRENCY
					, ord.LOCAL_CURRENCY
					, ord.LINE_DISCOUNT_AMOUNT
					, ord.ORDER_DISCOUNT_AMOUNT
					, ord.LINE_BONUS_AMOUNT
					, ord.BONUS_SHARE_AMOUNT
					) as [EtlDeltaHash]
			from
				uniqueifiedCte as u
			inner join stg.OrderBacklog as ord
				on ord.OrderBacklogKey = u.OrderBacklogKey
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
			stg.OrderBacklog as tgt
		inner join finalCte as src
			on src.OrderBacklogKey = tgt.OrderBacklogKey
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
if @@error <> 0 set noexec on
go
print N'Altering [privy].[OrderShippedNotInvoicedRefresh]'
go
alter procedure [privy].[OrderShippedNotInvoicedRefresh]
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
PROCEDURE NAME:		privy.OrderShippedNotInvoicedRefresh
DESCRIPTION:		Merges any changes from the QlikView source into the staging area ready for consumption by the
					QV-to-IDW ETL process
ORIGIN DATE:		14-JUN-2017
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
001		14-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------
002		14-JUL-2017		GML		BSR-103	Revised Uniquifier logic to prefer most recently updated active duplicate
------- ------------	------	-------	-----------------------------------------------------------------------------
003		25-JUL-2017		GML		BSR-132	Further revised Uniqueifier logic mark all non-preferred dupes as inactive
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

		if @_DataCaptureEnd is null
			raiserror('Load Parameter: Data Capture End cannot be null', 16, 1);

		--!
		--!
		--!
		set @_Step = 'Collect Runtime Parameters';
		set @_StepStartTime = getdate();

		declare @_UnmappedPaymentTerm varchar(50) = (select TEKST from [Icopal_profBIS].dbo.FLEXPARAMS where PARAMTYPE = 'DWH' and PARAMNAVN = 'PAYMENT_UNMAPPED') ;
		declare @_UnmappedProductCategory varchar(50) = (select TEKST from [Icopal_profBIS].dbo.FLEXPARAMS where PARAMTYPE = 'DWH' and PARAMNAVN = 'SA_UNMAPPED_ITEM') ;
		declare @_ExcludeFromQlikViewProductCategory varchar(50) = (select TEKST from [Icopal_profBIS].dbo.FLEXPARAMS where PARAMTYPE = 'DWH' and PARAMNAVN = 'SALES_NOT_QLIKVIEW') ;
		declare @_ExcludeFromQlikViewCustomerCategory varchar(50) = (select TEKST from [Icopal_profBIS].dbo.FLEXPARAMS where PARAMTYPE = 'DWH' and PARAMNAVN = 'CUSTOMER_NOT_EXPORTED') ;

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
			--! The following columns are defined as NOT NULL on the underlying table: REC_ID, SYSTEM_ID, SITE_SOLD
			--! We use the following columns to uniquely identify each row: SYSTEM_ID, ORDER_NUMBER, ORDER_LINE_NUMBER, SHIPPING_DOCUMENT and Uniqueifier
			select
				  ord.REC_ID
				, ord.SYSTEM_ID
				, coalesce(ord.ORDER_NUMBER, '') as [ORDER_NUMBER]
				, coalesce(ord.ORDER_LINE_NUMBER, '') as [ORDER_LINE_NUMBER]
				, coalesce(ord.SHIPPING_DOCUMENT, '') as [SHIPPING_DOCUMENT]
				, coalesce(tgt.Uniqueifier, 1) as [Uniqueifier] -- assume no dupes on new records for now (we check properly later)
				-----------------------------------------------------------------------------------------------------------------------
				, ord.EXPECTED_INVOICE_DATE
				, coalesce(ord.ORDER_TYPE, '') as [ORDER_TYPE]
				, case coalesce(ord.ORDER_TYPE, '')
					when '1' then 'TODO: Define Order Type (' + coalesce(ord.ORDER_TYPE, '') + ')'
					when '2' then 'TODO: Define Order Type (' + coalesce(ord.ORDER_TYPE, '') + ')'
					when '' then 'Not Specified At Source'
					else 'Lookup Not Found (' + coalesce(ord.ORDER_TYPE, '') + ')'
				  end as [OrderTypeName]
				-----------------------------------------------------------------------------------------------------------------------
				, ord.SITE_SOLD as [LOCAL_SITE_SOLD]
				, ssite.SITE_ID -- Don't need to collect SBU from this as per V_SA_ORDERSNI as we will expose SiteKey in the view later
				-----------------------------------------------------------------------------------------------------------------------
				, coalesce(ord.ITEM_NO, '') as [ITEM_NO]
				, coalesce(pCat.ITEM_CATEGORY_ID, @_UnmappedProductCategoryId) as [ITEM_CATEGORY_ID]
				, EnvPcat.ENV_CATEGORY_ID
				-----------------------------------------------------------------------------------------------------------------------
				, coalesce(ord.SOLD_TO, '') as [SOLD_TO_CUSTOMER_NO]
				, coalesce(ord.SHIP_TO, '') as [SHIP_TO_CUSTOMER_NO]
				-----------------------------------------------------------------------------------------------------------------------
				, coalesce(ord.SALESPERSON_ID, '') as [SALESPERSON_ID]
				, coalesce(ord.SALESPERSON_NAME, '') as [SALESPERSON_NAME]
				-----------------------------------------------------------------------------------------------------------------------
				, ord.SHIPPED_QUANTITY
				, coalesce(ord.SHIPPED_UOM, '') as [SHIPPED_UOM]
				, ord.STATISTIC_QUANTITY
				, coalesce(ord.STATISTIC_UOM, '') as [STATISTIC_UOM]
				, ord.QUANTITY
				-----------------------------------------------------------------------------------------------------------------------
				, coalesce(ord.UOM, '') as [LOCAL_UOM]
				, coalesce(lUom.HARMONIZED_UOM, '') as [LOCAL_UOM_HARMONIZED]
				, lUom.FACTOR as [LOCAL_UOM_FACTOR]
				-----------------------------------------------------------------------------------------------------------------------
				, ord.SHIPPED_AMOUNT
				, ord.LOCAL_AMOUNT
				, ord.GROUP_AMOUNT
				, coalesce(ord.SHIPPED_CURRENCY, '') as [SHIPPED_CURRENCY]
				, coalesce(ord.LOCAL_CURRENCY, '') as [LOCAL_CURRENCY]
				-----------------------------------------------------------------------------------------------------------------------
				, ord.LINE_DISCOUNT_AMOUNT
				, ord.ORDER_DISCOUNT_AMOUNT
				, ord.LINE_BONUS_AMOUNT
				, ord.BONUS_SHARE_AMOUNT
				-----------------------------------------------------------------------------------------------------------------------
				--! Encapsulate ALL non-key columns into a hash value to speed up CDC checks during susbseqent loads
				, privy.OrderShippedNotInvoicedDeltaHash
					(
					  coalesce(tgt.Uniqueifier, 1)
					, ord.SYSTEM_ID
					, ord.ORDER_NUMBER
					, ord.ORDER_LINE_NUMBER
					, ord.SHIPPING_DOCUMENT
					, ord.EXPECTED_INVOICE_DATE
					, ord.ORDER_TYPE
					, case coalesce(ord.ORDER_TYPE, '')
							when '1' then 'TODO: Define Order Type (' + coalesce(ord.ORDER_TYPE, '') + ')'
							when '2' then 'TODO: Define Order Type (' + coalesce(ord.ORDER_TYPE, '') + ')'
							when '' then 'Not Specified At Source'
							else 'Lookup Not Found (' + coalesce(ord.ORDER_TYPE, '') + ')'
						  end -- OrderTypeName
					, ord.SITE_SOLD 
					, ssite.SITE_ID-- Don't need to collect SBU from this as per V_SA_ORDER_BACKLOG as we will expose SiteKey in the view later
					, ord.ITEM_NO
					, coalesce(pCat.ITEM_CATEGORY_ID, @_UnmappedProductCategoryId)
					, EnvPcat.ENV_CATEGORY_ID
					, ord.SOLD_TO
					, ord.SHIP_TO
					, ord.SALESPERSON_ID
					, ord.SALESPERSON_NAME
					, ord.SHIPPED_QUANTITY
					, ord.SHIPPED_UOM
					, ord.STATISTIC_QUANTITY
					, ord.STATISTIC_UOM
					, ord.QUANTITY
					, ord.UOM
					, lUom.HARMONIZED_UOM
					, lUom.FACTOR
					, ord.SHIPPED_AMOUNT
					, ord.LOCAL_AMOUNT
					, ord.GROUP_AMOUNT
					, ord.SHIPPED_CURRENCY
					, ord.LOCAL_CURRENCY
					, ord.LINE_DISCOUNT_AMOUNT
					, ord.ORDER_DISCOUNT_AMOUNT
					, ord.LINE_BONUS_AMOUNT
					, ord.BONUS_SHARE_AMOUNT
					) as [EtlDeltaHash]
				---------------------------------------------------------------------------------------------------
				, coalesce(tgt.Uniqueifier, 1) as [CurrentUniqueifier]
			from
				[Icopal_profBIS].dbo.SA_ORDER_SNI as ord
			inner join [Icopal_profBIS].dbo.PU_LINK_SITE as ssite
				on ssite.SYSTEM_ID = ord.SYSTEM_ID
				and ssite.LOCAL_SITE = ord.SITE_SOLD
			inner join [Icopal_profBIS].dbo.MD_SITE as msite
				on msite.SITE_ID = ssite.SITE_ID
			--! Make sure we can filter for just invoices belonging to SBUs where SABIS is true
			inner join [Icopal_profBIS].dbo.MD_SBU as sbu
				on sbu.SBU   = msite.SBU
			left outer join [Icopal_profBIS].dbo.SA_LINK_ITEM as pCat
				on pCat.SYSTEM_ID = ord.SYSTEM_ID
				and pCat.ITEM_NO = ord.ITEM_NO
			left outer join [Icopal_profBIS].dbo.SA_LINK_ENV as EnvPcat
				on EnvPcat.SYSTEM_ID = ord.SYSTEM_ID
				and EnvPcat.ITEM_NO = ord.ITEM_NO
			left outer join [Icopal_profBIS].dbo.PU_LINK_UOM as lUom
				on lUom.SYSTEM_ID = ord.SYSTEM_ID
				and lUom.LOCAL_UOM = ord.UOM
			left outer join [Icopal_profBIS].dbo.SA_LINK_CUSTOMER as lcc 
				on lcc.SYSTEM_ID = ord.SYSTEM_ID
				and lcc.CUSTOMER_NO = ord.SHIP_TO
			left join stg.OrderShippedNotInvoiced as tgt
				on tgt.REC_ID = ord.REC_ID
			where
					ord.EXPECTED_INVOICE_DATE between @_DataCaptureStart and @_DataCaptureEnd
				--! Replicate all the filters used in Icopal_profBIS.dbo.V_SA_INVOICE (except date)
				and sbu.SABIS = 'Y'
				and ord.ORDER_TYPE in ('1', '2')
				and isnull(pCat.ITEM_CATEGORY_ID, -1) <> @_ExcludeFromQlikViewProductCategoryId
				and isnull(lcc.CUSTOMER_CATEGORY_ID, -1) <> @_ExcludeFromQlikViewCustomerCategoryId
		)
		merge into stg.OrderShippedNotInvoiced as tgt
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
			, ORDER_NUMBER
			, ORDER_LINE_NUMBER
			, SHIPPING_DOCUMENT
			, Uniqueifier
			, EXPECTED_INVOICE_DATE
			, ORDER_TYPE
			, OrderTypeName
			, LOCAL_SITE_SOLD
			, SITE_ID
			, ITEM_NO
			, ITEM_CATEGORY_ID
			, ENV_CATEGORY_ID
			, SOLD_TO_CUSTOMER_NO
			, SHIP_TO_CUSTOMER_NO
			, SALESPERSON_ID
			, SALESPERSON_NAME
			, SHIPPED_QUANTITY
			, SHIPPED_UOM
			, STATISTIC_QUANTITY
			, STATISTIC_UOM
			, QUANTITY
			, LOCAL_UOM
			, LOCAL_UOM_HARMONIZED
			, LOCAL_UOM_FACTOR
			, SHIPPED_AMOUNT
			, LOCAL_AMOUNT
			, GROUP_AMOUNT
			, SHIPPED_CURRENCY
			, LOCAL_CURRENCY
			, LINE_DISCOUNT_AMOUNT
			, ORDER_DISCOUNT_AMOUNT
			, LINE_BONUS_AMOUNT
			, BONUS_SHARE_AMOUNT
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
			, src.ORDER_NUMBER
			, src.ORDER_LINE_NUMBER
			, src.SHIPPING_DOCUMENT
			, src.Uniqueifier
			, src.EXPECTED_INVOICE_DATE
			, src.ORDER_TYPE
			, src.OrderTypeName
			, src.LOCAL_SITE_SOLD
			, src.SITE_ID
			, src.ITEM_NO
			, src.ITEM_CATEGORY_ID
			, src.ENV_CATEGORY_ID
			, src.SOLD_TO_CUSTOMER_NO
			, src.SHIP_TO_CUSTOMER_NO
			, src.SALESPERSON_ID
			, src.SALESPERSON_NAME
			, src.SHIPPED_QUANTITY
			, src.SHIPPED_UOM
			, src.STATISTIC_QUANTITY
			, src.STATISTIC_UOM
			, src.QUANTITY
			, src.LOCAL_UOM
			, src.LOCAL_UOM_HARMONIZED
			, src.LOCAL_UOM_FACTOR
			, src.SHIPPED_AMOUNT
			, src.LOCAL_AMOUNT
			, src.GROUP_AMOUNT
			, src.SHIPPED_CURRENCY
			, src.LOCAL_CURRENCY
			, src.LINE_DISCOUNT_AMOUNT
			, src.ORDER_DISCOUNT_AMOUNT
			, src.LINE_BONUS_AMOUNT
			, src.BONUS_SHARE_AMOUNT
			)
		--! If any value has changed or a previously soft-deleted record re-appears then update
		when matched and tgt.EtlDeltaHash <> src.EtlDeltaHash or (tgt.IsDeleted = 'Y' and src.CurrentUniqueifier = 1)
			then update set
					  tgt.EtlDeltaHash = src.EtlDeltaHash
					, tgt.EtlUpdatedOn = @LoadStart
					, tgt.EtlUpdatedBy = @_FunctionName
					, tgt.IsDeleted = case when src.CurrentUniqueifier > 1 then 'Y' else 'N' end
					, tgt.ORDER_NUMBER = src.ORDER_NUMBER
					, tgt.ORDER_LINE_NUMBER = src.ORDER_LINE_NUMBER
					, tgt.SHIPPING_DOCUMENT = src.SHIPPING_DOCUMENT
					, tgt.EXPECTED_INVOICE_DATE = src.EXPECTED_INVOICE_DATE
					, tgt.ORDER_TYPE = src.ORDER_TYPE
					, tgt.OrderTypeName = src.OrderTypeName
					, tgt.LOCAL_SITE_SOLD = src.LOCAL_SITE_SOLD
					, tgt.SITE_ID = src.SITE_ID
					, tgt.ITEM_NO = src.ITEM_NO
					, tgt.ITEM_CATEGORY_ID = src.ITEM_CATEGORY_ID
					, tgt.ENV_CATEGORY_ID = src.ENV_CATEGORY_ID
					, tgt.SOLD_TO_CUSTOMER_NO = src.SOLD_TO_CUSTOMER_NO
					, tgt.SHIP_TO_CUSTOMER_NO = src.SHIP_TO_CUSTOMER_NO
					, tgt.SALESPERSON_ID = src.SALESPERSON_ID
					, tgt.SALESPERSON_NAME = src.SALESPERSON_NAME
					, tgt.SHIPPED_QUANTITY = src.SHIPPED_QUANTITY
					, tgt.SHIPPED_UOM = src.SHIPPED_UOM
					, tgt.STATISTIC_QUANTITY = src.STATISTIC_QUANTITY
					, tgt.STATISTIC_UOM = src.STATISTIC_UOM
					, tgt.QUANTITY = src.QUANTITY
					, tgt.LOCAL_UOM = src.LOCAL_UOM
					, tgt.LOCAL_UOM_HARMONIZED = src.LOCAL_UOM_HARMONIZED
					, tgt.LOCAL_UOM_FACTOR = src.LOCAL_UOM_FACTOR
					, tgt.SHIPPED_AMOUNT = src.SHIPPED_AMOUNT
					, tgt.LOCAL_AMOUNT = src.LOCAL_AMOUNT
					, tgt.GROUP_AMOUNT = src.GROUP_AMOUNT
					, tgt.SHIPPED_CURRENCY = src.SHIPPED_CURRENCY
					, tgt.LOCAL_CURRENCY = src.LOCAL_CURRENCY
					, tgt.LINE_DISCOUNT_AMOUNT = src.LINE_DISCOUNT_AMOUNT
					, tgt.ORDER_DISCOUNT_AMOUNT = src.ORDER_DISCOUNT_AMOUNT
					, tgt.LINE_BONUS_AMOUNT = src.LINE_BONUS_AMOUNT
					, tgt.BONUS_SHARE_AMOUNT = src.BONUS_SHARE_AMOUNT
		--! If the REC_ID no longer exists at source, the Invoice date is within the capture range and the staging row isn't already inactive then soft-delete
		when not matched by source and (tgt.EXPECTED_INVOICE_DATE between @_DataCaptureStart and @_DataCaptureEnd) and tgt.OrderShippedNotInvoicedKey >= 100 and tgt.IsDeleted = 'N'
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
		set @_Step = 'Identify Unique Orders'
		set @_StepStartTime = getdate();
		declare @_UniquifierRowsAffected int;
		--!
		--! Start by finding all duplicates based on SYSTEM_ID, ORDER_NUMBER and ORDER_LINE_NUMBER
		--!
		;with dupesCte
		as
		(
			select
				  SYSTEM_ID
				, ORDER_NUMBER
				, ORDER_LINE_NUMBER
				, SHIPPING_DOCUMENT
				, count(*) as [DupeCount]
			from
				stg.OrderShippedNotInvoiced
			group by
				  SYSTEM_ID
				, ORDER_NUMBER
				, ORDER_LINE_NUMBER
				, SHIPPING_DOCUMENT
			having count(*) > 1
		)
		, uniqueifiedCte
		as
		(
			select
				  d.SYSTEM_ID
				, d.ORDER_NUMBER
				, d.ORDER_LINE_NUMBER
				, d.SHIPPING_DOCUMENT
				, d.DupeCount
				, osni.OrderShippedNotInvoicedKey
				, osni.REC_ID
				, osni.EXPECTED_INVOICE_DATE
				, osni.EtlUpdatedOn
				, row_number() over (partition by d.SYSTEM_ID, d.ORDER_NUMBER, d.ORDER_LINE_NUMBER, d.SHIPPING_DOCUMENT order by osni.EXPECTED_INVOICE_DATE desc, osni.EtlUpdatedOn desc, osni.OrderShippedNotInvoicedKey desc) as [Uniqueifier]
			from
				dupesCte as d
			inner join stg.OrderShippedNotInvoiced as osni
				on osni.SYSTEM_ID = d.SYSTEM_ID
				and osni.ORDER_NUMBER = d.ORDER_NUMBER
				and osni.ORDER_LINE_NUMBER = d.ORDER_LINE_NUMBER
				and osni.SHIPPING_DOCUMENT = d.SHIPPING_DOCUMENT
		)
		, finalCte
		as
		(
			select
				  u.OrderShippedNotInvoicedKey
				, u.Uniqueifier
				, u.SYSTEM_ID
				, u.ORDER_NUMBER
				, u.ORDER_LINE_NUMBER
				, u.SHIPPING_DOCUMENT
				, u.EXPECTED_INVOICE_DATE
				, u.DupeCount
				, privy.OrderShippedNotInvoicedDeltaHash
					(
					  u.Uniqueifier
					, ord.SYSTEM_ID
					, ord.ORDER_NUMBER
					, ord.ORDER_LINE_NUMBER
					, ord.SHIPPING_DOCUMENT
					, ord.EXPECTED_INVOICE_DATE
					, ord.ORDER_TYPE
					, ord.OrderTypeName
					, ord.LOCAL_SITE_SOLD
					, ord.SITE_ID
					, ord.ITEM_NO
					, ord.ITEM_CATEGORY_ID
					, ord.ENV_CATEGORY_ID
					, ord.SOLD_TO_CUSTOMER_NO
					, ord.SHIP_TO_CUSTOMER_NO
					, ord.SALESPERSON_ID
					, ord.SALESPERSON_NAME
					, ord.SHIPPED_QUANTITY
					, ord.SHIPPED_UOM
					, ord.STATISTIC_QUANTITY
					, ord.STATISTIC_UOM
					, ord.QUANTITY
					, ord.LOCAL_UOM
					, ord.LOCAL_UOM_HARMONIZED
					, ord.LOCAL_UOM_FACTOR
					, ord.SHIPPED_AMOUNT
					, ord.LOCAL_AMOUNT
					, ord.GROUP_AMOUNT
					, ord.SHIPPED_CURRENCY
					, ord.LOCAL_CURRENCY
					, ord.LINE_DISCOUNT_AMOUNT
					, ord.ORDER_DISCOUNT_AMOUNT
					, ord.LINE_BONUS_AMOUNT
					, ord.BONUS_SHARE_AMOUNT
					) as [EtlDeltaHash]
			from
				uniqueifiedCte as u
			inner join stg.OrderShippedNotInvoiced as ord
				on ord.OrderShippedNotInvoicedKey = u.OrderShippedNotInvoicedKey
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
			stg.OrderShippedNotInvoiced as tgt
		inner join finalCte as src
			on src.OrderShippedNotInvoicedKey = tgt.OrderShippedNotInvoicedKey
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
if @@error <> 0 set noexec on
go
print N'Altering [etl].[PrepareStagingData]'
go
alter procedure [etl].[PrepareStagingData]
(
  @LoadStart datetime = null
, @DebugLevel tinyint = 0
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		etl.PrepareStagingData
DESCRIPTION:		Executes a series of private worker procedures to prepare all staging data prior to ETL extract
					into interim data warehouse
ORIGIN DATE:		09-JUN-2017
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
001		09-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------
001		24-AUG-2017		GML		BSR-235	Added additional journalling calls to improve real-time monitoring
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
			+ char(10) + '    @LoadStart       : ' + coalesce(convert(varchar(24), @LoadStart, 120), '')
			+ char(10) + '    @DebugLevel      : ' + coalesce(cast(@DebugLevel as varchar(16)), 'NULL')
			+ char(10)
	set @_ProgressLog = @_ProgressMessage;

	/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
	/**/ if @DebugLevel > 4
	/**/     begin
	/**/         raiserror('', 0, 1) with nowait;
	/**/         raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
	/**/     end
	/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

	if @_JournalOnOff = 'ON'
		exec log4.JournalWriter
				  @Task = @_JobName
				, @FunctionName = @_FunctionName
				, @StepInFunction = 'Log Start'
				, @MessageText = @_ProgressMessage
				, @ExtraInfo = @_ProgressLog
				, @Severity = @SEVERITY_DEBUG

	begin try
		--! If Load Start time hasn't been passed in then set it now
		set @LoadStart = coalesce(@LoadStart, getdate())

		--!
		--!
		--!
		set @_Step = '1. Rebuild Product Category Hierarchy (Map)';
		set @_StepStartTime = getdate();

		exec privy.ProductCategoryHierarchyRebuild @LoadStart = @LoadStart, @RowsAffected = @_RowCount out ;

		set @_ProgressMessage = 'Step: "' +  @_Step + '" processed ' + coalesce(cast(@_RowCount as varchar(16)), 'NULL') + ' row(s)'
				+ ' in ' + log4.FormatElapsedTime(@_StepStartTime, null, 3)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 4 raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

		if @_JournalOnOff = 'ON'
			exec log4.JournalWriter
					  @Task = @_JobName
					, @FunctionName = @_FunctionName
					, @StepInFunction = @_Step
					, @MessageText = @_ProgressMessage
					, @ExtraInfo = @_ProgressLog
					, @Severity = @SEVERITY_DEBUG

		--!
		--!
		--!
		set @_Step = '2. Rebuild Product Category Hierarchy (Flat)';
		set @_StepStartTime = getdate();

		exec privy.ProductCategoryRefresh @LoadStart = @LoadStart, @RowsAffected = @_RowCount out ;

		set @_ProgressMessage = 'Step: "' +  @_Step + '" processed ' + coalesce(cast(@_RowCount as varchar(16)), 'NULL') + ' row(s)'
				+ ' in ' + log4.FormatElapsedTime(@_StepStartTime, null, 3)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 4 raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

		if @_JournalOnOff = 'ON'
			exec log4.JournalWriter
					  @Task = @_JobName
					, @FunctionName = @_FunctionName
					, @StepInFunction = @_Step
					, @MessageText = @_ProgressMessage
					, @ExtraInfo = @_ProgressLog
					, @Severity = @SEVERITY_DEBUG

		--!
		--!
		--!
		set @_Step = '3. Rebuild Customer Category Hierarchy';
		set @_StepStartTime = getdate();

		exec privy.CustomerCategoryHierarchyRebuild @LoadStart = @LoadStart, @RowsAffected = @_RowCount out ;

		set @_ProgressMessage = 'Step: "' +  @_Step + '" processed ' + coalesce(cast(@_RowCount as varchar(16)), 'NULL') + ' row(s)'
				+ ' in ' + log4.FormatElapsedTime(@_StepStartTime, null, 3)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 4 raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

		if @_JournalOnOff = 'ON'
			exec log4.JournalWriter
					  @Task = @_JobName
					, @FunctionName = @_FunctionName
					, @StepInFunction = @_Step
					, @MessageText = @_ProgressMessage
					, @ExtraInfo = @_ProgressLog
					, @Severity = @SEVERITY_DEBUG

		--!
		--!
		--!
		set @_Step = '4. Refresh Product (Dimension)';
		set @_StepStartTime = getdate();

		exec privy.ProductRefresh @LoadStart = @LoadStart, @RowsAffected = @_RowCount out ;

		set @_ProgressMessage = 'Step: "' +  @_Step + '" processed ' + coalesce(cast(@_RowCount as varchar(16)), 'NULL') + ' row(s)'
				+ ' in ' + log4.FormatElapsedTime(@_StepStartTime, null, 3)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 4 raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

		if @_JournalOnOff = 'ON'
			exec log4.JournalWriter
					  @Task = @_JobName
					, @FunctionName = @_FunctionName
					, @StepInFunction = @_Step
					, @MessageText = @_ProgressMessage
					, @ExtraInfo = @_ProgressLog
					, @Severity = @SEVERITY_DEBUG

		--!
		--!
		--!
		set @_Step = '5. Refresh Customer (Dimension)';
		set @_StepStartTime = getdate();

		exec privy.CustomerRefresh @LoadStart = @LoadStart, @RowsAffected = @_RowCount out ;

		set @_ProgressMessage = 'Step: "' +  @_Step + '" processed ' + coalesce(cast(@_RowCount as varchar(16)), 'NULL') + ' row(s)'
				+ ' in ' + log4.FormatElapsedTime(@_StepStartTime, null, 3)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 4 raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

		if @_JournalOnOff = 'ON'
			exec log4.JournalWriter
					  @Task = @_JobName
					, @FunctionName = @_FunctionName
					, @StepInFunction = @_Step
					, @MessageText = @_ProgressMessage
					, @ExtraInfo = @_ProgressLog
					, @Severity = @SEVERITY_DEBUG

		--!
		--!
		--!
		set @_Step = '6. Refresh BusinessUnit (Dimension)';
		set @_StepStartTime = getdate();

		exec privy.BusinessUnitRefresh @LoadStart = @LoadStart, @RowsAffected = @_RowCount out ;

		set @_ProgressMessage = 'Step: "' +  @_Step + '" processed ' + coalesce(cast(@_RowCount as varchar(16)), 'NULL') + ' row(s)'
				+ ' in ' + log4.FormatElapsedTime(@_StepStartTime, null, 3)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 4 raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

		if @_JournalOnOff = 'ON'
			exec log4.JournalWriter
					  @Task = @_JobName
					, @FunctionName = @_FunctionName
					, @StepInFunction = @_Step
					, @MessageText = @_ProgressMessage
					, @ExtraInfo = @_ProgressLog
					, @Severity = @SEVERITY_DEBUG

		--!
		--!
		--!
		set @_Step = '7. Refresh Site (Dimension)';
		set @_StepStartTime = getdate();

		exec privy.SiteRefresh @LoadStart = @LoadStart, @RowsAffected = @_RowCount out ;

		set @_ProgressMessage = 'Step: "' +  @_Step + '" processed ' + coalesce(cast(@_RowCount as varchar(16)), 'NULL') + ' row(s)'
				+ ' in ' + log4.FormatElapsedTime(@_StepStartTime, null, 3)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 4 raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

		if @_JournalOnOff = 'ON'
			exec log4.JournalWriter
					  @Task = @_JobName
					, @FunctionName = @_FunctionName
					, @StepInFunction = @_Step
					, @MessageText = @_ProgressMessage
					, @ExtraInfo = @_ProgressLog
					, @Severity = @SEVERITY_DEBUG

		--!
		--!
		--!
		set @_Step = '8. Refresh Payment Term (Dimension)';
		set @_StepStartTime = getdate();

		exec privy.PaymentTermRefresh @LoadStart = @LoadStart, @RowsAffected = @_RowCount out ;

		set @_ProgressMessage = 'Step: "' +  @_Step + '" processed ' + coalesce(cast(@_RowCount as varchar(16)), 'NULL') + ' row(s)'
				+ ' in ' + log4.FormatElapsedTime(@_StepStartTime, null, 3)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 4 raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

		if @_JournalOnOff = 'ON'
			exec log4.JournalWriter
					  @Task = @_JobName
					, @FunctionName = @_FunctionName
					, @StepInFunction = @_Step
					, @MessageText = @_ProgressMessage
					, @ExtraInfo = @_ProgressLog
					, @Severity = @SEVERITY_DEBUG

		--!
		--!
		--!
		set @_Step = '9. Refresh Invoice (Fact)';
		set @_StepStartTime = getdate();

		exec privy.InvoiceRefresh @LoadStart = @LoadStart, @DebugLevel = @DebugLevel, @RowsAffected = @_RowCount out ;

		set @_ProgressMessage = 'Step: "' +  @_Step + '" processed ' + coalesce(cast(@_RowCount as varchar(16)), 'NULL') + ' row(s)'
				+ ' in ' + log4.FormatElapsedTime(@_StepStartTime, null, 3)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 4 raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

		if @_JournalOnOff = 'ON'
			exec log4.JournalWriter
					  @Task = @_JobName
					, @FunctionName = @_FunctionName
					, @StepInFunction = @_Step
					, @MessageText = @_ProgressMessage
					, @ExtraInfo = @_ProgressLog
					, @Severity = @SEVERITY_DEBUG

		--!
		--!
		--!
		set @_Step = '10. Refresh OrderShippedNotInvoiced (Fact)';
		set @_StepStartTime = getdate();

		exec privy.OrderShippedNotInvoicedRefresh @LoadStart = @LoadStart, @DebugLevel = @DebugLevel, @RowsAffected = @_RowCount out ;

		set @_ProgressMessage = 'Step: "' +  @_Step + '" processed ' + coalesce(cast(@_RowCount as varchar(16)), 'NULL') + ' row(s)'
				+ ' in ' + log4.FormatElapsedTime(@_StepStartTime, null, 3)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 4 raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

		if @_JournalOnOff = 'ON'
			exec log4.JournalWriter
					  @Task = @_JobName
					, @FunctionName = @_FunctionName
					, @StepInFunction = @_Step
					, @MessageText = @_ProgressMessage
					, @ExtraInfo = @_ProgressLog
					, @Severity = @SEVERITY_DEBUG

		--!
		--!
		--!
		set @_Step = '11. Refresh OrderBacklog (Fact)';
		set @_StepStartTime = getdate();

		exec privy.OrderBacklogRefresh @LoadStart = @LoadStart, @DebugLevel = @DebugLevel, @RowsAffected = @_RowCount out ;

		set @_ProgressMessage = 'Step: "' +  @_Step + '" processed ' + coalesce(cast(@_RowCount as varchar(16)), 'NULL') + ' row(s)'
				+ ' in ' + log4.FormatElapsedTime(@_StepStartTime, null, 3)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 4 raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

		if @_JournalOnOff = 'ON'
			exec log4.JournalWriter
					  @Task = @_JobName
					, @FunctionName = @_FunctionName
					, @StepInFunction = @_Step
					, @MessageText = @_ProgressMessage
					, @ExtraInfo = @_ProgressLog
					, @Severity = @SEVERITY_DEBUG

		--!
		--! By this point there should be no uncommitted transactions
		--!
		if xact_state() = -1 or xact_state() = 1 or @@trancount > 0
			raiserror('Completed running all steps but found %i uncommitted transactions (expected zero)', 16, 1, @@trancount);

		--!
		--! If we get here, every step completed successfully so report final state
		--!
		set @_Message = 'Completed all staging data preparation steps'
		set @_Error = 0 ;
	end try
	begin catch
		set @_ErrorContext = 'Failed to prepare staging data at step: ' + coalesce('[' + @_Step + ']', 'NULL')

		--! Clean up any leftover transactions
		if xact_state() = -1 or xact_state() = 1
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
		;
	end catch

--/////////////////////////////////////////////////////////////////////////////////////////////////
EndEx:
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
	/**/ if @DebugLevel > 3
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
if @@error <> 0 set noexec on
go
commit transaction
go
if @@error <> 0 set noexec on
go
declare @Success as bit
set @Success = 1
set noexec off
if (@Success = 1) print 'The database update succeeded'
else begin
	if @@trancount > 0 rollback transaction
	print 'The database update failed'
end
go
