CREATE TABLE [tsa].[ics_land_iScala_HUN_PC063700]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_iScala_HUN_PC063700_ExcludedFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_iScala_HUN_PC063700_IsDuplicate] DEFAULT ((0)),
[PC06001] [nvarchar] (3) NOT NULL,
[PC06002] [nchar] (2) NOT NULL,
[PC06003] [nvarchar] (74) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_iScala_HUN_PC063700] ON [tsa].[ics_land_iScala_HUN_PC063700] ([PC06001], [PC06002])
GO
