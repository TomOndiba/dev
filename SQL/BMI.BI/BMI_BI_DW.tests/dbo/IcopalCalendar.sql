CREATE TABLE [dbo].[IcopalCalendar] (
    [DataFrom]              DATETIME      NOT NULL,
    [FiscalYear]            INT           NULL,
    [FiscalQuarter]         INT           NULL,
    [FiscalPeriod]          INT           NULL,
    [FiscalPeriodDescLong]  VARCHAR (255) NULL,
    [FiscalPeriodDescShort] VARCHAR (50)  NULL,
    [Col_F7]                VARCHAR (255) NULL,
    [Col_F8]                VARCHAR (255) NULL,
    [Col_F9]                VARCHAR (255) NULL,
    [Col_F10]               VARCHAR (255) NULL,
    [Col_F11]               VARCHAR (255) NULL,
    [Col_F12]               VARCHAR (255) NULL,
    [Col_F13]               VARCHAR (255) NULL,
    CONSTRAINT [PK_IcopalCalendar] PRIMARY KEY CLUSTERED ([DataFrom] ASC)
);

