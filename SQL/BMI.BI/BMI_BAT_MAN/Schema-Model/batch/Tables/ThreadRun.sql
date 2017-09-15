CREATE TABLE [batch].[ThreadRun]
(
[ThreadRunId] [int] NOT NULL IDENTITY(1, 1),
[StepRunId] [int] NOT NULL,
[ThreadId] [int] NOT NULL,
[StartTime] [datetime] NOT NULL CONSTRAINT [DF_batch_ThreadRun_StartTime] DEFAULT (getdate()),
[EndTime] [datetime] NULL,
[RunStateId] [int] NOT NULL CONSTRAINT [DF_batch_ThreadRun_RunStateId] DEFAULT ((-1)),
[EndState] [varchar] (16) NULL,
[EndMessage] [varchar] (500) NULL,
[SuccessSourceRows] [int] NULL,
[FailedSourceRows] [int] NULL,
[SuccessTargetRows] [int] NULL,
[FailedTargetRows] [int] NULL,
[MinChangeDataCapturePoint] [datetime] NULL,
[MaxChangeDataCapturePoint] [datetime] NULL
)
GO
ALTER TABLE [batch].[ThreadRun] ADD CONSTRAINT [PK_batch_ThreadRun] PRIMARY KEY CLUSTERED  ([ThreadRunId])
GO
ALTER TABLE [batch].[ThreadRun] ADD CONSTRAINT [AK_batch_ThreadRun_StepRunId_ThreadId] UNIQUE NONCLUSTERED  ([StepRunId], [ThreadId], [StartTime])
GO
ALTER TABLE [batch].[ThreadRun] ADD CONSTRAINT [FK_batch_ThreadRun_batch_RunState] FOREIGN KEY ([RunStateId]) REFERENCES [batch].[RunState] ([RunStateId])
GO
ALTER TABLE [batch].[ThreadRun] ADD CONSTRAINT [FK_batch_ThreadRun_batch_StepRun] FOREIGN KEY ([StepRunId]) REFERENCES [batch].[StepRun] ([StepRunId])
GO
ALTER TABLE [batch].[ThreadRun] ADD CONSTRAINT [FK_batch_ThreadRun_batch_Thread] FOREIGN KEY ([ThreadId]) REFERENCES [batch].[Thread] ([ThreadId])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Records a single ETL attempt to run a Thread within a running Batch Process Step', 'SCHEMA', N'batch', 'TABLE', N'ThreadRun', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Run End Message provided by the caller when ending this thread; may also be the value passed back to the caller by ics.ThreadRunStart if the instruction is "STOP" or "SKIP"', 'SCHEMA', N'batch', 'TABLE', N'ThreadRun', 'COLUMN', N'EndMessage'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run End State provided by the caller when ending this thread; may also be the value passed back to the caller by ics.ThreadRunStart if the instruction is "STOP" or "SKIP"', 'SCHEMA', N'batch', 'TABLE', N'ThreadRun', 'COLUMN', N'EndState'
GO
EXEC sp_addextendedproperty N'MS_Description', N'the ETL system date and time that a thread run attempt completed regardless of final end state', 'SCHEMA', N'batch', 'TABLE', N'ThreadRun', 'COLUMN', N'EndTime'
GO
EXEC sp_addextendedproperty N'MS_Description', N'If populated, the maximum change date and time found in the table processed by this thread run', 'SCHEMA', N'batch', 'TABLE', N'ThreadRun', 'COLUMN', N'MaxChangeDataCapturePoint'
GO
EXEC sp_addextendedproperty N'MS_Description', N'If populated, the minimum change date and time found in the table processed by this thread run', 'SCHEMA', N'batch', 'TABLE', N'ThreadRun', 'COLUMN', N'MinChangeDataCapturePoint'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Optional link to the database-specific unique identifier to indicate the current Thread Run State', 'SCHEMA', N'batch', 'TABLE', N'ThreadRun', 'COLUMN', N'RunStateId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory, the ETL system date and time that a thread run attempt started, defaults to the database system date/time', 'SCHEMA', N'batch', 'TABLE', N'ThreadRun', 'COLUMN', N'StartTime'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the batch process step run of which this thread run forms part', 'SCHEMA', N'batch', 'TABLE', N'ThreadRun', 'COLUMN', N'StepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory link to the database-specific unique identifier for a Thread, i.e. the control thread that this runtime instance represents', 'SCHEMA', N'batch', 'TABLE', N'ThreadRun', 'COLUMN', N'ThreadId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'BAT_MAN Database-specific unique identifier for a Thread Run attempt within the context of a running batch process step (auto-increments)', 'SCHEMA', N'batch', 'TABLE', N'ThreadRun', 'COLUMN', N'ThreadRunId'
GO
