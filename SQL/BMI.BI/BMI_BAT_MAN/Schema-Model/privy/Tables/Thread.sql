CREATE TABLE [privy].[Thread]
(
[ThreadId] [int] NOT NULL,
[ThreadName] [varchar] (100) NOT NULL,
[BatchStepId] [int] NOT NULL,
[Narrative] [varchar] (500) NOT NULL CONSTRAINT [DF_privy_Thread_Narrative] DEFAULT (''),
[IsDisabled] [bit] NOT NULL CONSTRAINT [DF_privy_Thread_IsDisabled] DEFAULT ((0))
)
GO
ALTER TABLE [privy].[Thread] ADD CONSTRAINT [PK_privy_Thread] PRIMARY KEY CLUSTERED  ([ThreadId])
GO
ALTER TABLE [privy].[Thread] ADD CONSTRAINT [AK_privy_Thread_BatchStepId_ThreadName] UNIQUE NONCLUSTERED  ([BatchStepId], [ThreadName])
GO
ALTER TABLE [privy].[Thread] ADD CONSTRAINT [FK_privy_Thread_BatchStep] FOREIGN KEY ([BatchStepId]) REFERENCES [privy].[BatchStep] ([BatchStepId])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Represents a single thread within a step of an ETL process, typically one thread is responsible for processing one table.', 'SCHEMA', N'privy', 'TABLE', N'Thread', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory link to the database-specific unique identifier for a BatchStep (and part of an alternate key with ThreadName)', 'SCHEMA', N'privy', 'TABLE', N'Thread', 'COLUMN', N'BatchStepId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates whether this thread is disabled (where 1 = TRUE)', 'SCHEMA', N'privy', 'TABLE', N'Thread', 'COLUMN', N'IsDisabled'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Database specific unique identifier for a single Thread', 'SCHEMA', N'privy', 'TABLE', N'Thread', 'COLUMN', N'ThreadId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'User friendly name for a thread, unique within a batch step (and part of an alternate key with BatchStepId)', 'SCHEMA', N'privy', 'TABLE', N'Thread', 'COLUMN', N'ThreadName'
GO
