if objectpropertyex(object_id(N'pbi.factInvoice'), N'IsView') = 1
	drop view pbi.factInvoice
go
set quoted_identifier on;
set ansi_nulls on;
go
create view [pbi].[factInvoice]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.factInvoice
DESCRIPTION:    Exposes current state of the Invoice facts imported from QlikView (no history available)
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
		  i.InvoiceKey
		, i.LineCount
		, i.InvoiceDateKey
		, i.InvoiceDate
		, i.InvoiceNumber
		, i.InvoiceLineNumber
		, i.NativeInvoiceLineNumber
		, i.OrderNumber
		, i.OrderLineNumber
		, i.NativeOrderLineNumber
		, i.NativeInvoiceType
		, i.InvoiceTypeName
		, i.LocalSellingSite
		, i.SiteKey
		, i.ProductKey
		, i.SoldToCustomerKey
		, i.ShippedToCustomerKey
		, i.NativeSalesPersonId
		, i.NativeSalesPersonName
		, i.DeliveryDateKey as [ActualDeliveryDateKey]
		, i.DeliveryDate as [ActualDeliveryDate]
		, i.ExpectedPaymentDateKey
		, i.ExpectedPaymentDate
		, i.ActualPaymentDateKey
		, i.ActualPaymentDate
		, i.LocalDeliveryTerm
		, i.LocalDeliveryTermText
		, i.PaymentTermKey
		, i.LocalPaymentTerm
		, i.LocalPaymentTermText
		, i.InvoiceQuantityValue
		, i.InvoiceQuantityUnitOfMeasure
		, i.StatisticQuantityValue
		, i.StatisticQuantityUnitOfMeasure
		, i.Quantity
		, i.LocalUnitOfMeasure
		, i.LocalUnitOfMeasureHarmonised
		, i.LocalUnitOfMeasureFactor
		, i.InvoiceAmount
		, i.LocalAmount
		, i.GroupAmountEUR
		, i.InvoiceCurrency
		, i.LocalCurrency
		, i.LineDiscountAmount
		, i.InvoiceDiscountAmount
		, i.LineBonusAmount
		, i.BonusShareAmount
		, i.StandardCost
		, i.StandardFreight
		--! Quick and dirty hack for Bob's Gross-to-Net Sales Report
		, cast(case when LocalCurrency <> InvoiceCurrency and LocalAmount > 0 and InvoiceAmount > 0 then LocalAmount / InvoiceAmount else 1 end as decimal(28,4)) as [InvoiceRate]
		, i.IsDeleted
	from
		qvi.factInvoice as i
go
