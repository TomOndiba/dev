CREATE TABLE [tsa].[ics_land_iScala_HUN_PC463700]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_iScala_HUN_PC463700_ExcludedFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_iScala_HUN_PC463700_IsDuplicate] DEFAULT ((0)),
[PC46001] [nchar] (10) NOT NULL,
[PC46002] [nchar] (6) NOT NULL,
[PC46003] [nchar] (6) NOT NULL,
[PC46004] [nchar] (6) NOT NULL,
[PC46005] [int] NOT NULL,
[PC46006] [int] NOT NULL,
[PC46007] [nchar] (10) NULL,
[PC46008] [int] NULL,
[PC46009] [nchar] (10) NULL,
[PC46010] [numeric] (26, 8) NULL,
[PC46011] [datetime] NULL,
[PC46012] [datetime] NULL,
[PC46013] [nvarchar] (25) NOT NULL,
[PC46014] [nchar] (4) NULL,
[PC46015] [nvarchar] (35) NULL,
[PC46016] [nchar] (1) NULL,
[PC46017] [nchar] (4) NULL,
[PC46018] [nchar] (6) NULL,
[PC46019] [int] NULL,
[PC46020] [datetime] NULL,
[PC46021] [datetime] NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_iScala_HUN_PC463700] ON [tsa].[ics_land_iScala_HUN_PC463700] ([PC46001], [PC46013], [PC46002], [PC46003], [PC46004], [PC46005], [PC46006])
GO
