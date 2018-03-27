CREATE TABLE [psa].[ics_stg_Symfonia_AcInfo]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_AcInfo_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Symfonia_AcInfo_IsIncomplete] DEFAULT ('N'),
[Ac_Name] [varchar] (15) NOT NULL,
[Ac_Value] [image] NULL
)
GO
ALTER TABLE [psa].[ics_stg_Symfonia_AcInfo] ADD CONSTRAINT [PK_psa_ics_stg_Symfonia_AcInfo] PRIMARY KEY CLUSTERED  ([Ac_Name])
GO
EXEC sp_addextendedproperty N'IncludeInMerge', N'Y', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_Symfonia_AcInfo', NULL, NULL
GO
