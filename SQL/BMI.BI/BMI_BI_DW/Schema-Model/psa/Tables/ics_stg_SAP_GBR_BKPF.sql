CREATE TABLE [psa].[ics_stg_SAP_GBR_BKPF]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_BKPF_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_BKPF_IsIncomplete] DEFAULT ('N'),
[MANDT] [nvarchar] (3) NULL,
[BUKRS] [nvarchar] (4) NULL,
[BELNR] [nvarchar] (10) NULL,
[GJAHR] [nvarchar] (4) NULL,
[BLART] [nvarchar] (2) NULL,
[BLDAT] [datetime] NULL,
[BUDAT] [datetime] NULL,
[MONAT] [nvarchar] (2) NULL,
[CPUDT] [datetime] NULL,
[CPUTM] [datetime] NULL,
[AEDAT] [datetime] NULL,
[UPDDT] [datetime] NULL,
[WWERT] [datetime] NULL,
[USNAM] [nvarchar] (12) NULL,
[TCODE] [nvarchar] (20) NULL,
[BVORG] [nvarchar] (16) NULL,
[XBLNR] [nvarchar] (16) NULL,
[DBBLG] [nvarchar] (10) NULL,
[STBLG] [nvarchar] (10) NULL,
[STJAH] [nvarchar] (4) NULL,
[BKTXT] [nvarchar] (25) NULL,
[WAERS] [nvarchar] (5) NULL,
[KURSF] [decimal] (9, 5) NULL,
[KZWRS] [nvarchar] (5) NULL,
[KZKRS] [decimal] (9, 5) NULL,
[BSTAT] [nvarchar] (1) NULL,
[XNETB] [nvarchar] (1) NULL,
[FRATH] [decimal] (13, 2) NULL,
[XRUEB] [nvarchar] (1) NULL,
[GLVOR] [nvarchar] (4) NULL,
[GRPID] [nvarchar] (12) NULL,
[DOKID] [nvarchar] (40) NULL,
[ARCID] [nvarchar] (10) NULL,
[IBLAR] [nvarchar] (2) NULL,
[AWTYP] [nvarchar] (5) NULL,
[AWKEY] [nvarchar] (20) NULL,
[FIKRS] [nvarchar] (4) NULL,
[HWAER] [nvarchar] (5) NULL,
[HWAE2] [nvarchar] (5) NULL,
[HWAE3] [nvarchar] (5) NULL,
[KURS2] [decimal] (9, 5) NULL,
[KURS3] [decimal] (9, 5) NULL,
[BASW2] [nvarchar] (1) NULL,
[BASW3] [nvarchar] (1) NULL,
[UMRD2] [nvarchar] (1) NULL,
[UMRD3] [nvarchar] (1) NULL,
[XSTOV] [nvarchar] (1) NULL,
[STODT] [datetime] NULL,
[XMWST] [nvarchar] (1) NULL,
[CURT2] [nvarchar] (2) NULL,
[CURT3] [nvarchar] (2) NULL,
[KUTY2] [nvarchar] (4) NULL,
[KUTY3] [nvarchar] (4) NULL,
[XSNET] [nvarchar] (1) NULL,
[AUSBK] [nvarchar] (4) NULL,
[XUSVR] [nvarchar] (1) NULL,
[DUEFL] [nvarchar] (1) NULL,
[AWSYS] [nvarchar] (10) NULL,
[TXKRS] [decimal] (9, 5) NULL,
[CTXKRS] [decimal] (9, 5) NULL,
[LOTKZ] [nvarchar] (10) NULL,
[XWVOF] [nvarchar] (1) NULL,
[STGRD] [nvarchar] (2) NULL,
[PPNAM] [nvarchar] (12) NULL,
[BRNCH] [nvarchar] (4) NULL,
[NUMPG] [nvarchar] (3) NULL,
[ADISC] [nvarchar] (1) NULL,
[XREF1_HD] [nvarchar] (20) NULL,
[XREF2_HD] [nvarchar] (20) NULL,
[XREVERSAL] [nvarchar] (1) NULL,
[REINDAT] [datetime] NULL,
[RLDNR] [nvarchar] (2) NULL,
[LDGRP] [nvarchar] (4) NULL,
[PROPMANO] [nvarchar] (13) NULL,
[XBLNR_ALT] [nvarchar] (26) NULL,
[VATDATE] [datetime] NULL,
[DOCCAT] [nvarchar] (6) NULL,
[XSPLIT] [nvarchar] (1) NULL,
[CASH_ALLOC] [nvarchar] (1) NULL,
[FOLLOW_ON] [nvarchar] (1) NULL,
[XREORG] [nvarchar] (1) NULL,
[RESUBMISSION] [datetime] NULL,
[_SAPF15_STATUS] [nvarchar] (1) NULL,
[PSOTY] [nvarchar] (2) NULL,
[PSOAK] [nvarchar] (10) NULL,
[PSOKS] [nvarchar] (10) NULL,
[PSOSG] [nvarchar] (1) NULL,
[PSOFN] [nvarchar] (30) NULL,
[INTFORM] [nvarchar] (4) NULL,
[INTDATE] [datetime] NULL,
[PSOBT] [datetime] NULL,
[PSOZL] [nvarchar] (1) NULL,
[PSODT] [datetime] NULL,
[PSOTM] [datetime] NULL,
[FM_UMART] [nvarchar] (1) NULL,
[CCINS] [nvarchar] (4) NULL,
[CCNUM] [nvarchar] (25) NULL,
[SSBLK] [nvarchar] (1) NULL,
[BATCH] [nvarchar] (10) NULL,
[SNAME] [nvarchar] (12) NULL,
[SAMPLED] [nvarchar] (1) NULL,
[EXCLUDE_FLAG] [nvarchar] (1) NULL,
[BLIND] [nvarchar] (1) NULL,
[OFFSET_STATUS] [nvarchar] (2) NULL,
[OFFSET_REFER_DAT] [datetime] NULL,
[PENRC] [nvarchar] (2) NULL,
[KNUMV] [nvarchar] (10) NULL
)
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_BKPF] ADD CONSTRAINT [AK_psa_ics_stg_SAP_GBR_BKPF_EtlRecordId] UNIQUE CLUSTERED  ([EtlRecordId])
GO
