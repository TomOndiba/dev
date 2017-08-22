CREATE TABLE [psa].[ics_stg_SAP_GBR_MARC]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_MARC_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_MARC_IsIncomplete] DEFAULT ('N'),
[MANDT] [nvarchar] (3) NULL,
[MATNR] [nvarchar] (18) NULL,
[WERKS] [nvarchar] (4) NULL,
[PSTAT] [nvarchar] (15) NULL,
[LVORM] [nvarchar] (1) NULL,
[BWTTY] [nvarchar] (1) NULL,
[XCHAR] [nvarchar] (1) NULL,
[MMSTA] [nvarchar] (2) NULL,
[MMSTD] [datetime] NULL,
[MAABC] [nvarchar] (1) NULL,
[KZKRI] [nvarchar] (1) NULL,
[EKGRP] [nvarchar] (3) NULL,
[AUSME] [nvarchar] (3) NULL,
[DISPR] [nvarchar] (4) NULL,
[DISMM] [nvarchar] (2) NULL,
[DISPO] [nvarchar] (3) NULL,
[KZDIE] [nvarchar] (1) NULL,
[PLIFZ] [decimal] (3, 0) NULL,
[WEBAZ] [decimal] (3, 0) NULL,
[PERKZ] [nvarchar] (1) NULL,
[AUSSS] [decimal] (5, 2) NULL,
[DISLS] [nvarchar] (2) NULL,
[BESKZ] [nvarchar] (1) NULL,
[SOBSL] [nvarchar] (2) NULL,
[MINBE] [decimal] (13, 3) NULL,
[EISBE] [decimal] (13, 3) NULL,
[BSTMI] [decimal] (13, 3) NULL,
[BSTMA] [decimal] (13, 3) NULL,
[BSTFE] [decimal] (13, 3) NULL,
[BSTRF] [decimal] (13, 3) NULL,
[MABST] [decimal] (13, 3) NULL,
[LOSFX] [decimal] (11, 2) NULL,
[SBDKZ] [nvarchar] (1) NULL,
[LAGPR] [nvarchar] (1) NULL,
[ALTSL] [nvarchar] (1) NULL,
[KZAUS] [nvarchar] (1) NULL,
[AUSDT] [datetime] NULL,
[NFMAT] [nvarchar] (18) NULL,
[KZBED] [nvarchar] (1) NULL,
[MISKZ] [nvarchar] (1) NULL,
[FHORI] [nvarchar] (3) NULL,
[PFREI] [nvarchar] (1) NULL,
[FFREI] [nvarchar] (1) NULL,
[RGEKZ] [nvarchar] (1) NULL,
[FEVOR] [nvarchar] (3) NULL,
[BEARZ] [decimal] (5, 2) NULL,
[RUEZT] [decimal] (5, 2) NULL,
[TRANZ] [decimal] (5, 2) NULL,
[BASMG] [decimal] (13, 3) NULL,
[DZEIT] [decimal] (3, 0) NULL,
[MAXLZ] [decimal] (5, 0) NULL,
[LZEIH] [nvarchar] (3) NULL,
[KZPRO] [nvarchar] (1) NULL,
[GPMKZ] [nvarchar] (1) NULL,
[UEETO] [decimal] (3, 1) NULL,
[UEETK] [nvarchar] (1) NULL,
[UNETO] [decimal] (3, 1) NULL,
[WZEIT] [decimal] (3, 0) NULL,
[ATPKZ] [nvarchar] (1) NULL,
[VZUSL] [decimal] (5, 2) NULL,
[HERBL] [nvarchar] (2) NULL,
[INSMK] [nvarchar] (1) NULL,
[SPROZ] [decimal] (3, 1) NULL,
[QUAZT] [decimal] (3, 0) NULL,
[SSQSS] [nvarchar] (8) NULL,
[MPDAU] [decimal] (5, 0) NULL,
[KZPPV] [nvarchar] (1) NULL,
[KZDKZ] [nvarchar] (1) NULL,
[WSTGH] [decimal] (9, 0) NULL,
[PRFRQ] [decimal] (5, 0) NULL,
[NKMPR] [datetime] NULL,
[UMLMC] [decimal] (13, 3) NULL,
[LADGR] [nvarchar] (4) NULL,
[XCHPF] [nvarchar] (1) NULL,
[USEQU] [nvarchar] (1) NULL,
[LGRAD] [decimal] (3, 1) NULL,
[AUFTL] [nvarchar] (1) NULL,
[PLVAR] [nvarchar] (2) NULL,
[OTYPE] [nvarchar] (2) NULL,
[OBJID] [nvarchar] (8) NULL,
[MTVFP] [nvarchar] (2) NULL,
[PERIV] [nvarchar] (2) NULL,
[KZKFK] [nvarchar] (1) NULL,
[VRVEZ] [decimal] (5, 2) NULL,
[VBAMG] [decimal] (13, 3) NULL,
[VBEAZ] [decimal] (5, 2) NULL,
[LIZYK] [nvarchar] (4) NULL,
[BWSCL] [nvarchar] (1) NULL,
[KAUTB] [nvarchar] (1) NULL,
[KORDB] [nvarchar] (1) NULL,
[STAWN] [nvarchar] (17) NULL,
[HERKL] [nvarchar] (3) NULL,
[HERKR] [nvarchar] (3) NULL,
[EXPME] [nvarchar] (3) NULL,
[MTVER] [nvarchar] (4) NULL,
[PRCTR] [nvarchar] (10) NULL,
[TRAME] [decimal] (13, 3) NULL,
[MRPPP] [nvarchar] (3) NULL,
[SAUFT] [nvarchar] (1) NULL,
[FXHOR] [nvarchar] (3) NULL,
[VRMOD] [nvarchar] (1) NULL,
[VINT1] [nvarchar] (3) NULL,
[VINT2] [nvarchar] (3) NULL,
[VERKZ] [nvarchar] (1) NULL,
[STLAL] [nvarchar] (2) NULL,
[STLAN] [nvarchar] (1) NULL,
[PLNNR] [nvarchar] (8) NULL,
[APLAL] [nvarchar] (2) NULL,
[LOSGR] [decimal] (13, 3) NULL,
[SOBSK] [nvarchar] (2) NULL,
[FRTME] [nvarchar] (3) NULL,
[LGPRO] [nvarchar] (4) NULL,
[DISGR] [nvarchar] (4) NULL,
[KAUSF] [decimal] (5, 2) NULL,
[QZGTP] [nvarchar] (4) NULL,
[QMATV] [nvarchar] (1) NULL,
[TAKZT] [decimal] (3, 0) NULL,
[RWPRO] [nvarchar] (3) NULL,
[COPAM] [nvarchar] (10) NULL,
[ABCIN] [nvarchar] (1) NULL,
[AWSLS] [nvarchar] (6) NULL,
[SERNP] [nvarchar] (4) NULL,
[CUOBJ] [nvarchar] (18) NULL,
[STDPD] [nvarchar] (18) NULL,
[SFEPR] [nvarchar] (4) NULL,
[XMCNG] [nvarchar] (1) NULL,
[QSSYS] [nvarchar] (4) NULL,
[LFRHY] [nvarchar] (3) NULL,
[RDPRF] [nvarchar] (4) NULL,
[VRBMT] [nvarchar] (18) NULL,
[VRBWK] [nvarchar] (4) NULL,
[VRBDT] [datetime] NULL,
[VRBFK] [decimal] (4, 2) NULL,
[AUTRU] [nvarchar] (1) NULL,
[PREFE] [nvarchar] (1) NULL,
[PRENC] [nvarchar] (1) NULL,
[PRENO] [nvarchar] (8) NULL,
[PREND] [datetime] NULL,
[PRENE] [nvarchar] (1) NULL,
[PRENG] [datetime] NULL,
[ITARK] [nvarchar] (1) NULL,
[SERVG] [nvarchar] (1) NULL,
[KZKUP] [nvarchar] (1) NULL,
[STRGR] [nvarchar] (2) NULL,
[CUOBV] [nvarchar] (18) NULL,
[LGFSB] [nvarchar] (4) NULL,
[SCHGT] [nvarchar] (1) NULL,
[CCFIX] [nvarchar] (1) NULL,
[EPRIO] [nvarchar] (4) NULL,
[QMATA] [nvarchar] (6) NULL,
[RESVP] [decimal] (3, 0) NULL,
[PLNTY] [nvarchar] (1) NULL,
[UOMGR] [nvarchar] (3) NULL,
[UMRSL] [nvarchar] (4) NULL,
[ABFAC] [decimal] (2, 1) NULL,
[SFCPF] [nvarchar] (6) NULL,
[SHFLG] [nvarchar] (1) NULL,
[SHZET] [nvarchar] (2) NULL,
[MDACH] [nvarchar] (2) NULL,
[KZECH] [nvarchar] (1) NULL,
[MEGRU] [nvarchar] (4) NULL,
[MFRGR] [nvarchar] (8) NULL,
[VKUMC] [decimal] (13, 2) NULL,
[VKTRW] [decimal] (13, 2) NULL,
[KZAGL] [nvarchar] (1) NULL,
[FVIDK] [nvarchar] (4) NULL,
[FXPRU] [nvarchar] (1) NULL,
[LOGGR] [nvarchar] (4) NULL,
[FPRFM] [nvarchar] (3) NULL,
[GLGMG] [decimal] (13, 3) NULL,
[VKGLG] [decimal] (13, 2) NULL,
[INDUS] [nvarchar] (2) NULL,
[MOWNR] [nvarchar] (12) NULL,
[MOGRU] [nvarchar] (6) NULL,
[CASNR] [nvarchar] (15) NULL,
[GPNUM] [nvarchar] (9) NULL,
[STEUC] [nvarchar] (16) NULL,
[FABKZ] [nvarchar] (1) NULL,
[MATGR] [nvarchar] (20) NULL,
[VSPVB] [nvarchar] (10) NULL,
[DPLFS] [nvarchar] (2) NULL,
[DPLPU] [nvarchar] (1) NULL,
[DPLHO] [decimal] (3, 0) NULL,
[MINLS] [decimal] (13, 3) NULL,
[MAXLS] [decimal] (13, 3) NULL,
[FIXLS] [decimal] (13, 3) NULL,
[LTINC] [decimal] (13, 3) NULL,
[COMPL] [nvarchar] (2) NULL,
[CONVT] [nvarchar] (2) NULL,
[SHPRO] [nvarchar] (3) NULL,
[AHDIS] [nvarchar] (1) NULL,
[DIBER] [nvarchar] (1) NULL,
[KZPSP] [nvarchar] (1) NULL,
[OCMPF] [nvarchar] (6) NULL,
[APOKZ] [nvarchar] (1) NULL,
[MCRUE] [nvarchar] (1) NULL,
[LFMON] [nvarchar] (2) NULL,
[LFGJA] [nvarchar] (4) NULL,
[EISLO] [decimal] (13, 3) NULL,
[NCOST] [nvarchar] (1) NULL,
[ROTATION_DATE] [nvarchar] (1) NULL,
[UCHKZ] [nvarchar] (1) NULL,
[UCMAT] [nvarchar] (18) NULL,
[BWESB] [decimal] (13, 3) NULL,
[_VSO_R_PKGRP] [nvarchar] (18) NULL,
[_VSO_R_LANE_NUM] [nvarchar] (3) NULL,
[_VSO_R_PAL_VEND] [nvarchar] (18) NULL,
[_VSO_R_FORK_DIR] [nvarchar] (1) NULL,
[IUID_RELEVANT] [nvarchar] (1) NULL,
[IUID_TYPE] [nvarchar] (10) NULL,
[UID_IEA] [nvarchar] (1) NULL,
[CONS_PROCG] [nvarchar] (1) NULL,
[GI_PR_TIME] [decimal] (3, 0) NULL,
[MULTIPLE_EKGRP] [nvarchar] (1) NULL,
[REF_SCHEMA] [nvarchar] (2) NULL,
[MIN_TROC] [nvarchar] (3) NULL,
[MAX_TROC] [nvarchar] (3) NULL,
[TARGET_STOCK] [decimal] (13, 3) NULL
)
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MARC] ADD CONSTRAINT [AK_psa_ics_stg_SAP_GBR_MARC_EtlRecordId] UNIQUE CLUSTERED  ([EtlRecordId])
GO
