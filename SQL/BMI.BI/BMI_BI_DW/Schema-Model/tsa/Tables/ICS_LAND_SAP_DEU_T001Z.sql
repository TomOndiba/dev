CREATE TABLE [tsa].[ICS_LAND_SAP_DEU_T001Z]
(
[EtlBatchRunId] [int] NULL,
[EtlStepRunId] [int] NULL,
[EtlThreadRunId] [int] NULL,
[DataSourceKey] [int] NULL,
[EtlCreatedOn] [datetime] NULL,
[EtlCreatedBy] [varchar] (200) NULL,
[MANDT] [nvarchar] (3) NULL,
[BUKRS] [nvarchar] (4) NULL,
[PARTY] [nvarchar] (6) NULL,
[PAVAL] [nvarchar] (48) NULL,
[EtlSourceTable] [varchar] (200) NOT NULL
)
GO
