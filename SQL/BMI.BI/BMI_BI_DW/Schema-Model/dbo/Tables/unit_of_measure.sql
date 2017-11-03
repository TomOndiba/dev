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
ALTER TABLE [dbo].[unit_of_measure] ADD CONSTRAINT [pk_unit_of_measure] PRIMARY KEY CLUSTERED  ([unit_of_measure_id])
GO
ALTER TABLE [dbo].[unit_of_measure] ADD CONSTRAINT [ak_unit_of_measure__unit_of_measure_code] UNIQUE NONCLUSTERED  ([unit_of_measure_code])
GO
ALTER TABLE [dbo].[unit_of_measure] ADD CONSTRAINT [ak_unit_of_measure__unit_of_measure_name] UNIQUE NONCLUSTERED  ([unit_of_measure_name])
GO
ALTER TABLE [dbo].[unit_of_measure] ADD CONSTRAINT [fk__unit_of_measure__unit_of_measure] FOREIGN KEY ([reporting_unit_of_measure_id]) REFERENCES [dbo].[unit_of_measure] ([unit_of_measure_id])
GO
ALTER TABLE [dbo].[unit_of_measure] ADD CONSTRAINT [fk__unit_of_measure__unit_of_measure_type] FOREIGN KEY ([unit_of_measure_type_id]) REFERENCES [dbo].[unit_of_measure_type] ([unit_of_measure_type_id])
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
