CREATE TABLE [tsa].[ics_land_iScala_HUN_PC3L3700]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_iScala_HUN_PC3L3700_ExcludedFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_iScala_HUN_PC3L3700_IsDuplicate] DEFAULT ((0)),
[PC3L001] [nchar] (10) NOT NULL,
[PC3L002] [nchar] (10) NOT NULL,
[PC3L003] [nchar] (6) NOT NULL,
[PC3L004] [nchar] (6) NOT NULL,
[PC3L005] [int] NOT NULL,
[PC3L006] [int] NOT NULL,
[PC3L007] [nchar] (10) NULL,
[PC3L008] [int] NULL,
[PC3L009] [nchar] (10) NULL,
[PC3L010] [numeric] (26, 8) NULL,
[PC3L011] [datetime] NULL,
[PC3L012] [datetime] NULL,
[PC3L013] [nchar] (25) NULL,
[PC3L014] [nchar] (4) NULL,
[PC3L015] [nvarchar] (35) NULL,
[PC3L016] [nchar] (1) NULL,
[PC3L017] [nchar] (4) NULL,
[PC3L018] [nchar] (6) NULL,
[PC3L019] [int] NULL,
[PC3L020] [datetime] NULL,
[PC3L021] [datetime] NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_iScala_HUN_PC3L3700] ON [tsa].[ics_land_iScala_HUN_PC3L3700] ([PC3L001], [PC3L002], [PC3L003], [PC3L004], [PC3L005], [PC3L006])
GO
