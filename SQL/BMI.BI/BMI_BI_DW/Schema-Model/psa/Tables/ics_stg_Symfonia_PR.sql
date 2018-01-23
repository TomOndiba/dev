CREATE TABLE [psa].[ics_stg_Symfonia_PR]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_PR_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_PR_IsIncomplete] DEFAULT ('N'),
[aktywny] [bit] NULL,
[czas] [datetime] NULL,
[dane] [text] NULL,
[dscname] [varchar] (14) NULL,
[flag] [smallint] NULL,
[id] [int] NOT NULL,
[idComp] [int] NULL,
[is_text] [smallint] NULL,
[katalog] [int] NULL,
[nazwa] [varchar] (68) NULL,
[rap_flag] [smallint] NULL,
[skrot] [varchar] (50) NULL,
[subtyp] [smallint] NULL,
[typ] [smallint] NULL,
[znacznik] [smallint] NULL
)
GO
ALTER TABLE [psa].[ics_stg_Symfonia_PR] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_PR] PRIMARY KEY CLUSTERED  ([id])
GO
