IF OBJECT_ID('[pbi].[dimExpectedPaymentDate]') IS NOT NULL
	DROP VIEW [pbi].[dimExpectedPaymentDate];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE view [pbi].[dimExpectedPaymentDate]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.dimExpectedPaymentDate
DESCRIPTION:    Exposes date information for use with factInvoice.ExpectedPaymentDateKey
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    21-JUN-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		21-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------


**********************************************************************************************************************/
--</CommentHeader>

	select
		  DateKey as [ExpectedPaymentDateKey]
		, ActualDate as [ExpectedPaymentDate]
		, DateNameEU as [ExpectedPaymentDateNameEU]
		, DateNameUS as [ExpectedPaymentDateNameUS]
		, EnglishMonthCode as [ExpectedPaymentDateEnglishMonthCode]
		, EnglishMonthName as [ExpectedPaymentDateEnglishMonthName]
		, EnglishDayCode as [ExpectedPaymentDateEnglishDayCode]
		, EnglishDayName as [ExpectedPaymentDateEnglishDayName]
		, CalendarYear as [ExpectedPaymentDateCalendarYear]
		, CalendarQuarter as [ExpectedPaymentDateCalendarQuarter]
		, MonthNumberInYear as [ExpectedPaymentDateMonthNumberInYear]
		, WeekNumberInYear as [ExpectedPaymentDateWeekNumberInYear]
		, DayNumberInYear as [ExpectedPaymentDateDayNumberInYear]
		, DayNumberInMonth as [ExpectedPaymentDateDayNumberInMonth]
		, DayNumberInWeek as [ExpectedPaymentDateDayNumberInWeek]
		, YearMonth as [ExpectedPaymentDateYearMonth]
		, YearQuarter as [ExpectedPaymentDateYearQuarter]
		, IsWeekend as [ExpectedPaymentDateIsWeekend]
		, IsLastDayInMonth as [ExpectedPaymentDateIsLastDayInMonth]
		, MondayWeekCommencing as [ExpectedPaymentDateMondayWeekCommencing]
		, WorkDaysInMonthTotal as [ExpectedPaymentDateWorkDaysInMonthTotal]
		, WorkDaysInMonthToDate as [ExpectedPaymentDateWorkDaysInMonthToDate]
		, FiscalPeriod as [ExpectedPaymentDateFiscalPeriod]
		, FiscalQuarter as [ExpectedPaymentDateFiscalQuarter]
		, FiscalYear as [ExpectedPaymentDateFiscalYear]
		, FiscalPeriodCode as [ExpectedPaymentDateFiscalPeriodCode]
		, FiscalPeriodName as [ExpectedPaymentDateFiscalPeriodName]
		, FiscalYearPeriod as [ExpectedPaymentDateFiscalYearPeriod]
		, FiscalYearQuarter as [ExpectedPaymentDateFiscalYearQuarter]
		, WorkDaysInFiscalPeriodTotal as [ExpectedPaymentDateWorkDaysInFiscalPeriodTotal]
		, WorkDaysInFiscalPeriodToDate as [ExpectedPaymentDateWorkDaysInFiscalPeriodToDate]
	from
		dbo.Calendar
GO
