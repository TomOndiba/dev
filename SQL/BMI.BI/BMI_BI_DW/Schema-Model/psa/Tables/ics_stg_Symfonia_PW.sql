CREATE TABLE [psa].[ics_stg_Symfonia_PW]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_PW_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_PW_IsIncomplete] DEFAULT ('N'),
[data] [datetime] NULL,
[flag] [smallint] NULL,
[id] [int] NOT NULL,
[iddkmg] [int] NULL,
[iddw] [int] NULL,
[idkoryg] [int] NULL,
[idmg] [int] NULL,
[idtw] [int] NULL,
[ilosc] [float] NULL,
[ilosczreal] [float] NULL,
[subtyp] [smallint] NULL,
[typ] [smallint] NULL,
[wartosc] [float] NULL
)
GO
ALTER TABLE [psa].[ics_stg_Symfonia_PW] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_PW] PRIMARY KEY CLUSTERED  ([id])
GO
