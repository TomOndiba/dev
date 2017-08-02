CREATE TABLE [tsa].[ICS_LAND_m3_BEL_MITFAC]
(
[EtlBatchRunId] [int] NULL,
[EtlStepRunId] [int] NULL,
[EtlThreadRunId] [int] NULL,
[DataSourceKey] [int] NULL,
[EtlCreatedOn] [datetime2] NULL,
[EtlCreatedBy] [varchar] (200) NULL,
[M9CONO] [decimal] (3, 0) NULL,
[M9FACI] [nvarchar] (255) NULL,
[M9ITNO] [nvarchar] (255) NULL,
[M9LEA4] [decimal] (3, 0) NULL,
[M9CSNO] [nvarchar] (255) NULL,
[M9SPFA] [decimal] (15, 9) NULL,
[M9ORCO] [nvarchar] (255) NULL,
[M9APPR] [decimal] (17, 6) NULL,
[M9UCOS] [decimal] (17, 6) NULL,
[M9SOCO] [decimal] (17, 6) NULL,
[M9EXPC] [decimal] (5, 2) NULL,
[M9BQTY] [decimal] (15, 6) NULL,
[M9BQTM] [decimal] (1, 0) NULL,
[M9LLCM] [decimal] (2, 0) NULL,
[M9DLET] [decimal] (1, 0) NULL,
[M9DLEF] [decimal] (3, 0) NULL,
[M9DIDY] [decimal] (1, 0) NULL,
[M9DIDF] [decimal] (3, 0) NULL,
[M9PRRA] [decimal] (1, 0) NULL,
[M9TRHC] [decimal] (5, 2) NULL,
[M9MARC] [decimal] (1, 0) NULL,
[M9JITF] [decimal] (1, 0) NULL,
[M9REWH] [nvarchar] (255) NULL,
[M9OPFQ] [decimal] (15, 6) NULL,
[M9FANO] [decimal] (15, 6) NULL,
[M9FANQ] [decimal] (15, 6) NULL,
[M9FANR] [decimal] (15, 6) NULL,
[M9FATM] [decimal] (1, 0) NULL,
[M9WCLN] [nvarchar] (255) NULL,
[M9EDEC] [nvarchar] (255) NULL,
[M9AUGE] [decimal] (1, 0) NULL,
[M9ECCC] [nvarchar] (255) NULL,
[M9ECAR] [nvarchar] (255) NULL,
[M9CPRI] [nvarchar] (255) NULL,
[M9CPRE] [nvarchar] (255) NULL,
[M9WSCA] [nvarchar] (255) NULL,
[M9PRCM] [nvarchar] (255) NULL,
[M9PLAP] [nvarchar] (255) NULL,
[M9PLUP] [nvarchar] (255) NULL,
[M9SCMO] [nvarchar] (255) NULL,
[M9CPL0] [decimal] (1, 0) NULL,
[M9CPL1] [decimal] (1, 0) NULL,
[M9CPL2] [decimal] (1, 0) NULL,
[M9PPL0] [decimal] (1, 0) NULL,
[M9PPL1] [decimal] (1, 0) NULL,
[M9PPL2] [decimal] (1, 0) NULL,
[M9TXID] [decimal] (13, 0) NULL,
[M9DTID] [decimal] (13, 0) NULL,
[M9CPDC] [decimal] (1, 0) NULL,
[M9COCD] [decimal] (5, 0) NULL,
[M9EVGR] [nvarchar] (255) NULL,
[M9VAMT] [decimal] (1, 0) NULL,
[M9LAMA] [decimal] (5, 2) NULL,
[M9GRTI] [nvarchar] (255) NULL,
[M9MOLL] [decimal] (5, 2) NULL,
[M9RGDT] [decimal] (8, 0) NULL,
[M9RGTM] [decimal] (6, 0) NULL,
[M9LMDT] [decimal] (8, 0) NULL,
[M9CHNO] [decimal] (3, 0) NULL,
[M9CHID] [nvarchar] (255) NULL,
[M9LMTS] [decimal] (18, 0) NULL,
[M9CRTM] [decimal] (1, 0) NULL,
[M9DICM] [nvarchar] (255) NULL,
[M9ACRF] [nvarchar] (255) NULL,
[M9ECVE] [nvarchar] (255) NULL,
[M9ATTC] [decimal] (1, 0) NULL,
[M9ATNR] [decimal] (17, 0) NULL,
[M9STCW] [decimal] (15, 6) NULL,
[M9QUCW] [decimal] (15, 6) NULL,
[M9RJCW] [decimal] (15, 6) NULL,
[M9CAWC] [decimal] (1, 0) NULL,
[M9COFA] [decimal] (15, 9) NULL,
[M9CUEX] [nvarchar] (255) NULL,
[EtlSourceTable] [varchar] (200) NOT NULL
)
GO
