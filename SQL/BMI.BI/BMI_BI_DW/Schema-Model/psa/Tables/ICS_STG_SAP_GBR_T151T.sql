CREATE TABLE [psa].[ics_stg_SAP_GBR_T151T]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_T151T_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_T151T_IsIncomplete] DEFAULT ('N'),
[MANDT] [nvarchar] (3) NULL,
[SPRAS] [nvarchar] (1) NULL,
[KDGRP] [nvarchar] (2) NULL,
[KTEXT] [nvarchar] (20) NULL
)
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_T151T] ADD CONSTRAINT [AK_psa_ics_stg_SAP_GBR_T151T_EtlRecordId] UNIQUE CLUSTERED  ([EtlRecordId])
GO
