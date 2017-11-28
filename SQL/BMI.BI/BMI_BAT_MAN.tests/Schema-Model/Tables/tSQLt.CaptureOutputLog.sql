CREATE TABLE [tSQLt].[CaptureOutputLog]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[OutputText] [nvarchar] (max) NULL
)
GO
ALTER TABLE [tSQLt].[CaptureOutputLog] ADD CONSTRAINT [PK_CaptureOutputLog] PRIMARY KEY CLUSTERED  ([Id])
GO
