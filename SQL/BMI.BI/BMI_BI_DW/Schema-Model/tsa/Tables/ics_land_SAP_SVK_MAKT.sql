CREATE TABLE [tsa].[ics_land_SAP_SVK_MAKT]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_SVK_MAKT_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_SVK_MAKT_IsDuplicate] DEFAULT ((0)),
[MAKTG] [nvarchar] (40) NULL,
[MAKTX] [nvarchar] (40) NULL,
[MANDT] [nvarchar] (3) NULL,
[MATNR] [nvarchar] (18) NULL,
[SPRAS] [nvarchar] (1) NULL
)
GO
