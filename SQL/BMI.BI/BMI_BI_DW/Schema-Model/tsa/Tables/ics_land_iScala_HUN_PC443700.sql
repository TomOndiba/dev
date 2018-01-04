CREATE TABLE [tsa].[ics_land_iScala_HUN_PC443700]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_iScala_HUN_PC443700_ExcludedFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_iScala_HUN_PC443700_IsDuplicate] DEFAULT ((0)),
[PC44001] [nchar] (10) NOT NULL,
[PC44002] [nchar] (6) NOT NULL,
[PC44003] [nchar] (6) NOT NULL,
[PC44004] [nchar] (6) NOT NULL,
[PC44005] [nvarchar] (70) NULL,
[PC44006] [nvarchar] (70) NULL,
[PC44007] [nvarchar] (1) NULL,
[PC44008] [nvarchar] (1) NULL,
[PC44009] [nvarchar] (1) NULL,
[PC44010] [nvarchar] (1) NULL,
[PC44011] [nvarchar] (1) NULL,
[PC44012] [nvarchar] (1) NULL,
[PC44013] [nvarchar] (1) NULL,
[PC44014] [nvarchar] (1) NULL,
[PC44015] [nvarchar] (1) NULL,
[PC44016] [nvarchar] (1) NULL,
[PC44017] [nvarchar] (1) NULL,
[PC44018] [nvarchar] (1) NULL,
[PC44019] [nvarchar] (1) NULL,
[PC44020] [nvarchar] (1) NULL,
[PC44021] [int] NULL,
[PC44022] [nvarchar] (25) NOT NULL,
[PC44023] [nvarchar] (6) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_iScala_HUN_PC443700] ON [tsa].[ics_land_iScala_HUN_PC443700] ([PC44001], [PC44022], [PC44002], [PC44003], [PC44004])
GO
