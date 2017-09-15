CREATE TABLE [tsa].[ics_land_SAP_GBR_KNVS]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_KNVS_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_KNVS_IsDuplicate] DEFAULT ((0)),
[MANDT] [nvarchar] (3) NULL,
[KUNNR] [nvarchar] (10) NULL,
[VSTEL] [nvarchar] (4) NULL,
[TRANS] [nvarchar] (3) NULL,
[TOPLA] [nvarchar] (1) NULL,
[TOURN] [nvarchar] (4) NULL,
[ANFRF] [nvarchar] (3) NULL,
[SPDNR] [nvarchar] (10) NULL
)
GO
