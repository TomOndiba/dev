CREATE TABLE [psa].[ics_stg_Symfonia_UZ]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_UZ_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_UZ_IsIncomplete] DEFAULT ('N'),
[bazauz] [smallint] NULL,
[cena] [float] NULL,
[flag] [smallint] NULL,
[id] [int] NOT NULL,
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
ALTER TABLE [psa].[ics_stg_Symfonia_UZ] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_UZ] PRIMARY KEY CLUSTERED  ([id])
GO
EXEC sp_addextendedproperty N'IncludeInMerge', N'Y', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_Symfonia_UZ', NULL, NULL
GO
