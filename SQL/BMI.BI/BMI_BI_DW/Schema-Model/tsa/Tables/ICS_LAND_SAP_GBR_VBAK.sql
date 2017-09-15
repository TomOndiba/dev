CREATE TABLE [tsa].[ics_land_SAP_GBR_VBAK]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_VBAK_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_VBAK_IsDuplicate] DEFAULT ((0)),
[MANDT] [nvarchar] (3) NULL,
[VBELN] [nvarchar] (10) NULL,
[ERDAT] [datetime] NULL,
[ERZET] [datetime] NULL,
[ERNAM] [nvarchar] (12) NULL,
[ANGDT] [datetime] NULL,
[BNDDT] [datetime] NULL,
[AUDAT] [datetime] NULL,
[VBTYP] [nvarchar] (1) NULL,
[TRVOG] [nvarchar] (1) NULL,
[AUART] [nvarchar] (4) NULL,
[AUGRU] [nvarchar] (3) NULL,
[GWLDT] [datetime] NULL,
[SUBMI] [nvarchar] (10) NULL,
[LIFSK] [nvarchar] (2) NULL,
[FAKSK] [nvarchar] (2) NULL,
[NETWR] [decimal] (15, 2) NULL,
[WAERK] [nvarchar] (5) NULL,
[VKORG] [nvarchar] (4) NULL,
[VTWEG] [nvarchar] (2) NULL,
[SPART] [nvarchar] (2) NULL,
[VKGRP] [nvarchar] (3) NULL,
[VKBUR] [nvarchar] (4) NULL,
[GSBER] [nvarchar] (4) NULL,
[GSKST] [nvarchar] (4) NULL,
[GUEBG] [datetime] NULL,
[GUEEN] [datetime] NULL,
[KNUMV] [nvarchar] (10) NULL,
[VDATU] [datetime2] NULL,
[VPRGR] [nvarchar] (1) NULL,
[AUTLF] [nvarchar] (1) NULL,
[VBKLA] [nvarchar] (9) NULL,
[VBKLT] [nvarchar] (1) NULL,
[KALSM] [nvarchar] (6) NULL,
[VSBED] [nvarchar] (2) NULL,
[FKARA] [nvarchar] (4) NULL,
[AWAHR] [nvarchar] (3) NULL,
[KTEXT] [nvarchar] (40) NULL,
[BSTNK] [nvarchar] (20) NULL,
[BSARK] [nvarchar] (4) NULL,
[BSTDK] [datetime] NULL,
[BSTZD] [nvarchar] (4) NULL,
[IHREZ] [nvarchar] (12) NULL,
[BNAME] [nvarchar] (35) NULL,
[TELF1] [nvarchar] (16) NULL,
[MAHZA] [decimal] (3, 0) NULL,
[MAHDT] [datetime] NULL,
[KUNNR] [nvarchar] (10) NULL,
[KOSTL] [nvarchar] (10) NULL,
[STAFO] [nvarchar] (6) NULL,
[STWAE] [nvarchar] (5) NULL,
[AEDAT] [datetime] NULL,
[KVGR1] [nvarchar] (3) NULL,
[KVGR2] [nvarchar] (3) NULL,
[KVGR3] [nvarchar] (3) NULL,
[KVGR4] [nvarchar] (3) NULL,
[KVGR5] [nvarchar] (3) NULL,
[KNUMA] [nvarchar] (10) NULL,
[KOKRS] [nvarchar] (4) NULL,
[PS_PSP_PNR] [nvarchar] (8) NULL,
[KURST] [nvarchar] (4) NULL,
[KKBER] [nvarchar] (4) NULL,
[KNKLI] [nvarchar] (10) NULL,
[GRUPP] [nvarchar] (4) NULL,
[SBGRP] [nvarchar] (3) NULL,
[CTLPC] [nvarchar] (3) NULL,
[CMWAE] [nvarchar] (5) NULL,
[CMFRE] [datetime] NULL,
[CMNUP] [datetime] NULL,
[CMNGV] [datetime] NULL,
[AMTBL] [decimal] (15, 2) NULL,
[HITYP_PR] [nvarchar] (1) NULL,
[ABRVW] [nvarchar] (3) NULL,
[ABDIS] [nvarchar] (1) NULL,
[VGBEL] [nvarchar] (10) NULL,
[OBJNR] [nvarchar] (22) NULL,
[BUKRS_VF] [nvarchar] (4) NULL,
[TAXK1] [nvarchar] (1) NULL,
[TAXK2] [nvarchar] (1) NULL,
[TAXK3] [nvarchar] (1) NULL,
[TAXK4] [nvarchar] (1) NULL,
[TAXK5] [nvarchar] (1) NULL,
[TAXK6] [nvarchar] (1) NULL,
[TAXK7] [nvarchar] (1) NULL,
[TAXK8] [nvarchar] (1) NULL,
[TAXK9] [nvarchar] (1) NULL,
[XBLNR] [nvarchar] (16) NULL,
[ZUONR] [nvarchar] (18) NULL,
[VGTYP] [nvarchar] (1) NULL,
[KALSM_CH] [nvarchar] (6) NULL,
[AGRZR] [nvarchar] (2) NULL,
[AUFNR] [nvarchar] (12) NULL,
[QMNUM] [nvarchar] (12) NULL,
[VBELN_GRP] [nvarchar] (10) NULL,
[SCHEME_GRP] [nvarchar] (4) NULL,
[ABRUF_PART] [nvarchar] (1) NULL,
[ABHOD] [datetime] NULL,
[ABHOV] [datetime] NULL,
[ABHOB] [datetime] NULL,
[RPLNR] [nvarchar] (10) NULL,
[VZEIT] [datetime] NULL,
[STCEG_L] [nvarchar] (3) NULL,
[LANDTX] [nvarchar] (3) NULL,
[XEGDR] [nvarchar] (1) NULL,
[ENQUEUE_GRP] [nvarchar] (1) NULL,
[DAT_FZAU] [datetime] NULL,
[FMBDAT] [datetime] NULL,
[VSNMR_V] [nvarchar] (12) NULL,
[HANDLE] [nvarchar] (22) NULL,
[PROLI] [nvarchar] (3) NULL,
[CONT_DG] [nvarchar] (1) NULL,
[CRM_GUID] [nvarchar] (70) NULL,
[UPD_TMSTMP] [decimal] (21, 7) NULL,
[MSR_ID] [nvarchar] (10) NULL,
[TM_CTRL_KEY] [nvarchar] (4) NULL,
[PSM_BUDAT] [datetime] NULL,
[SWENR] [nvarchar] (8) NULL,
[SMENR] [nvarchar] (8) NULL,
[PHASE] [nvarchar] (11) NULL,
[MTLAUR] [nvarchar] (1) NULL,
[STAGE] [bigint] NULL,
[HB_CONT_REASON] [nvarchar] (2) NULL,
[HB_EXPDATE] [datetime] NULL,
[HB_RESDATE] [datetime] NULL,
[LOGSYSB] [nvarchar] (10) NULL,
[KALCD] [nvarchar] (6) NULL,
[MULTI] [nvarchar] (1) NULL,
[SPPAYM] [nvarchar] (2) NULL
)
GO
