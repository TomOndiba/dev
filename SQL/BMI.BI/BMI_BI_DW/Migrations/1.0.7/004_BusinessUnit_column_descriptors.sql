-- <Migration ID="ad01e15c-35ed-48e8-a02e-4c1630c8cd8d" />
GO

PRINT N'Altering extended properties'
GO
EXEC sp_updateextendedproperty N'MS_Description', N'Represents a Strategic Business Unit - which operate within a single country jurisdiction or across multiple countries, similarly a country may have more than one business unit', 'SCHEMA', N'qvstg', 'TABLE', N'BusinessUnit', NULL, NULL
GO
PRINT N'Creating extended properties'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Database-specific surrogate key that uniquely identifies a strategic business unit', 'SCHEMA', N'qvstg', 'TABLE', N'BusinessUnit', 'COLUMN', N'BusinessUnitKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The full name of a strategic business unit (not guaranteed unique)', 'SCHEMA', N'qvstg', 'TABLE', N'BusinessUnit', 'COLUMN', N'BusinessUnitName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The unique identifier for a business unit record as maintained in the source system of record indicated by DataSourceKey', 'SCHEMA', N'qvstg', 'TABLE', N'BusinessUnit', 'COLUMN', N'NativeBusinessUnitKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'A longer description associated with a business region that groups one or more stratgeic business units together', 'SCHEMA', N'qvstg', 'TABLE', N'BusinessUnit', 'COLUMN', N'RegionDescription'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Reference to the unique identifier for a business region (in which the SBU is grouped) record as maintained in the source system of record indicated by DataSourceKey', 'SCHEMA', N'qvstg', 'TABLE', N'BusinessUnit', 'COLUMN', N'RegionId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of a business region that groups one or more stratgeic business units together', 'SCHEMA', N'qvstg', 'TABLE', N'BusinessUnit', 'COLUMN', N'RegionName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'A business-friendly code used to identify a business unit in QlikView Sales Center (and hence Power BI et al).  Actually the same as StrategicBusinessUnitCode is most cases.', 'SCHEMA', N'qvstg', 'TABLE', N'BusinessUnit', 'COLUMN', N'SalesCenterSbuCode'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The business-friendly code, used regionally, that uniquely identifies a strategic business unit', 'SCHEMA', N'qvstg', 'TABLE', N'BusinessUnit', 'COLUMN', N'StrategicBusinessUnitCode'
GO
