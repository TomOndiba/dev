CREATE TABLE [psa].[ics_stg_SAP_GBR_EKET]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_EKET_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_EKET_IsIncomplete] DEFAULT ('N'),
[MANDT] [nvarchar] (3) NULL,
[EBELN] [nvarchar] (10) NULL,
[EBELP] [nvarchar] (5) NULL,
[ETENR] [nvarchar] (4) NULL,
[EINDT] [datetime] NULL,
[SLFDT] [datetime] NULL,
[LPEIN] [nvarchar] (1) NULL,
[MENGE] [decimal] (13, 3) NULL,
[AMENG] [decimal] (13, 3) NULL,
[WEMNG] [decimal] (13, 3) NULL,
[WAMNG] [decimal] (13, 3) NULL,
[UZEIT] [datetime] NULL,
[BANFN] [nvarchar] (10) NULL,
[BNFPO] [nvarchar] (5) NULL,
[ESTKZ] [nvarchar] (1) NULL,
[QUNUM] [nvarchar] (10) NULL,
[QUPOS] [nvarchar] (3) NULL,
[MAHNZ] [decimal] (3, 0) NULL,
[BEDAT] [datetime] NULL,
[RSNUM] [nvarchar] (10) NULL,
[SERNR] [nvarchar] (8) NULL,
[FIXKZ] [nvarchar] (1) NULL,
[GLMNG] [decimal] (13, 3) NULL,
[DABMG] [decimal] (13, 3) NULL,
[CHARG] [nvarchar] (10) NULL,
[LICHA] [nvarchar] (15) NULL,
[CHKOM] [nvarchar] (1) NULL,
[VERID] [nvarchar] (4) NULL,
[ABART] [nvarchar] (1) NULL,
[MNG02] [decimal] (13, 3) NULL,
[DAT01] [datetime] NULL,
[ALTDT] [datetime] NULL,
[AULWE] [nvarchar] (10) NULL,
[MBDAT] [datetime] NULL,
[MBUHR] [datetime] NULL,
[LDDAT] [datetime] NULL,
[LDUHR] [datetime] NULL,
[TDDAT] [datetime] NULL,
[TDUHR] [datetime] NULL,
[WADAT] [datetime] NULL,
[WAUHR] [datetime] NULL,
[ELDAT] [datetime] NULL,
[ELUHR] [datetime] NULL,
[ANZSN] [bigint] NULL,
[NODISP] [nvarchar] (1) NULL,
[GEO_ROUTE] [nvarchar] (10) NULL,
[ROUTE_GTS] [nvarchar] (10) NULL,
[GTS_IND] [nvarchar] (2) NULL,
[TSP] [nvarchar] (10) NULL,
[CD_LOCNO] [nvarchar] (20) NULL,
[CD_LOCTYPE] [nvarchar] (4) NULL,
[KEY_ID] [nvarchar] (16) NULL,
[OTB_VALUE] [decimal] (17, 2) NULL,
[OTB_CURR] [nvarchar] (5) NULL,
[OTB_RES_VALUE] [decimal] (17, 2) NULL,
[OTB_SPEC_VALUE] [decimal] (17, 2) NULL,
[SPR_RSN_PROFILE] [nvarchar] (4) NULL,
[BUDG_TYPE] [nvarchar] (2) NULL,
[OTB_STATUS] [nvarchar] (1) NULL,
[OTB_REASON] [nvarchar] (3) NULL,
[CHECK_TYPE] [nvarchar] (1) NULL,
[DL_ID] [nvarchar] (22) NULL,
[HANDOVER_DATE] [datetime] NULL,
[NO_SCEM] [nvarchar] (1) NULL,
[DNG_DATE] [datetime] NULL,
[DNG_TIME] [datetime] NULL,
[CNCL_ANCMNT_DONE] [nvarchar] (1) NULL,
[DATESHIFT_NUMBER] [decimal] (3, 0) NULL
)
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKET] ADD CONSTRAINT [AK_psa_ics_stg_SAP_GBR_EKET_EtlRecordId] UNIQUE CLUSTERED  ([EtlRecordId])
GO
