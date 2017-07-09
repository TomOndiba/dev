CREATE TABLE [log4Private].[Severity]
(
[SeverityId] [int] NOT NULL,
[SeverityName] [varchar] (128) NOT NULL
)
GO
ALTER TABLE [log4Private].[Severity] ADD CONSTRAINT [PK_Severity] PRIMARY KEY CLUSTERED  ([SeverityId])
GO
ALTER TABLE [log4Private].[Severity] ADD CONSTRAINT [UQ_Severity_SeverityName] UNIQUE NONCLUSTERED  ([SeverityName])
GO
