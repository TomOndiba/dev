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
