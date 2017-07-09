if objectpropertyex(object_id(N'pbi.dimActualDeliveryDate'), N'IsView') = 1
	drop view pbi.dimActualDeliveryDate
go
set quoted_identifier on;
set ansi_nulls on;
go
create view [pbi].[dimActualDeliveryDate]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.dimActualDeliveryDate
DESCRIPTION:    Exposes date information for use with factInvoice.ActualDeliveryDateKey
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
		  DateKey as [ActualDeliveryDateKey]
		, ActualDate as [ActualDeliveryDate]
		, DateNameEU as [ActualDeliveryDateNameEU]
		, DateNameUS as [ActualDeliveryDateNameUS]
		, EnglishMonthCode as [ActualDeliveryDateEnglishMonthCode]
		, EnglishMonthName as [ActualDeliveryDateEnglishMonthName]
		, EnglishDayCode as [ActualDeliveryDateEnglishDayCode]
		, EnglishDayName as [ActualDeliveryDateEnglishDayName]
		, CalendarYear as [ActualDeliveryDateCalendarYear]
		, CalendarQuarter as [ActualDeliveryDateCalendarQuarter]
		, MonthNumberInYear as [ActualDeliveryDateMonthNumberInYear]
		, WeekNumberInYear as [ActualDeliveryDateWeekNumberInYear]
		, DayNumberInYear as [ActualDeliveryDateDayNumberInYear]
		, DayNumberInMonth as [ActualDeliveryDateDayNumberInMonth]
		, DayNumberInWeek as [ActualDeliveryDateDayNumberInWeek]
		, YearMonth as [ActualDeliveryDateYearMonth]
		, YearQuarter as [ActualDeliveryDateYearQuarter]
		, IsWeekend as [ActualDeliveryDateIsWeekend]
		, IsLastDayInMonth as [ActualDeliveryDateIsLastDayInMonth]
		, MondayWeekCommencing as [ActualDeliveryDateMondayWeekCommencing]
		, WorkDaysInMonthTotal as [ActualDeliveryDateWorkDaysInMonthTotal]
		, WorkDaysInMonthToDate as [ActualDeliveryDateWorkDaysInMonthToDate]
		, FiscalPeriod as [ActualDeliveryFiscalPeriod]
		, FiscalQuarter as [ActualDeliveryFiscalQuarter]
		, FiscalYear as [ActualDeliveryFiscalYear]
		, FiscalPeriodCode as [ActualDeliveryFiscalPeriodCode]
		, FiscalPeriodName as [ActualDeliveryFiscalPeriodName]
		, FiscalYearPeriod as [ActualDeliveryFiscalYearPeriod]
		, FiscalYearQuarter as [ActualDeliveryFiscalYearQuarter]
		, WorkDaysInFiscalPeriodTotal as [ActualDeliveryWorkDaysInFiscalPeriodTotal]
		, WorkDaysInFiscalPeriodToDate as [ActualDeliveryWorkDaysInFiscalPeriodToDate]
	from
		dbo.dimDate
go
