CREATE TABLE [psa].[ics_stg_SAP_GBR_KEPH]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_KEPH_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_KEPH_IsIncomplete] DEFAULT ('N'),
[MANDT] [nvarchar] (3) NULL,
[BZOBJ] [nvarchar] (1) NULL,
[KALNR] [nvarchar] (12) NULL,
[KALKA] [nvarchar] (2) NULL,
[KADKY] [datetime] NULL,
[TVERS] [nvarchar] (2) NULL,
[BWVAR] [nvarchar] (3) NULL,
[KKZMA] [nvarchar] (1) NULL,
[PATNR] [nvarchar] (6) NULL,
[KEART] [nvarchar] (1) NULL,
[LOSFX] [nvarchar] (1) NULL,
[KKZST] [nvarchar] (1) NULL,
[KKZMM] [nvarchar] (1) NULL,
[DIPA] [nvarchar] (1) NULL,
[KST001] [decimal] (13, 2) NULL,
[KST002] [decimal] (13, 2) NULL,
[KST003] [decimal] (13, 2) NULL,
[KST004] [decimal] (13, 2) NULL,
[KST005] [decimal] (13, 2) NULL,
[KST006] [decimal] (13, 2) NULL,
[KST007] [decimal] (13, 2) NULL,
[KST008] [decimal] (13, 2) NULL,
[KST009] [decimal] (13, 2) NULL,
[KST010] [decimal] (13, 2) NULL,
[KST011] [decimal] (13, 2) NULL,
[KST012] [decimal] (13, 2) NULL,
[KST013] [decimal] (13, 2) NULL,
[KST014] [decimal] (13, 2) NULL,
[KST015] [decimal] (13, 2) NULL,
[KST016] [decimal] (13, 2) NULL,
[KST017] [decimal] (13, 2) NULL,
[KST018] [decimal] (13, 2) NULL,
[KST019] [decimal] (13, 2) NULL,
[KST020] [decimal] (13, 2) NULL,
[KST021] [decimal] (13, 2) NULL,
[KST022] [decimal] (13, 2) NULL,
[KST023] [decimal] (13, 2) NULL,
[KST024] [decimal] (13, 2) NULL,
[KST025] [decimal] (13, 2) NULL,
[KST026] [decimal] (13, 2) NULL,
[KST027] [decimal] (13, 2) NULL,
[KST028] [decimal] (13, 2) NULL,
[KST029] [decimal] (13, 2) NULL,
[KST030] [decimal] (13, 2) NULL,
[KST031] [decimal] (13, 2) NULL,
[KST032] [decimal] (13, 2) NULL,
[KST033] [decimal] (13, 2) NULL,
[KST034] [decimal] (13, 2) NULL,
[KST035] [decimal] (13, 2) NULL,
[KST036] [decimal] (13, 2) NULL,
[KST037] [decimal] (13, 2) NULL,
[KST038] [decimal] (13, 2) NULL,
[KST039] [decimal] (13, 2) NULL,
[KST040] [decimal] (13, 2) NULL
)
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KEPH] ADD CONSTRAINT [AK_psa_ics_stg_SAP_GBR_KEPH_EtlRecordId] UNIQUE CLUSTERED  ([EtlRecordId])
GO
