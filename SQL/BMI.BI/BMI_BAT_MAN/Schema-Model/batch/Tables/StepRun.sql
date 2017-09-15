CREATE TABLE [batch].[StepRun]
(
[StepRunId] [int] NOT NULL IDENTITY(1, 1),
[ProcessRunId] [int] NOT NULL,
[StepId] [int] NOT NULL,
[StartTime] [datetime] NOT NULL CONSTRAINT [DF_batch_StepRun_StartTime] DEFAULT (getdate()),
[EndTime] [datetime] NULL,
[RunStateId] [int] NOT NULL CONSTRAINT [DF_batch_StepRun_RunStateId] DEFAULT ((-1)),
[EndState] [varchar] (16) NULL,
[EndMessage] [varchar] (500) NULL
)
GO
ALTER TABLE [batch].[StepRun] ADD CONSTRAINT [PK_batch_StepRun] PRIMARY KEY CLUSTERED  ([StepRunId])
GO
ALTER TABLE [batch].[StepRun] ADD CONSTRAINT [AK_batch_StepRun_ProcessRunId_StepId] UNIQUE NONCLUSTERED  ([ProcessRunId], [StepId], [StartTime])
GO
ALTER TABLE [batch].[StepRun] ADD CONSTRAINT [FK_batch_StepRun_batch_ProcessRun] FOREIGN KEY ([ProcessRunId]) REFERENCES [batch].[ProcessRun] ([ProcessRunId])
GO
ALTER TABLE [batch].[StepRun] ADD CONSTRAINT [FK_batch_StepRun_batch_RunState] FOREIGN KEY ([RunStateId]) REFERENCES [batch].[RunState] ([RunStateId])
GO
ALTER TABLE [batch].[StepRun] ADD CONSTRAINT [FK_batch_StepRun_batch_Step] FOREIGN KEY ([StepId]) REFERENCES [batch].[Step] ([StepId])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Records a single ETL attempt to run a Step within a running Batch Process', 'SCHEMA', N'batch', 'TABLE', N'StepRun', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Sub-process or Step Run End Message provided by the caller when ending this step; may also be the value passed back to the caller by ics.SubProcessRunStart if the instruction is "STOP" or "SKIP"', 'SCHEMA', N'batch', 'TABLE', N'StepRun', 'COLUMN', N'EndMessage'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Sub-process or Step Run End State provided by the caller when ending this step; may also be the value passed back to the caller by ics.SubProcessRunStart if the instruction is "STOP" or "SKIP"', 'SCHEMA', N'batch', 'TABLE', N'StepRun', 'COLUMN', N'EndState'
GO
EXEC sp_addextendedproperty N'MS_Description', N'the ETL system date and time that a step run attempt completed regardless of final end state', 'SCHEMA', N'batch', 'TABLE', N'StepRun', 'COLUMN', N'EndTime'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the batch process run of which this step run forms part', 'SCHEMA', N'batch', 'TABLE', N'StepRun', 'COLUMN', N'ProcessRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Optional link to the database-specific unique identifier to indicate the current Step Run State', 'SCHEMA', N'batch', 'TABLE', N'StepRun', 'COLUMN', N'RunStateId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory, the ETL system date and time that a step run attempt started, defaults to the database system date/time', 'SCHEMA', N'batch', 'TABLE', N'StepRun', 'COLUMN', N'StartTime'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory link to the database-specific unique identifier for a Process Step, i.e. the control step that this runtime instance represents', 'SCHEMA', N'batch', 'TABLE', N'StepRun', 'COLUMN', N'StepId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'BAT_MAN Database-specific unique identifier for a Step Run attempt within the context of a running batch process (auto-increments)', 'SCHEMA', N'batch', 'TABLE', N'StepRun', 'COLUMN', N'StepRunId'
GO
