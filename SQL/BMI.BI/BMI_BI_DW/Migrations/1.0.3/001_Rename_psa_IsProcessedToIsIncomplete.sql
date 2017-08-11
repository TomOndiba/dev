-- <Migration ID="562fb53f-0bf5-44e0-88f9-cf618ea8c38d" />
GO

PRINT N'Dropping constraints from [psa].[ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName]'
GO
ALTER TABLE [psa].[ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName] DROP CONSTRAINT [CK_ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName_IsProcessed]
GO
PRINT N'Dropping constraints from [psa].[ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName]'
GO
ALTER TABLE [psa].[ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName] DROP CONSTRAINT [DF_ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName_IsProcessed]
GO
PRINT N'Altering [psa].[ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName]'
GO
EXEC sp_rename N'[psa].[ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName].[IsProcessed]', N'IsIncomplete', N'COLUMN'
GO
PRINT N'Adding constraints to [psa].[ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName]'
GO
ALTER TABLE [psa].[ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName] ADD CONSTRAINT [CK_ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName_IsIncomplete] CHECK (([IsIncomplete]='Y' OR [IsIncomplete]='N'))
GO
PRINT N'Adding constraints to [psa].[ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName]'
GO
ALTER TABLE [psa].[ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName] ADD CONSTRAINT [DF_ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName_IsIncomplete] DEFAULT ('N') FOR [IsIncomplete]
GO
