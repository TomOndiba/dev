create view [etl].[InvoiceDelta]
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


**********************************************************************************************************************/
--</CommentHeader>

	select
		  i.InvoiceKey																				as [InvoiceKey]
		, i.IsDeleted																				as [IsDeleted]
		--! Some standard entities (N/S, N/F, N/I etc) already have the correct DataSourceKey
		, case when i.SYSTEM_ID = 100000 then i.SYSTEM_ID else i.SYSTEM_ID + 100100 end				as [DataSourceKey]
		, cast(i.REC_ID as nvarchar(50))															as [QlikViewInvoiceKey]
		, cast(1 as int)																			as [LineCount]
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
	left join stg.InvoiceControl as ic
		on ic.InvoiceKey = i.InvoiceKey
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
		--! Exclude any duplicates based on SYSTEM_ID, INVOICE_NUMBER, ORDER_NUMBER, INVOICE_LINE_NUMBER and ORDER_LINE_NUMBER
			i.Uniqueifier = 1
		and
			(
					ic.InvoiceKey is null --! New Invoices (not yet added to control)
				or ic.PreviousDeltaHash <> i.EtlDeltaHash -- Existing Invoices that have been updated
				or ic.IsDeleted <> i.IsDeleted --! Invoices that have been soft-deleted or (possibly) re-activated
			)
go
execute sp_addextendedproperty @name = N'MS_Description'
, @value = 'Exposes Invoice changes (new, changed and deleted) in the format best suited to populate the Interim Data Warehouse/Mart'
, @level0type = N'SCHEMA', @level0name = N'etl', @level1type = N'VIEW', @level1name = N'InvoiceDelta';

