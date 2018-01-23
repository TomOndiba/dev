CREATE TABLE [psa].[ics_stg_Symfonia_AD]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_AD_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_AD_IsIncomplete] DEFAULT ('N'),
[dom] [varchar] (15) NULL,
[flag] [smallint] NULL,
[id] [int] NOT NULL,
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
ALTER TABLE [psa].[ics_stg_Symfonia_AD] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_AD] PRIMARY KEY CLUSTERED  ([id])
GO
