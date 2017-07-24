-- <Migration ID="2adb7855-a742-4460-975c-fea9bc61f853" />
GO

PRINT N'Creating [dbo].[StubResultSet]'
GO
CREATE TABLE [dbo].[StubResultSet]
(
[FunctionName] [varchar] (255) NOT NULL,
[ProcessRunID] [int] NULL,
[SubProcessRunID] [int] NULL,
[ThreadRunID] [int] NULL,
[Instruction] [varchar] (255) NULL,
[RunType] [varchar] (10) NULL,
[Message] [varchar] (255) NULL
)
GO
PRINT N'Creating primary key [PK_StubResultSet] on [dbo].[StubResultSet]'
GO
ALTER TABLE [dbo].[StubResultSet] ADD CONSTRAINT [PK_StubResultSet] PRIMARY KEY CLUSTERED  ([FunctionName])
GO
