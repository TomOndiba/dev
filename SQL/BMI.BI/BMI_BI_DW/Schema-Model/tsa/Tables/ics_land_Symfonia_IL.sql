CREATE TABLE [tsa].[ics_land_Symfonia_IL]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_IL_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_IL_IsDuplicate] DEFAULT ((0)),
[data] [datetime] NULL,
[data_stan0] [datetime] NULL,
[flag] [smallint] NULL,
[id] [int] NULL,
[magazyn] [int] NULL,
[nazwa] [varchar] (40) NULL,
[typ] [smallint] NULL,
[wlasciwosci] [smallint] NULL,
[wystawil] [int] NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_IL_1] ON [tsa].[ics_land_Symfonia_IL] ([id])
GO
