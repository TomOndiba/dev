IF OBJECT_ID('[pbi].[dimInvoiceDate]') IS NOT NULL
	DROP VIEW [pbi].[dimInvoiceDate];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE view [pbi].[dimInvoiceDate]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.dimInvoiceDate
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
		  DateKey as [InvoiceDateKey]
		, ActualDate as [InvoiceDate]
		, DateNameEU as [InvoiceDateDateNameEU]
		, DateNameUS as [InvoiceDateDateNameUS]
		, EnglishMonthCode as [InvoiceDateEnglishMonthCode]
		, EnglishMonthName as [InvoiceDateEnglishMonthName]
		, EnglishDayCode as [InvoiceDateEnglishDayCode]
		, EnglishDayName as [InvoiceDateEnglishDayName]
		, CalendarYear as [InvoiceDateCalendarYear]
		, CalendarQuarter as [InvoiceDateCalendarQuarter]
		, MonthNumberInYear as [InvoiceDateMonthNumberInYear]
		, WeekNumberInYear as [InvoiceDateWeekNumberInYear]
		, DayNumberInYear as [InvoiceDateDayNumberInYear]
		, DayNumberInMonth as [InvoiceDateDayNumberInMonth]
		, DayNumberInWeek as [InvoiceDateDayNumberInWeek]
		, YearMonth as [InvoiceDateYearMonth]
		, YearQuarter as [InvoiceDateYearQuarter]
		, IsWeekend as [InvoiceDateIsWeekend]
		, IsLastDayInMonth as [InvoiceDateIsLastDayInMonth]
		, MondayWeekCommencing as [InvoiceDateMondayWeekCommencing]
		, WorkDaysInMonthTotal as [InvoiceDateWorkDaysInMonthTotal]
		, WorkDaysInMonthToDate as [InvoiceDateWorkDaysInMonthToDate]
		, FiscalPeriod as [InvoiceDateFiscalPeriod]
		, FiscalQuarter as [InvoiceDateFiscalQuarter]
		, FiscalYear as [InvoiceDateFiscalYear]
		, FiscalPeriodCode as [InvoiceDateFiscalPeriodCode]
		, FiscalPeriodName as [InvoiceDateFiscalPeriodName]
		, FiscalYearPeriod as [InvoiceDateFiscalYearPeriod]
		, FiscalYearQuarter as [InvoiceDateFiscalYearQuarter]
		, WorkDaysInFiscalPeriodTotal as [InvoiceDateWorkDaysInFiscalPeriodTotal]
		, WorkDaysInFiscalPeriodToDate as [InvoiceDateWorkDaysInFiscalPeriodToDate]
	from
		dbo.Calendar
GO
