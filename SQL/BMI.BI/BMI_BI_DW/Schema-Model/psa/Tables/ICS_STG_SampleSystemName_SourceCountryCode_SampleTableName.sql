CREATE TABLE [psa].[ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName]
(
[EtlRecordId] [bigint] NOT NULL,
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName_IsIncomplete] DEFAULT ('N'),
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NOT NULL,
[EtlDeletedBy] [varchar] (200) NOT NULL,
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName_IsDeleted] DEFAULT ('N'),
[SourceTableKeyColumnA] [char] (8) NOT NULL,
[SourceTableKeyColumnB] [int] NOT NULL,
[SourceColumnC] [decimal] (28, 4) NULL,
[SourceColumnD] [nvarchar] (50) NULL,
[SourceColumnE] [datetime] NULL,
[SourceColumnF] [date] NULL
)
GO
ALTER TABLE [psa].[ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName] ADD CONSTRAINT [CK_ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName_IsDeleted] CHECK (([IsDeleted]='Y' OR [IsDeleted]='N'))
GO
ALTER TABLE [psa].[ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName] ADD CONSTRAINT [CK_ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName_IsIncomplete] CHECK (([IsIncomplete]='Y' OR [IsIncomplete]='N'))
GO
ALTER TABLE [psa].[ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName] ADD CONSTRAINT [PK_ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName] PRIMARY KEY CLUSTERED  ([EtlRecordId])
GO
ALTER TABLE [psa].[ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName] ADD CONSTRAINT [AK_ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName] UNIQUE NONCLUSTERED  ([SourceTableKeyColumnA], [SourceTableKeyColumnB])
GO
