CREATE TABLE [psa].[ics_stg_SAP_GBR_TCURR]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_TCURR_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_TCURR_IsIncomplete] DEFAULT ('N'),
[MANDT] [nvarchar] (3) NOT NULL,
[KURST] [nvarchar] (4) NOT NULL,
[FCURR] [nvarchar] (5) NOT NULL,
[TCURR] [nvarchar] (5) NOT NULL,
[GDATU] [nvarchar] (8) NOT NULL,
[UKURS] [decimal] (9, 5) NULL,
[FFACT] [decimal] (9, 0) NULL,
[TFACT] [decimal] (9, 0) NULL
)
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_TCURR] ADD CONSTRAINT [psa_ics_stg_SAP_GBR_TCURR_PK] PRIMARY KEY CLUSTERED  ([MANDT], [KURST], [FCURR], [TCURR], [GDATU])
GO
EXEC sp_addextendedproperty N'IncludeInMerge', N'Y', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_SAP_GBR_TCURR', NULL, NULL
GO
