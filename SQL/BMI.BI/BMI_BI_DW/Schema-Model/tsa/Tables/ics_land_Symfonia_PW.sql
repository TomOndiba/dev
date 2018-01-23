CREATE TABLE [tsa].[ics_land_Symfonia_PW]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_PW_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_PW_IsDuplicate] DEFAULT ((0)),
[data] [datetime] NULL,
[flag] [smallint] NULL,
[id] [int] NULL,
[iddkmg] [int] NULL,
[iddw] [int] NULL,
[idkoryg] [int] NULL,
[idmg] [int] NULL,
[idtw] [int] NULL,
[ilosc] [float] NULL,
[ilosczreal] [float] NULL,
[subtyp] [smallint] NULL,
[typ] [smallint] NULL,
[wartosc] [float] NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_PW_1] ON [tsa].[ics_land_Symfonia_PW] ([id])
GO
