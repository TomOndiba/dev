CREATE TABLE [tsa].[ICS_LAND_SAP_GBR_MAKT]
(
[EtlBatchRunId] [int] NULL,
[EtlStepRunId] [int] NULL,
[EtlThreadRunId] [int] NULL,
[DataSourceKey] [int] NULL,
[EtlCreatedOn] [datetime] NULL,
[EtlCreatedBy] [varchar] (200) NULL,
[MANDT] [nvarchar] (3) NULL,
[MATNR] [nvarchar] (18) NULL,
[SPRAS] [nvarchar] (1) NULL,
[MAKTX] [nvarchar] (40) NULL,
[MAKTG] [nvarchar] (40) NULL,
[EtlSourceTable] [varchar] (200) NOT NULL
)
GO
