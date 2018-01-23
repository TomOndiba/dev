CREATE TABLE [tsa].[ics_land_Symfonia_AD]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_AD_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_AD_IsDuplicate] DEFAULT ((0)),
[dom] [varchar] (15) NULL,
[flag] [smallint] NULL,
[id] [int] NULL,
[idkh] [int] NULL,
[idKraju] [int] NULL,
[kodpocz] [varchar] (10) NULL,
[lokal] [varchar] (15) NULL,
[miejscowosc] [varchar] (50) NULL,
[nazwa] [varchar] (150) NULL,
[nazwaAdr] [varchar] (64) NULL,
[nip] [varchar] (20) NULL,
[typkh] [smallint] NULL,
[ulica] [varchar] (50) NULL
)
GO
