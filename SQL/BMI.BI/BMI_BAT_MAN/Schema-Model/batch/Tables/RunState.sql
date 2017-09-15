CREATE TABLE [batch].[RunState]
(
[RunStateId] [int] NOT NULL,
[RunStateName] [varchar] (50) NOT NULL,
[IsEtlClosingState] [char] (1) NOT NULL CONSTRAINT [DF_RunState_IsEtlClosingState] DEFAULT ('N'),
[Narrative] [varchar] (500) NOT NULL,
[FlagBit] [int] NOT NULL CONSTRAINT [DF_RunState_FlagBit] DEFAULT ((0))
)
GO
ALTER TABLE [batch].[RunState] ADD CONSTRAINT [CK_RunState_IsEtlClosingState] CHECK (([IsEtlClosingState]='Y' OR [IsEtlClosingState]='N'))
GO
ALTER TABLE [batch].[RunState] ADD CONSTRAINT [PK_RunState] PRIMARY KEY CLUSTERED  ([RunStateId])
GO
ALTER TABLE [batch].[RunState] ADD CONSTRAINT [AK_RunState_RunStateName] UNIQUE NONCLUSTERED  ([RunStateName])
GO
ALTER TABLE [batch].[RunState] ADD CONSTRAINT [FK_batch_RunState_batch_RunStateFlag] FOREIGN KEY ([FlagBit]) REFERENCES [batch].[RunStateFlag] ([FlagBit])
GO
EXEC sp_addextendedproperty N'MS_Description', N'A generic run state for an ETL batch run e.g. Started, Landing, Cleansing, Loading, Complete etc.', 'SCHEMA', N'batch', 'TABLE', N'RunState', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the unique bit flag indicating end state e.g. "Started", "In-Progress", "Succeeded" or "Failed" etc.', 'SCHEMA', N'batch', 'TABLE', N'RunState', 'COLUMN', N'FlagBit'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this is a closing state for an ETL process which may (when implemented) trigger additional logic or notifications', 'SCHEMA', N'batch', 'TABLE', N'RunState', 'COLUMN', N'IsEtlClosingState'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Database specific unique identifier for an ETL batch run state', 'SCHEMA', N'batch', 'TABLE', N'RunState', 'COLUMN', N'RunStateId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'ETL Control database-specific, business-friendly unique identifier for an ETL batch run state', 'SCHEMA', N'batch', 'TABLE', N'RunState', 'COLUMN', N'RunStateName'
GO
