-- <Migration ID="75a701fe-e456-4258-9d90-ed40215aa7d0" />
GO

PRINT N'Creating [dbo].[unit_of_measure_type]'
GO
CREATE TABLE [dbo].[unit_of_measure_type]
(
[unit_of_measure_type_id] [int] NOT NULL,
[unit_of_measure_type_name] [varchar] (50) NOT NULL,
[narrative] [varchar] (500) NULL CONSTRAINT [df_unit_of_measure_type__narrative] DEFAULT ('')
)
GO
PRINT N'Creating primary key [pk_unit_of_measure_type] on [dbo].[unit_of_measure_type]'
GO
ALTER TABLE [dbo].[unit_of_measure_type] ADD CONSTRAINT [pk_unit_of_measure_type] PRIMARY KEY CLUSTERED  ([unit_of_measure_type_id])
GO
PRINT N'Adding constraints to [dbo].[unit_of_measure_type]'
GO
ALTER TABLE [dbo].[unit_of_measure_type] ADD CONSTRAINT [ak_unit_of_measure_type__unit_of_measure_name] UNIQUE NONCLUSTERED  ([unit_of_measure_type_name])
GO
PRINT N'Creating [dbo].[unit_of_measure]'
GO
CREATE TABLE [dbo].[unit_of_measure]
(
[unit_of_measure_id] [int] NOT NULL,
[unit_of_measure_code] [varchar] (8) NOT NULL,
[unit_of_measure_name] [varchar] (50) NOT NULL,
[unit_of_measure_type_id] [int] NOT NULL,
[reporting_unit_of_measure_id] [int] NULL,
[narrative] [varchar] (500) NOT NULL CONSTRAINT [df_unit_of_measure__narrative] DEFAULT (''),
[is_deleted] [bit] NOT NULL CONSTRAINT [df_unit_of_measure__is_deleted] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [pk_unit_of_measure] on [dbo].[unit_of_measure]'
GO
ALTER TABLE [dbo].[unit_of_measure] ADD CONSTRAINT [pk_unit_of_measure] PRIMARY KEY CLUSTERED  ([unit_of_measure_id])
GO
PRINT N'Adding constraints to [dbo].[unit_of_measure]'
GO
ALTER TABLE [dbo].[unit_of_measure] ADD CONSTRAINT [ak_unit_of_measure__unit_of_measure_code] UNIQUE NONCLUSTERED  ([unit_of_measure_code])
GO
PRINT N'Adding constraints to [dbo].[unit_of_measure]'
GO
ALTER TABLE [dbo].[unit_of_measure] ADD CONSTRAINT [ak_unit_of_measure__unit_of_measure_name] UNIQUE NONCLUSTERED  ([unit_of_measure_name])
GO
PRINT N'Creating [etl].[unit_of_measure_lookup]'
GO
CREATE TABLE [etl].[unit_of_measure_lookup]
(
[data_source_key] [int] NOT NULL,
[native_key] [nvarchar] (50) NOT NULL,
[native_value] [nvarchar] (200) NOT NULL CONSTRAINT [df_etl_unit_of_measure_lookup__native_value] DEFAULT (''),
[unit_of_measure_id] [int] NOT NULL
)
GO
PRINT N'Creating primary key [pk_etl_unit_of_measure_lookup] on [etl].[unit_of_measure_lookup]'
GO
ALTER TABLE [etl].[unit_of_measure_lookup] ADD CONSTRAINT [pk_etl_unit_of_measure_lookup] PRIMARY KEY CLUSTERED  ([data_source_key], [native_key])
GO
PRINT N'Adding foreign keys to [dbo].[unit_of_measure]'
GO
ALTER TABLE [dbo].[unit_of_measure] ADD CONSTRAINT [fk__unit_of_measure__unit_of_measure] FOREIGN KEY ([reporting_unit_of_measure_id]) REFERENCES [dbo].[unit_of_measure] ([unit_of_measure_id])
GO
ALTER TABLE [dbo].[unit_of_measure] ADD CONSTRAINT [fk__unit_of_measure__unit_of_measure_type] FOREIGN KEY ([unit_of_measure_type_id]) REFERENCES [dbo].[unit_of_measure_type] ([unit_of_measure_type_id])
GO
PRINT N'Adding foreign keys to [etl].[unit_of_measure_lookup]'
GO
ALTER TABLE [etl].[unit_of_measure_lookup] ADD CONSTRAINT [fk_etl_unit_of_measure_lookup__unit_of_measure] FOREIGN KEY ([unit_of_measure_id]) REFERENCES [dbo].[unit_of_measure] ([unit_of_measure_id])
GO
ALTER TABLE [etl].[unit_of_measure_lookup] ADD CONSTRAINT [fk_etl_unit_of_measure_lookup__data_source] FOREIGN KEY ([data_source_key]) REFERENCES [dbo].[DataSource] ([DataSourceKey])
GO
PRINT N'Creating extended properties'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The measurement unit by which something may be measured, including a range different types e.g. Weights (lbs, Kg, Ton etc);  Surface Areas (m², yd², Acre etc.); Distance (Miles, Km etc.); Aggregate (Count, Average, Total etc.)', 'SCHEMA', N'dbo', 'TABLE', N'unit_of_measure', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that the unit of measure is inactive/no longer used. Defaults to "N" meaning False', 'SCHEMA', N'dbo', 'TABLE', N'unit_of_measure', 'COLUMN', N'is_deleted'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Description or other narrative associated with a unit of measure', 'SCHEMA', N'dbo', 'TABLE', N'unit_of_measure', 'COLUMN', N'narrative'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Optional reference to the database-specific identifier for the unit of measure used for standardised reporting of a measurement unit.  E.g. rolls may come in different lengths and widths so might be reported in square metres', 'SCHEMA', N'dbo', 'TABLE', N'unit_of_measure', 'COLUMN', N'reporting_unit_of_measure_id'
GO
EXEC sp_addextendedproperty N'MS_Description', N'User-friendly code that uniquely identifies a unit of measure', 'SCHEMA', N'dbo', 'TABLE', N'unit_of_measure', 'COLUMN', N'unit_of_measure_code'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Database-specific unique identifier for a unit of measure', 'SCHEMA', N'dbo', 'TABLE', N'unit_of_measure', 'COLUMN', N'unit_of_measure_id'
GO
EXEC sp_addextendedproperty N'MS_Description', N'User-friendly unique name for a unit of measure', 'SCHEMA', N'dbo', 'TABLE', N'unit_of_measure', 'COLUMN', N'unit_of_measure_name'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for a unit of measure type e.g. Weight, Volume, Area etc.', 'SCHEMA', N'dbo', 'TABLE', N'unit_of_measure', 'COLUMN', N'unit_of_measure_type_id'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Unit of measure type or category e.g. Distance, Surface Area, Volume, Weight etc.  It is expected that (for most types) it should be possible to convert between two different units of measure of the same type e.g. lbs to Kg or Feet to Metres', 'SCHEMA', N'dbo', 'TABLE', N'unit_of_measure_type', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Description or other narrative associated with a unit of measure type', 'SCHEMA', N'dbo', 'TABLE', N'unit_of_measure_type', 'COLUMN', N'narrative'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Database-specific unique identifier for a unit of measure type', 'SCHEMA', N'dbo', 'TABLE', N'unit_of_measure_type', 'COLUMN', N'unit_of_measure_type_id'
GO
EXEC sp_addextendedproperty N'MS_Description', N'User-friendly code that uniquely identifies a unit of measure type', 'SCHEMA', N'dbo', 'TABLE', N'unit_of_measure_type', 'COLUMN', N'unit_of_measure_type_name'
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
