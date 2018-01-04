CREATE TABLE [tsa].[ics_land_iScala_HUN_PC2T3700]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_iScala_HUN_PC2T3700_ExcludedFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_iScala_HUN_PC2T3700_IsDuplicate] DEFAULT ((0)),
[PC2T001] [nchar] (10) NOT NULL,
[PC2T002] [nchar] (25) NOT NULL,
[PC2T003] [nchar] (10) NOT NULL,
[PC2T004] [nchar] (6) NOT NULL,
[PC2T005] [nvarchar] (20) NOT NULL,
[PC2T006] [int] NOT NULL,
[PC2T007] [nvarchar] (70) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_iScala_HUN_PC2T3700] ON [tsa].[ics_land_iScala_HUN_PC2T3700] ([PC2T001], [PC2T002], [PC2T003], [PC2T004], [PC2T005], [PC2T006])
GO
