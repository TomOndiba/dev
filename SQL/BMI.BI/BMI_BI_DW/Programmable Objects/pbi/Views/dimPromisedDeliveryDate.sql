IF OBJECT_ID('[pbi].[dimPromisedDeliveryDate]') IS NOT NULL
	DROP VIEW [pbi].[dimPromisedDeliveryDate];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create view [pbi].[dimPromisedDeliveryDate]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.dimPromisedDeliveryDate
DESCRIPTION:    Exposes date information for use with factOrder.PromisedDeliveryDateKey (when implemented)
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
		  DateKey as [PromisedDeliveryDateKey]
		, ActualDate as [PromisedDeliveryDate]
		, DateNameEU as [PromisedDeliveryDateNameEU]
		, DateNameUS as [PromisedDeliveryDateNameUS]
		, EnglishMonthCode as [PromisedDeliveryDateEnglishMonthCode]
		, EnglishMonthName as [PromisedDeliveryDateEnglishMonthName]
		, EnglishDayCode as [PromisedDeliveryDateEnglishDayCode]
		, EnglishDayName as [PromisedDeliveryDateEnglishDayName]
		, CalendarYear as [PromisedDeliveryDateCalendarYear]
		, CalendarQuarter as [PromisedDeliveryDateCalendarQuarter]
		, MonthNumberInYear as [PromisedDeliveryDateMonthNumberInYear]
		, WeekNumberInYear as [PromisedDeliveryDateWeekNumberInYear]
		, DayNumberInYear as [PromisedDeliveryDateDayNumberInYear]
		, DayNumberInMonth as [PromisedDeliveryDateDayNumberInMonth]
		, DayNumberInWeek as [PromisedDeliveryDateDayNumberInWeek]
		, YearMonth as [PromisedDeliveryDateYearMonth]
		, YearQuarter as [PromisedDeliveryDateYearQuarter]
		, IsWeekend as [PromisedDeliveryDateIsWeekend]
		, IsLastDayInMonth as [PromisedDeliveryDateIsLastDayInMonth]
		, MondayWeekCommencing as [PromisedDeliveryDateMondayWeekCommencing]
		, WorkDaysInMonthTotal as [PromisedDeliveryDateWorkDaysInMonthTotal]
		, WorkDaysInMonthToDate as [PromisedDeliveryDateWorkDaysInMonthToDate]
		, FiscalPeriod as [PromisedDeliveryDateFiscalPeriod]
		, FiscalQuarter as [PromisedDeliveryDateFiscalQuarter]
		, FiscalYear as [PromisedDeliveryDateFiscalYear]
		, FiscalPeriodCode as [PromisedDeliveryDateFiscalPeriodCode]
		, FiscalPeriodName as [PromisedDeliveryDateFiscalPeriodName]
		, FiscalYearPeriod as [PromisedDeliveryDateFiscalYearPeriod]
		, FiscalYearQuarter as [PromisedDeliveryDateFiscalYearQuarter]
		, WorkDaysInFiscalPeriodTotal as [PromisedDeliveryDateWorkDaysInFiscalPeriodTotal]
		, WorkDaysInFiscalPeriodToDate as [PromisedDeliveryDateWorkDaysInFiscalPeriodToDate]
	from
		dbo.dimDate
GO
