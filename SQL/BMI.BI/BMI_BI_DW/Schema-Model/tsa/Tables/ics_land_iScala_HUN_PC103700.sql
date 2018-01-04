CREATE TABLE [tsa].[ics_land_iScala_HUN_PC103700]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_iScala_HUN_PC103700_ExcludedFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_iScala_HUN_PC103700_IsDuplicate] DEFAULT ((0)),
[PC10001] [nchar] (10) NOT NULL,
[PC10002] [nchar] (6) NOT NULL,
[PC10003] [nchar] (12) NOT NULL,
[PC10004] [nchar] (6) NOT NULL,
[PC10005] [nchar] (6) NOT NULL,
[PC10006] [nchar] (6) NOT NULL,
[PC10007] [nchar] (4) NOT NULL,
[PC10008] [nchar] (35) NOT NULL,
[PC10009] [datetime] NOT NULL,
[PC10010] [numeric] (20, 8) NULL,
[PC10011] [numeric] (20, 8) NULL,
[PC10012] [numeric] (20, 8) NULL,
[PC10013] [int] NULL,
[PC10014] [nchar] (10) NULL,
[PC10015] [nchar] (4) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_iScala_HUN_PC103700] ON [tsa].[ics_land_iScala_HUN_PC103700] ([PC10001], [PC10002], [PC10003], [PC10004], [PC10005], [PC10006], [PC10007], [PC10008], [PC10009])
GO
