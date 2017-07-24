IF OBJECT_ID('[pbi].[factOrderBacklog]') IS NOT NULL
	DROP VIEW [pbi].[factOrderBacklog];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create view [pbi].[factOrderBacklog]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.factOrderBacklog
DESCRIPTION:    Exposes current state of the Orders on backlog, i.e. promised but past or not delivered (imported
				from QlikView - no history available)
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


**********************************************************************************************************************/
--</CommentHeader>

	select
		  ob.OrderBacklogKey
		, ob.LineCount
		, ob.OrderNumber
		, ob.OrderLineNumber
		, ob.NativeOrderLineNumber
		, ob.ExpectedInvoiceDateKey
		, ob.ExpectedInvoiceDate
		, ob.NativeOrderType
		, ob.OrderTypeName
		, ob.LocalSellingSite
		, ob.SiteKey
		, ob.ProductKey
		, ob.SoldToCustomerKey
		, ob.ShippedToCustomerKey
		, ob.NativeSalesPersonId
		, ob.NativeSalesPersonName
		, ob.OrderQuantityValue
		, ob.OrderQuantityUnitOfMeasure
		, ob.StatisticQuantityValue
		, ob.StatisticQuantityUnitOfMeasure
		, ob.Quantity
		, ob.LocalUnitOfMeasure
		, ob.LocalUnitOfMeasureHarmonised
		, ob.LocalUnitOfMeasureFactor
		, ob.OrderAmount
		, ob.LocalAmount
		, ob.GroupAmountEUR
		, ob.OrderCurrency
		, ob.LocalCurrency
		, ob.LineDiscountAmount
		, ob.OrderDiscountAmount
		, ob.LineBonusAmount
		, ob.BonusShareAmount
		--! Quick and dirty hack for Bob's Gross-to-Net Sales Report
		, cast(case when LocalCurrency <> OrderCurrency and LocalAmount > 0 and OrderAmount > 0 then LocalAmount / OrderAmount else 1 end as decimal(28,4)) as [InvoiceRate]
		, ob.IsDeleted
	from
		qvstg.OrderBacklog as ob
GO
