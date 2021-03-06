CREATE TABLE [psa].[ics_stg_SAP_GBR_LFM1]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_LFM1_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_LFM1_IsIncomplete] DEFAULT ('N'),
[MANDT] [nvarchar] (3) NOT NULL,
[LIFNR] [nvarchar] (10) NOT NULL,
[EKORG] [nvarchar] (4) NOT NULL,
[ERDAT] [datetime] NULL,
[ERNAM] [nvarchar] (12) NULL,
[SPERM] [nvarchar] (1) NULL,
[LOEVM] [nvarchar] (1) NULL,
[LFABC] [nvarchar] (1) NULL,
[WAERS] [nvarchar] (5) NULL,
[VERKF] [nvarchar] (30) NULL,
[TELF1] [nvarchar] (16) NULL,
[MINBW] [decimal] (13, 2) NULL,
[ZTERM] [nvarchar] (4) NULL,
[INCO1] [nvarchar] (3) NULL,
[INCO2] [nvarchar] (28) NULL,
[WEBRE] [nvarchar] (1) NULL,
[KZABS] [nvarchar] (1) NULL,
[KALSK] [nvarchar] (2) NULL,
[KZAUT] [nvarchar] (1) NULL,
[EXPVZ] [nvarchar] (1) NULL,
[ZOLLA] [nvarchar] (6) NULL,
[MEPRF] [nvarchar] (1) NULL,
[EKGRP] [nvarchar] (3) NULL,
[XERSY] [nvarchar] (1) NULL,
[PLIFZ] [decimal] (3, 0) NULL,
[MRPPP] [nvarchar] (3) NULL,
[LFRHY] [nvarchar] (3) NULL,
[LIBES] [nvarchar] (1) NULL,
[LIPRE] [nvarchar] (2) NULL,
[LISER] [nvarchar] (1) NULL,
[PRFRE] [nvarchar] (1) NULL,
[NRGEW] [nvarchar] (1) NULL,
[BOIND] [nvarchar] (1) NULL,
[BLIND] [nvarchar] (1) NULL,
[KZRET] [nvarchar] (1) NULL,
[SKRIT] [nvarchar] (1) NULL,
[BSTAE] [nvarchar] (4) NULL,
[RDPRF] [nvarchar] (4) NULL,
[MEGRU] [nvarchar] (4) NULL,
[VENSL] [decimal] (4, 1) NULL,
[BOPNR] [nvarchar] (4) NULL,
[XERSR] [nvarchar] (1) NULL,
[EIKTO] [nvarchar] (12) NULL,
[ABUEB] [nvarchar] (4) NULL,
[PAPRF] [nvarchar] (4) NULL,
[AGREL] [nvarchar] (1) NULL,
[XNBWY] [nvarchar] (1) NULL,
[VSBED] [nvarchar] (2) NULL,
[LEBRE] [nvarchar] (1) NULL,
[BOLRE] [nvarchar] (1) NULL,
[UMSAE] [nvarchar] (1) NULL,
[VENDOR_RMA_REQ] [nvarchar] (1) NULL,
[ACTIVITY_PROFIL] [nvarchar] (4) NULL,
[TRANSPORT_CHAIN] [nvarchar] (10) NULL,
[STAGING_TIME] [decimal] (3, 0) NULL
)
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_LFM1] ADD CONSTRAINT [psa_ics_stg_SAP_GBR_LFM1_PK] PRIMARY KEY CLUSTERED  ([MANDT], [LIFNR], [EKORG])
GO
