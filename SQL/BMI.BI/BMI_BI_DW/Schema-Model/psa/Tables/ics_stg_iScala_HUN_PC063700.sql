CREATE TABLE [psa].[ics_stg_iScala_HUN_PC063700]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_iScala_HUN_PC063700_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_iScala_HUN_PC063700_IsIncomplete] DEFAULT ('N'),
[PC06001] [nvarchar] (3) NOT NULL,
[PC06002] [nchar] (2) NOT NULL,
[PC06003] [nvarchar] (74) NULL
)
GO
ALTER TABLE [psa].[ics_stg_iScala_HUN_PC063700] ADD CONSTRAINT [PK_psa_ics_stg_iScala_HUN_PC063700] PRIMARY KEY CLUSTERED  ([PC06001], [PC06002])
GO
EXEC sp_addextendedproperty N'IncludeInMerge', N'Y', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_iScala_HUN_PC063700', NULL, NULL
GO
