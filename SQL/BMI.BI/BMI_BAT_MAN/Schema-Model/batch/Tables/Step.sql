CREATE TABLE [batch].[Step]
(
[StepId] [int] NOT NULL,
[StepName] [varchar] (100) NOT NULL,
[BatchProcessId] [int] NOT NULL,
[IcrtSubProcessId] [int] NULL,
[Narrative] [varchar] (500) NOT NULL CONSTRAINT [DF_privy_BatchStep_Narrative] DEFAULT (''),
[IsDisabled] [bit] NOT NULL CONSTRAINT [DF_privy_BatchStep_IsDisabled] DEFAULT ((0))
)
GO
ALTER TABLE [batch].[Step] ADD CONSTRAINT [PK_batch_Step] PRIMARY KEY CLUSTERED  ([StepId])
GO
CREATE UNIQUE NONCLUSTERED INDEX [NDX_UNQ_batch_Step_BatchProcessId_IcrtSubProcessId] ON [batch].[Step] ([BatchProcessId], [IcrtSubProcessId]) WHERE ([IcrtSubProcessId] IS NOT NULL)
GO
ALTER TABLE [batch].[Step] ADD CONSTRAINT [AK_batch_Step_BatchProcessId_StepName] UNIQUE NONCLUSTERED  ([BatchProcessId], [StepName])
GO
ALTER TABLE [batch].[Step] ADD CONSTRAINT [FK_batch_Step_batch_Process] FOREIGN KEY ([BatchProcessId]) REFERENCES [batch].[Process] ([BatchProcessId])
GO
ALTER TABLE [batch].[Step] ADD CONSTRAINT [FK_batch_Step_ics_IcrtSubProcess] FOREIGN KEY ([IcrtSubProcessId]) REFERENCES [ics].[IcrtSubProcess] ([IcrtSubProcessId])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Represents one of one or more steps (a.k.a. sub-process) within an ETL batch process e.g. land Customer data, Load Sales Data, Remove Duplicates.  A Step consist of one or more threads which may run sequentially or in parallel.', 'SCHEMA', N'batch', 'TABLE', N'Step', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory link to the database-specific unique identifier for a Batch Process (and part of an alternate key with StepName)', 'SCHEMA', N'batch', 'TABLE', N'Step', 'COLUMN', N'BatchProcessId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Optional link to the database-specific unique identifier for the ICRT sub-process that is responsible for running this step within a wider ICRT Process/Batch', 'SCHEMA', N'batch', 'TABLE', N'Step', 'COLUMN', N'IcrtSubProcessId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates whether this step is disabled (where 1 = TRUE)', 'SCHEMA', N'batch', 'TABLE', N'Step', 'COLUMN', N'IsDisabled'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Database specific unique identifier for a single Batch Process Step', 'SCHEMA', N'batch', 'TABLE', N'Step', 'COLUMN', N'StepId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'User friendly name for a step, unique within a single batch process (and part of an alternate key with BatchProcessId)', 'SCHEMA', N'batch', 'TABLE', N'Step', 'COLUMN', N'StepName'
GO
