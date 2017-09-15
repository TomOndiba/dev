CREATE TABLE [tsa].[ics_land_SAP_GBR_T016T]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T016T_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T016T_IsDuplicate] DEFAULT ((0)),
[MANDT] [nvarchar] (3) NULL,
[SPRAS] [nvarchar] (1) NULL,
[BRSCH] [nvarchar] (4) NULL,
[BRTXT] [nvarchar] (20) NULL
)
GO
