CREATE TABLE [dbo].[DataSource]
(
[DataSourceKey] [int] NOT NULL CONSTRAINT [DF_DataSource_DataSourceKey] DEFAULT (NEXT VALUE FOR [dbo].[ReferenceTypeKeySequence]),
[DataSourceCode] [nvarchar] (20) NOT NULL,
[DataSourceName] [nvarchar] (50) NOT NULL,
[DataSourceGroup] [nvarchar] (50) NOT NULL,
[HostCountry] [nvarchar] (50) NOT NULL CONSTRAINT [DF_DataSource_HostCountry] DEFAULT (''),
[DataCountries] [nvarchar] (100) NOT NULL CONSTRAINT [DF_DataSource_DataCountries] DEFAULT (''),
[Narrative] [nvarchar] (500) NOT NULL CONSTRAINT [DF_DataSource_Narrative] DEFAULT (''),
[QlikViewSourceSystemId] [int] NULL,
[IsActive] [char] (1) NOT NULL CONSTRAINT [DF_DataSource_IsActive] DEFAULT ('Y'),
[PbiTxnViewSource] [char] (3) NOT NULL CONSTRAINT [DF_DataSource_PbiTxnViewSource] DEFAULT ('QVS')
)
GO
ALTER TABLE [dbo].[DataSource] ADD CONSTRAINT [CK_DataSource_IsActive] CHECK (([IsActive]='Y' OR [IsActive]='N'))
GO
ALTER TABLE [dbo].[DataSource] ADD CONSTRAINT [CK_DataSource_PbiTxnViewSource] CHECK (([PbiTxnViewSource]='PSA' OR [PbiTxnViewSource]='QVS'))
GO
ALTER TABLE [dbo].[DataSource] ADD CONSTRAINT [PK_DataSource] PRIMARY KEY CLUSTERED  ([DataSourceKey])
GO
ALTER TABLE [dbo].[DataSource] ADD CONSTRAINT [AK_DataSource_Code] UNIQUE NONCLUSTERED  ([DataSourceCode])
GO
ALTER TABLE [dbo].[DataSource] ADD CONSTRAINT [AK_DataSource_Name] UNIQUE NONCLUSTERED  ([DataSourceName])
GO
EXEC sp_addextendedproperty N'MS_Description', N'This table records all Data Warehouse-specific data sources corresponding to the source of e.g. SAP-GBR, SAP-AUT, M3-ESP, M3-FRA etc', 'SCHEMA', N'dbo', 'TABLE', N'DataSource', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'The country or countries represented by the data contained in this data source', 'SCHEMA', N'dbo', 'TABLE', N'DataSource', 'COLUMN', N'DataCountries'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Data Warehouse-specific short-code identifier for the originating data source of this record, that is, the ERP system behind QlikView (aka Source System) - corresponds to the schema name in the landing/staging area', 'SCHEMA', N'dbo', 'TABLE', N'DataSource', 'COLUMN', N'DataSourceCode'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Display heading to allow multiple data sources to be displayed under the same heading e.g. France might include M3-FRA, FRA-CEGID-COMP and FRA-CEGID-POLY', 'SCHEMA', N'dbo', 'TABLE', N'DataSource', 'COLUMN', N'DataSourceGroup'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Data Warehouse-specific unique identifier (primary key) for a data source (aka Source System)', 'SCHEMA', N'dbo', 'TABLE', N'DataSource', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Data Warehouse-specific, business-friendly unique name for a data source (aka Source System)', 'SCHEMA', N'dbo', 'TABLE', N'DataSource', 'COLUMN', N'DataSourceName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The country where the data source is hosted, the country business unit that "owns" the data', 'SCHEMA', N'dbo', 'TABLE', N'DataSource', 'COLUMN', N'HostCountry'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as deleted or otherwise inactive', 'SCHEMA', N'dbo', 'TABLE', N'DataSource', 'COLUMN', N'IsActive'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Detailed description (if any) of this data source', 'SCHEMA', N'dbo', 'TABLE', N'DataSource', 'COLUMN', N'Narrative'
GO
EXEC sp_addextendedproperty N'MS_Description', 'Flag to indicate from where transactioonal data should be retrieved for each data source. E.g. "QVS" = the data drawn from the QlikView source database and stored in the qvstg schema; "PSA" = the views over the PSA tables which hold raw data extracted directly from source ERP systems', 'SCHEMA', N'dbo', 'TABLE', N'DataSource', 'COLUMN', N'PbiTxnViewSource'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Optional identifier of a source system as detailed in the QlikView database (Icopal_profBIS)', 'SCHEMA', N'dbo', 'TABLE', N'DataSource', 'COLUMN', N'QlikViewSourceSystemId'
GO
