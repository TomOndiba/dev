CREATE TABLE [privy].[Batch]
(
[BatchId] [int] NOT NULL,
[BatchName] [varchar] (100) NOT NULL,
[IcrtProcessName] [varchar] (100) NOT NULL CONSTRAINT [DF_privy_Batch_IcrtProcessName] DEFAULT (''),
[IsDisabled] [bit] NOT NULL CONSTRAINT [DF_privy_Batch_IsDisabled] DEFAULT ((0)),
[Narrative] [varchar] (500) NOT NULL CONSTRAINT [DF_privy_Batch_Narrative] DEFAULT (''),
[StartCapturePointOverride] [datetime] NULL
)
GO
ALTER TABLE [privy].[Batch] ADD CONSTRAINT [PK_privy_Batch] PRIMARY KEY CLUSTERED  ([BatchId])
GO
ALTER TABLE [privy].[Batch] ADD CONSTRAINT [AK_privy_Batch_BatchName] UNIQUE NONCLUSTERED  ([BatchId])
GO
CREATE UNIQUE NONCLUSTERED INDEX [NDX_UNQ_privy_Batch_IcrtProcessName] ON [privy].[Batch] ([IcrtProcessName]) WHERE ([IcrtProcessName]<>'')
GO
EXEC sp_addextendedproperty N'MS_Description', N'Container for an end-to-end ETL Load Batch process e.g. "SAK UP", "SAP Germany", "Movex Denmark" or "M3 France" etc.  Effectively a container for a set of steps or instructions to load a particular set of data which may be PowerCenter, SSIS, ICS or something else.', 'SCHEMA', N'privy', 'TABLE', N'Batch', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Database-specific unique identifier for an ETL Batch', 'SCHEMA', N'privy', 'TABLE', N'Batch', 'COLUMN', N'BatchId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Database-specific, business-friendly unique identifier for an ETL Batch', 'SCHEMA', N'privy', 'TABLE', N'Batch', 'COLUMN', N'BatchName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Unique identifier for the same batch within ICRT/ICS.  Must be unique when populated', 'SCHEMA', N'privy', 'TABLE', N'Batch', 'COLUMN', N'IcrtProcessName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates whether this job is disabled where 1 = TRUE and will not run (only when managed through the standard JLL SSIS runtime)', 'SCHEMA', N'privy', 'TABLE', N'Batch', 'COLUMN', N'IsDisabled'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The date from which to fetch/process data for all steps in the job - used to force a full load over a delta', 'SCHEMA', N'privy', 'TABLE', N'Batch', 'COLUMN', N'StartCapturePointOverride'
GO
