IF OBJECT_ID('[pbi].[dimBudgetMonth]') IS NOT NULL
	DROP VIEW [pbi].[dimBudgetMonth];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE view [pbi].[dimBudgetMonth]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.dimBudgetMonth
DESCRIPTION:    Exposes date information for use with factInvoice.InvoiceDateKey
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    20-JUN-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		20-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------


**********************************************************************************************************************/
--</CommentHeader>

	select
		  min(DateKey) as [BudgetMonthKey]
		, FiscalPeriod as [BudgetFiscalPeriod]
		, FiscalQuarter as [BudgetFiscalQuarter]
		, FiscalYear as [BudgetFiscalYear]
		, FiscalPeriodCode as [BudgetFiscalPeriodCode]
		, FiscalPeriodName as [BudgetFiscalPeriodName]
		, FiscalYearPeriod as [BudgetFiscalYearPeriod]
		, FiscalYearQuarter as [BudgetFiscalYearQuarter]
		, WorkDaysInFiscalPeriodTotal as [BudgetWorkDaysInFiscalPeriodTotal]
	from
		dbo.Calendar
	group by
		  FiscalPeriod
		, FiscalQuarter
		, FiscalYear
		, FiscalPeriodCode
		, FiscalPeriodName
		, FiscalYearPeriod
		, FiscalYearQuarter
		, WorkDaysInFiscalPeriodTotal
GO
