CREATE TABLE [psa].[ics_stg_SAP_GBR_LIKP]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_LIKP_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_LIKP_IsIncomplete] DEFAULT ('N'),
[_BEV1_LULEINH] [nvarchar] (8) NULL,
[_BEV1_RPCONT] [decimal] (18, 0) NULL,
[_BEV1_RPFAESS] [decimal] (18, 0) NULL,
[_BEV1_RPFLGNR] [nvarchar] (5) NULL,
[_BEV1_RPKIST] [decimal] (18, 0) NULL,
[_BEV1_RPSONST] [decimal] (18, 0) NULL,
[ABLAD] [nvarchar] (25) NULL,
[ABSSC] [nvarchar] (6) NULL,
[AEDAT] [datetime] NULL,
[AENAM] [nvarchar] (12) NULL,
[AKKUR] [decimal] (18, 0) NULL,
[AKPRZ] [decimal] (18, 0) NULL,
[AKWAE] [nvarchar] (5) NULL,
[AMTBL] [decimal] (18, 0) NULL,
[ANZPK] [nvarchar] (5) NULL,
[AULWE] [nvarchar] (10) NULL,
[AUTLF] [nvarchar] (1) NULL,
[BEROT] [nvarchar] (20) NULL,
[BLDAT] [datetime] NULL,
[BOLNR] [nvarchar] (35) NULL,
[BORGR_GRP] [nvarchar] (35) NULL,
[BTGEW] [decimal] (18, 0) NULL,
[BZIRK] [nvarchar] (6) NULL,
[CMFRE] [datetime] NULL,
[CMNGV] [datetime] NULL,
[CMWAE] [nvarchar] (5) NULL,
[COMMN] [nvarchar] (5) NULL,
[CONT_DG] [nvarchar] (1) NULL,
[CTLPC] [nvarchar] (3) NULL,
[DIRTA] [nvarchar] (1) NULL,
[DLV_SPLIT_INITIA] [nvarchar] (1) NULL,
[DLV_VERSION] [nvarchar] (4) NULL,
[ERDAT] [datetime] NULL,
[ERNAM] [nvarchar] (12) NULL,
[ERZET] [datetime] NULL,
[EXNUM] [nvarchar] (10) NULL,
[EXPKZ] [nvarchar] (1) NULL,
[FAKSK] [nvarchar] (2) NULL,
[FKAIV] [nvarchar] (4) NULL,
[FKARV] [nvarchar] (4) NULL,
[FKDAT] [datetime] NULL,
[FKDIV] [datetime] NULL,
[FOLAR] [nvarchar] (4) NULL,
[GEWEI] [nvarchar] (3) NULL,
[GRULG] [nvarchar] (4) NULL,
[GRUPP] [nvarchar] (4) NULL,
[HANDLE] [nvarchar] (22) NULL,
[IMWRK] [nvarchar] (1) NULL,
[INCO1] [nvarchar] (3) NULL,
[INCO2] [nvarchar] (28) NULL,
[KALSM] [nvarchar] (6) NULL,
[KALSM_CH] [nvarchar] (6) NULL,
[KALSP] [nvarchar] (6) NULL,
[KDGRP] [nvarchar] (2) NULL,
[KKBER] [nvarchar] (4) NULL,
[KLIEF] [nvarchar] (1) NULL,
[KNFAK] [nvarchar] (2) NULL,
[KNKLI] [nvarchar] (10) NULL,
[KNUMP] [nvarchar] (10) NULL,
[KNUMV] [nvarchar] (10) NULL,
[KODAT] [datetime] NULL,
[KOUHR] [datetime] NULL,
[KUNAG] [nvarchar] (10) NULL,
[KUNIV] [nvarchar] (10) NULL,
[KUNNR] [nvarchar] (10) NULL,
[KZAZU] [nvarchar] (1) NULL,
[KZWAB] [nvarchar] (1) NULL,
[LCNUM] [nvarchar] (10) NULL,
[LDDAT] [datetime] NULL,
[LDUHR] [datetime] NULL,
[LFART] [nvarchar] (4) NULL,
[LFDAT] [datetime] NULL,
[LFUHR] [datetime] NULL,
[LGBZO] [nvarchar] (10) NULL,
[LGNUM] [nvarchar] (3) NULL,
[LGTOR] [nvarchar] (3) NULL,
[LIFEX] [nvarchar] (35) NULL,
[LIFNR] [nvarchar] (10) NULL,
[LIFSK] [nvarchar] (2) NULL,
[LISPL] [nvarchar] (1) NULL,
[LOC_GUID] [binary] (16) NULL,
[LPRIO] [nvarchar] (2) NULL,
[LSTEL] [nvarchar] (2) NULL,
[MANDT] [nvarchar] (3) NULL,
[MSR_ACTIVE] [nvarchar] (1) NULL,
[NETWR] [decimal] (18, 0) NULL,
[NTGEW] [decimal] (18, 0) NULL,
[PERFK] [nvarchar] (2) NULL,
[PIOIV] [nvarchar] (2) NULL,
[PODAT] [datetime] NULL,
[POTIM] [datetime] NULL,
[PRINTER_PROFILE] [nvarchar] (10) NULL,
[PROLI] [nvarchar] (3) NULL,
[PRTNR] [nvarchar] (10) NULL,
[PRVBE] [nvarchar] (10) NULL,
[ROUTA] [nvarchar] (6) NULL,
[ROUTE] [nvarchar] (6) NULL,
[SAKES] [nvarchar] (1) NULL,
[SBGRP] [nvarchar] (3) NULL,
[SDABW] [nvarchar] (4) NULL,
[SPAIV] [nvarchar] (2) NULL,
[SPE_ACC_APP_STS] [nvarchar] (1) NULL,
[SPE_BILLING_IND] [nvarchar] (1) NULL,
[SPE_CARRIER_IND] [nvarchar] (1) NULL,
[SPE_CHNG_SYS] [nvarchar] (1) NULL,
[SPE_GEOROUTE] [nvarchar] (10) NULL,
[SPE_GEOROUTEIND] [nvarchar] (1) NULL,
[SPE_GTS_REL] [nvarchar] (2) NULL,
[SPE_GTS_RT_CDE] [nvarchar] (10) NULL,
[SPE_INV_BFR_GI] [nvarchar] (1) NULL,
[SPE_LE_SCENARIO] [nvarchar] (1) NULL,
[SPE_LIFEX_TYPE] [nvarchar] (1) NULL,
[SPE_LOC_SEQ] [nvarchar] (3) NULL,
[SPE_LOEKZ] [nvarchar] (1) NULL,
[SPE_ORIG_SYS] [nvarchar] (1) NULL,
[SPE_PRO_NUMBER] [nvarchar] (35) NULL,
[SPE_QI_STATUS] [nvarchar] (1) NULL,
[SPE_RED_IND] [nvarchar] (1) NULL,
[SPE_REL_TMSTMP] [decimal] (18, 0) NULL,
[SPE_RET_CANC] [nvarchar] (1) NULL,
[SPE_REV_VLSTK] [nvarchar] (1) NULL,
[SPE_SHP_INF_STS] [nvarchar] (1) NULL,
[SPE_TTYPE] [nvarchar] (10) NULL,
[SPE_UNIT_SYSTEM] [nvarchar] (10) NULL,
[SPE_WAUHR_IST] [datetime] NULL,
[SPE_WAZONE_IST] [nvarchar] (6) NULL,
[STAFO] [nvarchar] (6) NULL,
[STCUR] [decimal] (18, 0) NULL,
[STGE_LOC_CHANGE] [nvarchar] (1) NULL,
[STWAE] [nvarchar] (5) NULL,
[STZKL] [decimal] (18, 0) NULL,
[STZZU] [decimal] (18, 0) NULL,
[TCODE] [nvarchar] (20) NULL,
[TDDAT] [datetime] NULL,
[TDUHR] [datetime] NULL,
[TERNR] [nvarchar] (12) NULL,
[TM_CTRL_KEY] [nvarchar] (4) NULL,
[TPGRP] [nvarchar] (2) NULL,
[TPQUA] [nvarchar] (1) NULL,
[TPSID] [nvarchar] (5) NULL,
[TRAGR] [nvarchar] (4) NULL,
[TRAID] [nvarchar] (20) NULL,
[TRATY] [nvarchar] (4) NULL,
[TRMTYP] [nvarchar] (18) NULL,
[TRSPG] [nvarchar] (2) NULL,
[TSEGFL] [nvarchar] (1) NULL,
[TSEGTP] [nvarchar] (10) NULL,
[TZONIS] [nvarchar] (6) NULL,
[TZONRC] [nvarchar] (6) NULL,
[VBEAK] [decimal] (18, 0) NULL,
[VBELN] [nvarchar] (10) NOT NULL,
[VBTYP] [nvarchar] (1) NULL,
[VBUND] [nvarchar] (6) NULL,
[VERUR] [nvarchar] (35) NULL,
[VERURSYS] [nvarchar] (10) NULL,
[VGANZ] [bigint] NULL,
[VKBUR] [nvarchar] (4) NULL,
[VKOIV] [nvarchar] (4) NULL,
[VKORG] [nvarchar] (4) NULL,
[VLSTK] [nvarchar] (1) NULL,
[VOLEH] [nvarchar] (3) NULL,
[VOLUM] [decimal] (18, 0) NULL,
[VSART] [nvarchar] (2) NULL,
[VSBED] [nvarchar] (2) NULL,
[VSTEL] [nvarchar] (4) NULL,
[VTWIV] [nvarchar] (2) NULL,
[WADAT] [datetime] NULL,
[WADAT_IST] [datetime] NULL,
[WAERK] [nvarchar] (5) NULL,
[WAUHR] [datetime] NULL,
[WERKS] [nvarchar] (4) NULL,
[XABLN] [nvarchar] (10) NULL,
[XBLNR] [nvarchar] (25) NULL,
[XWOFF] [nvarchar] (1) NULL,
[ZUKRL] [nvarchar] (40) NULL
)
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_LIKP] ADD CONSTRAINT [psa_ics_stg_SAP_GBR_LIKP_PK] PRIMARY KEY CLUSTERED  ([VBELN])
GO
