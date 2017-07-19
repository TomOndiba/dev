CREATE procedure [utils-tests].[test LoadCalendarDim generates correct placeholders]
as
begin
	exec tSQLt.FakeTable 'dbo.Calendar'
	
	--! Assemble
	;with sourceCte (DateKey, ActualDate, DateNameEU, DateNameUS, EnglishMonthCode, EnglishMonthName, EnglishDayCode, EnglishDayName
		, CalendarYear, CalendarQuarter, MonthNumberInYear, WeekNumberInYear, DayNumberInYear, DayNumberInMonth, DayNumberInWeek, YearMonth, YearQuarter
		, IsWeekend, IsLastDayInMonth, MondayWeekCommencing, WorkDaysInMonthTotal, WorkDaysInMonthToDate
		, FiscalPeriod, FiscalQuarter, FiscalYear, FiscalPeriodCode, FiscalPeriodName, FiscalYearPeriod, FiscalYearQuarter)
	as
	(
			select
				  cast(0 as int)			-- DateKey
				, cast(null as date)		-- ActualDate
				, cast('' as varchar(30))	-- DateNameEU
				, cast('' as varchar(30))	-- DateNameUS
				, cast('' as char(3))		-- EnglishMonthCode
				, cast('' as varchar(10))	-- EnglishMonthName
				, cast('' as char(3))		-- EnglishDayCode
				, cast('' as varchar(10))	-- EnglishDayName
				, cast(0 as int)			-- CalendarYear
				, cast(0 as tinyint)		-- CalendarQuarter
				, cast(0 as tinyint)		-- MonthNumberInYear
				, cast(0 as tinyint)		-- WeekNumberInYear
				, cast(0 as smallint)		-- DayNumberInYear
				, cast(0 as tinyint)		-- DayNumberInMonth
				, cast(0 as tinyint)		-- DayNumberInWeek
				, cast('' as varchar(10))	-- YearMonth
				, cast('' as varchar(10))	-- YearQuarter
				, cast('' as varchar(10))	-- IsWeekend
				, cast('' as varchar(10))	-- IsLastDayInMonth
				, cast(null as date)		-- MondayWeekCommencing
				, cast(0 as tinyint)		-- WorkDaysInMonthTotal
				, cast(0 as tinyint)		-- WorkDaysInMonthToDate
				, cast(null as tinyint)		-- FiscalPeriod tinyint null
				, cast(null as tinyint)		-- FiscalQuarter tinyint null
				, cast(null as int)			-- FiscalYear int null
				, cast('' as char(3))		-- FiscalPeriodCode char(3) not null
				, cast('' as varchar(50))	-- FiscalPeriodName varchar(10) not null
				, cast('' as varchar(50))	-- FiscalYearPeriod varchar(10) not null
				, cast('' as varchar(50))	-- FiscalYearQuarter varchar(10) not null
		union all select -8,null,'Invalid Source Format','Invalid Source Format','N/A','N/A','N/A','N/A',null,null,null,null,null,null,null,'N/A','N/A','N/A','N/A',null,null,null,null,null,null,'N/A','N/A','N/A','N/A'
		union all select -7,null,'Deliberately Blank','Deliberately Blank','N/A','N/A','N/A','N/A',null,null,null,null,null,null,null,'N/A','N/A','N/A','N/A',null,null,null,null,null,null,'N/A','N/A','N/A','N/A'
		union all select -6,null,'Expected in Future','Expected in Future','N/A','N/A','N/A','N/A',null,null,null,null,null,null,null,'N/A','N/A','N/A','N/A',null,null,null,null,null,null,'N/A','N/A','N/A','N/A'
		union all select -5,null,'Logic Not Defined','Logic Not Defined','N/A','N/A','N/A','N/A',null,null,null,null,null,null,null,'N/A','N/A','N/A','N/A',null,null,null,null,null,null,'N/A','N/A','N/A','N/A'
		union all select -4,null,'Not Applicable in this Context','Not Applicable in this Context','N/A','N/A','N/A','N/A',null,null,null,null,null,null,null,'N/A','N/A','N/A','N/A',null,null,null,null,null,null,'N/A','N/A','N/A','N/A'
		union all select -3,null,'Not Implemented in Source','Not Implemented in Source','N/A','N/A','N/A','N/A',null,null,null,null,null,null,null,'N/A','N/A','N/A','N/A',null,null,null,null,null,null,'N/A','N/A','N/A','N/A'
		union all select -2,null,'Lookup Not Found','Lookup Not Found','N/A','N/A','N/A','N/A',null,null,null,null,null,null,null,'N/A','N/A','N/A','N/A',null,null,null,null,null,null,'N/A','N/A','N/A','N/A'
		union all select -1,null,'Not Specified at Source','Not Specified at Source','N/A','N/A','N/A','N/A',null,null,null,null,null,null,null,'N/A','N/A','N/A','N/A',null,null,null,null,null,null,'N/A','N/A','N/A','N/A'
		union all select 19000101,'1900-01-01','Unknown Start Date','Unknown Start Date','N/A','N/A','N/A','N/A',1900,1,1,1,1,1,1,'N/A','N/A','N/A','N/A',null,null,null,null,null,null,'N/A','N/A','N/A','N/A'
		union all select 99991231,'9999-12-31','Open End Date/Ongoing','Open End Date/Ongoing','N/A','N/A','N/A','N/A',9999,4,12,53,365,31,5,'N/A','N/A','N/A','N/A',null,null,null,null,null,null,'N/A','N/A','N/A','N/A'
	)
	select * into #expected from sourceCte where DateKey <> 0

	--! Act
	exec utils.LoadCalendarDimension @Year = null, @DoOutputInfo = 0 ;

	select * into #actual from dbo.Calendar --where DateKey < 19700101 or DateKey > 90000101 ;

	--! Assert
	exec tSQLt.AssertEqualsTable @Expected = '#expected', @Actual = '#actual';
end