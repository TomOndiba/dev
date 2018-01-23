CREATE TABLE [psa].[ics_stg_Symfonia_RV]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_RV_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_RV_IsIncomplete] DEFAULT ('N'),
[datarej] [datetime] NULL,
[datawyst] [datetime] NULL,
[dkid] [int] NULL,
[id] [int] NOT NULL,
[netto] [float] NULL,
[rejestr] [int] NULL,
[stvat] [int] NULL,
[vat] [float] NULL
)
GO
ALTER TABLE [psa].[ics_stg_Symfonia_RV] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_RV] PRIMARY KEY CLUSTERED  ([id])
GO
