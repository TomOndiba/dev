CREATE TABLE [psa].[ics_stg_SAP_GBR_KNVH]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_KNVH_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_KNVH_IsIncomplete] DEFAULT ('N'),
[MANDT] [nvarchar] (3) NULL,
[HITYP] [nvarchar] (1) NULL,
[KUNNR] [nvarchar] (10) NULL,
[VKORG] [nvarchar] (4) NULL,
[VTWEG] [nvarchar] (2) NULL,
[SPART] [nvarchar] (2) NULL,
[DATAB] [datetime] NULL,
[DATBI] [datetime] NULL,
[HKUNNR] [nvarchar] (10) NULL,
[HVKORG] [nvarchar] (4) NULL,
[HVTWEG] [nvarchar] (2) NULL,
[HSPART] [nvarchar] (2) NULL,
[GRPNO] [nvarchar] (3) NULL,
[BOKRE] [nvarchar] (1) NULL,
[PRFRE] [nvarchar] (1) NULL,
[HZUOR] [nvarchar] (2) NULL,
[exp_deltaKey] [datetime] NULL
)
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KNVH] ADD CONSTRAINT [AK_psa_ics_stg_SAP_GBR_KNVH_EtlRecordId] UNIQUE CLUSTERED  ([EtlRecordId])
GO
