CREATE TABLE [psa].[ics_stg_SAP_GBR_LFB1]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_LFB1_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_LFB1_IsIncomplete] DEFAULT ('N'),
[MANDT] [nvarchar] (3) NULL,
[LIFNR] [nvarchar] (10) NULL,
[BUKRS] [nvarchar] (4) NULL,
[PERNR] [nvarchar] (8) NULL,
[ERDAT] [datetime] NULL,
[ERNAM] [nvarchar] (12) NULL,
[SPERR] [nvarchar] (1) NULL,
[LOEVM] [nvarchar] (1) NULL,
[ZUAWA] [nvarchar] (3) NULL,
[AKONT] [nvarchar] (10) NULL,
[BEGRU] [nvarchar] (4) NULL,
[VZSKZ] [nvarchar] (2) NULL,
[ZWELS] [nvarchar] (10) NULL,
[XVERR] [nvarchar] (1) NULL,
[ZAHLS] [nvarchar] (1) NULL,
[ZTERM] [nvarchar] (4) NULL,
[EIKTO] [nvarchar] (12) NULL,
[ZSABE] [nvarchar] (15) NULL,
[KVERM] [nvarchar] (30) NULL,
[FDGRV] [nvarchar] (10) NULL,
[BUSAB] [nvarchar] (2) NULL,
[LNRZE] [nvarchar] (10) NULL,
[LNRZB] [nvarchar] (10) NULL,
[ZINDT] [datetime] NULL,
[ZINRT] [nvarchar] (2) NULL,
[DATLZ] [datetime] NULL,
[XDEZV] [nvarchar] (1) NULL,
[WEBTR] [decimal] (13, 2) NULL,
[KULTG] [decimal] (3, 0) NULL,
[REPRF] [nvarchar] (1) NULL,
[TOGRU] [nvarchar] (4) NULL,
[HBKID] [nvarchar] (5) NULL,
[XPORE] [nvarchar] (1) NULL,
[QSZNR] [nvarchar] (10) NULL,
[QSZDT] [datetime] NULL,
[QSSKZ] [nvarchar] (2) NULL,
[BLNKZ] [nvarchar] (2) NULL,
[MINDK] [nvarchar] (3) NULL,
[ALTKN] [nvarchar] (10) NULL,
[ZGRUP] [nvarchar] (2) NULL,
[MGRUP] [nvarchar] (2) NULL,
[UZAWE] [nvarchar] (2) NULL,
[QSREC] [nvarchar] (2) NULL,
[QSBGR] [nvarchar] (1) NULL,
[QLAND] [nvarchar] (3) NULL,
[XEDIP] [nvarchar] (1) NULL,
[FRGRP] [nvarchar] (4) NULL,
[TOGRR] [nvarchar] (4) NULL,
[TLFXS] [nvarchar] (31) NULL,
[INTAD] [nvarchar] (130) NULL,
[XLFZB] [nvarchar] (1) NULL,
[GUZTE] [nvarchar] (4) NULL,
[GRICD] [nvarchar] (2) NULL,
[GRIDT] [nvarchar] (2) NULL,
[XAUSZ] [nvarchar] (1) NULL,
[CERDT] [datetime] NULL,
[CONFS] [nvarchar] (1) NULL,
[UPDAT] [datetime] NULL,
[UPTIM] [datetime] NULL,
[NODEL] [nvarchar] (1) NULL,
[TLFNS] [nvarchar] (30) NULL,
[AVSND] [nvarchar] (1) NULL,
[AD_HASH] [nvarchar] (10) NULL,
[CIIUCODE] [nvarchar] (4) NULL,
[J_SC_SUBCONTYPE] [nvarchar] (1) NULL,
[J_SC_COMPDATE] [nvarchar] (3) NULL,
[J_SC_OFFSM] [nvarchar] (1) NULL,
[J_SC_OFFSR] [nvarchar] (3) NULL,
[BASIS_PNT] [decimal] (6, 3) NULL,
[GMVKZK] [nvarchar] (1) NULL,
[PREPAY_RELEVANT] [nvarchar] (1) NULL,
[ASSIGN_TEST] [nvarchar] (4) NULL
)
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_LFB1] ADD CONSTRAINT [AK_psa_ics_stg_SAP_GBR_LFB1_EtlRecordId] UNIQUE CLUSTERED  ([EtlRecordId])
GO
