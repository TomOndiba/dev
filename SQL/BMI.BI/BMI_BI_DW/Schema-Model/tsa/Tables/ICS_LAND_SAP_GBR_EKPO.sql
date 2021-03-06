CREATE TABLE [tsa].[ics_land_SAP_GBR_EKPO]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_EKPO_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_EKPO_IsDuplicate] DEFAULT ((0)),
[_BEV1_NEDEPFREE] [nvarchar] (1) NULL,
[_BEV1_NEGEN_ITEM] [nvarchar] (1) NULL,
[_BEV1_NESTRUCCAT] [nvarchar] (1) NULL,
[ABDAT] [datetime] NULL,
[ABELN] [nvarchar] (10) NULL,
[ABELP] [nvarchar] (5) NULL,
[ABFTZ] [decimal] (18, 0) NULL,
[ABMNG] [decimal] (18, 0) NULL,
[ABSKZ] [nvarchar] (1) NULL,
[ABUEB] [nvarchar] (4) NULL,
[ADRN2] [nvarchar] (10) NULL,
[ADRNR] [nvarchar] (10) NULL,
[ADVCODE] [nvarchar] (2) NULL,
[AEDAT] [datetime] NULL,
[AFNAM] [nvarchar] (12) NULL,
[AGDAT] [datetime] NULL,
[AGMEM] [nvarchar] (3) NULL,
[AKTNR] [nvarchar] (10) NULL,
[ANFNR] [nvarchar] (10) NULL,
[ANFPS] [nvarchar] (5) NULL,
[ANZPU] [decimal] (18, 0) NULL,
[ANZSN] [bigint] NULL,
[APOMS] [nvarchar] (1) NULL,
[ARSNR] [nvarchar] (10) NULL,
[ARSPS] [nvarchar] (4) NULL,
[ATTYP] [nvarchar] (2) NULL,
[AUREL] [nvarchar] (1) NULL,
[BANFN] [nvarchar] (10) NULL,
[BEDNR] [nvarchar] (10) NULL,
[BERID] [nvarchar] (10) NULL,
[BLK_REASON_ID] [nvarchar] (4) NULL,
[BLK_REASON_TXT] [nvarchar] (40) NULL,
[BNFPO] [nvarchar] (5) NULL,
[BONBA] [decimal] (18, 0) NULL,
[BONUS] [nvarchar] (2) NULL,
[BPRME] [nvarchar] (3) NULL,
[BPUMN] [decimal] (18, 0) NULL,
[BPUMZ] [decimal] (18, 0) NULL,
[BRGEW] [decimal] (18, 0) NULL,
[BRTWR] [decimal] (18, 0) NULL,
[BSGRU] [nvarchar] (3) NULL,
[BSTAE] [nvarchar] (4) NULL,
[BSTYP] [nvarchar] (1) NULL,
[BUDGET_PD] [nvarchar] (10) NULL,
[BUKRS] [nvarchar] (4) NULL,
[BWTAR] [nvarchar] (10) NULL,
[BWTTY] [nvarchar] (1) NULL,
[CCOMP] [nvarchar] (1) NULL,
[CHG_FPLNR] [nvarchar] (1) NULL,
[CHG_SRV] [nvarchar] (1) NULL,
[CONS_ORDER] [nvarchar] (1) NULL,
[CQU_SAR] [decimal] (18, 0) NULL,
[CUOBJ] [nvarchar] (18) NULL,
[DPAMT] [decimal] (18, 0) NULL,
[DPDAT] [datetime] NULL,
[DPPCT] [decimal] (18, 0) NULL,
[DPTYP] [nvarchar] (4) NULL,
[DRDAT] [datetime] NULL,
[DRUHR] [datetime] NULL,
[DRUNR] [nvarchar] (4) NULL,
[EAN11] [nvarchar] (18) NULL,
[EBELN] [nvarchar] (10) NULL,
[EBELP] [nvarchar] (5) NULL,
[EBON2] [nvarchar] (2) NULL,
[EBON3] [nvarchar] (2) NULL,
[EBONF] [nvarchar] (1) NULL,
[EFFWR] [decimal] (18, 0) NULL,
[EGLKZ] [nvarchar] (1) NULL,
[EHTYP] [nvarchar] (4) NULL,
[EILDT] [datetime] NULL,
[EKKOL] [nvarchar] (4) NULL,
[ELIKZ] [nvarchar] (1) NULL,
[EMATN] [nvarchar] (18) NULL,
[EMLIF] [nvarchar] (10) NULL,
[EMNFR] [nvarchar] (10) NULL,
[EMPST] [nvarchar] (25) NULL,
[EREKZ] [nvarchar] (1) NULL,
[ETDRK] [nvarchar] (1) NULL,
[ETFZ1] [decimal] (18, 0) NULL,
[ETFZ2] [decimal] (18, 0) NULL,
[EVERS] [nvarchar] (2) NULL,
[EXCPE] [nvarchar] (2) NULL,
[EXLIN] [nvarchar] (40) NULL,
[EXSNR] [nvarchar] (5) NULL,
[EXT_RFX_ITEM] [nvarchar] (10) NULL,
[EXT_RFX_NUMBER] [nvarchar] (35) NULL,
[EXT_RFX_SYSTEM] [nvarchar] (10) NULL,
[FABKZ] [nvarchar] (1) NULL,
[FFZHI] [decimal] (18, 0) NULL,
[FIPOS] [nvarchar] (14) NULL,
[FISCAL_INCENTIVE] [nvarchar] (4) NULL,
[FISCAL_INCENTIVE_ID] [nvarchar] (4) NULL,
[FISTL] [nvarchar] (16) NULL,
[FIXMG] [nvarchar] (1) NULL,
[FKBER] [nvarchar] (16) NULL,
[FLS_RSTO] [nvarchar] (1) NULL,
[FMFGUS_KEY] [nvarchar] (22) NULL,
[FPLNR] [nvarchar] (10) NULL,
[GEBER] [nvarchar] (10) NULL,
[GEWEI] [nvarchar] (3) NULL,
[GNETWR] [decimal] (18, 0) NULL,
[GRANT_NBR] [nvarchar] (20) NULL,
[IDNLF] [nvarchar] (35) NULL,
[INCO1] [nvarchar] (3) NULL,
[INCO2] [nvarchar] (28) NULL,
[INFNR] [nvarchar] (10) NULL,
[INSMK] [nvarchar] (1) NULL,
[INSNC] [nvarchar] (1) NULL,
[IPRKZ] [nvarchar] (1) NULL,
[ITCONS] [nvarchar] (1) NULL,
[IUID_RELEVANT] [nvarchar] (1) NULL,
[J_1AIDATEP] [datetime] NULL,
[J_1AINDXP] [nvarchar] (5) NULL,
[J_1BINDUST] [nvarchar] (2) NULL,
[J_1BMATORG] [nvarchar] (1) NULL,
[J_1BMATUSE] [nvarchar] (1) NULL,
[J_1BNBM] [nvarchar] (16) NULL,
[J_1BOWNPRO] [nvarchar] (1) NULL,
[KANBA] [nvarchar] (1) NULL,
[KBLNR] [nvarchar] (10) NULL,
[KBLPOS] [nvarchar] (3) NULL,
[KNTTP] [nvarchar] (1) NULL,
[KO_GSBER] [nvarchar] (4) NULL,
[KO_PARGB] [nvarchar] (4) NULL,
[KO_PPRCTR] [nvarchar] (10) NULL,
[KO_PRCTR] [nvarchar] (10) NULL,
[KOLIF] [nvarchar] (10) NULL,
[KONNR] [nvarchar] (10) NULL,
[KTMNG] [decimal] (18, 0) NULL,
[KTPNR] [nvarchar] (5) NULL,
[KUNNR] [nvarchar] (10) NULL,
[KZABS] [nvarchar] (1) NULL,
[KZBWS] [nvarchar] (1) NULL,
[KZFME] [nvarchar] (1) NULL,
[KZKFG] [nvarchar] (1) NULL,
[KZSTU] [nvarchar] (1) NULL,
[KZTLF] [nvarchar] (1) NULL,
[KZVBR] [nvarchar] (1) NULL,
[KZWI1] [decimal] (18, 0) NULL,
[KZWI2] [decimal] (18, 0) NULL,
[KZWI3] [decimal] (18, 0) NULL,
[KZWI4] [decimal] (18, 0) NULL,
[KZWI5] [decimal] (18, 0) NULL,
[KZWI6] [decimal] (18, 0) NULL,
[LABNR] [nvarchar] (20) NULL,
[LBLKZ] [nvarchar] (1) NULL,
[LEBRE] [nvarchar] (1) NULL,
[LEWED] [datetime] NULL,
[LFRET] [nvarchar] (4) NULL,
[LGORT] [nvarchar] (4) NULL,
[LMEIN] [nvarchar] (3) NULL,
[LOEKZ] [nvarchar] (1) NULL,
[LTSNR] [nvarchar] (6) NULL,
[MAHN1] [decimal] (18, 0) NULL,
[MAHN2] [decimal] (18, 0) NULL,
[MAHN3] [decimal] (18, 0) NULL,
[MAHNZ] [decimal] (18, 0) NULL,
[MANDT] [nvarchar] (3) NULL,
[MANUAL_TC_REASON] [nvarchar] (2) NULL,
[MATKL] [nvarchar] (9) NULL,
[MATNR] [nvarchar] (18) NULL,
[MEINS] [nvarchar] (3) NULL,
[MENGE] [decimal] (18, 0) NULL,
[MEPRF] [nvarchar] (1) NULL,
[MFRGR] [nvarchar] (8) NULL,
[MFRNR] [nvarchar] (10) NULL,
[MFRPN] [nvarchar] (40) NULL,
[MFZHI] [decimal] (18, 0) NULL,
[MHDRZ] [decimal] (18, 0) NULL,
[MLMAA] [nvarchar] (1) NULL,
[MPROF] [nvarchar] (4) NULL,
[MRPIND] [nvarchar] (1) NULL,
[MTART] [nvarchar] (4) NULL,
[MWSKZ] [nvarchar] (2) NULL,
[NAVNW] [decimal] (18, 0) NULL,
[NETPR] [decimal] (18, 0) NULL,
[NETWR] [decimal] (18, 0) NULL,
[NFABD] [datetime] NULL,
[NLABD] [datetime] NULL,
[NOTKZ] [nvarchar] (1) NULL,
[NOVET] [nvarchar] (1) NULL,
[NRFHG] [nvarchar] (1) NULL,
[NTGEW] [decimal] (18, 0) NULL,
[PACKNO] [nvarchar] (10) NULL,
[PEINH] [decimal] (18, 0) NULL,
[PLIFZ] [decimal] (18, 0) NULL,
[POL_ID] [nvarchar] (10) NULL,
[PRDAT] [datetime] NULL,
[PRIO_REQ] [nvarchar] (3) NULL,
[PRIO_URG] [nvarchar] (2) NULL,
[PRSDR] [nvarchar] (1) NULL,
[PSTYP] [nvarchar] (1) NULL,
[PUNEI] [nvarchar] (3) NULL,
[PUT_BACK] [nvarchar] (1) NULL,
[RDPRF] [nvarchar] (4) NULL,
[REASON_CODE] [nvarchar] (4) NULL,
[REF_ITEM] [nvarchar] (5) NULL,
[REFSITE] [nvarchar] (4) NULL,
[REPOS] [nvarchar] (1) NULL,
[RESLO] [nvarchar] (4) NULL,
[RETPC] [decimal] (18, 0) NULL,
[RETPO] [nvarchar] (1) NULL,
[REVLV] [nvarchar] (2) NULL,
[SAISJ] [nvarchar] (4) NULL,
[SAISO] [nvarchar] (4) NULL,
[SATNR] [nvarchar] (18) NULL,
[SCHPR] [nvarchar] (1) NULL,
[SIKGR] [nvarchar] (3) NULL,
[SKTOF] [nvarchar] (1) NULL,
[SOBKZ] [nvarchar] (1) NULL,
[SOURCE_ID] [nvarchar] (3) NULL,
[SOURCE_KEY] [nvarchar] (32) NULL,
[SPE_ABGRU] [nvarchar] (2) NULL,
[SPE_CHNG_SYS] [nvarchar] (1) NULL,
[SPE_CQ_CTRLTYPE] [nvarchar] (1) NULL,
[SPE_CQ_NOCQ] [nvarchar] (1) NULL,
[SPE_CRM_FKREL] [nvarchar] (1) NULL,
[SPE_CRM_REF_ITEM] [nvarchar] (6) NULL,
[SPE_CRM_REF_SO] [nvarchar] (35) NULL,
[SPE_CRM_SO] [nvarchar] (10) NULL,
[SPE_CRM_SO_ITEM] [nvarchar] (6) NULL,
[SPE_EWM_DTC] [nvarchar] (1) NULL,
[SPE_INSMK_SRC] [nvarchar] (1) NULL,
[SPINF] [nvarchar] (1) NULL,
[SRM_CONTRACT_ID] [nvarchar] (10) NULL,
[SRM_CONTRACT_ITM] [nvarchar] (10) NULL,
[SRV_BAS_COM] [nvarchar] (1) NULL,
[SSQSS] [nvarchar] (8) NULL,
[STAFO] [nvarchar] (6) NULL,
[STAPO] [nvarchar] (1) NULL,
[STATU] [nvarchar] (1) NULL,
[STATUS] [nvarchar] (1) NULL,
[TAX_SUBJECT_ST] [nvarchar] (1) NULL,
[TC_AUT_DET] [nvarchar] (2) NULL,
[TECHS] [nvarchar] (12) NULL,
[TWRKZ] [nvarchar] (1) NULL,
[TXJCD] [nvarchar] (15) NULL,
[TXZ01] [nvarchar] (40) NULL,
[TZONRC] [nvarchar] (6) NULL,
[UEBPO] [nvarchar] (5) NULL,
[UEBTK] [nvarchar] (1) NULL,
[UEBTO] [decimal] (18, 0) NULL,
[UMREN] [decimal] (18, 0) NULL,
[UMREZ] [decimal] (18, 0) NULL,
[UMSOK] [nvarchar] (1) NULL,
[UNTTO] [decimal] (18, 0) NULL,
[UPTYP] [nvarchar] (1) NULL,
[UPVOR] [nvarchar] (1) NULL,
[USEQU] [nvarchar] (1) NULL,
[VOLEH] [nvarchar] (3) NULL,
[VOLUM] [decimal] (18, 0) NULL,
[VORAB] [nvarchar] (1) NULL,
[VRTKZ] [nvarchar] (1) NULL,
[WABWE] [nvarchar] (1) NULL,
[WEBAZ] [decimal] (18, 0) NULL,
[WEBRE] [nvarchar] (1) NULL,
[WEORA] [nvarchar] (1) NULL,
[WEPOS] [nvarchar] (1) NULL,
[WERKS] [nvarchar] (4) NULL,
[WEUNB] [nvarchar] (1) NULL,
[XCONDITIONS] [nvarchar] (1) NULL,
[XERSY] [nvarchar] (1) NULL,
[XOBLR] [nvarchar] (1) NULL,
[ZGTYP] [nvarchar] (4) NULL,
[ZWERT] [decimal] (18, 0) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_GBR_EKPO_1] ON [tsa].[ics_land_SAP_GBR_EKPO] ([EBELN], [EBELP])
GO
