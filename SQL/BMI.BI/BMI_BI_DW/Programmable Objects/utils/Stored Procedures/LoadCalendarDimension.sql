if object_id('[utils].[LoadCalendarDimension]') is not null
	drop procedure [utils].[LoadCalendarDimension];

go
set quoted_identifier on
go
set ansi_nulls on
go
create procedure [utils].[LoadCalendarDimension]
(
  @Year char(4)
, @DoOutputInfo bit = 1
)
as --<CommentHeader>
/**********************************************************************************************************************

Properties
==========
FUNCTION NAME:  utils.LoadCalendarDimension
DESCRIPTION:    Loads dbo.Calendar table with dates within provided date range
AUTHOR:         Greg M Lucas
ORIGIN DATE:    09-Jun-2017

Additional Notes
================

REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		09-Jun-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------


**********************************************************************************************************************/
--</CommentHeader>
begin
	set nocount on;
	
	--! Find out if we are already in a transaction
	declare	@_TxnIsExternal bit = case when @@trancount > 0 then 1 else 0 end;

	begin try
		if @Year not between '2000' and '2099'
			raiserror('@Year parameter is out of range, expected "2000" to "2099" but was %s', 16, 1, @Year) ;

		declare @_StartRange int = try_convert(int, right(@Year, 2) + '0101') ;
		declare @_EndRange int = try_convert(int, right(@Year, 2) + '1231') ;
		declare @_YearStart date = try_convert(date, @Year + '0101', 112) ;
		declare @_YearEnd date = try_convert(date, @Year + '1231', 112) ;

		--! As we have multiple steps if there no outer transaction,
		--! use an explicit transaction from this point forward 
		if @_TxnIsExternal = 0 begin tran;

		declare @_UpsertCount int, @_P445Count int;

		declare @tblRowCounts table (Change varchar(30));

		set datefirst 1; -- Monday
			
		; with	dateRangeCte(DateKey, ActualDate)
		as
		(
			select
				  20000000 + n.Number
				, try_convert(date, cast(20000000 + n.Number as char(8)))
			from
				dbo.Numbers (999999) as n
			where
				n.Number between @_StartRange and @_EndRange
		)
		, sourceCte(DateKey, ActualDate, DateNameEU, DateNameUS, EnglishMonthCode, EnglishMonthName, EnglishDayCode, EnglishDayName, YearMonth, YearQuarter, IsWeekend, IsLastDayInMonth
				, FiscalPeriod, FiscalQuarter, FiscalYear, FiscalPeriodCode, FiscalPeriodName, FiscalYearPeriod, FiscalYearQuarter)
		as
		(
				select
				  cast(-999 as int)			-- DateKey
				, cast(null as date)		-- ActualDate
				, cast('' as varchar(50))	-- DateNameEU
				, cast('' as varchar(50))	-- DateNameUS
				, cast('' as varchar(50))	-- EnglishMonthCode
				, cast('' as varchar(50))	-- EnglishMonthName
				, cast('' as varchar(50))	-- EnglishDayCode
				, cast('' as varchar(50))	-- EnglishDayName
				, cast('' as varchar(50))	-- YearMonth
				, cast('' as varchar(50))	-- YearQuarter
				, cast('' as varchar(50))	-- IsWeekend
				, cast('' as varchar(50))	-- IsLastDayInMonth
				, cast(null as tinyint)		-- FiscalPeriod tinyint null
				, cast(null as tinyint)		-- FiscalQuarter tinyint null
				, cast(null as int)		-- FiscalYear int null
				, cast('' as char(3))	-- FiscalPeriodCode char(3) not null
				, cast('' as varchar(50))	-- FiscalPeriodName varchar(10) not null
				, cast('' as varchar(50))	-- FiscalYearPeriod varchar(10) not null
				, cast('' as varchar(50))	-- FiscalYearQuarter varchar(10) not null
			union all
				select
					  19000101			-- DateKey
					, '19000101'		-- ActualDate
					, 'Unknown Start Date'	-- DateNameEU
					, 'Unknown Start Date'	-- DateNameUS
					, 'N/A'	-- EnglishMonthCode
					, 'N/A'	-- EnglishMonthName
					, 'N/A'	-- EnglishDayCode
					, 'N/A'	-- EnglishDayName
					, 'N/A'	-- YearMonth
					, 'N/A'	-- YearQuarter
					, 'N/A'	-- IsWeekend
					, 'N/A'	-- IsLastDayInMonth
					, null -- FiscalPeriod
					, null -- FiscalQuarter
					, null -- FiscalYear
					, 'N/A'	-- FiscalPeriodCode
					, 'N/A'	-- FiscalPeriodName
					, 'N/A'	-- FiscalYearPeriod
					, 'N/A'	-- FiscalYearQuarter
			union all
				select
					  99991231			-- DateKey
					, '99991231'		-- ActualDate
					, 'Open End Date/Ongoing'	-- DateNameEU
					, 'Open End Date/Ongoing'	-- DateNameUS
					, 'N/A'	-- EnglishMonthCode
					, 'N/A'	-- EnglishMonthName
					, 'N/A'	-- EnglishDayCode
					, 'N/A'	-- EnglishDayName
					, 'N/A'	-- YearMonth
					, 'N/A'	-- YearQuarter
					, 'N/A'	-- IsWeekend
					, 'N/A'	-- IsLastDayInMonth
					, null -- FiscalPeriod
					, null -- FiscalQuarter
					, null -- FiscalYear
					, 'N/A'	-- FiscalPeriodCode
					, 'N/A'	-- FiscalPeriodName
					, 'N/A'	-- FiscalYearPeriod
					, 'N/A'	-- FiscalYearQuarter
			union all
				select
					  -1		-- DateKey
					, null		-- ActualDate
					, 'Not Specified at Source'	-- DateNameEU
					, 'Not Specified at Source'	-- DateNameUS
					, 'N/A'	-- EnglishMonthCode
					, 'N/A'	-- EnglishMonthName
					, 'N/A'	-- EnglishDayCode
					, 'N/A'	-- EnglishDayName
					, 'N/A'	-- YearMonth
					, 'N/A'	-- YearQuarter
					, 'N/A'	-- IsWeekend
					, 'N/A'	-- IsLastDayInMonth
					, null -- FiscalPeriod
					, null -- FiscalQuarter
					, null -- FiscalYear
					, 'N/A'	-- FiscalPeriodCode
					, 'N/A'	-- FiscalPeriodName
					, 'N/A'	-- FiscalYearPeriod
					, 'N/A'	-- FiscalYearQuarter
			union all
				select
					  -2		-- DateKey
					, null		-- ActualDate
					, 'Lookup Not Found'	-- DateNameEU
					, 'Lookup Not Found'	-- DateNameUS
					, 'N/A'	-- EnglishMonthCode
					, 'N/A'	-- EnglishMonthName
					, 'N/A'	-- EnglishDayCode
					, 'N/A'	-- EnglishDayName
					, 'N/A'	-- YearMonth
					, 'N/A'	-- YearQuarter
					, 'N/A'	-- IsWeekend
					, 'N/A'	-- IsLastDayInMonth
					, null -- FiscalPeriod
					, null -- FiscalQuarter
					, null -- FiscalYear
					, 'N/A'	-- FiscalPeriodCode
					, 'N/A'	-- FiscalPeriodName
					, 'N/A'	-- FiscalYearPeriod
					, 'N/A'	-- FiscalYearQuarter
			union all
				select
					  -3		-- DateKey
					, null		-- ActualDate
					, 'Not Implemented in Source'	-- DateNameEU
					, 'Not Implemented in Source'	-- DateNameUS
					, 'N/A'	-- EnglishMonthCode
					, 'N/A'	-- EnglishMonthName
					, 'N/A'	-- EnglishDayCode
					, 'N/A'	-- EnglishDayName
					, 'N/A'	-- YearMonth
					, 'N/A'	-- YearQuarter
					, 'N/A'	-- IsWeekend
					, 'N/A'	-- IsLastDayInMonth
					, null -- FiscalPeriod
					, null -- FiscalQuarter
					, null -- FiscalYear
					, 'N/A'	-- FiscalPeriodCode
					, 'N/A'	-- FiscalPeriodName
					, 'N/A'	-- FiscalYearPeriod
					, 'N/A'	-- FiscalYearQuarter
			union all
				select
					  -4		-- DateKey
					, null		-- ActualDate
					, 'Not Applicable in this Context'	-- DateNameEU
					, 'Not Applicable in this Context'	-- DateNameUS
					, 'N/A'	-- EnglishMonthCode
					, 'N/A'	-- EnglishMonthName
					, 'N/A'	-- EnglishDayCode
					, 'N/A'	-- EnglishDayName
					, 'N/A'	-- YearMonth
					, 'N/A'	-- YearQuarter
					, 'N/A'	-- IsWeekend
					, 'N/A'	-- IsLastDayInMonth
					, null -- FiscalPeriod
					, null -- FiscalQuarter
					, null -- FiscalYear
					, 'N/A'	-- FiscalPeriodCode
					, 'N/A'	-- FiscalPeriodName
					, 'N/A'	-- FiscalYearPeriod
					, 'N/A'	-- FiscalYearQuarter
			union all
				select
					  -5		-- DateKey
					, null		-- ActualDate
					, 'Logic Not Defined'	-- DateNameEU
					, 'Logic Not Defined'	-- DateNameUS
					, 'N/A'	-- EnglishMonthCode
					, 'N/A'	-- EnglishMonthName
					, 'N/A'	-- EnglishDayCode
					, 'N/A'	-- EnglishDayName
					, 'N/A'	-- YearMonth
					, 'N/A'	-- YearQuarter
					, 'N/A'	-- IsWeekend
					, 'N/A'	-- IsLastDayInMonth
					, null -- FiscalPeriod
					, null -- FiscalQuarter
					, null -- FiscalYear
					, 'N/A'	-- FiscalPeriodCode
					, 'N/A'	-- FiscalPeriodName
					, 'N/A'	-- FiscalYearPeriod
					, 'N/A'	-- FiscalYearQuarter
			union all
				select
					  -6		-- DateKey
					, null		-- ActualDate
					, 'Expected in Future'	-- DateNameEU
					, 'Expected in Future'	-- DateNameUS
					, 'N/A'	-- EnglishMonthCode
					, 'N/A'	-- EnglishMonthName
					, 'N/A'	-- EnglishDayCode
					, 'N/A'	-- EnglishDayName
					, 'N/A'	-- YearMonth
					, 'N/A'	-- YearQuarter
					, 'N/A'	-- IsWeekend
					, 'N/A'	-- IsLastDayInMonth
					, null -- FiscalPeriod
					, null -- FiscalQuarter
					, null -- FiscalYear
					, 'N/A'	-- FiscalPeriodCode
					, 'N/A'	-- FiscalPeriodName
					, 'N/A'	-- FiscalYearPeriod
					, 'N/A'	-- FiscalYearQuarter
			union all
				select
					  -7		-- DateKey
					, null		-- ActualDate
					, 'Deliberately Blank'	-- DateNameEU
					, 'Deliberately Blank'	-- DateNameUS
					, 'N/A'	-- EnglishMonthCode
					, 'N/A'	-- EnglishMonthName
					, 'N/A'	-- EnglishDayCode
					, 'N/A'	-- EnglishDayName
					, 'N/A'	-- YearMonth
					, 'N/A'	-- YearQuarter
					, 'N/A'	-- IsWeekend
					, 'N/A'	-- IsLastDayInMonth
					, null -- FiscalPeriod
					, null -- FiscalQuarter
					, null -- FiscalYear
					, 'N/A'	-- FiscalPeriodCode
					, 'N/A'	-- FiscalPeriodName
					, 'N/A'	-- FiscalYearPeriod
					, 'N/A'	-- FiscalYearQuarter
			union all
				select
					 -8		-- DateKey
					, null		-- ActualDate
					, 'Invalid Source Format'	-- DateNameEU
					, 'Invalid Source Format'	-- DateNameUS
					, 'N/A'	-- EnglishMonthCode
					, 'N/A'	-- EnglishMonthName
					, 'N/A'	-- EnglishDayCode
					, 'N/A'	-- EnglishDayName
					, 'N/A'	-- YearMonth
					, 'N/A'	-- YearQuarter
					, 'N/A'	-- IsWeekend
					, 'N/A'	-- IsLastDayInMonth
					, null -- FiscalPeriod
					, null -- FiscalQuarter
					, null -- FiscalYear
					, 'N/A'	-- FiscalPeriodCode
					, 'N/A'	-- FiscalPeriodName
					, 'N/A'	-- FiscalYearPeriod
					, 'N/A'	-- FiscalYearQuarter
			union all
				select
					  dr.DateKey
					, dr.ActualDate
					, null	-- DateNameEU
					, null	-- DateNameUS
					, null	-- EnglishMonthCode
					, null	-- EnglishMonthName
					, null	-- EnglishDayCode
					, null	-- EnglishDayName
					, null	-- YearMonth
					, null	-- YearQuarter
					, null	-- IsWeekend
					, null	-- IsLastDayInMonth
					, null -- FiscalPeriod
					, null -- FiscalQuarter
					, null -- FiscalYear
					, 'N/D'	-- FiscalPeriodCode
					, 'N/D'	-- FiscalPeriodName
					, 'N/D'	-- FiscalYearPeriod
					, 'N/D'	-- FiscalYearQuarter
				from
					dateRangeCte as dr
				where
					dr.ActualDate is not null
		)
		, ValidDatesCte
		as
		(
			select
				  src.DateKey
				, src.ActualDate
				, coalesce(src.DateNameEU, format(src.ActualDate, 'dd/MM/yyyy'), 'Oops! Date Not Recognised') as [DateNameEU]
				, coalesce(src.DateNameUS, format(src.ActualDate, 'MM/dd/yyyy'), 'Oops! Date Not Recognised') as [DateNameUS]
				, coalesce(src.EnglishMonthCode, upper(left(datename(month, src.ActualDate), 3)), '???') as [EnglishMonthCode]
				, coalesce(src.EnglishMonthName, datename(month, src.ActualDate), 'Oops! Date Not Recognised') as [EnglishMonthName]
				, coalesce(src.EnglishDayCode, upper(left(datename(dw, src.ActualDate), 3)), '???') as [EnglishDayCode]
				, coalesce(src.EnglishDayName, datename(dw, src.ActualDate), 'Oops! Date Not Recognised') as [EnglishDayName]
				, datepart(year, src.ActualDate) as [CalendarYear]
				, datepart(quarter, src.ActualDate) as [CalendarQuarter]
				, datepart(month, src.ActualDate) as [MonthNumberInYear]
				, datepart(week, src.ActualDate) as [WeekNumberInYear]
				, datepart(dayofyear, src.ActualDate) as [DayNumberInYear]
				, datename(dd, src.ActualDate) as [DayNumberInMonth]
				, datepart(dw, src.ActualDate) as [DayNumberInWeek]
				, coalesce(src.YearMonth, format(src.ActualDate, 'yyyy-MM'), 'Oops!') as [YearMonth]
				, coalesce(src.YearQuarter, format(src.ActualDate, 'yyyy-Q') + cast(datepart(quarter, src.ActualDate) as char(1)), 'Oops!') as [YearQuarter]
				-------------------------------------------------------------------------------------------------------------------------------------------
				, case
					when src.IsWeekend is null and datename(dw, src.ActualDate) in ('Saturday', 'Sunday')
						then 'Weekend'
					when src.IsWeekend is null and datename(dw, src.ActualDate) in ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday')
						then 'Weekday'
					else coalesce(src.IsWeekend, '')
				  end as [IsWeekend]
				-------------------------------------------------------------------------------------------------------------------------------------------
				, case
					when src.IsLastDayInMonth is null and month(src.ActualDate) = month(dateadd(d, 1, src.ActualDate))
						then 'N'
					when src.IsLastDayInMonth is null and month(src.ActualDate) + 1 = month(dateadd(d, 1, src.ActualDate))
						then 'Y'
					else coalesce(src.IsLastDayInMonth, '')
				  end as [IsLastDayInMonth]
				-------------------------------------------------------------------------------------------------------------------------------------------
				, cast(case when DateKey between 19000102 and 99991230
					then dateadd(day, datediff(day, 0, ActualDate) / 7 * 7, 0)
					else null
				  end as date) as [MondayWeekCommencing]
				-------------------------------------------------------------------------------------------------------------------------------------------
				, case when src.IsWeekend is null and datename(dw, src.ActualDate) in ('Saturday', 'Sunday') then 0 else 1 end as [WorkDayCount]
				-------------------------------------------------------------------------------------------------------------------------------------------
				, src.FiscalPeriod
				, src.FiscalQuarter
				, src.FiscalYear
				, src.FiscalPeriodCode
				, src.FiscalPeriodName
				, src.FiscalYearPeriod
				, src.FiscalYearQuarter
			from
				sourceCte as src
			where
				src.DateKey > -999
		)
		, workDaysInMonthCte
		as
		(
			select
				  DateKey
				, sum(WorkDayCount) over(partition by YearMonth) as [WorkDaysInMonthTotal]
				, sum(WorkDayCount) over(partition by YearMonth order by DateKey rows unbounded preceding) as [WorkDaysInMonthToDate]
			from
				ValidDatesCte
			where
				DateKey between 19000102 and 99991230
		)
		, finalCte
		as
		(
			select
				  d.DateKey
				, d.ActualDate
				, d.DateNameEU
				, d.DateNameUS
				, d.EnglishMonthCode
				, d.EnglishMonthName
				, d.EnglishDayCode
				, d.EnglishDayName
				, d.CalendarYear
				, d.CalendarQuarter
				, d.MonthNumberInYear
				, d.WeekNumberInYear
				, d.DayNumberInYear
				, d.DayNumberInMonth
				, d.DayNumberInWeek
				, d.YearMonth
				, d.YearQuarter
				, d.IsWeekend
				, d.IsLastDayInMonth
				, d.MondayWeekCommencing
				-------------------------------------------------------------------------------
				, case when d.ActualDate is not null
					then cast(wdim.WorkDaysInMonthTotal as tinyint)
					else null
				  end as [WorkDaysInMonthTotal]
				-------------------------------------------------------------------------------
				, case when d.ActualDate is not null
					then cast(wdim.WorkDaysInMonthToDate as tinyint)
					else null
				  end as [WorkDaysInMonthToDate]
				-------------------------------------------------------------------------------
				, d.FiscalPeriod
				, d.FiscalQuarter
				, d.FiscalYear
				, d.FiscalPeriodCode
				, d.FiscalPeriodName
				, d.FiscalYearPeriod
				, d.FiscalYearQuarter
			from
				ValidDatesCte as d
			left join workDaysInMonthCte as wdim
				on wdim.DateKey = d.DateKey
		)
		merge into dbo.Calendar tgt
		using finalCte as src
		on src.DateKey = tgt.DateKey
		when not matched by target
			then
				insert
				(
				  DateKey
				, ActualDate
				, DateNameEU
				, DateNameUS
				, EnglishMonthCode
				, EnglishMonthName
				, EnglishDayCode
				, EnglishDayName
				, CalendarYear
				, CalendarQuarter
				, MonthNumberInYear
				, WeekNumberInYear
				, DayNumberInYear
				, DayNumberInMonth
				, DayNumberInWeek
				, YearMonth
				, YearQuarter
				, IsWeekend
				, IsLastDayInMonth
				, MondayWeekCommencing
				, WorkDaysInMonthTotal
				, WorkDaysInMonthToDate
				, FiscalPeriod
				, FiscalQuarter
				, FiscalYear
				, FiscalPeriodCode
				, FiscalPeriodName
				, FiscalYearPeriod
				, FiscalYearQuarter
				)
				values
				(
				  src.DateKey
				, src.ActualDate
				, src.DateNameEU
				, src.DateNameUS
				, src.EnglishMonthCode
				, src.EnglishMonthName
				, src.EnglishDayCode
				, src.EnglishDayName
				, src.CalendarYear
				, src.CalendarQuarter
				, src.MonthNumberInYear
				, src.WeekNumberInYear
				, src.DayNumberInYear
				, src.DayNumberInMonth
				, src.DayNumberInWeek
				, src.YearMonth
				, src.YearQuarter
				, src.IsWeekend
				, src.IsLastDayInMonth
				, src.MondayWeekCommencing
				, src.WorkDaysInMonthTotal
				, src.WorkDaysInMonthToDate
				, src.FiscalPeriod
				, src.FiscalQuarter
				, src.FiscalYear
				, src.FiscalPeriodCode
				, src.FiscalPeriodName
				, src.FiscalYearPeriod
				, src.FiscalYearQuarter
				)
		when matched
			and
				(
						(tgt.ActualDate <> src.ActualDate)
					or
						(tgt.ActualDate is null and src.ActualDate is not null)
					or
						(tgt.ActualDate is not null and src.ActualDate is null)
				)
			or tgt.DateNameEU <> src.DateNameEU
			or tgt.DateNameUS <> src.DateNameUS
			or tgt.EnglishMonthCode <> src.EnglishMonthCode
			or tgt.EnglishMonthName <> src.EnglishMonthName
			or tgt.EnglishDayCode <> src.EnglishDayCode
			or tgt.EnglishDayName <> src.EnglishDayName
			or coalesce(tgt.CalendarYear, -999999) <> coalesce(src.CalendarYear, -999999)
			or coalesce(tgt.CalendarQuarter, -999999) <> coalesce(src.CalendarQuarter, -999999)
			or coalesce(tgt.MonthNumberInYear, -999999) <> coalesce(src.MonthNumberInYear, -999999)
			or coalesce(tgt.WeekNumberInYear, -999999) <> coalesce(src.WeekNumberInYear, -999999)
			or coalesce(tgt.DayNumberInYear, -999999) <> coalesce(src.DayNumberInYear, -999999)
			or coalesce(tgt.DayNumberInMonth, -999999) <> coalesce(src.DayNumberInMonth, -999999)
			or coalesce(tgt.DayNumberInWeek, -999999) <> coalesce(src.DayNumberInWeek, -999999)
			or tgt.YearMonth <> src.YearMonth
			or tgt.YearQuarter <> src.YearQuarter
			or tgt.IsWeekend <> src.IsWeekend
			or tgt.IsLastDayInMonth <> src.IsLastDayInMonth
			or coalesce(tgt.MondayWeekCommencing, '19000101') <> coalesce(src.MondayWeekCommencing, '19000101')
			or coalesce(tgt.WorkDaysInMonthTotal, -999999) <> coalesce(src.WorkDaysInMonthTotal, -999999)
			or coalesce(tgt.WorkDaysInMonthToDate, -999999) <> coalesce(src.WorkDaysInMonthToDate, -999999)
			or coalesce(tgt.FiscalPeriod, -999999) <> coalesce(src.FiscalPeriod, -999999)
			or coalesce(tgt.FiscalQuarter, -999999) <> coalesce(src.FiscalQuarter, -999999)
			or coalesce(tgt.FiscalYear, -999999) <> coalesce(src.FiscalYear, -999999)
			or tgt.FiscalPeriodCode <> src.FiscalPeriodCode
			or tgt.FiscalPeriodName <> src.FiscalPeriodName
			or tgt.FiscalYearPeriod <> src.FiscalYearPeriod
			or tgt.FiscalYearQuarter <> src.FiscalYearQuarter
		then
			update set
				  tgt.ActualDate = src.ActualDate
				, tgt.DateNameEU = src.DateNameEU
				, tgt.DateNameUS = src.DateNameUS
				, tgt.EnglishMonthCode = src.EnglishMonthCode
				, tgt.EnglishMonthName = src.EnglishMonthName
				, tgt.EnglishDayCode = src.EnglishDayCode
				, tgt.EnglishDayName = src.EnglishDayName
				, tgt.CalendarYear = src.CalendarYear
				, tgt.CalendarQuarter = src.CalendarQuarter
				, tgt.MonthNumberInYear = src.MonthNumberInYear
				, tgt.WeekNumberInYear = src.WeekNumberInYear
				, tgt.DayNumberInYear = src.DayNumberInYear
				, tgt.DayNumberInMonth = src.DayNumberInMonth
				, tgt.DayNumberInWeek = src.DayNumberInWeek
				, tgt.YearMonth = src.YearMonth
				, tgt.YearQuarter = src.YearQuarter
				, tgt.IsWeekend = src.IsWeekend
				, tgt.IsLastDayInMonth = src.IsLastDayInMonth
				, tgt.MondayWeekCommencing = src.MondayWeekCommencing
				, tgt.WorkDaysInMonthTotal = src.WorkDaysInMonthTotal
				, tgt.WorkDaysInMonthToDate = src.WorkDaysInMonthToDate
				, tgt.FiscalPeriod = src.FiscalPeriod
				, tgt.FiscalQuarter = src.FiscalQuarter
				, tgt.FiscalYear = src.FiscalYear
				, tgt.FiscalPeriodCode = src.FiscalPeriodCode
				, tgt.FiscalPeriodName = src.FiscalPeriodName
				, tgt.FiscalYearPeriod = src.FiscalYearPeriod
				, tgt.FiscalYearQuarter = src.FiscalYearQuarter
		output $action into @tblRowCounts (Change);

		set @_UpsertCount = @@rowcount;

		--!
		--! We have to generate the 4-4-5 fiscal calendar values separately
		--! as some of the required dates may already be in the table but
		--! not within the date range we are upserting.
		--!
		;with periodNamesCte
		as
		(
			select distinct
				  CalendarYear as [FiscalYear]
				, MonthNumberInYear as [FiscalPeriod]
				, CalendarQuarter as [FiscalQuarter]
				, EnglishMonthCode as [FiscalPeriodCode]
				, EnglishMonthName as [FiscalPeriodName]
				, YearMonth as [FiscalYearPeriod]
				, YearQuarter as [FiscalYearQuarter]
			from
				dbo.Calendar
			where
				ActualDate between @_YearStart and @_YearEnd
		)
		, fiscalWeeksCte
		as
		(
			select
				  MondayWeekCommencing
				, case
					when MondayWeekCommencing <= @_YearStart
						then 1
					else row_number() over(order by MondayWeekCommencing asc) - 1
				  end as [FiscalWeekNumber]
			from
				dbo.Calendar
			where
					ActualDate between @_YearStart and @_YearEnd
				and MondayWeekCommencing is not null
			group by
				MondayWeekCommencing
		)
		, fiscalPeriodCte
		as
		(
			select
				  MondayWeekCommencing
				, case
					when FiscalWeekNumber between 1 and 4 then 1
					when FiscalWeekNumber between 5 and 8 then 2
					when FiscalWeekNumber between 9 and 13 then 3
					when FiscalWeekNumber between 14 and 17 then 4
					when FiscalWeekNumber between 18 and 21 then 5
					when FiscalWeekNumber between 22 and 26 then 6
					when FiscalWeekNumber between 27 and 30 then 7
					when FiscalWeekNumber between 31 and 34 then 8
					when FiscalWeekNumber between 35 and 39 then 9
					when FiscalWeekNumber between 40 and 43 then 10
					when FiscalWeekNumber between 44 and 47 then 11
					else 12
				  end as [FiscalPeriod]
			from
				fiscalWeeksCte
		)
		update
			tgt
		set
			  tgt.FiscalPeriod = fp.FiscalPeriod
			, tgt.FiscalQuarter = pn.FiscalQuarter
			, tgt.FiscalYear = pn.FiscalYear
			, tgt.FiscalPeriodCode = pn.FiscalPeriodCode
			, tgt.FiscalPeriodName = pn.FiscalPeriodName
			, tgt.FiscalYearPeriod = pn.FiscalYearPeriod
			, tgt.FiscalYearQuarter = pn.FiscalYearQuarter
		from
			dbo.Calendar as tgt
		inner join fiscalPeriodCte as fp
			on fp.MondayWeekCommencing = tgt.MondayWeekCommencing
		inner join periodNamesCte as pn
			on pn.FiscalYear = tgt.CalendarYear
			and pn.FiscalPeriod = fp.FiscalPeriod
		where
			tgt.ActualDate between @_YearStart and @_YearEnd
			
		set @_P445Count = @@rowcount ;

		;with workDaysInPeriodCte
		as
		(
			select
				  DateKey
				, sum(case when IsWeekend = 'Weekday' then 1 else 0 end) over(partition by FiscalYearPeriod) as [WorkDaysInPeriodTotal]
				, sum(case when IsWeekend = 'Weekday' then 1 else 0 end) over(partition by FiscalYearPeriod order by DateKey rows unbounded preceding) as [WorkDaysInPeriodToDate]
			from
				dbo.Calendar
			where
					ActualDate between @_YearStart and @_YearEnd
				and FiscalPeriod is not null
		)
		update
			tgt
		set
			  tgt.WorkDaysInFiscalPeriodTotal = src.WorkDaysInPeriodTotal
			, tgt.WorkDaysInFiscalPeriodToDate = src.WorkDaysInPeriodToDate
		from
			dbo.Calendar as tgt
		inner join workDaysInPeriodCte as src
			on src.DateKey = tgt.DateKey
		where
			tgt.ActualDate between @_YearStart and @_YearEnd

		if @DoOutputInfo = 1
			begin
				raiserror('Upserted %i records in Calendar table and set Period 4-4-5 values on %i rows', 0, 1, @_UpsertCount, @_P445Count) with nowait;

				select Change as [Calendar Management Action], count(*) as [Rows Affected] from @tblRowCounts group by Change ;
			end
			
		--!
		--! Only commit transactions started within this procedure
		--!
		if @_TxnIsExternal = 0 and (xact_state() = 1 or @@trancount > 0) commit tran ;
	end try
	begin catch
		--! If we have an uncommittable external transaction (see BOL), or a deadlock
		--! we can't do anything else until we roll that back. Alternatively, if we
		--! started the transaction we should roll it back otherwise or let the caller
		--! handle its own external txn 
		if (xact_state() = -1) or (xact_state() = 1 and error_number() = 1205) or (xact_state() = 1 and @_TxnIsExternal = 0)
			rollback tran;
		throw;
	end catch;

	set nocount off;
end;
go
grant execute on  [utils].[LoadCalendarDimension] to [BatchManagers]
go
