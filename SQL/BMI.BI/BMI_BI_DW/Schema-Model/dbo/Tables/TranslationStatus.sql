CREATE TABLE [dbo].[TranslationStatus]
(
[TranslationStatusId] [int] NOT NULL,
[TranslationStatusName] [varchar] (50) NOT NULL,
[Narrative] [varchar] (500) NOT NULL
)
GO
ALTER TABLE [dbo].[TranslationStatus] ADD CONSTRAINT [PK_TranslationStatus] PRIMARY KEY CLUSTERED  ([TranslationStatusId])
GO
ALTER TABLE [dbo].[TranslationStatus] ADD CONSTRAINT [AK_TranslationStatus] UNIQUE NONCLUSTERED  ([TranslationStatusName])
GO
