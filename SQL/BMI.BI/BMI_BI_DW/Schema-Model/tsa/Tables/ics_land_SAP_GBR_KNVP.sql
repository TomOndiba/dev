CREATE TABLE [tsa].[ics_land_SAP_GBR_KNVP]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_KNVP_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_KNVP_IsDuplicate] DEFAULT ((0)),
[MANDT] [nvarchar] (3) NULL,
[KUNNR] [nvarchar] (10) NULL,
[VKORG] [nvarchar] (4) NULL,
[VTWEG] [nvarchar] (2) NULL,
[SPART] [nvarchar] (2) NULL,
[PARVW] [nvarchar] (2) NULL,
[PARZA] [nvarchar] (3) NULL,
[KUNN2] [nvarchar] (10) NULL,
[LIFNR] [nvarchar] (10) NULL,
[PERNR] [nvarchar] (8) NULL,
[PARNR] [nvarchar] (10) NULL,
[KNREF] [nvarchar] (30) NULL,
[DEFPA] [nvarchar] (1) NULL
)
GO
