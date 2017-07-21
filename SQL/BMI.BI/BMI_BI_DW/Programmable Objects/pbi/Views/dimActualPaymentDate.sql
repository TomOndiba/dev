IF OBJECT_ID('[pbi].[dimActualPaymentDate]') IS NOT NULL
	DROP VIEW [pbi].[dimActualPaymentDate];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE view [pbi].[dimActualPaymentDate]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.dimActualPaymentDate
DESCRIPTION:    Exposes date information for use with factInvoice.ActualPaymentDateKey
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
		  DateKey as [ActualPaymentDateKey]
		, ActualDate as [ActualPaymentDate]
		, DateNameEU as [ActualPaymentDateNameEU]
		, DateNameUS as [ActualPaymentDateNameUS]
		, EnglishMonthCode as [ActualPaymentDateEnglishMonthCode]
		, EnglishMonthName as [ActualPaymentDateEnglishMonthName]
		, EnglishDayCode as [ActualPaymentDateEnglishDayCode]
		, EnglishDayName as [ActualPaymentDateEnglishDayName]
		, CalendarYear as [ActualPaymentDateCalendarYear]
		, CalendarQuarter as [ActualPaymentDateCalendarQuarter]
		, MonthNumberInYear as [ActualPaymentDateMonthNumberInYear]
		, WeekNumberInYear as [ActualPaymentDateWeekNumberInYear]
		, DayNumberInYear as [ActualPaymentDateDayNumberInYear]
		, DayNumberInMonth as [ActualPaymentDateDayNumberInMonth]
		, DayNumberInWeek as [ActualPaymentDateDayNumberInWeek]
		, YearMonth as [ActualPaymentDateYearMonth]
		, YearQuarter as [ActualPaymentDateYearQuarter]
		, IsWeekend as [ActualPaymentDateIsWeekend]
		, IsLastDayInMonth as [ActualPaymentDateIsLastDayInMonth]
		, MondayWeekCommencing as [ActualPaymentDateMondayWeekCommencing]
		, WorkDaysInMonthTotal as [ActualPaymentDateWorkDaysInMonthTotal]
		, WorkDaysInMonthToDate as [ActualPaymentDateWorkDaysInMonthToDate]
		, FiscalPeriod as [ActualPaymentDateFiscalPeriod]
		, FiscalQuarter as [ActualPaymentDateFiscalQuarter]
		, FiscalYear as [ActualPaymentDateFiscalYear]
		, FiscalPeriodCode as [ActualPaymentDateFiscalPeriodCode]
		, FiscalPeriodName as [ActualPaymentDateFiscalPeriodName]
		, FiscalYearPeriod as [ActualPaymentDateFiscalYearPeriod]
		, FiscalYearQuarter as [ActualPaymentDateFiscalYearQuarter]
		, WorkDaysInFiscalPeriodTotal as [ActualPaymentDateWorkDaysInFiscalPeriodTotal]
		, WorkDaysInFiscalPeriodToDate as [ActualPaymentDateWorkDaysInFiscalPeriodToDate]
	from
		dbo.Calendar
GO
