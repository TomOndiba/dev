CREATE TABLE [log4Private].[Journal]
(
[JournalId] [int] NOT NULL IDENTITY(1, 1),
[UtcDate] [datetime] NOT NULL CONSTRAINT [DF_Journal_UtcDate] DEFAULT (getutcdate()),
[SystemDate] [datetime] NOT NULL CONSTRAINT [DF_Journal_SystemDate] DEFAULT (getdate()),
[Task] [varchar] (128) NOT NULL CONSTRAINT [DF_Journal_Task] DEFAULT (''),
[FunctionName] [varchar] (256) NOT NULL,
[StepInFunction] [varchar] (128) NOT NULL,
[MessageText] [varchar] (512) NOT NULL,
[SeverityId] [int] NOT NULL,
[ExceptionId] [int] NULL,
[SessionId] [int] NOT NULL,
[ServerName] [nvarchar] (128) NOT NULL,
[DatabaseName] [nvarchar] (128) NOT NULL,
[HostName] [nvarchar] (128) NULL,
[ProgramName] [nvarchar] (128) NULL,
[NTDomain] [nvarchar] (128) NULL,
[NTUsername] [nvarchar] (128) NULL,
[LoginName] [nvarchar] (128) NULL,
[OriginalLoginName] [nvarchar] (128) NULL,
[SessionLoginTime] [datetime] NULL
)
GO
ALTER TABLE [log4Private].[Journal] ADD CONSTRAINT [PK_Journal] PRIMARY KEY CLUSTERED  ([JournalId])
GO
ALTER TABLE [log4Private].[Journal] ADD CONSTRAINT [FK_Journal_Severity] FOREIGN KEY ([SeverityId]) REFERENCES [log4Private].[Severity] ([SeverityId])
GO
ALTER TABLE [log4Private].[Journal] ADD CONSTRAINT [FK_Journal_SqlException] FOREIGN KEY ([ExceptionId]) REFERENCES [log4Private].[SqlException] ([ExceptionId])
GO
