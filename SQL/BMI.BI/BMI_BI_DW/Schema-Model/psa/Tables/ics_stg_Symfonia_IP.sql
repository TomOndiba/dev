CREATE TABLE [psa].[ics_stg_Symfonia_IP]
(
[EtlRecordId] [bigint] NOT NULL IDENTITY(1, 1),
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NULL,
[EtlDeletedBy] [varchar] (200) NULL,
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_IP_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_IP_IsIncomplete] DEFAULT ('N'),
[cena] [float] NULL,
[dataDw] [datetime] NULL,
[flag] [smallint] NULL,
[id] [int] NOT NULL,
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
ALTER TABLE [psa].[ics_stg_Symfonia_IP] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_IP] PRIMARY KEY CLUSTERED  ([id])
GO
EXEC sp_addextendedproperty N'IncludeInMerge', N'Y', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_Symfonia_IP', NULL, NULL
GO
