CREATE TABLE [tsa].[ics_land_SAP_GBR_T006A]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T006A_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T006A_IsDuplicate] DEFAULT ((0)),
[MANDT] [nvarchar] (3) NULL,
[SPRAS] [nvarchar] (1) NULL,
[MSEHI] [nvarchar] (3) NULL,
[MSEH3] [nvarchar] (3) NULL,
[MSEH6] [nvarchar] (6) NULL,
[MSEHT] [nvarchar] (10) NULL,
[MSEHL] [nvarchar] (30) NULL
)
GO
