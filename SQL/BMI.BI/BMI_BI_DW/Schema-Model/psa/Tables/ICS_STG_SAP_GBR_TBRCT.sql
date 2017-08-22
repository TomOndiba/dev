CREATE TABLE [psa].[ics_stg_SAP_GBR_TBRCT]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_TBRCT_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_TBRCT_IsIncomplete] DEFAULT ('N'),
[MANDT] [nvarchar] (3) NULL,
[SPRAS] [nvarchar] (1) NULL,
[BRACO] [nvarchar] (10) NULL,
[VTEXT] [nvarchar] (20) NULL
)
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_TBRCT] ADD CONSTRAINT [AK_psa_ics_stg_SAP_GBR_TBRCT_EtlRecordId] UNIQUE CLUSTERED  ([EtlRecordId])
GO
