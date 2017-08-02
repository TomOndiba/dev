CREATE TABLE [psa].[ICS_STG_SAP_GBR_T016T]
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
[EtlRecordId] [bigint] NOT NULL,
[IsIncomplete] [char] (1) NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NOT NULL,
[EtlDeletedBy] [varchar] (200) NOT NULL,
[IsDeleted] [char] (1) NOT NULL
)
GO
