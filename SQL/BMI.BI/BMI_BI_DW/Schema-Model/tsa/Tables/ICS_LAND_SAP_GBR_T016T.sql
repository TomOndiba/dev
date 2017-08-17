CREATE TABLE [tsa].[ICS_LAND_SAP_GBR_T016T]
(
[EtlBatchRunId] [int] NULL,
[EtlStepRunId] [int] NULL,
[EtlThreadRunId] [int] NULL,
[DataSourceKey] [int] NULL,
[EtlCreatedOn] [datetime] NULL,
[EtlCreatedBy] [varchar] (200) NULL,
[MANDT] [nvarchar] (3) NULL,
[SPRAS] [nvarchar] (1) NULL,
[BRSCH] [nvarchar] (4) NULL,
[BRTXT] [nvarchar] (20) NULL,
[EtlSourceTable] [varchar] (200) NOT NULL
)
GO
