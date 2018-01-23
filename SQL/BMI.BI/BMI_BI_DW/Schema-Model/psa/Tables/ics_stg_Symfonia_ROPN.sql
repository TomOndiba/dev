CREATE TABLE [psa].[ics_stg_Symfonia_ROPN]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_ROPN_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_ROPN_IsIncomplete] DEFAULT ('N'),
[data] [datetime] NULL,
[id] [int] NULL,
[id1] [int] NULL,
[id2] [int] NULL,
[kurs1] [float] NULL,
[kurs2] [float] NULL,
[wartosc] [float] NULL,
[wartoscW1] [float] NULL,
[wartoscW2] [float] NULL
)
GO
