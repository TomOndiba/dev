CREATE TABLE [privy].[BatchStep]
(
[BatchStepId] [int] NOT NULL,
[BatchStepName] [varchar] (100) NOT NULL,
[BatchId] [int] NOT NULL,
[Narrative] [varchar] (500) NOT NULL CONSTRAINT [DF_privy_BatchStep_Narrative] DEFAULT (''),
[IsDisabled] [bit] NOT NULL CONSTRAINT [DF_privy_BatchStep_IsDisabled] DEFAULT ((0))
)
GO
ALTER TABLE [privy].[BatchStep] ADD CONSTRAINT [PK_privy_BatchStep] PRIMARY KEY CLUSTERED  ([BatchStepId])
GO
ALTER TABLE [privy].[BatchStep] ADD CONSTRAINT [AK_privy_BatchStep_BatchId_BatchStepName] UNIQUE NONCLUSTERED  ([BatchId], [BatchStepName])
GO
ALTER TABLE [privy].[BatchStep] ADD CONSTRAINT [FK_privy_BatchStep_Batch] FOREIGN KEY ([BatchId]) REFERENCES [privy].[Batch] ([BatchId])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Represents one of one or more batch steps (a.k.a. sub-process) within an ETL process e.g. land Customer data, Load Sales Data, Remove Duplicates.  A Batch Step consist of one or more threads which may run sequentially or in parallel.', 'SCHEMA', N'privy', 'TABLE', N'BatchStep', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory link to the database-specific unique identifier for a Batch (and part of an alternate key with BatchStepName)', 'SCHEMA', N'privy', 'TABLE', N'BatchStep', 'COLUMN', N'BatchId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Database specific unique identifier for a single Batch Step', 'SCHEMA', N'privy', 'TABLE', N'BatchStep', 'COLUMN', N'BatchStepId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'User friendly name for a batch step, unique within a single batch (and part of an alternate key with BatchId)', 'SCHEMA', N'privy', 'TABLE', N'BatchStep', 'COLUMN', N'BatchStepName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates whether this batch step is disabled (where 1 = TRUE)', 'SCHEMA', N'privy', 'TABLE', N'BatchStep', 'COLUMN', N'IsDisabled'
GO
