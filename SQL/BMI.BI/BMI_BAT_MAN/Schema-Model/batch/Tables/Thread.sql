CREATE TABLE [batch].[Thread]
(
[ThreadId] [int] NOT NULL,
[ThreadName] [varchar] (100) NOT NULL,
[StepId] [int] NOT NULL,
[MappingConfigTaskId] [int] NULL,
[Narrative] [varchar] (500) NOT NULL CONSTRAINT [DF_privy_Thread_Narrative] DEFAULT (''),
[IsDisabled] [bit] NOT NULL CONSTRAINT [DF_privy_Thread_IsDisabled] DEFAULT ((0)),
[StartCapturePointOverride] [datetime] NULL
)
GO
ALTER TABLE [batch].[Thread] ADD CONSTRAINT [PK_batch_Thread] PRIMARY KEY CLUSTERED  ([ThreadId])
GO
ALTER TABLE [batch].[Thread] ADD CONSTRAINT [AK_batch_Thread_StepId_ThreadName] UNIQUE NONCLUSTERED  ([StepId], [ThreadName])
GO
ALTER TABLE [batch].[Thread] ADD CONSTRAINT [FK_batch_BatchStep_ics_MappingConfigTask] FOREIGN KEY ([MappingConfigTaskId]) REFERENCES [ics].[MappingConfigTask] ([MappingConfigTaskId])
GO
ALTER TABLE [batch].[Thread] ADD CONSTRAINT [FK_batch_Thread_batch_Step] FOREIGN KEY ([StepId]) REFERENCES [batch].[Step] ([StepId])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Represents a single thread within a step of an ETL process, typically one thread is responsible for processing one table.', 'SCHEMA', N'batch', 'TABLE', N'Thread', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates whether this thread is disabled (where 1 = TRUE)', 'SCHEMA', N'batch', 'TABLE', N'Thread', 'COLUMN', N'IsDisabled'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Optional link to the database-specific unique identifier for the ICS Mapping Configuration Task/Mapping that is responsible for running this thread within a wider ICRT Sub-process/Step', 'SCHEMA', N'batch', 'TABLE', N'Thread', 'COLUMN', N'MappingConfigTaskId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The date FROM which (i.e. ">") to fetch/process data for just the table processed by this thread - used to force a full load over a delta', 'SCHEMA', N'batch', 'TABLE', N'Thread', 'COLUMN', N'StartCapturePointOverride'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory link to the database-specific unique identifier for a batch process step (and part of an alternate key with ThreadName)', 'SCHEMA', N'batch', 'TABLE', N'Thread', 'COLUMN', N'StepId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Database specific unique identifier for a single Thread', 'SCHEMA', N'batch', 'TABLE', N'Thread', 'COLUMN', N'ThreadId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'User friendly name for a thread, unique within a batch process step (and part of an alternate key with StepId)', 'SCHEMA', N'batch', 'TABLE', N'Thread', 'COLUMN', N'ThreadName'
GO
