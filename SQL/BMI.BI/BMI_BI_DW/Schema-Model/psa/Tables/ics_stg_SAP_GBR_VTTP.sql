CREATE TABLE [psa].[ics_stg_SAP_GBR_VTTP]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_VTTP_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_VTTP_IsIncomplete] DEFAULT ('N'),
[MANDT] [nvarchar] (3) NULL,
[TKNUM] [nvarchar] (10) NULL,
[TPNUM] [nvarchar] (4) NULL,
[VBELN] [nvarchar] (10) NULL,
[TPRFO] [nvarchar] (4) NULL,
[ERNAM] [nvarchar] (12) NULL,
[ERDAT] [datetime] NULL,
[ERZET] [datetime] NULL,
[PKSTA] [nvarchar] (1) NULL,
[KZHULFG] [nvarchar] (1) NULL
)
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_VTTP] ADD CONSTRAINT [AK_psa_ics_stg_SAP_GBR_VTTP_EtlRecordId] UNIQUE CLUSTERED  ([EtlRecordId])
GO
