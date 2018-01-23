CREATE TABLE [psa].[ics_stg_Symfonia_KR]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_KR_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_KR_IsIncomplete] DEFAULT ('N'),
[aktywny] [bit] NULL,
[flag] [smallint] NULL,
[formatNIP] [varchar] (100) NULL,
[formatVAT] [varchar] (100) NULL,
[id] [int] NOT NULL,
[kod] [varchar] (40) NULL,
[nazwa] [varchar] (100) NULL,
[typ] [smallint] NULL,
[ue] [bit] NULL
)
GO
ALTER TABLE [psa].[ics_stg_Symfonia_KR] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_KR] PRIMARY KEY CLUSTERED  ([id])
GO
