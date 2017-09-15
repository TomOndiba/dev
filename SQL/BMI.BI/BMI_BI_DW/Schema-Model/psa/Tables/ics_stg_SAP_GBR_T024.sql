CREATE TABLE [psa].[ics_stg_SAP_GBR_T024]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_T024_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_T024_IsIncomplete] DEFAULT ('N'),
[MANDT] [nvarchar] (3) NULL,
[EKGRP] [nvarchar] (3) NULL,
[EKNAM] [nvarchar] (18) NULL,
[EKTEL] [nvarchar] (12) NULL,
[LDEST] [nvarchar] (4) NULL,
[TELFX] [nvarchar] (31) NULL,
[TEL_NUMBER] [nvarchar] (30) NULL,
[TEL_EXTENS] [nvarchar] (10) NULL,
[SMTP_ADDR] [nvarchar] (241) NULL
)
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T024] ADD CONSTRAINT [AK_psa_ics_stg_SAP_GBR_T024_EtlRecordId] UNIQUE CLUSTERED  ([EtlRecordId])
GO
