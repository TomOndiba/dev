-- <Migration ID="9aff08b4-4ac5-4ddf-b933-117313d00da6" />
GO

PRINT N'Creating schemas'
GO
CREATE SCHEMA [log4]
AUTHORIZATION [dbo]
GO
CREATE SCHEMA [log4Private]
AUTHORIZATION [dbo]
GO
CREATE SCHEMA [log4Utils]
AUTHORIZATION [dbo]
GO
PRINT N'Creating [log4Private].[JournalControl]'
GO
CREATE TABLE [log4Private].[JournalControl]
(
[ModuleName] [varchar] (255) NOT NULL,
[OnOffSwitch] [varchar] (3) NOT NULL
)
GO
PRINT N'Creating primary key [PK_JournalControl] on [log4Private].[JournalControl]'
GO
ALTER TABLE [log4Private].[JournalControl] ADD CONSTRAINT [PK_JournalControl] PRIMARY KEY CLUSTERED  ([ModuleName])
GO
PRINT N'Creating [log4Private].[SqlException]'
GO
CREATE TABLE [log4Private].[SqlException]
(
[ExceptionId] [int] NOT NULL IDENTITY(1, 1),
[UtcDate] [datetime] NOT NULL CONSTRAINT [DF_SqlException_UtcDate] DEFAULT (getutcdate()),
[SystemDate] [datetime] NOT NULL CONSTRAINT [DF_SqlException_SystemDate] DEFAULT (getdate()),
[ErrorContext] [nvarchar] (512) NOT NULL,
[ErrorNumber] [int] NOT NULL,
[ErrorSeverity] [int] NOT NULL,
[ErrorState] [int] NOT NULL,
[ErrorProcedure] [nvarchar] (128) NOT NULL,
[ErrorLine] [int] NOT NULL,
[ErrorMessage] [nvarchar] (max) NOT NULL,
[ErrorDatabase] [nvarchar] (128) NOT NULL,
[SessionIdent] [int] NOT NULL,
[ServerName] [nvarchar] (128) NOT NULL,
[HostName] [nvarchar] (128) NOT NULL,
[ProgramName] [nvarchar] (128) NOT NULL,
[NTDomain] [nvarchar] (128) NOT NULL,
[NTUsername] [nvarchar] (128) NOT NULL,
[LoginName] [nvarchar] (128) NOT NULL,
[OriginalLoginName] [nvarchar] (128) NOT NULL,
[SessionLoginTime] [datetime] NULL
)
GO
PRINT N'Creating primary key [PK_SqlException] on [log4Private].[SqlException]'
GO
ALTER TABLE [log4Private].[SqlException] ADD CONSTRAINT [PK_SqlException] PRIMARY KEY CLUSTERED  ([ExceptionId])
GO
PRINT N'Creating [log4Private].[JournalDetail]'
GO
CREATE TABLE [log4Private].[JournalDetail]
(
[JournalId] [int] NOT NULL,
[ExtraInfo] [varchar] (max) NULL
)
GO
PRINT N'Creating primary key [PK_JournalDetail] on [log4Private].[JournalDetail]'
GO
ALTER TABLE [log4Private].[JournalDetail] ADD CONSTRAINT [PK_JournalDetail] PRIMARY KEY CLUSTERED  ([JournalId])
GO
PRINT N'Creating [log4Private].[Journal]'
GO
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
PRINT N'Creating primary key [PK_Journal] on [log4Private].[Journal]'
GO
ALTER TABLE [log4Private].[Journal] ADD CONSTRAINT [PK_Journal] PRIMARY KEY CLUSTERED  ([JournalId])
GO
PRINT N'Creating [log4Private].[Severity]'
GO
CREATE TABLE [log4Private].[Severity]
(
[SeverityId] [int] NOT NULL,
[SeverityName] [varchar] (128) NOT NULL
)
GO
PRINT N'Creating primary key [PK_Severity] on [log4Private].[Severity]'
GO
ALTER TABLE [log4Private].[Severity] ADD CONSTRAINT [PK_Severity] PRIMARY KEY CLUSTERED  ([SeverityId])
GO
PRINT N'Adding constraints to [log4Private].[Severity]'
GO
ALTER TABLE [log4Private].[Severity] ADD CONSTRAINT [UQ_Severity_SeverityName] UNIQUE NONCLUSTERED  ([SeverityName])
GO
PRINT N'Adding constraints to [log4Private].[JournalControl]'
GO
ALTER TABLE [log4Private].[JournalControl] ADD CONSTRAINT [CK_JournalControl_OnOffSwitch] CHECK (([OnOffSwitch]='OFF' OR [OnOffSwitch]='ON'))
GO
PRINT N'Adding foreign keys to [log4Private].[JournalDetail]'
GO
ALTER TABLE [log4Private].[JournalDetail] ADD CONSTRAINT [FK_JournalDetail_Journal] FOREIGN KEY ([JournalId]) REFERENCES [log4Private].[Journal] ([JournalId]) ON DELETE CASCADE
GO
PRINT N'Adding foreign keys to [log4Private].[Journal]'
GO
ALTER TABLE [log4Private].[Journal] ADD CONSTRAINT [FK_Journal_Severity] FOREIGN KEY ([SeverityId]) REFERENCES [log4Private].[Severity] ([SeverityId])
GO
ALTER TABLE [log4Private].[Journal] ADD CONSTRAINT [FK_Journal_SqlException] FOREIGN KEY ([ExceptionId]) REFERENCES [log4Private].[SqlException] ([ExceptionId])
GO
PRINT N'Altering permissions on SCHEMA:: [log4]'
GO
GRANT EXECUTE ON SCHEMA:: [log4] TO [public]
GO
PRINT N'Altering permissions on SCHEMA:: [log4Utils]'
GO
GRANT EXECUTE ON SCHEMA:: [log4Utils] TO [public]
GO
