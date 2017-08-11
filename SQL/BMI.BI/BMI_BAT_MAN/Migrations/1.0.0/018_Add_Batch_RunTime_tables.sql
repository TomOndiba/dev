-- <Migration ID="e78a5ced-7268-43d8-bbf8-9cb4d2c986bd" />
GO

PRINT N'Altering [batch].[Thread]'
GO
ALTER TABLE [batch].[Thread] ADD
[StartCapturePointOverride] [datetime] NULL
GO
PRINT N'Creating [batch].[ProcessRun]'
GO
CREATE TABLE [batch].[ProcessRun]
(
[ProcessRunId] [int] NOT NULL IDENTITY(1, 1),
[BatchProcessId] [int] NOT NULL,
[IcrtProcessId] [int] NULL,
[StartTime] [datetime] NOT NULL CONSTRAINT [DF_batch_ProcessRun_StartTime] DEFAULT (getdate()),
[EndTime] [datetime] NULL,
[RunStateId] [int] NOT NULL CONSTRAINT [DF_batch_ProcessRun_RunStateId] DEFAULT ((-1)),
[EndState] [varchar] (16) NULL,
[EndMessage] [varchar] (500) NULL,
[MinChangeDataCapturePoint] [datetime] NULL,
[MaxChangeDataCapturePoint] [datetime] NULL
)
GO
PRINT N'Creating primary key [PK_batch_ProcessRun] on [batch].[ProcessRun]'
GO
ALTER TABLE [batch].[ProcessRun] ADD CONSTRAINT [PK_batch_ProcessRun] PRIMARY KEY CLUSTERED  ([ProcessRunId])
GO
PRINT N'Creating [batch].[StepRun]'
GO
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
PRINT N'Creating primary key [PK_batch_StepRun] on [batch].[StepRun]'
GO
ALTER TABLE [batch].[StepRun] ADD CONSTRAINT [PK_batch_StepRun] PRIMARY KEY CLUSTERED  ([StepRunId])
GO
PRINT N'Adding constraints to [batch].[StepRun]'
GO
ALTER TABLE [batch].[StepRun] ADD CONSTRAINT [AK_batch_StepRun_ProcessRunId_StepId] UNIQUE NONCLUSTERED  ([ProcessRunId], [StepId], [StartTime])
GO
PRINT N'Creating [batch].[ThreadRun]'
GO
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
PRINT N'Creating primary key [PK_batch_ThreadRun] on [batch].[ThreadRun]'
GO
ALTER TABLE [batch].[ThreadRun] ADD CONSTRAINT [PK_batch_ThreadRun] PRIMARY KEY CLUSTERED  ([ThreadRunId])
GO
PRINT N'Adding constraints to [batch].[ThreadRun]'
GO
ALTER TABLE [batch].[ThreadRun] ADD CONSTRAINT [AK_batch_ThreadRun_StepRunId_ThreadId] UNIQUE NONCLUSTERED  ([StepRunId], [ThreadId], [StartTime])
GO
PRINT N'Adding foreign keys to [batch].[StepRun]'
GO
ALTER TABLE [batch].[StepRun] ADD CONSTRAINT [FK_batch_StepRun_batch_ProcessRun] FOREIGN KEY ([ProcessRunId]) REFERENCES [batch].[ProcessRun] ([ProcessRunId])
GO
ALTER TABLE [batch].[StepRun] ADD CONSTRAINT [FK_batch_StepRun_batch_Step] FOREIGN KEY ([StepId]) REFERENCES [batch].[Step] ([StepId])
GO
ALTER TABLE [batch].[StepRun] ADD CONSTRAINT [FK_batch_StepRun_batch_RunState] FOREIGN KEY ([RunStateId]) REFERENCES [batch].[RunState] ([RunStateId])
GO
PRINT N'Adding foreign keys to [batch].[ProcessRun]'
GO
ALTER TABLE [batch].[ProcessRun] ADD CONSTRAINT [FK_batch_ProcessRun_batch_Process] FOREIGN KEY ([BatchProcessId]) REFERENCES [batch].[Process] ([BatchProcessId])
GO
ALTER TABLE [batch].[ProcessRun] ADD CONSTRAINT [FK_batch_ProcessRun_batch_RunState] FOREIGN KEY ([RunStateId]) REFERENCES [batch].[RunState] ([RunStateId])
GO
PRINT N'Adding foreign keys to [batch].[ThreadRun]'
GO
ALTER TABLE [batch].[ThreadRun] ADD CONSTRAINT [FK_batch_ThreadRun_batch_StepRun] FOREIGN KEY ([StepRunId]) REFERENCES [batch].[StepRun] ([StepRunId])
GO
ALTER TABLE [batch].[ThreadRun] ADD CONSTRAINT [FK_batch_ThreadRun_batch_Thread] FOREIGN KEY ([ThreadId]) REFERENCES [batch].[Thread] ([ThreadId])
GO
ALTER TABLE [batch].[ThreadRun] ADD CONSTRAINT [FK_batch_ThreadRun_batch_RunState] FOREIGN KEY ([RunStateId]) REFERENCES [batch].[RunState] ([RunStateId])
GO
PRINT N'Altering extended properties'
GO
EXEC sp_updateextendedproperty N'MS_Description', N'The date FROM which (i.e. ">") to fetch/process data for all steps in the batch process - used to force a full load over a delta', 'SCHEMA', N'batch', 'TABLE', N'Process', 'COLUMN', N'StartCapturePointOverride'
GO
PRINT N'Creating extended properties'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Records a single ETL attempt to run a Batch Process i.e. run time logging, not batch control metadata', 'SCHEMA', N'batch', 'TABLE', N'ProcessRun', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory link to the database-specific unique identifier for a Batch Process', 'SCHEMA', N'batch', 'TABLE', N'ProcessRun', 'COLUMN', N'BatchProcessId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Process Run End Message provided by the caller when ending this process; may also be the value passed back to the caller by ics.ProcessRunStart if the instruction is "STOP" or "SKIP"', 'SCHEMA', N'batch', 'TABLE', N'ProcessRun', 'COLUMN', N'EndMessage'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Process Run End State provided by the caller when ending this process; may also be the value passed back to the caller by ics.ProcessRunStart if the instruction is "STOP" or "SKIP"', 'SCHEMA', N'batch', 'TABLE', N'ProcessRun', 'COLUMN', N'EndState'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that a process run attempt completed regardless of final end state', 'SCHEMA', N'batch', 'TABLE', N'ProcessRun', 'COLUMN', N'EndTime'
GO
EXEC sp_addextendedproperty N'MS_Description', N'ICRT-specific unique identifier for a process run attempt, i.e. the execution instance id', 'SCHEMA', N'batch', 'TABLE', N'ProcessRun', 'COLUMN', N'IcrtProcessId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'If populated, the end date and time used for this batch process run-wide data capture', 'SCHEMA', N'batch', 'TABLE', N'ProcessRun', 'COLUMN', N'MaxChangeDataCapturePoint'
GO
EXEC sp_addextendedproperty N'MS_Description', N'If populated, the start date and time used for this batch process run-wide data capture', 'SCHEMA', N'batch', 'TABLE', N'ProcessRun', 'COLUMN', N'MinChangeDataCapturePoint'
GO
EXEC sp_addextendedproperty N'MS_Description', N'BAT_MAN Database-specific unique identifier for a Batch Run attempt (auto-increments)', 'SCHEMA', N'batch', 'TABLE', N'ProcessRun', 'COLUMN', N'ProcessRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Optional link to the database-specific unique identifier to indicate the current Batch Process Run State', 'SCHEMA', N'batch', 'TABLE', N'ProcessRun', 'COLUMN', N'RunStateId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory, the ETL system date and time that a process run attempt started, defaults to the database system date/time', 'SCHEMA', N'batch', 'TABLE', N'ProcessRun', 'COLUMN', N'StartTime'
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
EXEC sp_addextendedproperty N'MS_Description', N'The date FROM which (i.e. ">") to fetch/process data for just the table processed by this thread - used to force a full load over a delta', 'SCHEMA', N'batch', 'TABLE', N'Thread', 'COLUMN', N'StartCapturePointOverride'
GO
