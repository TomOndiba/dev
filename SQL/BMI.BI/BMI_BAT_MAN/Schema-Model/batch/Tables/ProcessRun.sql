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
ALTER TABLE [batch].[ProcessRun] ADD CONSTRAINT [PK_batch_ProcessRun] PRIMARY KEY CLUSTERED  ([ProcessRunId])
GO
ALTER TABLE [batch].[ProcessRun] ADD CONSTRAINT [FK_batch_ProcessRun_batch_Process] FOREIGN KEY ([BatchProcessId]) REFERENCES [batch].[Process] ([BatchProcessId])
GO
ALTER TABLE [batch].[ProcessRun] ADD CONSTRAINT [FK_batch_ProcessRun_batch_RunState] FOREIGN KEY ([RunStateId]) REFERENCES [batch].[RunState] ([RunStateId])
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
