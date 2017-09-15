CREATE TABLE [tsa].[ics_land_SAP_GBR_LIPS]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_LIPS_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_LIPS_IsDuplicate] DEFAULT ((0)),
[MANDT] [nvarchar] (3) NULL,
[VBELN] [nvarchar] (10) NULL,
[POSNR] [nvarchar] (6) NULL,
[VGBEL] [nvarchar] (10) NULL,
[VGTYP] [nvarchar] (1) NULL
)
GO
