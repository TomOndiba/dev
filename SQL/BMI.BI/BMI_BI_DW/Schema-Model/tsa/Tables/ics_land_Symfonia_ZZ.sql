CREATE TABLE [tsa].[ics_land_Symfonia_ZZ]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_ZZ_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_ZZ_IsDuplicate] DEFAULT ((0)),
[baza1] [smallint] NULL,
[baza2] [smallint] NULL,
[baza3] [smallint] NULL,
[cena] [float] NULL,
[data] [datetime] NULL,
[flag] [smallint] NULL,
[id] [int] NULL,
[id1] [int] NULL,
[id2] [int] NULL,
[id3] [int] NULL,
[id3pos] [int] NULL,
[iddkreal] [int] NULL,
[ilosc] [float] NULL,
[ilosc2] [float] NULL,
[kod1] [varchar] (40) NULL,
[kod2] [varchar] (40) NULL,
[magazyn] [int] NULL,
[opis] [varchar] (100) NULL,
[subtyp] [smallint] NULL,
[termin] [datetime] NULL,
[typ] [smallint] NULL,
[waluta] [varchar] (3) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_ZZ_1] ON [tsa].[ics_land_Symfonia_ZZ] ([id])
GO
