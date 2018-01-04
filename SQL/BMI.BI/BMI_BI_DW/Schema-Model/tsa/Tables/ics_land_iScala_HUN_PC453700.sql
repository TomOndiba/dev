CREATE TABLE [tsa].[ics_land_iScala_HUN_PC453700]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_iScala_HUN_PC453700_ExcludedFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_iScala_HUN_PC453700_IsDuplicate] DEFAULT ((0)),
[PC45001] [nvarchar] (10) NOT NULL,
[PC45002] [nvarchar] (35) NULL,
[PC45003] [nvarchar] (35) NULL,
[PC45004] [nvarchar] (35) NULL,
[PC45005] [nvarchar] (35) NULL,
[PC45006] [nvarchar] (35) NULL,
[PC45007] [nvarchar] (10) NULL,
[PC45008] [nvarchar] (20) NULL,
[PC45009] [nvarchar] (20) NULL,
[PC45010] [nvarchar] (25) NOT NULL,
[PC45011] [nvarchar] (35) NULL,
[PC45012] [nvarchar] (10) NULL,
[PC45013] [nchar] (3) NULL,
[PC45014] [nvarchar] (10) NULL,
[PC45015] [nvarchar] (10) NULL,
[PC45016] [nvarchar] (10) NULL,
[PC45017] [nvarchar] (35) NULL,
[PC45018] [nvarchar] (35) NULL,
[PC45019] [nvarchar] (35) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_iScala_HUN_PC453700] ON [tsa].[ics_land_iScala_HUN_PC453700] ([PC45001], [PC45010])
GO
