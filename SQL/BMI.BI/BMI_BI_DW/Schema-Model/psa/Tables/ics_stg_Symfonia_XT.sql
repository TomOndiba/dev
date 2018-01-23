CREATE TABLE [psa].[ics_stg_Symfonia_XT]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_XT_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_XT_IsIncomplete] DEFAULT ('N'),
[baza] [smallint] NULL,
[data1] [datetime] NULL,
[data2] [datetime] NULL,
[flag] [smallint] NULL,
[id] [int] NOT NULL,
[klient] [int] NULL,
[kod] [varchar] (40) NULL,
[long] [int] NULL,
[long2] [int] NULL,
[nazwa] [varchar] (100) NULL,
[podkatalog] [smallint] NULL,
[root] [int] NULL,
[subtyp] [smallint] NULL,
[super] [int] NULL,
[typ] [smallint] NULL,
[wartosc] [float] NULL,
[zawartosc] [int] NULL
)
GO
ALTER TABLE [psa].[ics_stg_Symfonia_XT] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_XT] PRIMARY KEY CLUSTERED  ([id])
GO
