CREATE TABLE [psa].[ics_stg_SAP_GBR_MVKE]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_MVKE_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_MVKE_IsIncomplete] DEFAULT ('N'),
[MANDT] [nvarchar] (3) NULL,
[MATNR] [nvarchar] (18) NULL,
[VKORG] [nvarchar] (4) NULL,
[VTWEG] [nvarchar] (2) NULL,
[LVORM] [nvarchar] (1) NULL,
[VERSG] [nvarchar] (1) NULL,
[BONUS] [nvarchar] (2) NULL,
[PROVG] [nvarchar] (2) NULL,
[SKTOF] [nvarchar] (1) NULL,
[VMSTA] [nvarchar] (2) NULL,
[VMSTD] [datetime] NULL,
[AUMNG] [decimal] (13, 3) NULL,
[LFMNG] [decimal] (13, 3) NULL,
[EFMNG] [decimal] (13, 3) NULL,
[SCMNG] [decimal] (13, 3) NULL,
[SCHME] [nvarchar] (3) NULL,
[VRKME] [nvarchar] (3) NULL,
[MTPOS] [nvarchar] (4) NULL,
[DWERK] [nvarchar] (4) NULL,
[PRODH] [nvarchar] (18) NULL,
[PMATN] [nvarchar] (18) NULL,
[KONDM] [nvarchar] (2) NULL,
[KTGRM] [nvarchar] (2) NULL,
[MVGR1] [nvarchar] (3) NULL,
[MVGR2] [nvarchar] (3) NULL,
[MVGR3] [nvarchar] (3) NULL,
[MVGR4] [nvarchar] (3) NULL,
[MVGR5] [nvarchar] (3) NULL,
[SSTUF] [nvarchar] (2) NULL,
[PFLKS] [nvarchar] (1) NULL,
[LSTFL] [nvarchar] (2) NULL,
[LSTVZ] [nvarchar] (2) NULL,
[LSTAK] [nvarchar] (1) NULL,
[LDVFL] [datetime] NULL,
[LDBFL] [datetime] NULL,
[LDVZL] [datetime] NULL,
[LDBZL] [datetime] NULL,
[VDVFL] [datetime] NULL,
[VDBFL] [datetime] NULL,
[VDVZL] [datetime] NULL,
[VDBZL] [datetime] NULL,
[PRAT1] [nvarchar] (1) NULL,
[PRAT2] [nvarchar] (1) NULL,
[PRAT3] [nvarchar] (1) NULL,
[PRAT4] [nvarchar] (1) NULL,
[PRAT5] [nvarchar] (1) NULL,
[PRAT6] [nvarchar] (1) NULL,
[PRAT7] [nvarchar] (1) NULL,
[PRAT8] [nvarchar] (1) NULL,
[PRAT9] [nvarchar] (1) NULL,
[PRATA] [nvarchar] (1) NULL,
[RDPRF] [nvarchar] (4) NULL,
[MEGRU] [nvarchar] (4) NULL,
[LFMAX] [decimal] (13, 3) NULL,
[RJART] [nvarchar] (1) NULL,
[PBIND] [nvarchar] (1) NULL,
[VAVME] [nvarchar] (1) NULL,
[MATKC] [nvarchar] (1) NULL,
[PVMSO] [nvarchar] (8) NULL,
[_BEV1_EMLGRP] [nvarchar] (4) NULL,
[_BEV1_EMDRCKSPL] [nvarchar] (1) NULL,
[_BEV1_RPBEZME] [nvarchar] (3) NULL,
[_BEV1_RPSNS] [nvarchar] (1) NULL,
[_BEV1_RPSFA] [nvarchar] (1) NULL,
[_BEV1_RPSKI] [nvarchar] (1) NULL,
[_BEV1_RPSCO] [nvarchar] (1) NULL,
[_BEV1_RPSSO] [nvarchar] (1) NULL,
[PLGTP] [nvarchar] (2) NULL
)
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MVKE] ADD CONSTRAINT [AK_psa_ics_stg_SAP_GBR_MVKE_EtlRecordId] UNIQUE CLUSTERED  ([EtlRecordId])
GO
