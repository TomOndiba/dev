CREATE TABLE [dbo].[Calendar]
(
[DateKey] [int] NOT NULL,
[ActualDate] [date] NULL,
[DateNameEU] [varchar] (30) NOT NULL,
[DateNameUS] [varchar] (30) NOT NULL,
[EnglishMonthCode] [char] (3) NOT NULL,
[EnglishMonthName] [varchar] (10) NOT NULL,
[EnglishDayCode] [char] (3) NOT NULL,
[EnglishDayName] [varchar] (10) NOT NULL,
[CalendarYear] [int] NULL,
[CalendarQuarter] [tinyint] NULL,
[MonthNumberInYear] [tinyint] NULL,
[WeekNumberInYear] [tinyint] NULL,
[DayNumberInYear] [smallint] NULL,
[DayNumberInMonth] [tinyint] NULL,
[DayNumberInWeek] [tinyint] NULL,
[YearMonth] [varchar] (10) NOT NULL,
[YearQuarter] [varchar] (10) NOT NULL,
[IsWeekend] [varchar] (10) NOT NULL,
[IsLastDayInMonth] [varchar] (10) NOT NULL,
[MondayWeekCommencing] [date] NULL,
[WorkDaysInMonthTotal] [tinyint] NULL,
[WorkDaysInMonthToDate] [tinyint] NULL,
[FiscalPeriod] [tinyint] NULL,
[FiscalQuarter] [tinyint] NULL,
[FiscalYear] [int] NULL,
[FiscalPeriodCode] [char] (3) NOT NULL,
[FiscalPeriodName] [varchar] (10) NOT NULL,
[FiscalYearPeriod] [varchar] (10) NOT NULL,
[FiscalYearQuarter] [varchar] (10) NOT NULL,
[WorkDaysInFiscalPeriodTotal] [tinyint] NULL,
[WorkDaysInFiscalPeriodToDate] [tinyint] NULL
)
GO
ALTER TABLE [dbo].[Calendar] ADD CONSTRAINT [PK_Calendar] PRIMARY KEY CLUSTERED  ([DateKey])
GO
