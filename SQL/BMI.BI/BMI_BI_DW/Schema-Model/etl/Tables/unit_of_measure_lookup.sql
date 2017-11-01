CREATE TABLE [etl].[unit_of_measure_lookup]
(
[data_source_key] [int] NOT NULL,
[native_key] [nvarchar] (50) NOT NULL,
[native_value] [nvarchar] (200) NOT NULL CONSTRAINT [df_etl_unit_of_measure_lookup__native_value] DEFAULT (''),
[unit_of_measure_id] [int] NOT NULL
)
GO
ALTER TABLE [etl].[unit_of_measure_lookup] ADD CONSTRAINT [pk_etl_unit_of_measure_lookup] PRIMARY KEY CLUSTERED  ([data_source_key], [native_key])
GO
ALTER TABLE [etl].[unit_of_measure_lookup] ADD CONSTRAINT [fk_etl_unit_of_measure_lookup__data_source] FOREIGN KEY ([data_source_key]) REFERENCES [dbo].[DataSource] ([DataSourceKey])
GO
ALTER TABLE [etl].[unit_of_measure_lookup] ADD CONSTRAINT [fk_etl_unit_of_measure_lookup__unit_of_measure] FOREIGN KEY ([unit_of_measure_id]) REFERENCES [dbo].[unit_of_measure] ([unit_of_measure_id])
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ', 'SCHEMA', N'etl', 'TABLE', N'unit_of_measure_lookup', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for a data source', 'SCHEMA', N'etl', 'TABLE', N'unit_of_measure_lookup', 'COLUMN', N'data_source_key'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory, source-specific unique identifier for a unit of measure', 'SCHEMA', N'etl', 'TABLE', N'unit_of_measure_lookup', 'COLUMN', N'native_key'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Optional name or code for a native (local) unit of measure as defined in the source system of record.  Exists only to aid readability for data analysts etc.', 'SCHEMA', N'etl', 'TABLE', N'unit_of_measure_lookup', 'COLUMN', N'native_value'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for a unit of measure', 'SCHEMA', N'etl', 'TABLE', N'unit_of_measure_lookup', 'COLUMN', N'unit_of_measure_id'
GO
