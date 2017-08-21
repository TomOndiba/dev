CREATE TABLE [tsa].[ics_land_SAP_GBR_TKA02]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_TKA02_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_TKA02_IsDuplicate] DEFAULT ((0)),
[MANDT] [nvarchar] (3) NULL,
[BUKRS] [nvarchar] (4) NULL,
[GSBER] [nvarchar] (4) NULL,
[KOKRS] [nvarchar] (4) NULL
)
GO
