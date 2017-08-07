CREATE TABLE [ics].[IcrtSubProcess]
(
[IcrtSubProcessId] [int] NOT NULL,
[BatchProcessId] [int] NOT NULL,
[IcrtSubProcessName] [varchar] (100) NOT NULL,
[Narrative] [varchar] (500) NOT NULL CONSTRAINT [DF_ics_IcrtSubProcess_Narrative] DEFAULT ('')
)
GO
ALTER TABLE [ics].[IcrtSubProcess] ADD CONSTRAINT [PK_ics_IcrtSubProcess] PRIMARY KEY CLUSTERED  ([IcrtSubProcessId])
GO
ALTER TABLE [ics].[IcrtSubProcess] ADD CONSTRAINT [AK_ics_IcrtSubProcess_Name] UNIQUE NONCLUSTERED  ([IcrtSubProcessName])
GO
ALTER TABLE [ics].[IcrtSubProcess] ADD CONSTRAINT [FK_ics_IcrtSubProcess_batch_Process] FOREIGN KEY ([BatchProcessId]) REFERENCES [batch].[Process] ([BatchProcessId])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Represents a uniquely named ICRT sub-process', 'SCHEMA', N'ics', 'TABLE', N'IcrtSubProcess', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory link to the database-specific unique identifier for the Batch Process of which this sub-process forms part', 'SCHEMA', N'ics', 'TABLE', N'IcrtSubProcess', 'COLUMN', N'BatchProcessId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Database-specific unique identifier for an ICRT sub-process', 'SCHEMA', N'ics', 'TABLE', N'IcrtSubProcess', 'COLUMN', N'IcrtSubProcessId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The unique physical name of the ICRT sub-process', 'SCHEMA', N'ics', 'TABLE', N'IcrtSubProcess', 'COLUMN', N'IcrtSubProcessName'
GO
