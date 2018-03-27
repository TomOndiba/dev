CREATE TABLE [psa].[ics_stg_Symfonia_INIFILE]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_INIFILE_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_INIFILE_IsIncomplete] DEFAULT ('N'),
[klucz] [varchar] (100) NOT NULL,
[napis] [varchar] (256) NULL,
[plik] [varchar] (100) NOT NULL,
[sekcja] [varchar] (100) NOT NULL
)
GO
ALTER TABLE [psa].[ics_stg_Symfonia_INIFILE] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_INIFILE] PRIMARY KEY CLUSTERED  ([klucz], [plik], [sekcja])
GO
EXEC sp_addextendedproperty N'IncludeInMerge', N'Y', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_Symfonia_INIFILE', NULL, NULL
GO
