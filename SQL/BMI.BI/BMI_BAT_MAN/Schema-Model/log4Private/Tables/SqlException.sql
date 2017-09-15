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
ALTER TABLE [log4Private].[SqlException] ADD CONSTRAINT [PK_SqlException] PRIMARY KEY CLUSTERED  ([ExceptionId])
GO
