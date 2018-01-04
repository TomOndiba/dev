CREATE TABLE [tsa].[ics_land_iScala_HUN_PCB33700]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_iScala_HUN_PCB33700_ExcludedFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_iScala_HUN_PCB33700_IsDuplicate] DEFAULT ((0)),
[PCB3001] [nchar] (38) NOT NULL,
[PCB3002] [int] NOT NULL,
[PCB3003] [nchar] (38) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_iScala_HUN_PCB33700] ON [tsa].[ics_land_iScala_HUN_PCB33700] ([PCB3001], [PCB3002])
GO
