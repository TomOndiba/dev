CREATE TABLE [dbo].[StubResultSet]
(
[FunctionName] [varchar] (255) NOT NULL,
[ProcessRunID] [int] NULL,
[SubProcessRunID] [int] NULL,
[ThreadRunID] [int] NULL,
[Instruction] [varchar] (255) NULL,
[RunType] [varchar] (10) NULL,
[Message] [varchar] (255) NULL,
[StartCapturePoint] [datetime] NULL,
[EndCapturePoint] [datetime] NULL,
[Outcome] [varchar] (255) NULL,
[ExpectedThreadCount] [int] NULL,
[ActualThreadCount] [int] NULL,
[ThreadsSucceeded] [int] NULL,
[ThreadsSkipped] [int] NULL,
[ThreadsStopped] [int] NULL,
[ThreadsFailed] [int] NULL
)
GO
ALTER TABLE [dbo].[StubResultSet] ADD CONSTRAINT [PK_StubResultSet] PRIMARY KEY CLUSTERED  ([FunctionName])
GO
