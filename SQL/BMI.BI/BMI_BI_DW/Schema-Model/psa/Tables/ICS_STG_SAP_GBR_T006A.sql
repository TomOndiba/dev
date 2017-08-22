CREATE TABLE [psa].[ics_stg_SAP_GBR_T006A]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_T006A_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_T006A_IsIncomplete] DEFAULT ('N'),
[MANDT] [nvarchar] (3) NULL,
[SPRAS] [nvarchar] (1) NULL,
[MSEHI] [nvarchar] (3) NULL,
[MSEH3] [nvarchar] (3) NULL,
[MSEH6] [nvarchar] (6) NULL,
[MSEHT] [nvarchar] (10) NULL,
[MSEHL] [nvarchar] (30) NULL
)
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T006A] ADD CONSTRAINT [AK_psa_ics_stg_SAP_GBR_T006A_EtlRecordId] UNIQUE CLUSTERED  ([EtlRecordId])
GO
