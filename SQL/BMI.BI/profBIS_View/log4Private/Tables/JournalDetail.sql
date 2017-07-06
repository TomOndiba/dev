CREATE TABLE [log4Private].[JournalDetail] (
    [JournalId] INT           NOT NULL,
    [ExtraInfo] VARCHAR (MAX) NULL,
    CONSTRAINT [PK_JournalDetail] PRIMARY KEY CLUSTERED ([JournalId] ASC) WITH (FILLFACTOR = 100),
    CONSTRAINT [FK_JournalDetail_Journal] FOREIGN KEY ([JournalId]) REFERENCES [log4Private].[Journal] ([JournalId]) ON DELETE CASCADE
);

