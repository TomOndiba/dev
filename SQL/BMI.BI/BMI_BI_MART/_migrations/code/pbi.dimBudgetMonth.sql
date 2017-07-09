if objectpropertyex(object_id(N'pbi.dimBudgetMonth'), N'IsView') = 1
	drop view pbi.dimBudgetMonth
go
set quoted_identifier on;
set ansi_nulls on;
go
create view [pbi].[dimBudgetMonth]
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
		dbo.dimDate
	group by
		  FiscalPeriod
		, FiscalQuarter
		, FiscalYear
		, FiscalPeriodCode
		, FiscalPeriodName
		, FiscalYearPeriod
		, FiscalYearQuarter
		, WorkDaysInFiscalPeriodTotal
go
