if objectpropertyex(object_id(N'dbo.dimDate'), N'IsUserTable') is not null
  drop table dbo.dimDate ;
go
create table dbo.dimDate
(
  DateKey int not null
, ActualDate date null
, DateNameEU varchar(30) not null
, DateNameUS varchar(30) not null
, EnglishMonthCode char(3) not null
, EnglishMonthName varchar(10) not null
, EnglishDayCode char(3) not null
, EnglishDayName varchar(10) not null
, CalendarYear int null
, CalendarQuarter tinyint null
, MonthNumberInYear tinyint null
, WeekNumberInYear tinyint null
, DayNumberInYear smallint null
, DayNumberInMonth tinyint null
, DayNumberInWeek tinyint null
, YearMonth varchar(10) not null
, YearQuarter varchar(10) not null
, IsWeekend varchar(10) not null
, IsLastDayInMonth varchar(10) not null
, MondayWeekCommencing date null
, WorkDaysInMonthTotal tinyint null
, WorkDaysInMonthToDate tinyint null
, FiscalPeriod tinyint null
, FiscalQuarter tinyint null
, FiscalYear int null
, FiscalPeriodCode char(3) not null
, FiscalPeriodName varchar(10) not null
, FiscalYearPeriod varchar(10) not null
, FiscalYearQuarter varchar(10) not null
, WorkDaysInFiscalPeriodTotal tinyint null
, WorkDaysInFiscalPeriodToDate tinyint null
)
with (heap)
go

create index NCI_dimDate_DateKey on dbo.dimDate (DateKey);
go