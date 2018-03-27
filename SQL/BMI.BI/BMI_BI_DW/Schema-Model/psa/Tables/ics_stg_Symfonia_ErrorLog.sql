CREATE TABLE [psa].[ics_stg_Symfonia_ErrorLog]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_ErrorLog_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_ErrorLog_IsIncomplete] DEFAULT ('N'),
[data] [datetime] NULL,
[errno] [int] NULL,
[id] [int] NOT NULL,
[opis] [varchar] (2000) NULL,
[super] [int] NULL,
[typ] [smallint] NULL
)
GO
ALTER TABLE [psa].[ics_stg_Symfonia_ErrorLog] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_ErrorLog] PRIMARY KEY CLUSTERED  ([id])
GO
EXEC sp_addextendedproperty N'IncludeInMerge', N'Y', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_Symfonia_ErrorLog', NULL, NULL
GO
