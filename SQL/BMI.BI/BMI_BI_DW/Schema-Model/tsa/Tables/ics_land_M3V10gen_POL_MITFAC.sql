CREATE TABLE [tsa].[ics_land_M3V10gen_POL_MITFAC]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF__ics_land___Exclu__4460EE73] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF__ics_land___IsDup__455512AC] DEFAULT ((0)),
[M9ACRF] [nchar] (8) NULL,
[M9APPR] [numeric] (18, 0) NULL,
[M9ATNR] [numeric] (18, 0) NULL,
[M9ATTC] [numeric] (18, 0) NULL,
[M9AUGE] [numeric] (18, 0) NULL,
[M9BQTM] [numeric] (18, 0) NULL,
[M9BQTY] [numeric] (18, 0) NULL,
[M9CAWC] [numeric] (18, 0) NULL,
[M9CHID] [nchar] (10) NULL,
[M9CHNO] [numeric] (18, 0) NULL,
[M9COCD] [numeric] (18, 0) NULL,
[M9CONO] [numeric] (18, 0) NULL,
[M9CPDC] [numeric] (18, 0) NULL,
[M9CPL0] [numeric] (18, 0) NULL,
[M9CPL1] [numeric] (18, 0) NULL,
[M9CPL2] [numeric] (18, 0) NULL,
[M9CPRE] [nchar] (5) NULL,
[M9CPRI] [nchar] (5) NULL,
[M9CRTM] [numeric] (18, 0) NULL,
[M9CSNO] [nchar] (16) NULL,
[M9DICM] [nchar] (6) NULL,
[M9DIDF] [numeric] (18, 0) NULL,
[M9DIDY] [numeric] (18, 0) NULL,
[M9DLEF] [numeric] (18, 0) NULL,
[M9DLET] [numeric] (18, 0) NULL,
[M9DTID] [numeric] (18, 0) NULL,
[M9ECAR] [nchar] (2) NULL,
[M9ECCC] [nchar] (4) NULL,
[M9ECVE] [nchar] (4) NULL,
[M9EDEC] [nchar] (2) NULL,
[M9EVGR] [nchar] (2) NULL,
[M9EXPC] [numeric] (18, 0) NULL,
[M9FACI] [nchar] (3) NULL,
[M9FANO] [numeric] (18, 0) NULL,
[M9FANQ] [numeric] (18, 0) NULL,
[M9FANR] [numeric] (18, 0) NULL,
[M9FATM] [numeric] (18, 0) NULL,
[M9GRTI] [nchar] (10) NULL,
[M9ITNO] [nchar] (15) NULL,
[M9JITF] [numeric] (18, 0) NULL,
[M9LAMA] [numeric] (18, 0) NULL,
[M9LEA4] [numeric] (18, 0) NULL,
[M9LLCM] [numeric] (18, 0) NULL,
[M9LMDT] [numeric] (18, 0) NULL,
[M9LMTS] [numeric] (18, 0) NULL,
[M9MARC] [numeric] (18, 0) NULL,
[M9MOLL] [numeric] (18, 0) NULL,
[M9OPFQ] [numeric] (18, 0) NULL,
[M9ORCO] [nchar] (3) NULL,
[M9PLAP] [nchar] (15) NULL,
[M9PLUP] [nchar] (15) NULL,
[M9PPL0] [numeric] (18, 0) NULL,
[M9PPL1] [numeric] (18, 0) NULL,
[M9PPL2] [numeric] (18, 0) NULL,
[M9PRCM] [nchar] (6) NULL,
[M9PRRA] [numeric] (18, 0) NULL,
[M9QUCW] [numeric] (18, 0) NULL,
[M9REWH] [nchar] (3) NULL,
[M9RGDT] [numeric] (18, 0) NULL,
[M9RGTM] [numeric] (18, 0) NULL,
[M9RJCW] [numeric] (18, 0) NULL,
[M9SCMO] [nchar] (6) NULL,
[M9SOCO] [numeric] (18, 0) NULL,
[M9SPFA] [numeric] (18, 0) NULL,
[M9STCW] [numeric] (18, 0) NULL,
[M9TRHC] [numeric] (18, 0) NULL,
[M9TXID] [numeric] (18, 0) NULL,
[M9UCOS] [numeric] (18, 0) NULL,
[M9VAMT] [numeric] (18, 0) NULL,
[M9WCLN] [nchar] (8) NULL,
[M9WSCA] [nchar] (6) NULL
)
GO
