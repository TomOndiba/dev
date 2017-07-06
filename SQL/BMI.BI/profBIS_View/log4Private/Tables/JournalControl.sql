CREATE TABLE [log4Private].[JournalControl] (
    [ModuleName]  VARCHAR (255) NOT NULL,
    [OnOffSwitch] VARCHAR (3)   NOT NULL,
    CONSTRAINT [PK_JournalControl] PRIMARY KEY CLUSTERED ([ModuleName] ASC) WITH (FILLFACTOR = 100),
    CONSTRAINT [CK_JournalControl_OnOffSwitch] CHECK ([OnOffSwitch]='OFF' OR [OnOffSwitch]='ON')
);

