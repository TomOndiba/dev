if object_id('[pbi].[Today]') is not null
	drop view [pbi].[Today];
go
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE view [pbi].[Today]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.Today
DESCRIPTION:    Exposes date information for the current date (used to spoof getdate() in Power BI)
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    17-JUL-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		17-JUL-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------


**********************************************************************************************************************/
--</CommentHeader>

	select
		  DateKey as [TodayDateKey]
		, ActualDate as [TodayDate]
		, DateNameEU as [TodayDateNameEU]
		, DateNameUS as [TodayDateNameUS]
		, EnglishMonthCode as [TodayEnglishMonthCode]
		, EnglishMonthName as [TodayEnglishMonthName]
		, EnglishDayCode as [TodayEnglishDayCode]
		, EnglishDayName as [TodayEnglishDayName]
		, CalendarYear as [TodayCalendarYear]
		, CalendarQuarter as [TodayCalendarQuarter]
		, MonthNumberInYear as [TodayMonthNumberInYear]
		, WeekNumberInYear as [TodayWeekNumberInYear]
		, DayNumberInYear as [TodayDayNumberInYear]
		, DayNumberInMonth as [TodayDayNumberInMonth]
		, DayNumberInWeek as [TodayDayNumberInWeek]
		, YearMonth as [TodayYearMonth]
		, YearQuarter as [TodayYearQuarter]
		, IsWeekend as [TodayIsWeekend]
		, IsLastDayInMonth as [TodayIsLastDayInMonth]
		, MondayWeekCommencing as [TodayMondayWeekCommencing]
		, WorkDaysInMonthTotal as [TodayWorkDaysInMonthTotal]
		, WorkDaysInMonthToDate as [TodayWorkDaysInMonthToDate]
		, FiscalPeriod as [TodayFiscalPeriod]
		, FiscalQuarter as [TodayFiscalQuarter]
		, FiscalYear as [TodayFiscalYear]
		, FiscalPeriodCode as [TodayFiscalPeriodCode]
		, FiscalPeriodName as [TodayFiscalPeriodName]
		, FiscalYearPeriod as [TodayFiscalYearPeriod]
		, FiscalYearQuarter as [TodayFiscalYearQuarter]
		, WorkDaysInFiscalPeriodTotal as [TodayWorkDaysInFiscalPeriodTotal]
		, WorkDaysInFiscalPeriodToDate as [TodayWorkDaysInFiscalPeriodToDate]
	from
		dbo.Calendar
	where
		ActualDate = cast(getdate() as date)
GO
