CREATE TABLE [tsa].[ics_land_SAP_GBR_VTTP]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_VTTP_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_VTTP_IsDuplicate] DEFAULT ((0)),
[MANDT] [nvarchar] (3) NULL,
[TKNUM] [nvarchar] (10) NULL,
[TPNUM] [nvarchar] (4) NULL,
[VBELN] [nvarchar] (10) NULL,
[TPRFO] [nvarchar] (4) NULL,
[ERNAM] [nvarchar] (12) NULL,
[ERDAT] [datetime] NULL,
[ERZET] [datetime] NULL,
[PKSTA] [nvarchar] (1) NULL,
[KZHULFG] [nvarchar] (1) NULL
)
GO
