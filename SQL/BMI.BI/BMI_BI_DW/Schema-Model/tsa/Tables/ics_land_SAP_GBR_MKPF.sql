CREATE TABLE [tsa].[ics_land_SAP_GBR_MKPF]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_MKPF_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_MKPF_IsDuplicate] DEFAULT ((0)),
[MANDT] [nvarchar] (3) NULL,
[MBLNR] [nvarchar] (10) NULL,
[MJAHR] [nvarchar] (4) NULL,
[VGART] [nvarchar] (2) NULL,
[BLART] [nvarchar] (2) NULL,
[BLAUM] [nvarchar] (2) NULL,
[BLDAT] [datetime] NULL,
[BUDAT] [datetime] NULL,
[CPUDT] [datetime] NULL,
[CPUTM] [datetime] NULL,
[AEDAT] [datetime] NULL,
[USNAM] [nvarchar] (12) NULL,
[TCODE] [nvarchar] (4) NULL,
[XBLNR] [nvarchar] (16) NULL,
[BKTXT] [nvarchar] (25) NULL,
[FRATH] [decimal] (13, 2) NULL,
[FRBNR] [nvarchar] (16) NULL,
[WEVER] [nvarchar] (1) NULL,
[XABLN] [nvarchar] (10) NULL,
[AWSYS] [nvarchar] (10) NULL,
[BLA2D] [nvarchar] (2) NULL,
[TCODE2] [nvarchar] (20) NULL,
[BFWMS] [nvarchar] (1) NULL,
[EXNUM] [nvarchar] (10) NULL,
[SPE_BUDAT_UHR] [datetime] NULL,
[SPE_BUDAT_ZONE] [nvarchar] (6) NULL,
[LE_VBELN] [nvarchar] (10) NULL,
[SPE_LOGSYS] [nvarchar] (10) NULL,
[SPE_MDNUM_EWM] [nvarchar] (16) NULL,
[GTS_CUSREF_NO] [nvarchar] (35) NULL,
[FLS_RSTO] [nvarchar] (1) NULL,
[MSR_ACTIVE] [nvarchar] (1) NULL,
[KNUMV] [nvarchar] (10) NULL
)
GO