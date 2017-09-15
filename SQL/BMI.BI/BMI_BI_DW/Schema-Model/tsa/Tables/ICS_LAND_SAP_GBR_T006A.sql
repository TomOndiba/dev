CREATE TABLE [tsa].[ICS_LAND_SAP_GBR_T006A]
(
[EtlBatchRunId] [int] NULL,
[EtlStepRunId] [int] NULL,
[EtlThreadRunId] [int] NULL,
[DataSourceKey] [int] NULL,
[EtlCreatedOn] [datetime] NULL,
[EtlCreatedBy] [varchar] (200) NULL,
[MANDT] [nvarchar] (3) NULL,
[SPRAS] [nvarchar] (1) NULL,
[MSEHI] [nvarchar] (3) NULL,
[MSEH3] [nvarchar] (3) NULL,
[MSEH6] [nvarchar] (6) NULL,
[MSEHT] [nvarchar] (10) NULL,
[MSEHL] [nvarchar] (30) NULL,
[EtlSourceTable] [varchar] (200) NOT NULL
)
GO
