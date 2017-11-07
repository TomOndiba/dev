-- <Migration ID="7b4c4c2d-8c83-4257-9708-f204f9713352" />
GO

PRINT N'Enabling constraints on [batch].[ProcessRun]'
GO
ALTER TABLE [batch].[ProcessRun] WITH CHECK CHECK CONSTRAINT [FK_batch_ProcessRun_batch_Process]
GO
ALTER TABLE [batch].[ProcessRun] WITH CHECK CHECK CONSTRAINT [FK_batch_ProcessRun_batch_RunState]
GO
