CREATE TABLE [tsa].[ics_land_Symfonia_UZ]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_UZ_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_UZ_IsDuplicate] DEFAULT ((0)),
[bazauz] [smallint] NULL,
[cena] [float] NULL,
[flag] [smallint] NULL,
[id] [int] NULL,
[idkh] [int] NULL,
[idobcy] [int] NULL,
[iduz] [int] NULL,
[kodobcy] [varchar] (40) NULL,
[subtyp] [smallint] NULL,
[typ] [smallint] NULL,
[waluta] [varchar] (3) NULL,
[wart] [float] NULL
)
GO
