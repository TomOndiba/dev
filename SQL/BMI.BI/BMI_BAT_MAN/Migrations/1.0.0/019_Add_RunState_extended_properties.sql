-- <Migration ID="029902c1-87d1-4aec-96f7-3eda561d2123" />
GO

PRINT N'Creating extended properties'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Bit-wise run state indicator used when evaluating run time precendence for SSIS Steps/Packages e.g. 1 = Started; 2 = In Progress; 4 = Succeeded, etc.', 'SCHEMA', N'batch', 'TABLE', N'RunStateFlag', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Database-specific unique flag for a specific run state flag/bit', 'SCHEMA', N'batch', 'TABLE', N'RunStateFlag', 'COLUMN', N'FlagBit'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Unique, user-freindly name for a specific run state flag/bit', 'SCHEMA', N'batch', 'TABLE', N'RunStateFlag', 'COLUMN', N'FlagName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'A generic run state for an ETL batch run e.g. Started, Landing, Cleansing, Loading, Complete etc.', 'SCHEMA', N'batch', 'TABLE', N'RunState', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the unique bit flag indicating end state e.g. "Started", "In-Progress", "Succeeded" or "Failed" etc.', 'SCHEMA', N'batch', 'TABLE', N'RunState', 'COLUMN', N'FlagBit'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this is a closing state for an ETL process which may (when implemented) trigger additional logic or notifications', 'SCHEMA', N'batch', 'TABLE', N'RunState', 'COLUMN', N'IsEtlClosingState'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Database specific unique identifier for an ETL batch run state', 'SCHEMA', N'batch', 'TABLE', N'RunState', 'COLUMN', N'RunStateId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'ETL Control database-specific, business-friendly unique identifier for an ETL batch run state', 'SCHEMA', N'batch', 'TABLE', N'RunState', 'COLUMN', N'RunStateName'
GO
