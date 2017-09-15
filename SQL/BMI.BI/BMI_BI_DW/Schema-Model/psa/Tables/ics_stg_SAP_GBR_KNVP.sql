CREATE TABLE [psa].[ics_stg_SAP_GBR_KNVP]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_KNVP_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_KNVP_IsIncomplete] DEFAULT ('N'),
[MANDT] [nvarchar] (3) NULL,
[KUNNR] [nvarchar] (10) NULL,
[VKORG] [nvarchar] (4) NULL,
[VTWEG] [nvarchar] (2) NULL,
[SPART] [nvarchar] (2) NULL,
[PARVW] [nvarchar] (2) NULL,
[PARZA] [nvarchar] (3) NULL,
[KUNN2] [nvarchar] (10) NULL,
[LIFNR] [nvarchar] (10) NULL,
[PERNR] [nvarchar] (8) NULL,
[PARNR] [nvarchar] (10) NULL,
[KNREF] [nvarchar] (30) NULL,
[DEFPA] [nvarchar] (1) NULL
)
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNVP] ADD CONSTRAINT [AK_psa_ics_stg_SAP_GBR_KNVP_EtlRecordId] UNIQUE CLUSTERED  ([EtlRecordId])
GO
