-- <Migration ID="b938168a-956f-4afa-8936-77527f6373f2" />
GO

PRINT N'Creating index [NDX_UNQ_privy_BatchStep_BatchId_IcrtSubProcessId] on [privy].[BatchStep]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [NDX_UNQ_privy_BatchStep_BatchId_IcrtSubProcessId] ON [privy].[BatchStep] ([BatchId], [IcrtSubProcessId]) WHERE ([IcrtSubProcessId] IS NOT NULL)
GO
