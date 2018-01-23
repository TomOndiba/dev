CREATE TABLE [tsa].[ics_land_Symfonia_LOG_BASE]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_LOG_BASE_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_LOG_BASE_IsDuplicate] DEFAULT ((0)),
[baseName] [varchar] (19) NULL,
[id] [int] NULL,
[operation] [smallint] NULL,
[rec_id] [int] NULL,
[term] [int] NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_LOG_BASE_1] ON [tsa].[ics_land_Symfonia_LOG_BASE] ([id])
GO
