CREATE TABLE [psa].[ics_stg_Symfonia__KonwersjaIdToCore]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia__KonwersjaIdToCore_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia__KonwersjaIdToCore_IsIncomplete] DEFAULT ('N'),
[coreId] [int] NOT NULL,
[hmfID] [int] NOT NULL,
[objId] [int] NOT NULL
)
GO
ALTER TABLE [psa].[ics_stg_Symfonia__KonwersjaIdToCore] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia__KonwersjaIdToCore] PRIMARY KEY CLUSTERED  ([coreId], [hmfID], [objId])
GO
EXEC sp_addextendedproperty N'IncludeInMerge', N'Y', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_Symfonia__KonwersjaIdToCore', NULL, NULL
GO
