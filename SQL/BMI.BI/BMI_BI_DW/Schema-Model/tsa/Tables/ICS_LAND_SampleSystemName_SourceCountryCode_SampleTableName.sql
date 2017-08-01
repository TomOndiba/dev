CREATE TABLE [tsa].[ICS_LAND_SampleSystemName_SourceCountryCode_SampleTableName]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
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
ALTER TABLE [tsa].[ICS_LAND_SampleSystemName_SourceCountryCode_SampleTableName] ADD CONSTRAINT [PK_ICS_LAND_SampleSystemName_SourceCountryCode_SampleTableName] PRIMARY KEY CLUSTERED  ([SourceTableKeyColumnA], [SourceTableKeyColumnB])
GO
