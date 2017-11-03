CREATE TABLE [dbo].[unit_of_measure_type]
(
[unit_of_measure_type_id] [int] NOT NULL,
[unit_of_measure_type_name] [varchar] (50) NOT NULL,
[narrative] [varchar] (500) NULL CONSTRAINT [df_unit_of_measure_type__narrative] DEFAULT ('')
)
GO
ALTER TABLE [dbo].[unit_of_measure_type] ADD CONSTRAINT [pk_unit_of_measure_type] PRIMARY KEY CLUSTERED  ([unit_of_measure_type_id])
GO
ALTER TABLE [dbo].[unit_of_measure_type] ADD CONSTRAINT [ak_unit_of_measure_type__unit_of_measure_name] UNIQUE NONCLUSTERED  ([unit_of_measure_type_name])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Unit of measure type or category e.g. Distance, Surface Area, Volume, Weight etc.  It is expected that (for most types) it should be possible to convert between two different units of measure of the same type e.g. lbs to Kg or Feet to Metres', 'SCHEMA', N'dbo', 'TABLE', N'unit_of_measure_type', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Description or other narrative associated with a unit of measure type', 'SCHEMA', N'dbo', 'TABLE', N'unit_of_measure_type', 'COLUMN', N'narrative'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Database-specific unique identifier for a unit of measure type', 'SCHEMA', N'dbo', 'TABLE', N'unit_of_measure_type', 'COLUMN', N'unit_of_measure_type_id'
GO
EXEC sp_addextendedproperty N'MS_Description', N'User-friendly code that uniquely identifies a unit of measure type', 'SCHEMA', N'dbo', 'TABLE', N'unit_of_measure_type', 'COLUMN', N'unit_of_measure_type_name'
GO
