CREATE TABLE [psa].[ics_stg_SAP_GBR_ZTERMS]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_ZTERMS_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_ZTERMS_IsIncomplete] DEFAULT ('N'),
[MANDT] [nvarchar] (3) NULL,
[VKORG] [nvarchar] (4) NULL,
[KUNNR] [nvarchar] (10) NULL,
[MATNR] [nvarchar] (18) NULL,
[SEQUENCE] [nvarchar] (10) NULL,
[MAKTX] [nvarchar] (40) NULL,
[PRICE] [decimal] (11, 2) NULL,
[ROLLS] [decimal] (5, 0) NULL,
[M2PRICE] [decimal] (11, 2) NULL,
[SROLLS] [decimal] (15, 3) NULL,
[VKGRP] [nvarchar] (3) NULL,
[VKBUR] [nvarchar] (4) NULL,
[WAERS] [nvarchar] (5) NULL,
[DATAB] [datetime] NULL,
[DATBI] [datetime] NULL
)
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_ZTERMS] ADD CONSTRAINT [AK_psa_ics_stg_SAP_GBR_ZTERMS_EtlRecordId] UNIQUE CLUSTERED  ([EtlRecordId])
GO
