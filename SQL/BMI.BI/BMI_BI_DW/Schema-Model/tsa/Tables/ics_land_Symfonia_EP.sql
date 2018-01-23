CREATE TABLE [tsa].[ics_land_Symfonia_EP]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_EP_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_EP_IsDuplicate] DEFAULT ((0)),
[guid] [uniqueidentifier] NULL,
[id] [int] NULL,
[kurs] [float] NULL,
[podmiot] [int] NULL,
[typ] [smallint] NULL,
[zobowiazanie] [int] NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_EP_1] ON [tsa].[ics_land_Symfonia_EP] ([id])
GO
