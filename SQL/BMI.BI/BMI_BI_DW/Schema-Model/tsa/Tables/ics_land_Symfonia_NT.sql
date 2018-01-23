CREATE TABLE [tsa].[ics_land_Symfonia_NT]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_NT_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_NT_IsDuplicate] DEFAULT ((0)),
[baza] [smallint] NULL,
[flag] [smallint] NULL,
[id] [int] NULL,
[opis] [text] NULL,
[subtyp] [smallint] NULL,
[super] [int] NULL,
[typ] [smallint] NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_NT_1] ON [tsa].[ics_land_Symfonia_NT] ([id])
GO
