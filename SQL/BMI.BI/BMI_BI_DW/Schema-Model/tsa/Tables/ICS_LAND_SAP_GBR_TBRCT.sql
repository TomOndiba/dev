CREATE TABLE [tsa].[ICS_LAND_SAP_GBR_TBRCT]
(
[EtlBatchRunId] [int] NULL,
[EtlStepRunId] [int] NULL,
[EtlThreadRunId] [int] NULL,
[DataSourceKey] [int] NULL,
[EtlCreatedOn] [datetime] NULL,
[EtlCreatedBy] [varchar] (200) NULL,
[MANDT] [nvarchar] (3) NULL,
[SPRAS] [nvarchar] (1) NULL,
[BRACO] [nvarchar] (10) NULL,
[VTEXT] [nvarchar] (20) NULL,
[EtlSourceTable] [varchar] (200) NOT NULL
)
GO
