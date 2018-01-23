CREATE TABLE [psa].[ics_stg_Symfonia_CN]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_CN_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_CN_IsIncomplete] DEFAULT ('N'),
[aktywna] [smallint] NULL,
[cena] [float] NULL,
[createdBy] [int] NULL,
[dataend] [datetime] NULL,
[datastart] [datetime] NULL,
[flag] [smallint] NULL,
[flagcen] [smallint] NULL,
[id] [int] NOT NULL,
[idck] [int] NULL,
[idpd] [int] NULL,
[idpm] [int] NULL,
[parametr] [float] NULL,
[subtyp] [smallint] NULL,
[typ] [smallint] NULL,
[typceny] [smallint] NULL,
[typpar] [smallint] NULL,
[typpd] [smallint] NULL,
[waluta] [varchar] (3) NULL
)
GO
ALTER TABLE [psa].[ics_stg_Symfonia_CN] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_CN] PRIMARY KEY CLUSTERED  ([id])
GO
