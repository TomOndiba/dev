CREATE TABLE [log4Private].[JournalDetail]
(
[JournalId] [int] NOT NULL,
[ExtraInfo] [varchar] (max) NULL
)
GO
ALTER TABLE [log4Private].[JournalDetail] ADD CONSTRAINT [PK_JournalDetail] PRIMARY KEY CLUSTERED  ([JournalId])
GO
ALTER TABLE [log4Private].[JournalDetail] ADD CONSTRAINT [FK_JournalDetail_Journal] FOREIGN KEY ([JournalId]) REFERENCES [log4Private].[Journal] ([JournalId]) ON DELETE CASCADE
GO
