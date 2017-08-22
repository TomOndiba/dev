CREATE TABLE [psa].[ics_stg_SAP_GBR_KONP]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_KONP_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_KONP_IsIncomplete] DEFAULT ('N'),
[MANDT] [nvarchar] (3) NULL,
[KNUMH] [nvarchar] (10) NULL,
[KOPOS] [nvarchar] (2) NULL,
[KAPPL] [nvarchar] (2) NULL,
[KSCHL] [nvarchar] (4) NULL,
[KNUMT] [nvarchar] (10) NULL,
[STFKZ] [nvarchar] (1) NULL,
[KZBZG] [nvarchar] (1) NULL,
[KSTBM] [decimal] (15, 3) NULL,
[KONMS] [nvarchar] (3) NULL,
[KSTBW] [decimal] (15, 2) NULL,
[KONWS] [nvarchar] (5) NULL,
[KRECH] [nvarchar] (1) NULL,
[KBETR] [decimal] (11, 2) NULL,
[KONWA] [nvarchar] (5) NULL,
[KPEIN] [decimal] (5, 0) NULL,
[KMEIN] [nvarchar] (3) NULL,
[PRSCH] [nvarchar] (4) NULL,
[KUMZA] [decimal] (5, 0) NULL,
[KUMNE] [decimal] (5, 0) NULL,
[MEINS] [nvarchar] (3) NULL,
[MXWRT] [decimal] (11, 2) NULL,
[GKWRT] [decimal] (11, 2) NULL,
[PKWRT] [decimal] (15, 2) NULL,
[FKWRT] [decimal] (15, 2) NULL,
[RSWRT] [decimal] (15, 2) NULL,
[KWAEH] [nvarchar] (5) NULL,
[UKBAS] [decimal] (15, 2) NULL,
[KZNEP] [nvarchar] (1) NULL,
[KUNNR] [nvarchar] (10) NULL,
[LIFNR] [nvarchar] (10) NULL,
[MWSK1] [nvarchar] (2) NULL,
[LOEVM_KO] [nvarchar] (1) NULL,
[ZAEHK_IND] [nvarchar] (2) NULL,
[BOMAT] [nvarchar] (18) NULL,
[KBRUE] [decimal] (11, 2) NULL,
[KSPAE] [nvarchar] (1) NULL,
[BOSTA] [nvarchar] (1) NULL,
[KNUMA_PI] [nvarchar] (10) NULL,
[KNUMA_AG] [nvarchar] (10) NULL,
[KNUMA_SQ] [nvarchar] (10) NULL,
[VALTG] [nvarchar] (2) NULL,
[VALDT] [datetime] NULL,
[ZTERM] [nvarchar] (4) NULL,
[ANZAUF] [nvarchar] (2) NULL,
[MIKBAS] [decimal] (15, 3) NULL,
[MXKBAS] [decimal] (15, 3) NULL,
[KOMXWRT] [decimal] (13, 2) NULL,
[KLF_STG] [nvarchar] (4) NULL,
[KLF_KAL] [nvarchar] (4) NULL,
[VKKAL] [nvarchar] (1) NULL,
[AKTNR] [nvarchar] (10) NULL,
[KNUMA_BO] [nvarchar] (10) NULL,
[MWSK2] [nvarchar] (2) NULL,
[VERTT] [nvarchar] (1) NULL,
[VERTN] [nvarchar] (13) NULL,
[VBEWA] [nvarchar] (4) NULL,
[MDFLG] [nvarchar] (1) NULL,
[KFRST] [nvarchar] (1) NULL,
[UASTA] [nvarchar] (1) NULL,
[_BEV1_ECRTT] [nvarchar] (1) NULL,
[_BEV1_ECRTN] [nvarchar] (13) NULL,
[_BEV1_ECEWA] [nvarchar] (4) NULL
)
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KONP] ADD CONSTRAINT [AK_psa_ics_stg_SAP_GBR_KONP_EtlRecordId] UNIQUE CLUSTERED  ([EtlRecordId])
GO
