CREATE TABLE [batch].[Process]
(
[BatchProcessId] [int] NOT NULL,
[BatchProcessName] [varchar] (100) NOT NULL,
[IcrtProcessName] [varchar] (100) NOT NULL CONSTRAINT [DF_batch_Process_IcrtProcessName] DEFAULT (''),
[IsDisabled] [bit] NOT NULL CONSTRAINT [DF_batch_Process_IsDisabled] DEFAULT ((0)),
[Narrative] [varchar] (500) NOT NULL CONSTRAINT [DF_batch_Process_Narrative] DEFAULT (''),
[StartCapturePointOverride] [datetime] NULL
)
GO
ALTER TABLE [batch].[Process] ADD CONSTRAINT [PK_batch_Process] PRIMARY KEY CLUSTERED  ([BatchProcessId])
GO
ALTER TABLE [batch].[Process] ADD CONSTRAINT [AK_batch_Process_BatchProcessName] UNIQUE NONCLUSTERED  ([BatchProcessName])
GO
CREATE UNIQUE NONCLUSTERED INDEX [NDX_UNQ_batch_Process_IcrtProcessName] ON [batch].[Process] ([IcrtProcessName]) WHERE ([IcrtProcessName]<>'')
GO
EXEC sp_addextendedproperty N'MS_Description', N'Container for an end-to-end ETL Batch Process e.g. "SAK UP", "SAP Germany", "Movex Denmark" or "M3 France" etc.  Effectively a container for a set of steps or instructions to load a particular set of data using one or more ETL tools which may be PowerCenter, SSIS, ICS or something else.', 'SCHEMA', N'batch', 'TABLE', N'Process', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Database-specific unique identifier for an ETL Batch Process', 'SCHEMA', N'batch', 'TABLE', N'Process', 'COLUMN', N'BatchProcessId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Database-specific, business-friendly unique identifier for an ETL Batch Process', 'SCHEMA', N'batch', 'TABLE', N'Process', 'COLUMN', N'BatchProcessName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Unique identifier for the equivalent batch process within ICRT/ICS.  Must be unique when populated', 'SCHEMA', N'batch', 'TABLE', N'Process', 'COLUMN', N'IcrtProcessName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates whether this job is disabled where 1 = TRUE and will not run (only when managed through the standard JLL SSIS runtime)', 'SCHEMA', N'batch', 'TABLE', N'Process', 'COLUMN', N'IsDisabled'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The date FROM which (i.e. ">") to fetch/process data for all steps in the batch process - used to force a full load over a delta', 'SCHEMA', N'batch', 'TABLE', N'Process', 'COLUMN', N'StartCapturePointOverride'
GO
