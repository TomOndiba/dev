CREATE TABLE [psa].[ics_stg_Symfonia_TR]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_TR_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_TR_IsIncomplete] DEFAULT ('N'),
[data] [datetime] NULL,
[datarozl] [datetime] NULL,
[dzial] [int] NULL,
[flag] [smallint] NULL,
[id] [int] NOT NULL,
[id_komu] [int] NULL,
[id_kto] [int] NULL,
[kod] [varchar] (40) NULL,
[nrozl_oper] [int] NULL,
[nrozlilosc] [int] NULL,
[ok] [smallint] NULL,
[owner_base] [int] NULL,
[owner_id] [int] NULL,
[status] [smallint] NULL,
[subtyp] [smallint] NULL,
[termin] [datetime] NULL,
[typ] [smallint] NULL,
[wartosc] [float] NULL,
[wartosc_rozl] [float] NULL
)
GO
ALTER TABLE [psa].[ics_stg_Symfonia_TR] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_TR] PRIMARY KEY CLUSTERED  ([id])
GO
EXEC sp_addextendedproperty N'IncludeInMerge', N'Y', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_Symfonia_TR', NULL, NULL
GO
