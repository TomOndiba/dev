CREATE TABLE [psa].[ics_stg_Symfonia_StanyMinMax]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_StanyMinMax_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_StanyMinMax_IsIncomplete] DEFAULT ('N'),
[id] [int] NOT NULL,
[MagazynId] [int] NULL,
[StanMax] [float] NULL,
[StanMin] [float] NULL,
[TowarId] [int] NULL
)
GO
ALTER TABLE [psa].[ics_stg_Symfonia_StanyMinMax] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_StanyMinMax] PRIMARY KEY CLUSTERED  ([id])
GO
EXEC sp_addextendedproperty N'IncludeInMerge', N'Y', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_Symfonia_StanyMinMax', NULL, NULL
GO
