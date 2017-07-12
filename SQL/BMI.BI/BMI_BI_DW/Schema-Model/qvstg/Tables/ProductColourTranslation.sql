CREATE TABLE [qvstg].[ProductColourTranslation]
(
[ProductColourTranslationId] [bigint] NOT NULL IDENTITY(1, 1),
[EtlDeltaHash] [char] (32) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[UserUpdatedOn] [datetime] NULL,
[UserUpdatedBy] [varchar] (200) NULL,
[UserApprovedOn] [datetime] NULL,
[UserApprovedBy] [varchar] (200) NULL,
[ProductKey] [int] NOT NULL,
[SourceCultureHistoryIdAsIs] [bigint] NOT NULL,
[SourceCountryHistoryIdAsIs] [bigint] NOT NULL,
[TranslationService] [nvarchar] (50) NOT NULL,
[TranslatedCultureHistoryIdAsIs] [bigint] NOT NULL,
[TranslationStatusId] [int] NOT NULL CONSTRAINT [DF_qvstg_ProductColourTranslation_TranslationStatusId] DEFAULT ((1)),
[ExtractColourName] [nvarchar] (100) NULL,
[ColourFromWords] [nvarchar] (200) NULL,
[ColourFromSentence] [nvarchar] (200) NULL,
[ColourFromManualInput] [nvarchar] (200) NULL,
[OtherColour01] [nvarchar] (200) NULL,
[OtherColour02] [nvarchar] (200) NULL,
[OtherColour03] [nvarchar] (200) NULL,
[OtherColour04] [nvarchar] (200) NULL,
[OtherColour05] [nvarchar] (200) NULL,
[OtherColour06] [nvarchar] (200) NULL,
[OtherColour07] [nvarchar] (200) NULL,
[OtherColour08] [nvarchar] (200) NULL,
[OtherColour09] [nvarchar] (200) NULL,
[OtherColour10] [nvarchar] (200) NULL
)
GO
ALTER TABLE [qvstg].[ProductColourTranslation] ADD CONSTRAINT [PK_qvstg_ProductColourTranslation] PRIMARY KEY CLUSTERED  ([ProductColourTranslationId])
GO
ALTER TABLE [qvstg].[ProductColourTranslation] ADD CONSTRAINT [AK_qvstg_ProductColourTranslation] UNIQUE NONCLUSTERED  ([ProductKey], [SourceCultureHistoryIdAsIs], [SourceCountryHistoryIdAsIs], [TranslationService], [TranslatedCultureHistoryIdAsIs])
GO
ALTER TABLE [qvstg].[ProductColourTranslation] ADD CONSTRAINT [FK_qvstg_ProductColourTranslation_Country_Source] FOREIGN KEY ([SourceCountryHistoryIdAsIs]) REFERENCES [dbo].[Country] ([CountryHistoryId])
GO
ALTER TABLE [qvstg].[ProductColourTranslation] ADD CONSTRAINT [FK_qvstg_ProductColourTranslation_Culture_Source] FOREIGN KEY ([SourceCultureHistoryIdAsIs]) REFERENCES [dbo].[Culture] ([CultureHistoryId])
GO
ALTER TABLE [qvstg].[ProductColourTranslation] ADD CONSTRAINT [FK_qvstg_ProductColourTranslation_Culture_Translated] FOREIGN KEY ([TranslatedCultureHistoryIdAsIs]) REFERENCES [dbo].[Culture] ([CultureHistoryId])
GO
ALTER TABLE [qvstg].[ProductColourTranslation] ADD CONSTRAINT [FK_qvstg_ProductColourTranslation_qvstg_Product] FOREIGN KEY ([ProductKey]) REFERENCES [qvstg].[Product] ([ProductKey])
GO
ALTER TABLE [qvstg].[ProductColourTranslation] ADD CONSTRAINT [FK_qvstg_ProductColourTranslation_TranslationStatus] FOREIGN KEY ([TranslationStatusId]) REFERENCES [dbo].[TranslationStatus] ([TranslationStatusId])
GO
