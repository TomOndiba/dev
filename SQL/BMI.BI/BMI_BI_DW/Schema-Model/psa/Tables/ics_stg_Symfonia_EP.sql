CREATE TABLE [psa].[ics_stg_Symfonia_EP]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_EP_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_EP_IsIncomplete] DEFAULT ('N'),
[guid] [uniqueidentifier] NULL,
[id] [int] NOT NULL,
[kurs] [float] NULL,
[podmiot] [int] NULL,
[typ] [smallint] NULL,
[zobowiazanie] [int] NULL
)
GO
ALTER TABLE [psa].[ics_stg_Symfonia_EP] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_EP] PRIMARY KEY CLUSTERED  ([id])
GO
