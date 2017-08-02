CREATE TABLE [psa].[ICS_STG_SAP_DEU_VBRK]
(
[EtlBatchRunId] [int] NULL,
[EtlStepRunId] [int] NULL,
[EtlThreadRunId] [int] NULL,
[DataSourceKey] [int] NULL,
[EtlCreatedOn] [datetime] NULL,
[EtlCreatedBy] [varchar] (200) NULL,
[MANDT] [nvarchar] (3) NULL,
[VBELN] [nvarchar] (10) NULL,
[FKART] [nvarchar] (4) NULL,
[FKTYP] [nvarchar] (1) NULL,
[VBTYP] [nvarchar] (1) NULL,
[WAERK] [nvarchar] (5) NULL,
[VKORG] [nvarchar] (4) NULL,
[VTWEG] [nvarchar] (2) NULL,
[KALSM] [nvarchar] (6) NULL,
[KNUMV] [nvarchar] (10) NULL,
[VSBED] [nvarchar] (2) NULL,
[FKDAT] [datetime] NULL,
[BELNR] [nvarchar] (10) NULL,
[GJAHR] [nvarchar] (4) NULL,
[POPER] [nvarchar] (3) NULL,
[KONDA] [nvarchar] (2) NULL,
[KDGRP] [nvarchar] (2) NULL,
[BZIRK] [nvarchar] (6) NULL,
[PLTYP] [nvarchar] (2) NULL,
[INCO1] [nvarchar] (3) NULL,
[INCO2] [nvarchar] (28) NULL,
[EXPKZ] [nvarchar] (1) NULL,
[RFBSK] [nvarchar] (1) NULL,
[MRNKZ] [nvarchar] (1) NULL,
[KURRF] [decimal] (9, 5) NULL,
[CPKUR] [nvarchar] (1) NULL,
[VALTG] [nvarchar] (2) NULL,
[VALDT] [datetime] NULL,
[ZTERM] [nvarchar] (4) NULL,
[ZLSCH] [nvarchar] (1) NULL,
[KTGRD] [nvarchar] (2) NULL,
[LAND1] [nvarchar] (3) NULL,
[REGIO] [nvarchar] (3) NULL,
[COUNC] [nvarchar] (3) NULL,
[CITYC] [nvarchar] (4) NULL,
[BUKRS] [nvarchar] (4) NULL,
[TAXK1] [nvarchar] (1) NULL,
[TAXK2] [nvarchar] (1) NULL,
[TAXK3] [nvarchar] (1) NULL,
[TAXK4] [nvarchar] (1) NULL,
[TAXK5] [nvarchar] (1) NULL,
[TAXK6] [nvarchar] (1) NULL,
[TAXK7] [nvarchar] (1) NULL,
[TAXK8] [nvarchar] (1) NULL,
[TAXK9] [nvarchar] (1) NULL,
[NETWR] [decimal] (15, 2) NULL,
[ZUKRI] [nvarchar] (40) NULL,
[ERNAM] [nvarchar] (12) NULL,
[ERZET] [datetime] NULL,
[ERDAT] [datetime] NULL,
[STAFO] [nvarchar] (6) NULL,
[KUNRG] [nvarchar] (10) NULL,
[KUNAG] [nvarchar] (10) NULL,
[MABER] [nvarchar] (2) NULL,
[STWAE] [nvarchar] (5) NULL,
[EXNUM] [nvarchar] (10) NULL,
[STCEG] [nvarchar] (20) NULL,
[AEDAT] [datetime] NULL,
[SFAKN] [nvarchar] (10) NULL,
[KNUMA] [nvarchar] (10) NULL,
[FKART_RL] [nvarchar] (4) NULL,
[FKDAT_RL] [datetime] NULL,
[KURST] [nvarchar] (4) NULL,
[MSCHL] [nvarchar] (1) NULL,
[MANSP] [nvarchar] (1) NULL,
[SPART] [nvarchar] (2) NULL,
[KKBER] [nvarchar] (4) NULL,
[KNKLI] [nvarchar] (10) NULL,
[CMWAE] [nvarchar] (5) NULL,
[CMKUF] [decimal] (9, 5) NULL,
[HITYP_PR] [nvarchar] (1) NULL,
[BSTNK_VF] [nvarchar] (35) NULL,
[VBUND] [nvarchar] (6) NULL,
[FKART_AB] [nvarchar] (4) NULL,
[KAPPL] [nvarchar] (2) NULL,
[LANDTX] [nvarchar] (3) NULL,
[STCEG_H] [nvarchar] (1) NULL,
[STCEG_L] [nvarchar] (3) NULL,
[XBLNR] [nvarchar] (16) NULL,
[ZUONR] [nvarchar] (18) NULL,
[MWSBK] [decimal] (13, 2) NULL,
[LOGSYS] [nvarchar] (10) NULL,
[FKSTO] [nvarchar] (1) NULL,
[XEGDR] [nvarchar] (1) NULL,
[RPLNR] [nvarchar] (10) NULL,
[LCNUM] [nvarchar] (10) NULL,
[J_1AFITP] [nvarchar] (2) NULL,
[KURRF_DAT] [datetime] NULL,
[AKWAE] [nvarchar] (5) NULL,
[AKKUR] [decimal] (9, 5) NULL,
[KIDNO] [nvarchar] (30) NULL,
[BVTYP] [nvarchar] (4) NULL,
[NUMPG] [nvarchar] (3) NULL,
[BUPLA] [nvarchar] (4) NULL,
[VKONT] [nvarchar] (12) NULL,
[FKK_DOCSTAT] [nvarchar] (1) NULL,
[NRZAS] [nvarchar] (12) NULL,
[SPE_BILLING_IND] [nvarchar] (1) NULL,
[VTREF] [nvarchar] (20) NULL,
[FK_SOURCE_SYS] [nvarchar] (10) NULL,
[FKTYP_CRM] [nvarchar] (1) NULL,
[STGRD] [nvarchar] (2) NULL,
[DPC_REL] [nvarchar] (1) NULL,
[MNDID] [nvarchar] (35) NULL,
[PAY_TYPE] [nvarchar] (1) NULL,
[SEPON] [nvarchar] (1) NULL,
[MNDVG] [nvarchar] (1) NULL,
[SPPAYM] [nvarchar] (2) NULL,
[SPPORD] [nvarchar] (10) NULL,
[ZZOFF] [nvarchar] (10) NULL,
[ZZPALMENGE] [decimal] (15, 0) NULL,
[ZZDATART] [nvarchar] (1) NULL,
[ZZAUTYP] [nvarchar] (1) NULL,
[ZZKVGR4] [nvarchar] (3) NULL,
[ZZVKBUR] [nvarchar] (4) NULL,
[ZZSTEUER] [nvarchar] (1) NULL,
[ZZVKGRP] [nvarchar] (3) NULL,
[ZZDUZP] [datetime] NULL,
[EtlRecordId] [bigint] NOT NULL,
[IsIncomplete] [char] (1) NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NOT NULL,
[EtlDeletedBy] [varchar] (200) NOT NULL,
[IsDeleted] [char] (1) NOT NULL
)
GO
