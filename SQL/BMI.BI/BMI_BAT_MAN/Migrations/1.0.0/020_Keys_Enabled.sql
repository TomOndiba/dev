-- <Migration ID="db56fae0-2f8a-4d33-9bad-7741851ce14a" />
GO

PRINT N'Enabling constraints on [batch].[ProcessRun]'
GO
ALTER TABLE [batch].[ProcessRun] NOCHECK CONSTRAINT [FK_batch_ProcessRun_batch_Process]
GO
ALTER TABLE [batch].[ProcessRun] CHECK CONSTRAINT [FK_batch_ProcessRun_batch_Process]
GO
ALTER TABLE [batch].[ProcessRun] NOCHECK CONSTRAINT [FK_batch_ProcessRun_batch_RunState]
GO
ALTER TABLE [batch].[ProcessRun] CHECK CONSTRAINT [FK_batch_ProcessRun_batch_RunState]
GO
