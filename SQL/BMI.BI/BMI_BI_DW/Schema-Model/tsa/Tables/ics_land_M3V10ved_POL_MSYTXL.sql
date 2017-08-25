CREATE TABLE [tsa].[ics_land_M3V10ved_POL_MSYTXL]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF__ics_land___Exclu__0A695708] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF__ics_land___IsDup__0B5D7B41] DEFAULT ((0)),
[TLCONO] [numeric] (18, 0) NULL,
[TLDIVI] [nchar] (3) NULL,
[TLLINO] [numeric] (18, 0) NULL,
[TLLMTS] [numeric] (18, 0) NULL,
[TLLNCD] [nchar] (2) NULL,
[TLTX60] [nvarchar] (60) NULL,
[TLTXID] [numeric] (18, 0) NULL,
[TLTXVR] [nchar] (10) NULL
)
GO
