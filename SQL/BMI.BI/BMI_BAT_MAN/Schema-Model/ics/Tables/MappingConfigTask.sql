CREATE TABLE [ics].[MappingConfigTask]
(
[MappingConfigTaskId] [int] NOT NULL,
[MappingConfigTaskName] [varchar] (100) NOT NULL,
[MappingName] [varchar] (100) NOT NULL,
[Narrative] [varchar] (500) NOT NULL CONSTRAINT [DF_ics_MappingConfigTask_Narrative] DEFAULT ('')
)
GO
ALTER TABLE [ics].[MappingConfigTask] ADD CONSTRAINT [PK_ics_MappingConfigTask] PRIMARY KEY CLUSTERED  ([MappingConfigTaskId])
GO
ALTER TABLE [ics].[MappingConfigTask] ADD CONSTRAINT [AK_ics_MappingConfigTask_Name] UNIQUE NONCLUSTERED  ([MappingConfigTaskName], [MappingName])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Represents a unique combination of a Mapping Configuration Task and a Mapping in ICS', 'SCHEMA', N'ics', 'TABLE', N'MappingConfigTask', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Database-specific unique identifier for an ICS Mapping Config Task', 'SCHEMA', N'ics', 'TABLE', N'MappingConfigTask', 'COLUMN', N'MappingConfigTaskId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The unique physical name of the ICS Mapping Config Task', 'SCHEMA', N'ics', 'TABLE', N'MappingConfigTask', 'COLUMN', N'MappingConfigTaskName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The physical name of the ICS Mapping contained in the ICS MappingsConfig Task', 'SCHEMA', N'ics', 'TABLE', N'MappingConfigTask', 'COLUMN', N'MappingName'
GO
