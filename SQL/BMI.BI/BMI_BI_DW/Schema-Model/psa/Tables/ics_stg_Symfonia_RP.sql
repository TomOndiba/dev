CREATE TABLE [psa].[ics_stg_Symfonia_RP]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_RP_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_RP_IsIncomplete] DEFAULT ('N'),
[data] [datetime] NULL,
[exp_fk] [smallint] NULL,
[id] [int] NOT NULL,
[idrj] [int] NULL,
[kod] [varchar] (40) NULL,
[okres] [smallint] NULL,
[opis] [varchar] (80) NULL,
[seria] [varchar] (5) NULL,
[seriadzial] [int] NULL,
[serianr] [int] NULL,
[stan] [float] NULL,
[stanwal] [float] NULL,
[statusFK] [smallint] NULL,
[typdk] [varchar] (4) NULL,
[waluta] [varchar] (3) NULL,
[wplaty] [float] NULL,
[wplatywal] [float] NULL,
[wyplaty] [float] NULL,
[wyplatywal] [float] NULL
)
GO
ALTER TABLE [psa].[ics_stg_Symfonia_RP] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_RP] PRIMARY KEY CLUSTERED  ([id])
GO
