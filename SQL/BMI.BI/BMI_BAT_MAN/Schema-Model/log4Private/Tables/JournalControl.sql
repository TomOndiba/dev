CREATE TABLE [log4Private].[JournalControl]
(
[ModuleName] [varchar] (255) NOT NULL,
[OnOffSwitch] [varchar] (3) NOT NULL
)
GO
ALTER TABLE [log4Private].[JournalControl] ADD CONSTRAINT [CK_JournalControl_OnOffSwitch] CHECK (([OnOffSwitch]='OFF' OR [OnOffSwitch]='ON'))
GO
ALTER TABLE [log4Private].[JournalControl] ADD CONSTRAINT [PK_JournalControl] PRIMARY KEY CLUSTERED  ([ModuleName])
GO
