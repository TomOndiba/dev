CREATE TABLE [psa].[ics_stg_SAP_GBR_LIPS]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_LIPS_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_LIPS_IsIncomplete] DEFAULT ('N'),
[MANDT] [nvarchar] (3) NULL,
[VBELN] [nvarchar] (10) NULL,
[POSNR] [nvarchar] (6) NULL,
[VGBEL] [nvarchar] (10) NULL,
[VGTYP] [nvarchar] (1) NULL
)
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_LIPS] ADD CONSTRAINT [AK_psa_ics_stg_SAP_GBR_LIPS_EtlRecordId] UNIQUE CLUSTERED  ([EtlRecordId])
GO
