CREATE TABLE [psa].[ICS_STG_audit]
(
[EtlBatchRunId] [int] NULL,
[EtlStepRunId] [int] NULL,
[EtlThreadRunId] [int] NULL,
[DataSourceKey] [int] NULL,
[EtlCreatedOn] [datetime2] NULL,
[EtlCreatedBy] [varchar] (200) NULL,
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
