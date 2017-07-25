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
[EndCapturePoint] [datetime] NULL
)
GO
ALTER TABLE [dbo].[StubResultSet] ADD CONSTRAINT [PK_StubResultSet] PRIMARY KEY CLUSTERED  ([FunctionName])
GO
