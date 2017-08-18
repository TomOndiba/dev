CREATE TABLE [tsa].[ICS_LAND_SAP_DEU_T052U]
(
[EtlBatchRunId] [int] NULL,
[EtlStepRunId] [int] NULL,
[EtlThreadRunId] [int] NULL,
[DataSourceKey] [int] NULL,
[EtlCreatedOn] [datetime] NULL,
[EtlCreatedBy] [varchar] (200) NULL,
[MANDT] [nvarchar] (3) NULL,
[SPRAS] [nvarchar] (1) NULL,
[ZTERM] [nvarchar] (4) NULL,
[ZTAGG] [nvarchar] (2) NULL,
[TEXT1] [nvarchar] (50) NULL,
[EtlSourceTable] [varchar] (200) NOT NULL
)
GO
