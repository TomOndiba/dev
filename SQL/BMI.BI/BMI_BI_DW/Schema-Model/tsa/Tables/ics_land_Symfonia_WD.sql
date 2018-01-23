CREATE TABLE [tsa].[ics_land_Symfonia_WD]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_WD_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_WD_IsDuplicate] DEFAULT ((0)),
[cena] [float] NULL,
[dzial] [varchar] (40) NULL,
[flag] [smallint] NULL,
[guid_obcy] [uniqueidentifier] NULL,
[id] [int] NULL,
[id_obcy] [int] NULL,
[id_wlasny] [int] NULL,
[idkh] [int] NULL,
[idkhfk] [int] NULL,
[ilosc] [float] NULL,
[kodkh] [varchar] (40) NULL,
[kodtw] [varchar] (40) NULL,
[opis] [varchar] (100) NULL,
[typ] [smallint] NULL,
[wartosc] [float] NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_WD_1] ON [tsa].[ics_land_Symfonia_WD] ([id])
GO
