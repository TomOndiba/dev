CREATE TABLE [psa].[ics_stg_iScala_HUN_PC2T3700]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_iScala_HUN_PC2T3700_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_iScala_HUN_PC2T3700_IsIncomplete] DEFAULT ('N'),
[PC2T001] [nchar] (10) NOT NULL,
[PC2T002] [nchar] (25) NOT NULL,
[PC2T003] [nchar] (10) NOT NULL,
[PC2T004] [nchar] (6) NOT NULL,
[PC2T005] [nvarchar] (20) NOT NULL,
[PC2T006] [int] NOT NULL,
[PC2T007] [nvarchar] (70) NULL
)
GO
ALTER TABLE [psa].[ics_stg_iScala_HUN_PC2T3700] ADD CONSTRAINT [PK_psa_ics_stg_iScala_HUN_PC2T3700] PRIMARY KEY CLUSTERED  ([PC2T001], [PC2T002], [PC2T003], [PC2T004], [PC2T005], [PC2T006])
GO
