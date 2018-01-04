CREATE TABLE [tsa].[ics_land_iScala_HUN_PCB23700]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_iScala_HUN_PCB23700_ExcludedFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_iScala_HUN_PCB23700_IsDuplicate] DEFAULT ((0)),
[PCB2001] [nchar] (38) NOT NULL,
[PCB2002] [nchar] (3) NOT NULL,
[PCB2003] [nvarchar] (50) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_iScala_HUN_PCB23700] ON [tsa].[ics_land_iScala_HUN_PCB23700] ([PCB2001], [PCB2002])
GO
