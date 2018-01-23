CREATE TABLE [psa].[ics_stg_Symfonia_WD]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_WD_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_WD_IsIncomplete] DEFAULT ('N'),
[cena] [float] NULL,
[dzial] [varchar] (40) NULL,
[flag] [smallint] NULL,
[guid_obcy] [uniqueidentifier] NULL,
[id] [int] NOT NULL,
[id_obcy] [int] NULL,
[id_wlasny] [int] NULL,
[idkh] [int] NULL,
[idkhfk] [int] NULL,
[ilosc] [float] NULL,
[kodkh] [varchar] (40) NULL,
[kodtw] [varchar] (40) NULL,
[opis] [varchar] (100) NULL,
[typ] [smallint] NULL,
[wartosc] [float] NULL
)
GO
ALTER TABLE [psa].[ics_stg_Symfonia_WD] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_WD] PRIMARY KEY CLUSTERED  ([id])
GO
