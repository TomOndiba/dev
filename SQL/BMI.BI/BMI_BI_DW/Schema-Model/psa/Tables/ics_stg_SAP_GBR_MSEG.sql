CREATE TABLE [psa].[ics_stg_SAP_GBR_MSEG]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_MSEG_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_MSEG_IsIncomplete] DEFAULT ('N'),
[MANDT] [nvarchar] (3) NULL,
[MBLNR] [nvarchar] (10) NULL,
[MJAHR] [nvarchar] (4) NULL,
[ZEILE] [nvarchar] (4) NULL,
[LINE_ID] [nvarchar] (6) NULL,
[PARENT_ID] [nvarchar] (6) NULL,
[LINE_DEPTH] [nvarchar] (2) NULL,
[MAA_URZEI] [nvarchar] (4) NULL,
[BWART] [nvarchar] (3) NULL,
[XAUTO] [nvarchar] (1) NULL,
[MATNR] [nvarchar] (18) NULL,
[WERKS] [nvarchar] (4) NULL,
[LGORT] [nvarchar] (4) NULL,
[CHARG] [nvarchar] (10) NULL,
[INSMK] [nvarchar] (1) NULL,
[ZUSCH] [nvarchar] (1) NULL,
[ZUSTD] [nvarchar] (1) NULL,
[SOBKZ] [nvarchar] (1) NULL,
[LIFNR] [nvarchar] (10) NULL,
[KUNNR] [nvarchar] (10) NULL,
[KDAUF] [nvarchar] (10) NULL,
[KDPOS] [nvarchar] (6) NULL,
[KDEIN] [nvarchar] (4) NULL,
[PLPLA] [nvarchar] (10) NULL,
[SHKZG] [nvarchar] (1) NULL,
[WAERS] [nvarchar] (5) NULL,
[DMBTR] [decimal] (13, 2) NULL,
[BNBTR] [decimal] (13, 2) NULL,
[BUALT] [decimal] (13, 2) NULL,
[SHKUM] [nvarchar] (1) NULL,
[DMBUM] [decimal] (13, 2) NULL,
[BWTAR] [nvarchar] (10) NULL,
[MENGE] [decimal] (13, 3) NULL,
[MEINS] [nvarchar] (3) NULL,
[ERFMG] [decimal] (13, 3) NULL,
[ERFME] [nvarchar] (3) NULL,
[BPMNG] [decimal] (13, 3) NULL,
[BPRME] [nvarchar] (3) NULL,
[EBELN] [nvarchar] (10) NULL,
[EBELP] [nvarchar] (5) NULL,
[LFBJA] [nvarchar] (4) NULL,
[LFBNR] [nvarchar] (10) NULL,
[LFPOS] [nvarchar] (4) NULL,
[SJAHR] [nvarchar] (4) NULL,
[SMBLN] [nvarchar] (10) NULL,
[SMBLP] [nvarchar] (4) NULL,
[ELIKZ] [nvarchar] (1) NULL,
[SGTXT] [nvarchar] (50) NULL,
[EQUNR] [nvarchar] (18) NULL,
[WEMPF] [nvarchar] (12) NULL,
[ABLAD] [nvarchar] (25) NULL,
[GSBER] [nvarchar] (4) NULL,
[KOKRS] [nvarchar] (4) NULL,
[PARGB] [nvarchar] (4) NULL,
[PARBU] [nvarchar] (4) NULL,
[KOSTL] [nvarchar] (10) NULL,
[PROJN] [nvarchar] (16) NULL,
[AUFNR] [nvarchar] (12) NULL,
[ANLN1] [nvarchar] (12) NULL,
[ANLN2] [nvarchar] (4) NULL,
[XSKST] [nvarchar] (1) NULL,
[XSAUF] [nvarchar] (1) NULL,
[XSPRO] [nvarchar] (1) NULL,
[XSERG] [nvarchar] (1) NULL,
[GJAHR] [nvarchar] (4) NULL,
[XRUEM] [nvarchar] (1) NULL,
[XRUEJ] [nvarchar] (1) NULL,
[BUKRS] [nvarchar] (4) NULL,
[BELNR] [nvarchar] (10) NULL,
[BUZEI] [nvarchar] (3) NULL,
[BELUM] [nvarchar] (10) NULL,
[BUZUM] [nvarchar] (3) NULL,
[RSNUM] [nvarchar] (10) NULL,
[RSPOS] [nvarchar] (4) NULL,
[KZEAR] [nvarchar] (1) NULL,
[PBAMG] [decimal] (13, 3) NULL,
[KZSTR] [nvarchar] (1) NULL,
[UMMAT] [nvarchar] (18) NULL,
[UMWRK] [nvarchar] (4) NULL,
[UMLGO] [nvarchar] (4) NULL,
[UMCHA] [nvarchar] (10) NULL,
[UMZST] [nvarchar] (1) NULL,
[UMZUS] [nvarchar] (1) NULL,
[UMBAR] [nvarchar] (10) NULL,
[UMSOK] [nvarchar] (1) NULL,
[KZBEW] [nvarchar] (1) NULL,
[KZVBR] [nvarchar] (1) NULL,
[KZZUG] [nvarchar] (1) NULL,
[WEUNB] [nvarchar] (1) NULL,
[PALAN] [decimal] (11, 0) NULL,
[LGNUM] [nvarchar] (3) NULL,
[LGTYP] [nvarchar] (3) NULL,
[LGPLA] [nvarchar] (10) NULL,
[BESTQ] [nvarchar] (1) NULL,
[BWLVS] [nvarchar] (3) NULL,
[TBNUM] [nvarchar] (10) NULL,
[TBPOS] [nvarchar] (4) NULL,
[XBLVS] [nvarchar] (1) NULL,
[VSCHN] [nvarchar] (1) NULL,
[NSCHN] [nvarchar] (1) NULL,
[DYPLA] [nvarchar] (1) NULL,
[UBNUM] [nvarchar] (10) NULL,
[TBPRI] [nvarchar] (1) NULL,
[TANUM] [nvarchar] (10) NULL,
[WEANZ] [nvarchar] (3) NULL,
[GRUND] [nvarchar] (4) NULL,
[EVERS] [nvarchar] (2) NULL,
[EVERE] [nvarchar] (2) NULL,
[IMKEY] [nvarchar] (8) NULL,
[KSTRG] [nvarchar] (12) NULL,
[PAOBJNR] [nvarchar] (10) NULL,
[PRCTR] [nvarchar] (10) NULL,
[PS_PSP_PNR] [nvarchar] (8) NULL,
[NPLNR] [nvarchar] (12) NULL,
[AUFPL] [nvarchar] (10) NULL,
[APLZL] [nvarchar] (8) NULL,
[AUFPS] [nvarchar] (4) NULL,
[VPTNR] [nvarchar] (10) NULL,
[FIPOS] [nvarchar] (14) NULL,
[SAKTO] [nvarchar] (10) NULL,
[BSTMG] [decimal] (13, 3) NULL,
[BSTME] [nvarchar] (3) NULL,
[XWSBR] [nvarchar] (1) NULL,
[EMLIF] [nvarchar] (10) NULL,
[EXBWR] [decimal] (13, 2) NULL,
[VKWRT] [decimal] (13, 2) NULL,
[AKTNR] [nvarchar] (10) NULL,
[ZEKKN] [nvarchar] (2) NULL,
[VFDAT] [datetime] NULL,
[CUOBJ_CH] [nvarchar] (18) NULL,
[EXVKW] [decimal] (13, 2) NULL,
[PPRCTR] [nvarchar] (10) NULL,
[RSART] [nvarchar] (1) NULL,
[GEBER] [nvarchar] (10) NULL,
[FISTL] [nvarchar] (16) NULL,
[MATBF] [nvarchar] (18) NULL,
[UMMAB] [nvarchar] (18) NULL,
[BUSTM] [nvarchar] (4) NULL,
[BUSTW] [nvarchar] (4) NULL,
[MENGU] [nvarchar] (1) NULL,
[WERTU] [nvarchar] (1) NULL,
[LBKUM] [decimal] (13, 3) NULL,
[SALK3] [decimal] (13, 2) NULL,
[VPRSV] [nvarchar] (1) NULL,
[FKBER] [nvarchar] (16) NULL,
[DABRBZ] [datetime] NULL,
[VKWRA] [decimal] (13, 2) NULL,
[DABRZ] [datetime] NULL,
[XBEAU] [nvarchar] (1) NULL,
[LSMNG] [decimal] (13, 3) NULL,
[LSMEH] [nvarchar] (3) NULL,
[KZBWS] [nvarchar] (1) NULL,
[QINSPST] [nvarchar] (1) NULL,
[URZEI] [nvarchar] (4) NULL,
[J_1BEXBASE] [decimal] (13, 2) NULL,
[MWSKZ] [nvarchar] (2) NULL,
[TXJCD] [nvarchar] (15) NULL,
[EMATN] [nvarchar] (18) NULL,
[J_1AGIRUPD] [nvarchar] (1) NULL,
[VKMWS] [nvarchar] (2) NULL,
[HSDAT] [datetime] NULL,
[BERKZ] [nvarchar] (1) NULL,
[MAT_KDAUF] [nvarchar] (10) NULL,
[MAT_KDPOS] [nvarchar] (6) NULL,
[MAT_PSPNR] [nvarchar] (8) NULL,
[XWOFF] [nvarchar] (1) NULL,
[BEMOT] [nvarchar] (2) NULL,
[PRZNR] [nvarchar] (12) NULL,
[LLIEF] [nvarchar] (10) NULL,
[LSTAR] [nvarchar] (6) NULL,
[XOBEW] [nvarchar] (1) NULL,
[GRANT_NBR] [nvarchar] (20) NULL,
[ZUSTD_T156M] [nvarchar] (1) NULL,
[SPE_GTS_STOCK_TY] [nvarchar] (1) NULL,
[KBLNR] [nvarchar] (10) NULL,
[KBLPOS] [nvarchar] (3) NULL,
[XMACC] [nvarchar] (1) NULL,
[VGART_MKPF] [nvarchar] (2) NULL,
[BUDAT_MKPF] [datetime] NULL,
[CPUDT_MKPF] [datetime] NULL,
[CPUTM_MKPF] [datetime] NULL,
[USNAM_MKPF] [nvarchar] (12) NULL,
[XBLNR_MKPF] [nvarchar] (16) NULL,
[TCODE2_MKPF] [nvarchar] (20) NULL,
[VBELN_IM] [nvarchar] (10) NULL,
[VBELP_IM] [nvarchar] (6) NULL,
[_BEV2_ED_KZ_VER] [nvarchar] (1) NULL,
[_BEV2_ED_USER] [nvarchar] (12) NULL,
[_BEV2_ED_AEDAT] [datetime] NULL,
[_BEV2_ED_AETIM] [datetime] NULL,
[OINAVNW] [decimal] (13, 2) NULL,
[OICONDCOD] [nvarchar] (2) NULL,
[CONDI] [nvarchar] (2) NULL
)
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MSEG] ADD CONSTRAINT [AK_psa_ics_stg_SAP_GBR_MSEG_EtlRecordId] UNIQUE CLUSTERED  ([EtlRecordId])
GO
