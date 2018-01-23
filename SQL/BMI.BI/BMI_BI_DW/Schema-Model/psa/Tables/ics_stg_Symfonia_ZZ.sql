CREATE TABLE [psa].[ics_stg_Symfonia_ZZ]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_ZZ_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_ZZ_IsIncomplete] DEFAULT ('N'),
[baza1] [smallint] NULL,
[baza2] [smallint] NULL,
[baza3] [smallint] NULL,
[cena] [float] NULL,
[data] [datetime] NULL,
[flag] [smallint] NULL,
[id] [int] NOT NULL,
[id1] [int] NULL,
[id2] [int] NULL,
[id3] [int] NULL,
[id3pos] [int] NULL,
[iddkreal] [int] NULL,
[ilosc] [float] NULL,
[ilosc2] [float] NULL,
[kod1] [varchar] (40) NULL,
[kod2] [varchar] (40) NULL,
[magazyn] [int] NULL,
[opis] [varchar] (100) NULL,
[subtyp] [smallint] NULL,
[termin] [datetime] NULL,
[typ] [smallint] NULL,
[waluta] [varchar] (3) NULL
)
GO
ALTER TABLE [psa].[ics_stg_Symfonia_ZZ] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_ZZ] PRIMARY KEY CLUSTERED  ([id])
GO
