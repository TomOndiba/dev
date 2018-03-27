CREATE TABLE [psa].[ics_stg_SAP_SVK_MAKT]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_SVK_MAKT_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_SVK_MAKT_IsIncomplete] DEFAULT ('N'),
[MAKTG] [nvarchar] (40) NULL,
[MAKTX] [nvarchar] (40) NULL,
[MANDT] [nvarchar] (3) NULL,
[MATNR] [nvarchar] (18) NOT NULL,
[SPRAS] [nvarchar] (1) NOT NULL
)
GO
ALTER TABLE [psa].[ics_stg_SAP_SVK_MAKT] ADD CONSTRAINT [PK_psa_ics_stg_SAP_SVK_MAKT] PRIMARY KEY CLUSTERED  ([SPRAS], [MATNR])
GO
EXEC sp_addextendedproperty N'IncludeInMerge', N'Y', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_SAP_SVK_MAKT', NULL, NULL
GO
