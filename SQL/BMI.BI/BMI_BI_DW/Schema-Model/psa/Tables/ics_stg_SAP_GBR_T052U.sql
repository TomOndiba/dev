CREATE TABLE [psa].[ics_stg_SAP_GBR_T052U]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_T052U_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_T052U_IsIncomplete] DEFAULT ('N'),
[MANDT] [nvarchar] (3) NOT NULL,
[SPRAS] [nvarchar] (1) NOT NULL,
[ZTERM] [nvarchar] (4) NOT NULL,
[ZTAGG] [nvarchar] (2) NOT NULL,
[TEXT1] [nvarchar] (50) NULL
)
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T052U] ADD CONSTRAINT [psa_ics_stg_SAP_GBR_T052U_PK] PRIMARY KEY CLUSTERED  ([MANDT], [SPRAS], [ZTERM], [ZTAGG])
GO
EXEC sp_addextendedproperty N'IncludeInMerge', N'Y', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_SAP_GBR_T052U', NULL, NULL
GO
