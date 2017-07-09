CREATE TABLE [dbo].[dimDate]
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
ALTER TABLE [dbo].[dimDate] ADD CONSTRAINT [PK_dimDate] PRIMARY KEY CLUSTERED  ([DateKey])
GO
EXEC sp_addextendedproperty N'MS_Description', N'This table represents the date dimension used in EDW and records all past, present and future dates along with their attributes for eaxmple, day of the week, month, quarter, year etc', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Optional - will always be populated for real dates but may be NULL (or an extreme like 01-Jan-1900 or 31-Dec-9999) for special cases', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'ActualDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Numeric representation of the quarter in the calendar year when ActualDate is populated - otherwise NULL', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'CalendarQuarter'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Numeric representation of the year when ActualDate is populated - otherwise NULL', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'CalendarYear'
GO
EXEC sp_addextendedproperty N'MS_Description', N'database-specific unique identifier for a date. Except for the special cases (unknown, not happened etc) the number will be an eight digit integer formatted to represent YYYYMMDD for readability', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'DateKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'When ActualDate is populated will usually be string in the standard EU date format of MM/DD/YYYY but may be some other text for special case dates', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'DateNameEU'
GO
EXEC sp_addextendedproperty N'MS_Description', N'When ActualDate is populated will usually be string in the standard US date format of DD/MM/YYYY but may be some other text for special case dates', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'DateNameUS'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Numeric representation of the day number in the month when ActualDate is populated - otherwise NULL', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'DayNumberInMonth'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Numeric representation of the day number in the week when ActualDate is populated - otherwise NULL', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'DayNumberInWeek'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Numeric representation of the day number in the calendar year when ActualDate is populated - otherwise NULL', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'DayNumberInYear'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Three letter abbreviation of English day name in English or other text for special cases', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'EnglishDayCode'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Full English day name or other text for special cases', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'EnglishDayName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Three letter abbreviation of English month name or other text for special cases', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'EnglishMonthCode'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Full English month name or other text for special cases', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'EnglishMonthName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'When ActualDate is populated will be the 4-4-5 financial period/month number (1-12), otherwise null', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'FiscalPeriod'
GO
EXEC sp_addextendedproperty N'MS_Description', N'When ActualDate is populated will be a string representation of the 4-4-5 financial period/month code (JAN-DEC)', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'FiscalPeriodCode'
GO
EXEC sp_addextendedproperty N'MS_Description', N'When ActualDate is populated will be a string representation of the 4-4-5 financial period/month full name (January-December)', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'FiscalPeriodName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'When ActualDate is populated will be the 4-4-5 financial quarter number (1-4), otherwise null', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'FiscalQuarter'
GO
EXEC sp_addextendedproperty N'MS_Description', N'When ActualDate is populated will be the 4-4-5 financial year reprsented as a four-digit number (should be the same as calendar year), otherwise null', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'FiscalYear'
GO
EXEC sp_addextendedproperty N'MS_Description', N'When ActualDate is populated will be a string representation of the 4-4-5 financial year and month in the form YYYY-MM - may be some other text for special cases', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'FiscalYearPeriod'
GO
EXEC sp_addextendedproperty N'MS_Description', N'When ActualDate is populated will be a string representation of the 4-4-5 financial year and quarter in the form YYYY-QN - may be some other text for special cases', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'FiscalYearQuarter'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Typically Y (Yes) or N (No) if Actual Date is populated, otherwise some other text for special cases', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'IsLastDayInMonth'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Typically Weekend or Weekday if Actual Date is populated, otherwise some other text for special cases', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'IsWeekend'
GO
EXEC sp_addextendedproperty N'MS_Description', N'When ActualDate is populated will be the date of the Monday in the week,  in which ActualDate falls - otherwise NULL.', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'MondayWeekCommencing'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Numeric representation of the month number in the calendar year when ActualDate is populated - otherwise NULL', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'MonthNumberInYear'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Numeric representation of the week number in the calendar year when ActualDate is populated - otherwise NULL', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'WeekNumberInYear'
GO
EXEC sp_addextendedproperty N'MS_Description', N'When ActualDate is populated will be the total number of normal working days to date in the month indicated by ActualDate, otherwise 0', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'WorkDaysInMonthToDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'When ActualDate is populated will be the number of normal working days in the month indicated by ActualDate, otherwise 0', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'WorkDaysInMonthTotal'
GO
EXEC sp_addextendedproperty N'MS_Description', N'When ActualDate is populated will be string representation of calendar year and month in the form YYYY-MM - may be some other text for special cases', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'YearMonth'
GO
EXEC sp_addextendedproperty N'MS_Description', N'When ActualDate is populated will be string representation of calendar year and quarter in the form YYYY-QN - may be some other text for special cases', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'YearQuarter'
GO
