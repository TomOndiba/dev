CREATE TABLE [tsa].[ICS_LAND_SAP_GBR_LIPS]
(
[EtlBatchRunId] [int] NULL,
[EtlStepRunId] [int] NULL,
[EtlThreadRunId] [int] NULL,
[DataSourceKey] [int] NULL,
[EtlCreatedOn] [datetime] NULL,
[EtlCreatedBy] [varchar] (200) NULL,
[MANDT] [nvarchar] (3) NULL,
[VBELN] [nvarchar] (10) NULL,
[POSNR] [nvarchar] (6) NULL,
[VGBEL] [nvarchar] (10) NULL,
[VGTYP] [nvarchar] (1) NULL,
[EtlSourceTable] [varchar] (200) NOT NULL
)
GO
