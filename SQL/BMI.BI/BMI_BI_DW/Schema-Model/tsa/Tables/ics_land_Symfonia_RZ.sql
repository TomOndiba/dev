CREATE TABLE [tsa].[ics_land_Symfonia_RZ]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_RZ_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_RZ_IsDuplicate] DEFAULT ((0)),
[bazadokrz] [smallint] NULL,
[bazapozrz] [smallint] NULL,
[data] [datetime] NULL,
[flag] [smallint] NULL,
[id] [int] NULL,
[iddokrz] [int] NULL,
[idkh] [int] NULL,
[idpozrz] [int] NULL,
[idtw] [int] NULL,
[iloscrl] [float] NULL,
[iloscrz] [float] NULL,
[magazyn] [int] NULL,
[subtyp] [smallint] NULL,
[termin] [datetime] NULL,
[typ] [smallint] NULL,
[wartosc] [float] NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_RZ_1] ON [tsa].[ics_land_Symfonia_RZ] ([id])
GO
