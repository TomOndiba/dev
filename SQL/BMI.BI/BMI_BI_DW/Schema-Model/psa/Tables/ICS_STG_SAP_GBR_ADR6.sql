CREATE TABLE [psa].[ics_stg_SAP_GBR_ADR6]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_ADR6_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_ADR6_IsIncomplete] DEFAULT ('N'),
[CLIENT] [nvarchar] (3) NULL,
[ADDRNUMBER] [nvarchar] (10) NULL,
[PERSNUMBER] [nvarchar] (10) NULL,
[DATE_FROM] [nvarchar] (20) NULL,
[CONSNUMBER] [nvarchar] (3) NULL,
[FLGDEFAULT] [nvarchar] (1) NULL,
[FLG_NOUSE] [nvarchar] (1) NULL,
[HOME_FLAG] [nvarchar] (1) NULL,
[SMTP_ADDR] [nvarchar] (241) NULL,
[SMTP_SRCH] [nvarchar] (20) NULL,
[DFT_RECEIV] [nvarchar] (1) NULL,
[R3_USER] [nvarchar] (1) NULL,
[ENCODE] [nvarchar] (1) NULL,
[TNEF] [nvarchar] (1) NULL,
[VALID_FROM] [nvarchar] (14) NULL,
[VALID_TO] [nvarchar] (14) NULL
)
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_ADR6] ADD CONSTRAINT [AK_psa_ics_stg_SAP_GBR_ADR6_EtlRecordId] UNIQUE CLUSTERED  ([EtlRecordId])
GO
