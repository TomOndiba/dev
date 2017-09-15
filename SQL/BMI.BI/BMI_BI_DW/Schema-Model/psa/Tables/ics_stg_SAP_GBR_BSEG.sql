CREATE TABLE [psa].[ics_stg_SAP_GBR_BSEG]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_BSEG_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_BSEG_IsIncomplete] DEFAULT ('N'),
[MANDT] [nvarchar] (3) NULL,
[BUKRS] [nvarchar] (4) NULL,
[BELNR] [nvarchar] (10) NULL,
[GJAHR] [nvarchar] (4) NULL,
[BUZEI] [nvarchar] (3) NULL,
[BUZID] [nvarchar] (1) NULL,
[AUGDT] [datetime] NULL,
[AUGCP] [datetime] NULL,
[AUGBL] [nvarchar] (10) NULL,
[BSCHL] [nvarchar] (2) NULL,
[KOART] [nvarchar] (1) NULL,
[UMSKZ] [nvarchar] (1) NULL,
[UMSKS] [nvarchar] (1) NULL,
[ZUMSK] [nvarchar] (1) NULL,
[SHKZG] [nvarchar] (1) NULL,
[GSBER] [nvarchar] (4) NULL,
[PARGB] [nvarchar] (4) NULL,
[MWSKZ] [nvarchar] (2) NULL,
[QSSKZ] [nvarchar] (2) NULL,
[DMBTR] [decimal] (13, 2) NULL,
[WRBTR] [decimal] (13, 2) NULL,
[KZBTR] [decimal] (13, 2) NULL,
[PSWBT] [decimal] (13, 2) NULL,
[PSWSL] [nvarchar] (5) NULL,
[TXBHW] [decimal] (13, 2) NULL,
[TXBFW] [decimal] (13, 2) NULL,
[MWSTS] [decimal] (13, 2) NULL,
[WMWST] [decimal] (13, 2) NULL,
[HWBAS] [decimal] (13, 2) NULL,
[FWBAS] [decimal] (13, 2) NULL,
[HWZUZ] [decimal] (13, 2) NULL,
[FWZUZ] [decimal] (13, 2) NULL,
[SHZUZ] [nvarchar] (1) NULL,
[STEKZ] [nvarchar] (2) NULL,
[MWART] [nvarchar] (1) NULL,
[TXGRP] [nvarchar] (3) NULL,
[KTOSL] [nvarchar] (3) NULL,
[QSSHB] [decimal] (13, 2) NULL,
[KURSR] [decimal] (9, 5) NULL,
[GBETR] [decimal] (13, 2) NULL,
[BDIFF] [decimal] (13, 2) NULL,
[BDIF2] [decimal] (13, 2) NULL,
[VALUT] [datetime] NULL,
[ZUONR] [nvarchar] (18) NULL,
[SGTXT] [nvarchar] (50) NULL,
[ZINKZ] [nvarchar] (2) NULL,
[VBUND] [nvarchar] (6) NULL,
[BEWAR] [nvarchar] (3) NULL,
[ALTKT] [nvarchar] (10) NULL,
[VORGN] [nvarchar] (4) NULL,
[FDLEV] [nvarchar] (2) NULL,
[FDGRP] [nvarchar] (10) NULL,
[FDWBT] [decimal] (13, 2) NULL,
[FDTAG] [datetime] NULL,
[FKONT] [nvarchar] (3) NULL,
[KOKRS] [nvarchar] (4) NULL,
[KOSTL] [nvarchar] (10) NULL,
[PROJN] [nvarchar] (16) NULL,
[AUFNR] [nvarchar] (12) NULL,
[VBELN] [nvarchar] (10) NULL,
[VBEL2] [nvarchar] (10) NULL,
[POSN2] [nvarchar] (6) NULL,
[ETEN2] [nvarchar] (4) NULL,
[ANLN1] [nvarchar] (12) NULL,
[ANLN2] [nvarchar] (4) NULL,
[ANBWA] [nvarchar] (3) NULL,
[BZDAT] [datetime] NULL,
[PERNR] [nvarchar] (8) NULL,
[XUMSW] [nvarchar] (1) NULL,
[XHRES] [nvarchar] (1) NULL,
[XKRES] [nvarchar] (1) NULL,
[XOPVW] [nvarchar] (1) NULL,
[XCPDD] [nvarchar] (1) NULL,
[XSKST] [nvarchar] (1) NULL,
[XSAUF] [nvarchar] (1) NULL,
[XSPRO] [nvarchar] (1) NULL,
[XSERG] [nvarchar] (1) NULL,
[XFAKT] [nvarchar] (1) NULL,
[XUMAN] [nvarchar] (1) NULL,
[XANET] [nvarchar] (1) NULL,
[XSKRL] [nvarchar] (1) NULL,
[XINVE] [nvarchar] (1) NULL,
[XPANZ] [nvarchar] (1) NULL,
[XAUTO] [nvarchar] (1) NULL,
[XNCOP] [nvarchar] (1) NULL,
[XZAHL] [nvarchar] (1) NULL,
[SAKNR] [nvarchar] (10) NULL,
[HKONT] [nvarchar] (10) NULL,
[KUNNR] [nvarchar] (10) NULL,
[LIFNR] [nvarchar] (10) NULL,
[FILKD] [nvarchar] (10) NULL,
[XBILK] [nvarchar] (1) NULL,
[GVTYP] [nvarchar] (2) NULL,
[HZUON] [nvarchar] (18) NULL,
[ZFBDT] [datetime] NULL,
[ZTERM] [nvarchar] (4) NULL,
[ZBD1T] [decimal] (3, 0) NULL,
[ZBD2T] [decimal] (3, 0) NULL,
[ZBD3T] [decimal] (3, 0) NULL,
[ZBD1P] [decimal] (5, 3) NULL,
[ZBD2P] [decimal] (5, 3) NULL,
[SKFBT] [decimal] (13, 2) NULL,
[SKNTO] [decimal] (13, 2) NULL,
[WSKTO] [decimal] (13, 2) NULL,
[ZLSCH] [nvarchar] (1) NULL,
[ZLSPR] [nvarchar] (1) NULL,
[ZBFIX] [nvarchar] (1) NULL,
[HBKID] [nvarchar] (5) NULL,
[BVTYP] [nvarchar] (4) NULL,
[NEBTR] [decimal] (13, 2) NULL,
[MWSK1] [nvarchar] (2) NULL,
[DMBT1] [decimal] (13, 2) NULL,
[WRBT1] [decimal] (13, 2) NULL,
[MWSK2] [nvarchar] (2) NULL,
[DMBT2] [decimal] (13, 2) NULL,
[WRBT2] [decimal] (13, 2) NULL,
[MWSK3] [nvarchar] (2) NULL,
[DMBT3] [decimal] (13, 2) NULL,
[WRBT3] [decimal] (13, 2) NULL,
[REBZG] [nvarchar] (10) NULL,
[REBZJ] [nvarchar] (4) NULL,
[REBZZ] [nvarchar] (3) NULL,
[REBZT] [nvarchar] (1) NULL,
[ZOLLT] [nvarchar] (8) NULL,
[ZOLLD] [datetime] NULL,
[LZBKZ] [nvarchar] (3) NULL,
[LANDL] [nvarchar] (3) NULL,
[DIEKZ] [nvarchar] (1) NULL,
[SAMNR] [nvarchar] (8) NULL,
[ABPER] [datetime] NULL,
[VRSKZ] [nvarchar] (1) NULL,
[VRSDT] [datetime] NULL,
[DISBN] [nvarchar] (10) NULL,
[DISBJ] [nvarchar] (4) NULL,
[DISBZ] [nvarchar] (3) NULL,
[WVERW] [nvarchar] (1) NULL,
[ANFBN] [nvarchar] (10) NULL,
[ANFBJ] [nvarchar] (4) NULL,
[ANFBU] [nvarchar] (4) NULL,
[ANFAE] [datetime] NULL,
[BLNBT] [decimal] (13, 2) NULL,
[BLNKZ] [nvarchar] (2) NULL,
[BLNPZ] [decimal] (7, 2) NULL,
[MSCHL] [nvarchar] (1) NULL,
[MANSP] [nvarchar] (1) NULL,
[MADAT] [datetime] NULL,
[MANST] [nvarchar] (1) NULL,
[MABER] [nvarchar] (2) NULL,
[ESRNR] [nvarchar] (11) NULL,
[ESRRE] [nvarchar] (27) NULL,
[ESRPZ] [nvarchar] (2) NULL,
[KLIBT] [decimal] (13, 2) NULL,
[QSZNR] [nvarchar] (10) NULL,
[QBSHB] [decimal] (13, 2) NULL,
[QSFBT] [decimal] (13, 2) NULL,
[NAVHW] [decimal] (13, 2) NULL,
[NAVFW] [decimal] (13, 2) NULL,
[MATNR] [nvarchar] (18) NULL,
[WERKS] [nvarchar] (4) NULL,
[MENGE] [decimal] (13, 3) NULL,
[MEINS] [nvarchar] (3) NULL,
[ERFMG] [decimal] (13, 3) NULL,
[ERFME] [nvarchar] (3) NULL,
[BPMNG] [decimal] (13, 3) NULL,
[BPRME] [nvarchar] (3) NULL,
[EBELN] [nvarchar] (10) NULL,
[EBELP] [nvarchar] (5) NULL,
[ZEKKN] [nvarchar] (2) NULL,
[ELIKZ] [nvarchar] (1) NULL,
[VPRSV] [nvarchar] (1) NULL,
[PEINH] [decimal] (5, 0) NULL,
[BWKEY] [nvarchar] (4) NULL,
[BWTAR] [nvarchar] (10) NULL,
[BUSTW] [nvarchar] (4) NULL,
[REWRT] [decimal] (13, 2) NULL,
[REWWR] [decimal] (13, 2) NULL,
[BONFB] [decimal] (13, 2) NULL,
[BUALT] [decimal] (13, 2) NULL,
[PSALT] [nvarchar] (1) NULL,
[NPREI] [decimal] (11, 2) NULL,
[TBTKZ] [nvarchar] (1) NULL,
[SPGRP] [nvarchar] (1) NULL,
[SPGRM] [nvarchar] (1) NULL,
[SPGRT] [nvarchar] (1) NULL,
[SPGRG] [nvarchar] (1) NULL,
[SPGRV] [nvarchar] (1) NULL,
[SPGRQ] [nvarchar] (1) NULL,
[STCEG] [nvarchar] (20) NULL,
[EGBLD] [nvarchar] (3) NULL,
[EGLLD] [nvarchar] (3) NULL,
[RSTGR] [nvarchar] (3) NULL,
[RYACQ] [nvarchar] (4) NULL,
[RPACQ] [nvarchar] (3) NULL,
[RDIFF] [decimal] (13, 2) NULL,
[RDIF2] [decimal] (13, 2) NULL,
[PRCTR] [nvarchar] (10) NULL,
[XHKOM] [nvarchar] (1) NULL,
[VNAME] [nvarchar] (6) NULL,
[RECID] [nvarchar] (2) NULL,
[EGRUP] [nvarchar] (3) NULL,
[VPTNR] [nvarchar] (10) NULL,
[VERTT] [nvarchar] (1) NULL,
[VERTN] [nvarchar] (13) NULL,
[VBEWA] [nvarchar] (4) NULL,
[DEPOT] [nvarchar] (10) NULL,
[TXJCD] [nvarchar] (15) NULL,
[IMKEY] [nvarchar] (8) NULL,
[DABRZ] [datetime] NULL,
[POPTS] [decimal] (9, 6) NULL,
[FIPOS] [nvarchar] (14) NULL,
[KSTRG] [nvarchar] (12) NULL,
[NPLNR] [nvarchar] (12) NULL,
[AUFPL] [nvarchar] (10) NULL,
[APLZL] [nvarchar] (8) NULL,
[PROJK] [nvarchar] (8) NULL,
[PAOBJNR] [nvarchar] (10) NULL,
[PASUBNR] [nvarchar] (4) NULL,
[SPGRS] [nvarchar] (1) NULL,
[SPGRC] [nvarchar] (1) NULL,
[BTYPE] [nvarchar] (2) NULL,
[ETYPE] [nvarchar] (3) NULL,
[XEGDR] [nvarchar] (1) NULL,
[LNRAN] [nvarchar] (5) NULL,
[HRKFT] [nvarchar] (4) NULL,
[DMBE2] [decimal] (13, 2) NULL,
[DMBE3] [decimal] (13, 2) NULL,
[DMB21] [decimal] (13, 2) NULL,
[DMB22] [decimal] (13, 2) NULL,
[DMB23] [decimal] (13, 2) NULL,
[DMB31] [decimal] (13, 2) NULL,
[DMB32] [decimal] (13, 2) NULL,
[DMB33] [decimal] (13, 2) NULL,
[MWST2] [decimal] (13, 2) NULL,
[MWST3] [decimal] (13, 2) NULL,
[NAVH2] [decimal] (13, 2) NULL,
[NAVH3] [decimal] (13, 2) NULL,
[SKNT2] [decimal] (13, 2) NULL,
[SKNT3] [decimal] (13, 2) NULL,
[BDIF3] [decimal] (13, 2) NULL,
[RDIF3] [decimal] (13, 2) NULL,
[HWMET] [nvarchar] (1) NULL,
[GLUPM] [nvarchar] (1) NULL,
[XRAGL] [nvarchar] (1) NULL,
[UZAWE] [nvarchar] (2) NULL,
[LOKKT] [nvarchar] (10) NULL,
[FISTL] [nvarchar] (16) NULL,
[GEBER] [nvarchar] (10) NULL,
[STBUK] [nvarchar] (4) NULL,
[TXBH2] [decimal] (13, 2) NULL,
[TXBH3] [decimal] (13, 2) NULL,
[PPRCT] [nvarchar] (10) NULL,
[XREF1] [nvarchar] (12) NULL,
[XREF2] [nvarchar] (12) NULL,
[KBLNR] [nvarchar] (10) NULL,
[KBLPOS] [nvarchar] (3) NULL,
[STTAX] [decimal] (13, 2) NULL,
[FKBER] [nvarchar] (4) NULL,
[OBZEI] [nvarchar] (3) NULL,
[XNEGP] [nvarchar] (1) NULL,
[RFZEI] [nvarchar] (3) NULL,
[CCBTC] [nvarchar] (10) NULL,
[KKBER] [nvarchar] (4) NULL,
[EMPFB] [nvarchar] (10) NULL,
[XREF3] [nvarchar] (20) NULL,
[DTWS1] [nvarchar] (2) NULL,
[DTWS2] [nvarchar] (2) NULL,
[DTWS3] [nvarchar] (2) NULL,
[DTWS4] [nvarchar] (2) NULL,
[GRICD] [nvarchar] (2) NULL,
[GRIRG] [nvarchar] (3) NULL,
[GITYP] [nvarchar] (2) NULL,
[XPYPR] [nvarchar] (1) NULL,
[KIDNO] [nvarchar] (30) NULL,
[ABSBT] [decimal] (13, 2) NULL,
[IDXSP] [nvarchar] (5) NULL,
[LINFV] [datetime] NULL,
[KONTT] [nvarchar] (2) NULL,
[KONTL] [nvarchar] (50) NULL,
[TXDAT] [datetime] NULL,
[AGZEI] [decimal] (5, 0) NULL,
[PYCUR] [nvarchar] (5) NULL,
[PYAMT] [decimal] (13, 2) NULL,
[BUPLA] [nvarchar] (4) NULL,
[SECCO] [nvarchar] (4) NULL,
[LSTAR] [nvarchar] (6) NULL,
[CESSION_KZ] [nvarchar] (2) NULL,
[PRZNR] [nvarchar] (12) NULL,
[PPDIFF] [decimal] (13, 2) NULL,
[PPDIF2] [decimal] (13, 2) NULL,
[PPDIF3] [decimal] (13, 2) NULL,
[PENLC1] [decimal] (13, 2) NULL,
[PENLC2] [decimal] (13, 2) NULL,
[PENLC3] [decimal] (13, 2) NULL,
[PENFC] [decimal] (13, 2) NULL,
[PENDAYS] [bigint] NULL,
[PENRC] [nvarchar] (2) NULL,
[GRANT_NBR] [nvarchar] (20) NULL,
[SCTAX] [decimal] (13, 2) NULL,
[FKBER_LONG] [nvarchar] (16) NULL,
[GMVKZ] [nvarchar] (1) NULL,
[SRTYPE] [nvarchar] (2) NULL,
[INTRENO] [nvarchar] (13) NULL,
[MEASURE] [nvarchar] (24) NULL,
[AUGGJ] [nvarchar] (4) NULL,
[PPA_EX_IND] [nvarchar] (1) NULL,
[DOCLN] [nvarchar] (6) NULL,
[SEGMENT] [nvarchar] (10) NULL,
[PSEGMENT] [nvarchar] (10) NULL,
[PFKBER] [nvarchar] (16) NULL,
[HKTID] [nvarchar] (5) NULL,
[KSTAR] [nvarchar] (10) NULL,
[XLGCLR] [nvarchar] (1) NULL,
[TAXPS] [nvarchar] (6) NULL,
[PAYS_PROV] [nvarchar] (4) NULL,
[PAYS_TRAN] [nvarchar] (35) NULL,
[XFRGE_BSEG] [nvarchar] (1) NULL,
[MNDID] [nvarchar] (35) NULL,
[PGEBER] [nvarchar] (10) NULL,
[PGRANT_NBR] [nvarchar] (20) NULL,
[BUDGET_PD] [nvarchar] (10) NULL,
[PBUDGET_PD] [nvarchar] (10) NULL,
[J_1TPBUPL] [nvarchar] (5) NULL,
[PEROP_BEG] [datetime] NULL,
[PEROP_END] [datetime] NULL,
[FASTPAY] [nvarchar] (1) NULL,
[IGNR_IVREF] [nvarchar] (1) NULL,
[FMFGUS_KEY] [nvarchar] (22) NULL,
[FMXDOCNR] [nvarchar] (10) NULL,
[FMXYEAR] [nvarchar] (4) NULL,
[FMXDOCLN] [nvarchar] (6) NULL,
[FMXZEKKN] [nvarchar] (5) NULL,
[PRODPER] [datetime] NULL
)
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_BSEG] ADD CONSTRAINT [AK_psa_ics_stg_SAP_GBR_BSEG_EtlRecordId] UNIQUE CLUSTERED  ([EtlRecordId])
GO
