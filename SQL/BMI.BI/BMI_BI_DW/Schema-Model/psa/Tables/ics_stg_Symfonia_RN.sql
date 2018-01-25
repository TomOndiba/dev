CREATE TABLE [psa].[ics_stg_Symfonia_RN]
(
[EtlRecordId] [bigint] NOT NULL IDENTITY(1, 1),
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NULL,
[EtlDeletedBy] [varchar] (200) NULL,
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_RN_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_RN_IsIncomplete] DEFAULT ('N'),
[aktywny] [bit] NULL,
[createdBy] [int] NULL,
[createdDate] [datetime] NULL,
[id] [int] NOT NULL,
[idtw] [int] NULL,
[kod] [varchar] (40) NULL,
[modifiedBy] [int] NULL,
[modifiedDate] [datetime] NULL,
[nazwa] [varchar] (100) NULL
)
GO
ALTER TABLE [psa].[ics_stg_Symfonia_RN] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_RN] PRIMARY KEY CLUSTERED  ([id])
GO