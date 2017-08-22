CREATE TABLE [psa].[ics_stg_SAP_GBR_KNVS]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_KNVS_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_KNVS_IsIncomplete] DEFAULT ('N'),
[MANDT] [nvarchar] (3) NULL,
[KUNNR] [nvarchar] (10) NULL,
[VSTEL] [nvarchar] (4) NULL,
[TRANS] [nvarchar] (3) NULL,
[TOPLA] [nvarchar] (1) NULL,
[TOURN] [nvarchar] (4) NULL,
[ANFRF] [nvarchar] (3) NULL,
[SPDNR] [nvarchar] (10) NULL
)
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNVS] ADD CONSTRAINT [AK_psa_ics_stg_SAP_GBR_KNVS_EtlRecordId] UNIQUE CLUSTERED  ([EtlRecordId])
GO
