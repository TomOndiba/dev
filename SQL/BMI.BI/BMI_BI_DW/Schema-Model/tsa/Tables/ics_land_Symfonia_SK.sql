CREATE TABLE [tsa].[ics_land_Symfonia_SK]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_SK_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_SK_IsDuplicate] DEFAULT ((0)),
[flag] [smallint] NULL,
[id] [int] NULL,
[kod] [varchar] (40) NULL,
[kodKor] [varchar] (4) NULL,
[nazwa] [varchar] (100) NULL,
[super] [int] NULL,
[trescFK] [varchar] (60) NULL,
[typ] [smallint] NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_SK_1] ON [tsa].[ics_land_Symfonia_SK] ([id])
GO
