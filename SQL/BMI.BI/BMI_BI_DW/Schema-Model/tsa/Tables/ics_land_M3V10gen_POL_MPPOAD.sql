CREATE TABLE [tsa].[ics_land_M3V10gen_POL_MPPOAD]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF__ics_land___Exclu__6C6EDFCD] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF__ics_land___IsDup__6D630406] DEFAULT ((0)),
[ADADID] [nchar] (6) NULL,
[ADADK2] [nchar] (3) NULL,
[ADADK3] [nchar] (3) NULL,
[ADADR1] [nvarchar] (36) NULL,
[ADADR2] [nvarchar] (36) NULL,
[ADADR3] [nvarchar] (36) NULL,
[ADADR4] [nvarchar] (36) NULL,
[ADCHID] [nchar] (10) NULL,
[ADCHNO] [numeric] (18, 0) NULL,
[ADCONM] [nvarchar] (36) NULL,
[ADCONO] [numeric] (18, 0) NULL,
[ADCSCD] [nchar] (3) NULL,
[ADECAR] [nchar] (2) NULL,
[ADFACI] [nchar] (3) NULL,
[ADLMDT] [numeric] (18, 0) NULL,
[ADPNLI] [numeric] (18, 0) NULL,
[ADPOAD] [numeric] (18, 0) NULL,
[ADPONO] [nchar] (10) NULL,
[ADPRIA] [numeric] (18, 0) NULL,
[ADPUNO] [nchar] (7) NULL,
[ADRGDT] [numeric] (18, 0) NULL,
[ADRGTM] [numeric] (18, 0) NULL,
[ADTOWN] [nvarchar] (20) NULL,
[ADTXID] [numeric] (18, 0) NULL,
[ADWHLO] [nchar] (3) NULL
)
GO
