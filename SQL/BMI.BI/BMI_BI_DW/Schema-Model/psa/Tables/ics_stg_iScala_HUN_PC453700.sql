CREATE TABLE [psa].[ics_stg_iScala_HUN_PC453700]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_iScala_HUN_PC453700_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_iScala_HUN_PC453700_IsIncomplete] DEFAULT ('N'),
[PC45001] [nvarchar] (10) NOT NULL,
[PC45002] [nvarchar] (35) NULL,
[PC45003] [nvarchar] (35) NULL,
[PC45004] [nvarchar] (35) NULL,
[PC45005] [nvarchar] (35) NULL,
[PC45006] [nvarchar] (35) NULL,
[PC45007] [nvarchar] (10) NULL,
[PC45008] [nvarchar] (20) NULL,
[PC45009] [nvarchar] (20) NULL,
[PC45010] [nvarchar] (25) NOT NULL,
[PC45011] [nvarchar] (35) NULL,
[PC45012] [nvarchar] (10) NULL,
[PC45013] [nchar] (3) NULL,
[PC45014] [nvarchar] (10) NULL,
[PC45015] [nvarchar] (10) NULL,
[PC45016] [nvarchar] (10) NULL,
[PC45017] [nvarchar] (35) NULL,
[PC45018] [nvarchar] (35) NULL,
[PC45019] [nvarchar] (35) NULL
)
GO
ALTER TABLE [psa].[ics_stg_iScala_HUN_PC453700] ADD CONSTRAINT [PK_psa_ics_stg_iScala_HUN_PC453700] PRIMARY KEY CLUSTERED  ([PC45001], [PC45010])
GO
EXEC sp_addextendedproperty N'IncludeInMerge', N'Y', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_iScala_HUN_PC453700', NULL, NULL
GO
