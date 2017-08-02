CREATE TABLE [psa].[ICS_STG_SAP_GBR_VBAP]
(
[EtlBatchRunId] [int] NULL,
[EtlStepRunId] [int] NULL,
[EtlThreadRunId] [int] NULL,
[DataSourceKey] [int] NULL,
[EtlCreatedOn] [datetime] NULL,
[EtlCreatedBy] [varchar] (200) NULL,
[MANDT] [nvarchar] (3) NULL,
[VBELN] [nvarchar] (10) NULL,
[POSNR] [nvarchar] (6) NULL,
[MATNR] [nvarchar] (18) NULL,
[MATWA] [nvarchar] (18) NULL,
[PMATN] [nvarchar] (18) NULL,
[CHARG] [nvarchar] (10) NULL,
[MATKL] [nvarchar] (9) NULL,
[ARKTX] [nvarchar] (40) NULL,
[PSTYV] [nvarchar] (4) NULL,
[POSAR] [nvarchar] (1) NULL,
[LFREL] [nvarchar] (1) NULL,
[FKREL] [nvarchar] (1) NULL,
[UEPOS] [nvarchar] (6) NULL,
[GRPOS] [nvarchar] (6) NULL,
[ABGRU] [nvarchar] (2) NULL,
[PRODH] [nvarchar] (18) NULL,
[ZWERT] [decimal] (13, 2) NULL,
[ZMENG] [decimal] (13, 3) NULL,
[ZIEME] [nvarchar] (3) NULL,
[UMZIZ] [decimal] (5, 0) NULL,
[UMZIN] [decimal] (5, 0) NULL,
[MEINS] [nvarchar] (3) NULL,
[SMENG] [decimal] (13, 3) NULL,
[ABLFZ] [decimal] (13, 3) NULL,
[ABDAT] [datetime] NULL,
[ABSFZ] [decimal] (13, 3) NULL,
[POSEX] [nvarchar] (6) NULL,
[KDMAT] [nvarchar] (35) NULL,
[KBVER] [decimal] (3, 0) NULL,
[KEVER] [decimal] (3, 0) NULL,
[VKGRU] [nvarchar] (3) NULL,
[VKAUS] [nvarchar] (3) NULL,
[GRKOR] [nvarchar] (3) NULL,
[FMENG] [nvarchar] (1) NULL,
[UEBTK] [nvarchar] (1) NULL,
[UEBTO] [decimal] (3, 1) NULL,
[UNTTO] [decimal] (3, 1) NULL,
[FAKSP] [nvarchar] (2) NULL,
[ATPKZ] [nvarchar] (1) NULL,
[RKFKF] [nvarchar] (1) NULL,
[SPART] [nvarchar] (2) NULL,
[GSBER] [nvarchar] (4) NULL,
[NETWR] [decimal] (15, 2) NULL,
[WAERK] [nvarchar] (5) NULL,
[ANTLF] [decimal] (1, 0) NULL,
[KZTLF] [nvarchar] (1) NULL,
[CHSPL] [nvarchar] (1) NULL,
[KWMENG] [decimal] (15, 3) NULL,
[LSMENG] [decimal] (15, 3) NULL,
[KBMENG] [decimal] (15, 3) NULL,
[KLMENG] [decimal] (15, 3) NULL,
[VRKME] [nvarchar] (3) NULL,
[UMVKZ] [decimal] (5, 0) NULL,
[UMVKN] [decimal] (5, 0) NULL,
[BRGEW] [decimal] (15, 3) NULL,
[NTGEW] [decimal] (15, 3) NULL,
[GEWEI] [nvarchar] (3) NULL,
[VOLUM] [decimal] (15, 3) NULL,
[VOLEH] [nvarchar] (3) NULL,
[VBELV] [nvarchar] (10) NULL,
[POSNV] [nvarchar] (6) NULL,
[VGBEL] [nvarchar] (10) NULL,
[VGPOS] [nvarchar] (6) NULL,
[VOREF] [nvarchar] (1) NULL,
[UPFLU] [nvarchar] (1) NULL,
[ERLRE] [nvarchar] (1) NULL,
[LPRIO] [nvarchar] (2) NULL,
[WERKS] [nvarchar] (4) NULL,
[LGORT] [nvarchar] (4) NULL,
[VSTEL] [nvarchar] (4) NULL,
[ROUTE] [nvarchar] (6) NULL,
[STKEY] [nvarchar] (1) NULL,
[STDAT] [datetime] NULL,
[STLNR] [nvarchar] (8) NULL,
[STPOS] [decimal] (5, 0) NULL,
[AWAHR] [nvarchar] (3) NULL,
[ERDAT] [datetime] NULL,
[ERNAM] [nvarchar] (12) NULL,
[ERZET] [datetime] NULL,
[TAXM1] [nvarchar] (1) NULL,
[TAXM2] [nvarchar] (1) NULL,
[TAXM3] [nvarchar] (1) NULL,
[TAXM4] [nvarchar] (1) NULL,
[TAXM5] [nvarchar] (1) NULL,
[TAXM6] [nvarchar] (1) NULL,
[TAXM7] [nvarchar] (1) NULL,
[TAXM8] [nvarchar] (1) NULL,
[TAXM9] [nvarchar] (1) NULL,
[VBEAF] [decimal] (5, 2) NULL,
[VBEAV] [decimal] (5, 2) NULL,
[VGREF] [nvarchar] (1) NULL,
[NETPR] [decimal] (11, 2) NULL,
[KPEIN] [decimal] (5, 0) NULL,
[KMEIN] [nvarchar] (3) NULL,
[SHKZG] [nvarchar] (1) NULL,
[SKTOF] [nvarchar] (1) NULL,
[MTVFP] [nvarchar] (2) NULL,
[SUMBD] [nvarchar] (1) NULL,
[KONDM] [nvarchar] (2) NULL,
[KTGRM] [nvarchar] (2) NULL,
[BONUS] [nvarchar] (2) NULL,
[PROVG] [nvarchar] (2) NULL,
[EANNR] [nvarchar] (13) NULL,
[PRSOK] [nvarchar] (1) NULL,
[BWTAR] [nvarchar] (10) NULL,
[BWTEX] [nvarchar] (1) NULL,
[XCHPF] [nvarchar] (1) NULL,
[XCHAR] [nvarchar] (1) NULL,
[LFMNG] [decimal] (13, 3) NULL,
[STAFO] [nvarchar] (6) NULL,
[WAVWR] [decimal] (13, 2) NULL,
[KZWI1] [decimal] (13, 2) NULL,
[KZWI2] [decimal] (13, 2) NULL,
[KZWI3] [decimal] (13, 2) NULL,
[KZWI4] [decimal] (13, 2) NULL,
[KZWI5] [decimal] (13, 2) NULL,
[KZWI6] [decimal] (13, 2) NULL,
[STCUR] [decimal] (9, 5) NULL,
[AEDAT] [datetime] NULL,
[EAN11] [nvarchar] (18) NULL,
[FIXMG] [nvarchar] (1) NULL,
[PRCTR] [nvarchar] (10) NULL,
[MVGR1] [nvarchar] (3) NULL,
[MVGR2] [nvarchar] (3) NULL,
[MVGR3] [nvarchar] (3) NULL,
[MVGR4] [nvarchar] (3) NULL,
[MVGR5] [nvarchar] (3) NULL,
[KMPMG] [decimal] (13, 3) NULL,
[SUGRD] [nvarchar] (4) NULL,
[SOBKZ] [nvarchar] (1) NULL,
[VPZUO] [nvarchar] (1) NULL,
[PAOBJNR] [nvarchar] (10) NULL,
[PS_PSP_PNR] [nvarchar] (8) NULL,
[AUFNR] [nvarchar] (12) NULL,
[VPMAT] [nvarchar] (18) NULL,
[VPWRK] [nvarchar] (4) NULL,
[PRBME] [nvarchar] (3) NULL,
[UMREF] [float] NULL,
[KNTTP] [nvarchar] (1) NULL,
[KZVBR] [nvarchar] (1) NULL,
[SERNR] [nvarchar] (8) NULL,
[OBJNR] [nvarchar] (22) NULL,
[ABGRS] [nvarchar] (6) NULL,
[BEDAE] [nvarchar] (4) NULL,
[CMPRE] [decimal] (11, 2) NULL,
[CMTFG] [nvarchar] (1) NULL,
[CMPNT] [nvarchar] (1) NULL,
[CMKUA] [decimal] (9, 5) NULL,
[CUOBJ] [nvarchar] (18) NULL,
[CUOBJ_CH] [nvarchar] (18) NULL,
[CEPOK] [nvarchar] (1) NULL,
[KOUPD] [nvarchar] (1) NULL,
[SERAIL] [nvarchar] (4) NULL,
[ANZSN] [bigint] NULL,
[NACHL] [nvarchar] (1) NULL,
[MAGRV] [nvarchar] (4) NULL,
[MPROK] [nvarchar] (1) NULL,
[VGTYP] [nvarchar] (1) NULL,
[PROSA] [nvarchar] (1) NULL,
[UEPVW] [nvarchar] (1) NULL,
[KALNR] [nvarchar] (12) NULL,
[KLVAR] [nvarchar] (4) NULL,
[SPOSN] [nvarchar] (4) NULL,
[KOWRR] [nvarchar] (1) NULL,
[STADAT] [datetime] NULL,
[EXART] [nvarchar] (2) NULL,
[PREFE] [nvarchar] (1) NULL,
[KNUMH] [nvarchar] (10) NULL,
[CLINT] [nvarchar] (10) NULL,
[CHMVS] [nvarchar] (3) NULL,
[STLTY] [nvarchar] (1) NULL,
[STLKN] [nvarchar] (8) NULL,
[STPOZ] [nvarchar] (8) NULL,
[STMAN] [nvarchar] (1) NULL,
[ZSCHL_K] [nvarchar] (6) NULL,
[KALSM_K] [nvarchar] (6) NULL,
[KALVAR] [nvarchar] (4) NULL,
[KOSCH] [nvarchar] (18) NULL,
[UPMAT] [nvarchar] (18) NULL,
[UKONM] [nvarchar] (2) NULL,
[MFRGR] [nvarchar] (8) NULL,
[PLAVO] [nvarchar] (4) NULL,
[KANNR] [nvarchar] (35) NULL,
[CMPRE_FLT] [float] NULL,
[ABFOR] [nvarchar] (2) NULL,
[ABGES] [float] NULL,
[J_1BCFOP] [nvarchar] (10) NULL,
[J_1BTAXLW1] [nvarchar] (3) NULL,
[J_1BTAXLW2] [nvarchar] (3) NULL,
[J_1BTXSDC] [nvarchar] (2) NULL,
[WKTNR] [nvarchar] (10) NULL,
[WKTPS] [nvarchar] (6) NULL,
[SKOPF] [nvarchar] (18) NULL,
[KZBWS] [nvarchar] (1) NULL,
[WGRU1] [nvarchar] (18) NULL,
[WGRU2] [nvarchar] (18) NULL,
[KNUMA_PI] [nvarchar] (10) NULL,
[KNUMA_AG] [nvarchar] (10) NULL,
[KZFME] [nvarchar] (1) NULL,
[LSTANR] [nvarchar] (1) NULL,
[TECHS] [nvarchar] (12) NULL,
[MWSBP] [decimal] (13, 2) NULL,
[BERID] [nvarchar] (10) NULL,
[PCTRF] [nvarchar] (10) NULL,
[LOGSYS_EXT] [nvarchar] (10) NULL,
[J_1BTAXLW3] [nvarchar] (3) NULL,
[J_1BTAXLW4] [nvarchar] (3) NULL,
[J_1BTAXLW5] [nvarchar] (3) NULL,
[STOCKLOC] [nvarchar] (20) NULL,
[SLOCTYPE] [nvarchar] (4) NULL,
[MSR_RET_REASON] [nvarchar] (3) NULL,
[MSR_REFUND_CODE] [nvarchar] (3) NULL,
[MSR_APPROV_BLOCK] [nvarchar] (1) NULL,
[NRAB_KNUMH] [nvarchar] (10) NULL,
[TC_AUT_DET] [nvarchar] (2) NULL,
[MANUAL_TC_REASON] [nvarchar] (2) NULL,
[FISCAL_INCENTIVE] [nvarchar] (4) NULL,
[TAX_SUBJECT_ST] [nvarchar] (1) NULL,
[FISCAL_INCENTIVE_ID] [nvarchar] (4) NULL,
[SPCSTO] [nvarchar] (2) NULL,
[_BEV1_SRFUND] [nvarchar] (2) NULL,
[AUFPL_OLC] [nvarchar] (10) NULL,
[APLZL_OLC] [nvarchar] (8) NULL,
[FERC_IND] [nvarchar] (4) NULL,
[KOSTL] [nvarchar] (10) NULL,
[FONDS] [nvarchar] (10) NULL,
[FISTL] [nvarchar] (16) NULL,
[FKBER] [nvarchar] (16) NULL,
[GRANT_NBR] [nvarchar] (20) NULL,
[IUID_RELEVANT] [nvarchar] (1) NULL,
[PRS_OBJNR] [nvarchar] (22) NULL,
[PRS_SD_SPSNR] [nvarchar] (8) NULL,
[PRS_WORK_PERIOD] [nvarchar] (7) NULL,
[PARGB] [nvarchar] (4) NULL,
[AUFPL_OAA] [nvarchar] (10) NULL,
[APLZL_OAA] [nvarchar] (8) NULL,
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
