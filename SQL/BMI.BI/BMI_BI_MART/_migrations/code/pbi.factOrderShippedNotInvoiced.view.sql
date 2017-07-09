if objectpropertyex(object_id(N'pbi.factOrderShippedNotInvoiced'), N'IsView') = 1
	drop view pbi.factOrderShippedNotInvoiced
go
set quoted_identifier on;
set ansi_nulls on;
go
create view [pbi].[factOrderShippedNotInvoiced]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.factOrderShippedNotInvoiced
DESCRIPTION:    Exposes current state of the Orders that have been shipped but not invoiced (imported from QlikView
				- no history available)
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


**********************************************************************************************************************/
--</CommentHeader>

	select
		  osni.OrderShippedNotInvoicedKey
		, osni.LineCount
		, osni.OrderNumber
		, osni.OrderLineNumber
		, osni.NativeOrderLineNumber
		, osni.NativeShippingDocumentKey
		, osni.ExpectedInvoiceDateKey
		, osni.ExpectedInvoiceDate
		, osni.NativeOrderType
		, osni.OrderTypeName
		, osni.LocalSellingSite
		, osni.SiteKey
		, osni.ProductKey
		, osni.SoldToCustomerKey
		, osni.ShippedToCustomerKey
		, osni.NativeSalesPersonId
		, osni.NativeSalesPersonName
		, osni.ShippedQuantityValue
		, osni.ShippedQuantityUnitOfMeasure
		, osni.StatisticQuantityValue
		, osni.StatisticQuantityUnitOfMeasure
		, osni.Quantity
		, osni.LocalUnitOfMeasure
		, osni.LocalUnitOfMeasureHarmonised
		, osni.LocalUnitOfMeasureFactor
		, osni.ShippedAmount
		, osni.LocalAmount
		, osni.GroupAmountEUR
		, osni.ShippedCurrency
		, osni.LocalCurrency
		, osni.LineDiscountAmount
		, osni.OrderDiscountAmount
		, osni.LineBonusAmount
		, osni.BonusShareAmount
		--! Quick and dirty hack for Bob's Gross-to-Net Sales Report
		, cast(case when LocalCurrency <> ShippedCurrency and LocalAmount > 0 and ShippedAmount > 0 then LocalAmount / ShippedAmount else 1 end as decimal(28,4)) as [InvoiceRate]
		, osni.IsDeleted
	from
		qvi.factOrderShippedNotInvoiced as osni
go
