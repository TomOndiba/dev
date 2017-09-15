CREATE TABLE [psa].[ics_stg_SAP_GBR_EKAN]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_EKAN_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_EKAN_IsIncomplete] DEFAULT ('N'),
[MANDT] [nvarchar] (3) NULL,
[EBELN] [nvarchar] (10) NULL,
[NAME1] [nvarchar] (35) NULL,
[NAME2] [nvarchar] (35) NULL,
[NAME3] [nvarchar] (35) NULL,
[NAME4] [nvarchar] (35) NULL,
[PSTLZ] [nvarchar] (10) NULL,
[ORT01] [nvarchar] (35) NULL,
[LAND1] [nvarchar] (3) NULL,
[STRAS] [nvarchar] (35) NULL,
[PFACH] [nvarchar] (10) NULL,
[PSTL2] [nvarchar] (10) NULL,
[ANRED] [nvarchar] (15) NULL,
[TELX1] [nvarchar] (30) NULL,
[TELFX] [nvarchar] (31) NULL,
[TELTX] [nvarchar] (30) NULL,
[DATLT] [nvarchar] (14) NULL,
[TELBX] [nvarchar] (15) NULL,
[REGIO] [nvarchar] (3) NULL
)
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKAN] ADD CONSTRAINT [AK_psa_ics_stg_SAP_GBR_EKAN_EtlRecordId] UNIQUE CLUSTERED  ([EtlRecordId])
GO
