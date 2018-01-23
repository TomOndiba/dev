CREATE TABLE [psa].[ics_stg_Symfonia_SM]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_SM_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_SM_IsIncomplete] DEFAULT ('N'),
[flag] [smallint] NULL,
[id] [int] NOT NULL,
[idtw] [int] NULL,
[magazyn] [int] NULL,
[stan] [float] NULL,
[stanHandl] [float] NULL,
[subtyp] [smallint] NULL,
[typ] [smallint] NULL,
[wartosc] [float] NULL
)
GO
ALTER TABLE [psa].[ics_stg_Symfonia_SM] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_SM] PRIMARY KEY CLUSTERED  ([id])
GO
