CREATE TABLE [psa].[ics_stg_aspect4_VIRKTBL]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_aspect4_VIRKTBL_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_aspect4_VIRKTBL_IsIncomplete] DEFAULT ('N'),
[VIRK_STATUS_KODE] [decimal] (1, 0) NULL,
[VIRK_RECORD_ID] [nvarchar] (2) NULL,
[VIRK_PAR_NAVN] [nvarchar] (8) NULL,
[VIRK_KEY_REST] [nvarchar] (10) NULL,
[VIRK_KONCRN] [decimal] (3, 0) NULL,
[VIRK_FIRMA] [decimal] (3, 0) NULL,
[VIRK_DATA] [nvarchar] (300) NULL,
[VIRK_OPDAT_DATO] [decimal] (8, 0) NULL,
[VIRK_OPDAT_AF] [nvarchar] (10) NULL,
[VIRK_OPRET_DATO] [decimal] (8, 0) NULL,
[VIRK_OPRET_AF] [nvarchar] (10) NULL,
[VIRK_TS] [decimal] (8, 0) NULL
)
GO
ALTER TABLE [psa].[ics_stg_aspect4_VIRKTBL] ADD CONSTRAINT [psa_ics_stg_aspect4_VIRKTBL_PK] PRIMARY KEY CLUSTERED  ([EtlRecordId])
GO
