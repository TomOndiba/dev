CREATE TABLE [psa].[ics_stg_SAP_GBR_LFBK]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_LFBK_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_LFBK_IsIncomplete] DEFAULT ('N'),
[MANDT] [nvarchar] (3) NULL,
[LIFNR] [nvarchar] (10) NULL,
[BANKS] [nvarchar] (3) NULL,
[BANKL] [nvarchar] (15) NULL,
[BANKN] [nvarchar] (18) NULL,
[BKONT] [nvarchar] (2) NULL,
[BVTYP] [nvarchar] (4) NULL,
[XEZER] [nvarchar] (1) NULL,
[BKREF] [nvarchar] (20) NULL,
[KOINH] [nvarchar] (60) NULL,
[EBPP_ACCNAME] [nvarchar] (40) NULL,
[EBPP_BVSTATUS] [nvarchar] (1) NULL,
[KOVON] [datetime] NULL,
[KOBIS] [datetime] NULL
)
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_LFBK] ADD CONSTRAINT [AK_psa_ics_stg_SAP_GBR_LFBK_EtlRecordId] UNIQUE CLUSTERED  ([EtlRecordId])
GO
