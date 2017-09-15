CREATE view [etl].[OrderBacklogDelta]
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
execute sp_addextendedproperty @name = N'MS_Description'
, @value = 'Exposes changes to Orders shipped-not-invoiced (new, changed and deleted) in the format best suited to populate the Interim Data Warehouse/Mart'
, @level0type = N'SCHEMA', @level0name = N'etl', @level1type = N'VIEW', @level1name = N'OrderBacklogDelta';
