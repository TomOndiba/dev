-- <Migration ID="ed54bb21-e6bd-4d8e-a72f-9535672da4f5" />
GO

PRINT N'Creating schemas'
GO
CREATE SCHEMA [psa]
AUTHORIZATION [dbo]
GO
CREATE SCHEMA [tsa]
AUTHORIZATION [dbo]
GO
PRINT N'Creating [psa].[ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName]'
GO
CREATE TABLE [psa].[ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName]
(
[EtlRecordId] [bigint] NOT NULL,
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[IsProcessed] [char] (1) NOT NULL CONSTRAINT [DF_ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName_IsProcessed] DEFAULT ('N'),
[DataSourceKey] [int] NOT NULL,
[EtlSampleTable] [varchar] (200) NOT NULL,
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
PRINT N'Creating primary key [PK_ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName] on [psa].[ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName]'
GO
ALTER TABLE [psa].[ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName] ADD CONSTRAINT [PK_ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName] PRIMARY KEY CLUSTERED  ([EtlRecordId])
GO
PRINT N'Adding constraints to [psa].[ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName]'
GO
ALTER TABLE [psa].[ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName] ADD CONSTRAINT [AK_ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName] UNIQUE NONCLUSTERED  ([SourceTableKeyColumnA], [SourceTableKeyColumnB])
GO
PRINT N'Creating [tsa].[ICS_LAND_SampleSystemName_SourceCountryCode_SampleTableName]'
GO
CREATE TABLE [tsa].[ICS_LAND_SampleSystemName_SourceCountryCode_SampleTableName]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSampleTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[SourceTableKeyColumnA] [char] (8) NOT NULL,
[SourceTableKeyColumnB] [int] NOT NULL,
[SourceColumnC] [decimal] (28, 4) NULL,
[SourceColumnD] [nvarchar] (50) NULL,
[SourceColumnE] [datetime] NULL,
[SourceColumnF] [date] NULL
)
GO
PRINT N'Creating primary key [PK_ICS_LAND_SampleSystemName_SourceCountryCode_SampleTableName] on [tsa].[ICS_LAND_SampleSystemName_SourceCountryCode_SampleTableName]'
GO
ALTER TABLE [tsa].[ICS_LAND_SampleSystemName_SourceCountryCode_SampleTableName] ADD CONSTRAINT [PK_ICS_LAND_SampleSystemName_SourceCountryCode_SampleTableName] PRIMARY KEY CLUSTERED  ([SourceTableKeyColumnA], [SourceTableKeyColumnB])
GO
PRINT N'Adding constraints to [psa].[ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName]'
GO
ALTER TABLE [psa].[ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName] ADD CONSTRAINT [CK_ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName_IsProcessed] CHECK (([IsProcessed]='Y' OR [IsProcessed]='N'))
GO
ALTER TABLE [psa].[ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName] ADD CONSTRAINT [CK_ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName_IsDeleted] CHECK (([IsDeleted]='Y' OR [IsDeleted]='N'))
GO
