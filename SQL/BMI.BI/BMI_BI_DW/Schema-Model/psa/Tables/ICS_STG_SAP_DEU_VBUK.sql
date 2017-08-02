CREATE TABLE [psa].[ICS_STG_SAP_DEU_VBUK]
(
[EtlBatchRunId] [int] NULL,
[EtlStepRunId] [int] NULL,
[EtlThreadRunId] [int] NULL,
[DataSourceKey] [int] NULL,
[EtlCreatedOn] [datetime] NULL,
[EtlCreatedBy] [varchar] (200) NULL,
[MANDT] [nvarchar] (3) NULL,
[VBELN] [nvarchar] (10) NULL,
[RFSTK] [nvarchar] (1) NULL,
[RFGSK] [nvarchar] (1) NULL,
[BESTK] [nvarchar] (1) NULL,
[LFSTK] [nvarchar] (1) NULL,
[LFGSK] [nvarchar] (1) NULL,
[WBSTK] [nvarchar] (1) NULL,
[FKSTK] [nvarchar] (1) NULL,
[FKSAK] [nvarchar] (1) NULL,
[BUCHK] [nvarchar] (1) NULL,
[ABSTK] [nvarchar] (1) NULL,
[GBSTK] [nvarchar] (1) NULL,
[KOSTK] [nvarchar] (1) NULL,
[LVSTK] [nvarchar] (1) NULL,
[UVALS] [nvarchar] (1) NULL,
[UVVLS] [nvarchar] (1) NULL,
[UVFAS] [nvarchar] (1) NULL,
[UVALL] [nvarchar] (1) NULL,
[UVVLK] [nvarchar] (1) NULL,
[UVFAK] [nvarchar] (1) NULL,
[UVPRS] [nvarchar] (1) NULL,
[VBTYP] [nvarchar] (1) NULL,
[VBOBJ] [nvarchar] (1) NULL,
[AEDAT] [datetime] NULL,
[FKIVK] [nvarchar] (1) NULL,
[RELIK] [nvarchar] (1) NULL,
[UVK01] [nvarchar] (1) NULL,
[UVK02] [nvarchar] (1) NULL,
[UVK03] [nvarchar] (1) NULL,
[UVK04] [nvarchar] (1) NULL,
[UVK05] [nvarchar] (1) NULL,
[UVS01] [nvarchar] (1) NULL,
[UVS02] [nvarchar] (1) NULL,
[UVS03] [nvarchar] (1) NULL,
[UVS04] [nvarchar] (1) NULL,
[UVS05] [nvarchar] (1) NULL,
[PKSTK] [nvarchar] (1) NULL,
[CMPSA] [nvarchar] (1) NULL,
[CMPSB] [nvarchar] (1) NULL,
[CMPSC] [nvarchar] (1) NULL,
[CMPSD] [nvarchar] (1) NULL,
[CMPSE] [nvarchar] (1) NULL,
[CMPSF] [nvarchar] (1) NULL,
[CMPSG] [nvarchar] (1) NULL,
[CMPSH] [nvarchar] (1) NULL,
[CMPSI] [nvarchar] (1) NULL,
[CMPSJ] [nvarchar] (1) NULL,
[CMPSK] [nvarchar] (1) NULL,
[CMPSL] [nvarchar] (1) NULL,
[CMPS0] [nvarchar] (1) NULL,
[CMPS1] [nvarchar] (1) NULL,
[CMPS2] [nvarchar] (1) NULL,
[CMGST] [nvarchar] (1) NULL,
[TRSTA] [nvarchar] (1) NULL,
[KOQUK] [nvarchar] (1) NULL,
[COSTA] [nvarchar] (1) NULL,
[SAPRL] [nvarchar] (4) NULL,
[UVPAS] [nvarchar] (1) NULL,
[UVPIS] [nvarchar] (1) NULL,
[UVWAS] [nvarchar] (1) NULL,
[UVPAK] [nvarchar] (1) NULL,
[UVPIK] [nvarchar] (1) NULL,
[UVWAK] [nvarchar] (1) NULL,
[UVGEK] [nvarchar] (1) NULL,
[CMPSM] [nvarchar] (1) NULL,
[DCSTK] [nvarchar] (1) NULL,
[VESTK] [nvarchar] (1) NULL,
[VLSTK] [nvarchar] (1) NULL,
[RRSTA] [nvarchar] (1) NULL,
[BLOCK] [nvarchar] (1) NULL,
[FSSTK] [nvarchar] (1) NULL,
[LSSTK] [nvarchar] (1) NULL,
[SPSTG] [nvarchar] (1) NULL,
[PDSTK] [nvarchar] (1) NULL,
[FMSTK] [nvarchar] (1) NULL,
[MANEK] [nvarchar] (1) NULL,
[SPE_TMPID] [nvarchar] (1) NULL,
[HDALL] [nvarchar] (1) NULL,
[HDALS] [nvarchar] (1) NULL,
[CMPS_CM] [nvarchar] (1) NULL,
[CMPS_TE] [nvarchar] (1) NULL,
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
