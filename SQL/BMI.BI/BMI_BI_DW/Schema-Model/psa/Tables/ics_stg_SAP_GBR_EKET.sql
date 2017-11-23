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
[ABART] [nvarchar] (1) NULL,
[ALTDT] [datetime] NULL,
[AMENG] [decimal] (18, 0) NULL,
[ANZSN] [bigint] NULL,
[AULWE] [nvarchar] (10) NULL,
[BANFN] [nvarchar] (10) NULL,
[BEDAT] [datetime] NULL,
[BNFPO] [nvarchar] (5) NULL,
[BUDG_TYPE] [nvarchar] (2) NULL,
[CD_LOCNO] [nvarchar] (20) NULL,
[CD_LOCTYPE] [nvarchar] (4) NULL,
[CHARG] [nvarchar] (10) NULL,
[CHECK_TYPE] [nvarchar] (1) NULL,
[CHKOM] [nvarchar] (1) NULL,
[CNCL_ANCMNT_DONE] [nvarchar] (1) NULL,
[DABMG] [decimal] (18, 0) NULL,
[DAT01] [datetime] NULL,
[DATESHIFT_NUMBER] [decimal] (18, 0) NULL,
[DL_ID] [nvarchar] (22) NULL,
[DNG_DATE] [datetime] NULL,
[DNG_TIME] [datetime] NULL,
[EBELN] [nvarchar] (10) NOT NULL,
[EBELP] [nvarchar] (5) NOT NULL,
[EINDT] [datetime] NULL,
[ELDAT] [datetime] NULL,
[ELUHR] [datetime] NULL,
[ESTKZ] [nvarchar] (1) NULL,
[ETENR] [nvarchar] (4) NOT NULL,
[FIXKZ] [nvarchar] (1) NULL,
[GEO_ROUTE] [nvarchar] (10) NULL,
[GLMNG] [decimal] (18, 0) NULL,
[GTS_IND] [nvarchar] (2) NULL,
[HANDOVER_DATE] [datetime] NULL,
[KEY_ID] [nvarchar] (16) NULL,
[LDDAT] [datetime] NULL,
[LDUHR] [datetime] NULL,
[LICHA] [nvarchar] (15) NULL,
[LPEIN] [nvarchar] (1) NULL,
[MAHNZ] [decimal] (18, 0) NULL,
[MANDT] [nvarchar] (3) NULL,
[MBDAT] [datetime] NULL,
[MBUHR] [datetime] NULL,
[MENGE] [decimal] (18, 0) NULL,
[MNG02] [decimal] (18, 0) NULL,
[NO_SCEM] [nvarchar] (1) NULL,
[NODISP] [nvarchar] (1) NULL,
[OTB_CURR] [nvarchar] (5) NULL,
[OTB_REASON] [nvarchar] (3) NULL,
[OTB_RES_VALUE] [decimal] (18, 0) NULL,
[OTB_SPEC_VALUE] [decimal] (18, 0) NULL,
[OTB_STATUS] [nvarchar] (1) NULL,
[OTB_VALUE] [decimal] (18, 0) NULL,
[QUNUM] [nvarchar] (10) NULL,
[QUPOS] [nvarchar] (3) NULL,
[ROUTE_GTS] [nvarchar] (10) NULL,
[RSNUM] [nvarchar] (10) NULL,
[SERNR] [nvarchar] (8) NULL,
[SLFDT] [datetime] NULL,
[SPR_RSN_PROFILE] [nvarchar] (4) NULL,
[TDDAT] [datetime] NULL,
[TDUHR] [datetime] NULL,
[TSP] [nvarchar] (10) NULL,
[UZEIT] [datetime] NULL,
[VERID] [nvarchar] (4) NULL,
[WADAT] [datetime] NULL,
[WAMNG] [decimal] (18, 0) NULL,
[WAUHR] [datetime] NULL,
[WEMNG] [decimal] (18, 0) NULL
)
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKET] ADD CONSTRAINT [psa_ics_stg_SAP_GBR_EKET_PK] PRIMARY KEY CLUSTERED  ([EBELN], [EBELP], [ETENR])
GO
