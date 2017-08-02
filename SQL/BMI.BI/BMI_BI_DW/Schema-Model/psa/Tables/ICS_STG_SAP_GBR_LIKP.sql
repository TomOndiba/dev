CREATE TABLE [psa].[ICS_STG_SAP_GBR_LIKP]
(
[EtlBatchRunId] [int] NULL,
[EtlStepRunId] [int] NULL,
[EtlThreadRunId] [int] NULL,
[DataSourceKey] [int] NULL,
[EtlCreatedOn] [datetime] NULL,
[EtlCreatedBy] [varchar] (200) NULL,
[MANDT] [nvarchar] (3) NULL,
[VBELN] [nvarchar] (10) NULL,
[ERNAM] [nvarchar] (12) NULL,
[ERZET] [datetime] NULL,
[ERDAT] [datetime] NULL,
[BZIRK] [nvarchar] (6) NULL,
[VSTEL] [nvarchar] (4) NULL,
[VKORG] [nvarchar] (4) NULL,
[LFART] [nvarchar] (4) NULL,
[AUTLF] [nvarchar] (1) NULL,
[KZAZU] [nvarchar] (1) NULL,
[WADAT] [datetime] NULL,
[LDDAT] [datetime] NULL,
[TDDAT] [datetime] NULL,
[LFDAT] [datetime] NULL,
[KODAT] [datetime] NULL,
[ABLAD] [nvarchar] (25) NULL,
[INCO1] [nvarchar] (3) NULL,
[INCO2] [nvarchar] (28) NULL,
[EXPKZ] [nvarchar] (1) NULL,
[ROUTE] [nvarchar] (6) NULL,
[FAKSK] [nvarchar] (2) NULL,
[LIFSK] [nvarchar] (2) NULL,
[VBTYP] [nvarchar] (1) NULL,
[KNFAK] [nvarchar] (2) NULL,
[TPQUA] [nvarchar] (1) NULL,
[TPGRP] [nvarchar] (2) NULL,
[LPRIO] [nvarchar] (2) NULL,
[VSBED] [nvarchar] (2) NULL,
[KUNNR] [nvarchar] (10) NULL,
[KUNAG] [nvarchar] (10) NULL,
[KDGRP] [nvarchar] (2) NULL,
[STZKL] [decimal] (3, 2) NULL,
[STZZU] [decimal] (3, 0) NULL,
[BTGEW] [decimal] (15, 3) NULL,
[NTGEW] [decimal] (15, 3) NULL,
[GEWEI] [nvarchar] (3) NULL,
[VOLUM] [decimal] (15, 3) NULL,
[VOLEH] [nvarchar] (3) NULL,
[ANZPK] [nvarchar] (5) NULL,
[BEROT] [nvarchar] (20) NULL,
[LFUHR] [datetime] NULL,
[GRULG] [nvarchar] (4) NULL,
[LSTEL] [nvarchar] (2) NULL,
[TRAGR] [nvarchar] (4) NULL,
[FKARV] [nvarchar] (4) NULL,
[FKDAT] [datetime] NULL,
[PERFK] [nvarchar] (2) NULL,
[ROUTA] [nvarchar] (6) NULL,
[STAFO] [nvarchar] (6) NULL,
[KALSM] [nvarchar] (6) NULL,
[KNUMV] [nvarchar] (10) NULL,
[WAERK] [nvarchar] (5) NULL,
[VKBUR] [nvarchar] (4) NULL,
[VBEAK] [decimal] (6, 2) NULL,
[ZUKRL] [nvarchar] (40) NULL,
[VERUR] [nvarchar] (35) NULL,
[COMMN] [nvarchar] (5) NULL,
[STWAE] [nvarchar] (5) NULL,
[STCUR] [decimal] (9, 5) NULL,
[EXNUM] [nvarchar] (10) NULL,
[AENAM] [nvarchar] (12) NULL,
[AEDAT] [datetime] NULL,
[LGNUM] [nvarchar] (3) NULL,
[LISPL] [nvarchar] (1) NULL,
[VKOIV] [nvarchar] (4) NULL,
[VTWIV] [nvarchar] (2) NULL,
[SPAIV] [nvarchar] (2) NULL,
[FKAIV] [nvarchar] (4) NULL,
[PIOIV] [nvarchar] (2) NULL,
[FKDIV] [datetime] NULL,
[KUNIV] [nvarchar] (10) NULL,
[KKBER] [nvarchar] (4) NULL,
[KNKLI] [nvarchar] (10) NULL,
[GRUPP] [nvarchar] (4) NULL,
[SBGRP] [nvarchar] (3) NULL,
[CTLPC] [nvarchar] (3) NULL,
[CMWAE] [nvarchar] (5) NULL,
[AMTBL] [decimal] (15, 2) NULL,
[BOLNR] [nvarchar] (35) NULL,
[LIFNR] [nvarchar] (10) NULL,
[TRATY] [nvarchar] (4) NULL,
[TRAID] [nvarchar] (20) NULL,
[CMFRE] [datetime] NULL,
[CMNGV] [datetime] NULL,
[XABLN] [nvarchar] (10) NULL,
[BLDAT] [datetime] NULL,
[WADAT_IST] [datetime] NULL,
[TRSPG] [nvarchar] (2) NULL,
[TPSID] [nvarchar] (5) NULL,
[LIFEX] [nvarchar] (35) NULL,
[TERNR] [nvarchar] (12) NULL,
[KALSM_CH] [nvarchar] (6) NULL,
[KLIEF] [nvarchar] (1) NULL,
[KALSP] [nvarchar] (6) NULL,
[KNUMP] [nvarchar] (10) NULL,
[NETWR] [decimal] (15, 2) NULL,
[AULWE] [nvarchar] (10) NULL,
[WERKS] [nvarchar] (4) NULL,
[LCNUM] [nvarchar] (10) NULL,
[ABSSC] [nvarchar] (6) NULL,
[KOUHR] [datetime] NULL,
[TDUHR] [datetime] NULL,
[LDUHR] [datetime] NULL,
[WAUHR] [datetime] NULL,
[LGTOR] [nvarchar] (3) NULL,
[LGBZO] [nvarchar] (10) NULL,
[AKWAE] [nvarchar] (5) NULL,
[AKKUR] [decimal] (9, 5) NULL,
[AKPRZ] [decimal] (5, 2) NULL,
[PROLI] [nvarchar] (3) NULL,
[XBLNR] [nvarchar] (25) NULL,
[HANDLE] [nvarchar] (22) NULL,
[TSEGFL] [nvarchar] (1) NULL,
[TSEGTP] [nvarchar] (10) NULL,
[TZONIS] [nvarchar] (6) NULL,
[TZONRC] [nvarchar] (6) NULL,
[CONT_DG] [nvarchar] (1) NULL,
[VERURSYS] [nvarchar] (10) NULL,
[KZWAB] [nvarchar] (1) NULL,
[VLSTK] [nvarchar] (1) NULL,
[TCODE] [nvarchar] (20) NULL,
[VSART] [nvarchar] (2) NULL,
[TRMTYP] [nvarchar] (18) NULL,
[SDABW] [nvarchar] (4) NULL,
[VBUND] [nvarchar] (6) NULL,
[XWOFF] [nvarchar] (1) NULL,
[DIRTA] [nvarchar] (1) NULL,
[PRVBE] [nvarchar] (10) NULL,
[FOLAR] [nvarchar] (4) NULL,
[PODAT] [datetime] NULL,
[POTIM] [datetime] NULL,
[VGANZ] [bigint] NULL,
[IMWRK] [nvarchar] (1) NULL,
[SPE_LOEKZ] [nvarchar] (1) NULL,
[SPE_LOC_SEQ] [nvarchar] (3) NULL,
[SPE_ACC_APP_STS] [nvarchar] (1) NULL,
[SPE_SHP_INF_STS] [nvarchar] (1) NULL,
[SPE_RET_CANC] [nvarchar] (1) NULL,
[SPE_WAUHR_IST] [datetime] NULL,
[SPE_WAZONE_IST] [nvarchar] (6) NULL,
[SPE_REV_VLSTK] [nvarchar] (1) NULL,
[SPE_LE_SCENARIO] [nvarchar] (1) NULL,
[SPE_ORIG_SYS] [nvarchar] (1) NULL,
[SPE_CHNG_SYS] [nvarchar] (1) NULL,
[SPE_GEOROUTE] [nvarchar] (10) NULL,
[SPE_GEOROUTEIND] [nvarchar] (1) NULL,
[SPE_CARRIER_IND] [nvarchar] (1) NULL,
[SPE_GTS_REL] [nvarchar] (2) NULL,
[SPE_GTS_RT_CDE] [nvarchar] (10) NULL,
[SPE_REL_TMSTMP] [decimal] (15, 0) NULL,
[SPE_UNIT_SYSTEM] [nvarchar] (10) NULL,
[SPE_INV_BFR_GI] [nvarchar] (1) NULL,
[SPE_QI_STATUS] [nvarchar] (1) NULL,
[SPE_RED_IND] [nvarchar] (1) NULL,
[SAKES] [nvarchar] (1) NULL,
[SPE_LIFEX_TYPE] [nvarchar] (1) NULL,
[SPE_TTYPE] [nvarchar] (10) NULL,
[SPE_PRO_NUMBER] [nvarchar] (35) NULL,
[LOC_GUID] [binary] (16) NULL,
[SPE_BILLING_IND] [nvarchar] (1) NULL,
[PRINTER_PROFILE] [nvarchar] (10) NULL,
[MSR_ACTIVE] [nvarchar] (1) NULL,
[PRTNR] [nvarchar] (10) NULL,
[STGE_LOC_CHANGE] [nvarchar] (1) NULL,
[TM_CTRL_KEY] [nvarchar] (4) NULL,
[DLV_SPLIT_INITIA] [nvarchar] (1) NULL,
[DLV_VERSION] [nvarchar] (4) NULL,
[_BEV1_LULEINH] [nvarchar] (8) NULL,
[_BEV1_RPFAESS] [decimal] (7, 0) NULL,
[_BEV1_RPKIST] [decimal] (7, 0) NULL,
[_BEV1_RPCONT] [decimal] (7, 0) NULL,
[_BEV1_RPSONST] [decimal] (7, 0) NULL,
[_BEV1_RPFLGNR] [nvarchar] (5) NULL,
[BORGR_GRP] [nvarchar] (35) NULL,
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
