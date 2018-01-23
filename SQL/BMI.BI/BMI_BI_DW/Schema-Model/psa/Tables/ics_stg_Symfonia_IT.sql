CREATE TABLE [psa].[ics_stg_Symfonia_IT]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_IT_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_IT_IsIncomplete] DEFAULT ('N'),
[dostawa] [varchar] (3) NULL,
[id] [int] NULL,
[idKrajuPo] [int] NULL,
[idKrajuWy] [int] NULL,
[idmg] [int] NULL,
[transakcja] [smallint] NULL,
[transport] [smallint] NULL,
[wartStat] [float] NULL,
[zmieniony] [smallint] NULL
)
GO
