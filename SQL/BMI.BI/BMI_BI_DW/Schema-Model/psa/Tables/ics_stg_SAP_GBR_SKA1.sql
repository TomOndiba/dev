CREATE TABLE [psa].[ics_stg_SAP_GBR_SKA1]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_SKA1_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_SKA1_IsIncomplete] DEFAULT ('N'),
[MANDT] [nvarchar] (3) NULL,
[KTOPL] [nvarchar] (4) NULL,
[SAKNR] [nvarchar] (10) NULL,
[XBILK] [nvarchar] (1) NULL,
[SAKAN] [nvarchar] (10) NULL,
[BILKT] [nvarchar] (10) NULL,
[ERDAT] [datetime] NULL,
[ERNAM] [nvarchar] (12) NULL,
[GVTYP] [nvarchar] (2) NULL,
[KTOKS] [nvarchar] (4) NULL,
[MUSTR] [nvarchar] (10) NULL,
[VBUND] [nvarchar] (6) NULL,
[XLOEV] [nvarchar] (1) NULL,
[XSPEA] [nvarchar] (1) NULL,
[XSPEB] [nvarchar] (1) NULL,
[XSPEP] [nvarchar] (1) NULL,
[MCOD1] [nvarchar] (25) NULL,
[FUNC_AREA] [nvarchar] (16) NULL
)
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_SKA1] ADD CONSTRAINT [AK_psa_ics_stg_SAP_GBR_SKA1_EtlRecordId] UNIQUE CLUSTERED  ([EtlRecordId])
GO
