CREATE TABLE [tsa].[ics_land_Symfonia_DT]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_DT_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_DT_IsDuplicate] DEFAULT ((0)),
[id] [int] NULL,
[idkh] [int] NULL,
[idtw] [int] NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_DT_1] ON [tsa].[ics_land_Symfonia_DT] ([id])
GO
