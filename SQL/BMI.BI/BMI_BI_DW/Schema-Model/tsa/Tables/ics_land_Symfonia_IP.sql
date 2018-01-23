CREATE TABLE [tsa].[ics_land_Symfonia_IP]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_IP_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_IP_IsDuplicate] DEFAULT ((0)),
[cena] [float] NULL,
[dataDw] [datetime] NULL,
[flag] [smallint] NULL,
[id] [int] NULL,
[iddw] [int] NULL,
[idil] [int] NULL,
[idtw] [int] NULL,
[iloscjest] [float] NULL,
[iloscma] [float] NULL,
[kod_obcy] [varchar] (40) NULL,
[nazwaDw] [varchar] (40) NULL,
[typ] [smallint] NULL,
[wartosc] [float] NULL
)
GO
