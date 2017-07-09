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
		  osni.OrderBacklogKey
		, osni.LineCount
		, osni.OrderNumber
		, osni.OrderLineNumber
		, osni.NativeOrderLineNumber
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
		, osni.OrderQuantityValue
		, osni.OrderQuantityUnitOfMeasure
		, osni.StatisticQuantityValue
		, osni.StatisticQuantityUnitOfMeasure
		, osni.Quantity
		, osni.LocalUnitOfMeasure
		, osni.LocalUnitOfMeasureHarmonised
		, osni.LocalUnitOfMeasureFactor
		, osni.OrderAmount
		, osni.LocalAmount
		, osni.GroupAmountEUR
		, osni.OrderCurrency
		, osni.LocalCurrency
		, osni.LineDiscountAmount
		, osni.OrderDiscountAmount
		, osni.LineBonusAmount
		, osni.BonusShareAmount
		--! Quick and dirty hack for Bob's Gross-to-Net Sales Report
		, cast(case when LocalCurrency <> OrderCurrency and LocalAmount > 0 and OrderAmount > 0 then LocalAmount / OrderAmount else 1 end as decimal(28,4)) as [InvoiceRate]
		, osni.IsDeleted
	from
		qvstg.OrderBacklog as osni
GO
