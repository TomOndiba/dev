CREATE TABLE [psa].[ics_stg_Symfonia_PN]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_PN_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_PN_IsIncomplete] DEFAULT ('N'),
[aktywny] [bit] NULL,
[anulowany] [smallint] NULL,
[bufor] [smallint] NULL,
[createdBy] [int] NULL,
[createdDate] [datetime] NULL,
[data] [datetime] NULL,
[datarozl] [datetime] NULL,
[dkid] [int] NULL,
[e_status] [smallint] NULL,
[exp_fk] [smallint] NULL,
[flag] [smallint] NULL,
[guid] [uniqueidentifier] NULL,
[id] [int] NOT NULL,
[khadid] [int] NULL,
[khdzial] [int] NULL,
[khid] [int] NULL,
[kod] [varchar] (40) NULL,
[kurs] [float] NULL,
[kwota] [float] NULL,
[kwotarozl] [float] NULL,
[kwotarozlpln] [float] NULL,
[modifiedBy] [int] NULL,
[modifiedDate] [datetime] NULL,
[ok] [smallint] NULL,
[okres] [smallint] NULL,
[opis] [varchar] (80) NULL,
[plattyp] [int] NULL,
[rejestr] [int] NULL,
[related_fk] [smallint] NULL,
[schemat] [varchar] (4) NULL,
[seria] [varchar] (5) NULL,
[seriadzial] [int] NULL,
[serianr] [int] NULL,
[stan] [float] NULL,
[status] [smallint] NULL,
[strona] [int] NULL,
[subtyp] [smallint] NULL,
[termin] [datetime] NULL,
[typ] [smallint] NULL,
[typdk] [varchar] (4) NULL,
[typkh] [smallint] NULL,
[waluta] [varchar] (3) NULL,
[wartosc] [float] NULL,
[wartoscWal] [float] NULL,
[wyplata] [smallint] NULL,
[wystawil] [int] NULL,
[znacznik] [smallint] NULL
)
GO
ALTER TABLE [psa].[ics_stg_Symfonia_PN] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_PN] PRIMARY KEY CLUSTERED  ([id])
GO