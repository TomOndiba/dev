CREATE TABLE [psa].[ics_stg_Symfonia_SK]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_SK_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_SK_IsIncomplete] DEFAULT ('N'),
[flag] [smallint] NULL,
[id] [int] NOT NULL,
[kod] [varchar] (40) NULL,
[kodKor] [varchar] (4) NULL,
[nazwa] [varchar] (100) NULL,
[super] [int] NULL,
[trescFK] [varchar] (60) NULL,
[typ] [smallint] NULL
)
GO
ALTER TABLE [psa].[ics_stg_Symfonia_SK] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_SK] PRIMARY KEY CLUSTERED  ([id])
GO
EXEC sp_addextendedproperty N'IncludeInMerge', N'Y', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_Symfonia_SK', NULL, NULL
GO
