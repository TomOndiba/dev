CREATE TABLE [psa].[ics_stg_Symfonia_RZ]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_RZ_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_RZ_IsIncomplete] DEFAULT ('N'),
[bazadokrz] [smallint] NULL,
[bazapozrz] [smallint] NULL,
[data] [datetime] NULL,
[flag] [smallint] NULL,
[id] [int] NOT NULL,
[iddokrz] [int] NULL,
[idkh] [int] NULL,
[idpozrz] [int] NULL,
[idtw] [int] NULL,
[iloscrl] [float] NULL,
[iloscrz] [float] NULL,
[magazyn] [int] NULL,
[subtyp] [smallint] NULL,
[termin] [datetime] NULL,
[typ] [smallint] NULL,
[wartosc] [float] NULL
)
GO
ALTER TABLE [psa].[ics_stg_Symfonia_RZ] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_RZ] PRIMARY KEY CLUSTERED  ([id])
GO
