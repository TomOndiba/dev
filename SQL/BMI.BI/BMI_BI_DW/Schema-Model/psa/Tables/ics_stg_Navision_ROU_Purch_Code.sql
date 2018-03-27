CREATE TABLE [psa].[ics_stg_Navision_ROU_Purch_Code]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Navision_ROU_Purchase_Code_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Navision_ROU_Purchase_Code_IsIncomplete] DEFAULT ('N'),
[timestamp] [varbinary] (8) NULL,
[Code] [varchar] (10) NOT NULL,
[Description] [varchar] (50) NULL,
[Currency Code] [varchar] (10) NULL
)
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_Purch_Code] ADD CONSTRAINT [PK_psa_ics_stg_Navision_ROU_Purch_Code] PRIMARY KEY CLUSTERED  ([Code])
GO
EXEC sp_addextendedproperty N'IncludeInMerge', N'Y', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_Navision_ROU_Purch_Code', NULL, NULL
GO
