-- <Migration ID="b6ea9d53-cb0b-4a0a-b498-440b6da4ad0c" />
GO

PRINT N'Altering [dbo].[StubResultSet]'
GO
ALTER TABLE [dbo].[StubResultSet] ADD
[Outcome] [varchar] (255) NULL,
[ExpectedThreadCount] [int] NULL,
[ActualThreadCount] [int] NULL,
[ThreadsSucceeded] [int] NULL,
[ThreadsSkipped] [int] NULL,
[ThreadsStopped] [int] NULL,
[ThreadsFailed] [int] NULL
GO
