CREATE TABLE [psa].[ics_stg_Symfonia_LOCAL_LOG]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_LOCAL_LOG_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_LOCAL_LOG_IsIncomplete] DEFAULT ('N'),
[baseName] [varchar] (19) NULL,
[id] [int] NOT NULL,
[operation] [smallint] NULL,
[rec_id] [int] NULL,
[term] [int] NOT NULL
)
GO
ALTER TABLE [psa].[ics_stg_Symfonia_LOCAL_LOG] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_LOCAL_LOG] PRIMARY KEY CLUSTERED  ([id], [term])
GO
EXEC sp_addextendedproperty N'IncludeInMerge', N'Y', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_Symfonia_LOCAL_LOG', NULL, NULL
GO
