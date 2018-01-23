CREATE TABLE [tsa].[ics_land_Symfonia_XT]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_XT_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_XT_IsDuplicate] DEFAULT ((0)),
[baza] [smallint] NULL,
[data1] [datetime] NULL,
[data2] [datetime] NULL,
[flag] [smallint] NULL,
[id] [int] NULL,
[klient] [int] NULL,
[kod] [varchar] (40) NULL,
[long] [int] NULL,
[long2] [int] NULL,
[nazwa] [varchar] (100) NULL,
[podkatalog] [smallint] NULL,
[root] [int] NULL,
[subtyp] [smallint] NULL,
[super] [int] NULL,
[typ] [smallint] NULL,
[wartosc] [float] NULL,
[zawartosc] [int] NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_XT_1] ON [tsa].[ics_land_Symfonia_XT] ([id])
GO
