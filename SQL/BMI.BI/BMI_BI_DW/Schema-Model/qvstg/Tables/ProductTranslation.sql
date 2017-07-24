CREATE TABLE [qvstg].[ProductTranslation]
(
[ProductTranslationId] [bigint] NOT NULL IDENTITY(1, 1),
[EtlDeltaHash] [char] (32) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[ProductKey] [int] NOT NULL,
[SourceCultureHistoryIdAsIs] [bigint] NOT NULL,
[SourceCountryHistoryIdAsIs] [bigint] NOT NULL,
[TranslationService] [nvarchar] (50) NOT NULL,
[TranslatedCultureHistoryIdAsIs] [bigint] NOT NULL,
[TranslationStatusId] [int] NOT NULL CONSTRAINT [DF_qvstg_ProductTranslation_TranslationStatusId] DEFAULT ((1)),
[NativeProductName] [nvarchar] (100) NULL,
[NativeProductTypeName] [nvarchar] (50) NULL,
[NativeProductDescription1] [nvarchar] (100) NULL,
[NativeProductDescription2] [nvarchar] (100) NULL,
[BrandNameFromWords] [nvarchar] (200) NULL,
[BrandNameFromSentence] [nvarchar] (200) NULL,
[BrandNameFromManualInput] [nvarchar] (200) NULL,
[ProductNameFromWords] [nvarchar] (200) NULL,
[ProductNameFromSentence] [nvarchar] (200) NULL,
[ProductNameFromManualInput] [nvarchar] (200) NULL,
[ProductTypeNameFromWords] [nvarchar] (50) NULL,
[ProductTypeNameFromSentence] [nvarchar] (50) NULL,
[ProductTypeNameFromManualInput] [nvarchar] (50) NULL,
[ProductDescriptionFromWords] [nvarchar] (500) NULL,
[ProductDescriptionFromSentence] [nvarchar] (500) NULL,
[ProductDescriptionFromManualInput] [nvarchar] (500) NULL,
[ColourFromWords] [nvarchar] (200) NULL,
[ColourFromSentence] [nvarchar] (200) NULL,
[ColourFromManualInput] [nvarchar] (200) NULL,
[MaterialFromWords] [nvarchar] (200) NULL,
[MaterialFromSentence] [nvarchar] (200) NULL,
[MaterialFromManualInput] [nvarchar] (200) NULL,
[SizeFromWords] [nvarchar] (200) NULL,
[SizeFromSentence] [nvarchar] (200) NULL,
[SizeFromManualInput] [nvarchar] (200) NULL
)
GO
ALTER TABLE [qvstg].[ProductTranslation] ADD CONSTRAINT [PK_qvstg_ProductTranslation] PRIMARY KEY CLUSTERED  ([ProductTranslationId])
GO
ALTER TABLE [qvstg].[ProductTranslation] ADD CONSTRAINT [AK_qvstg_ProductTranslation] UNIQUE NONCLUSTERED  ([ProductKey], [SourceCultureHistoryIdAsIs], [SourceCountryHistoryIdAsIs], [TranslationService], [TranslatedCultureHistoryIdAsIs])
GO
ALTER TABLE [qvstg].[ProductTranslation] ADD CONSTRAINT [FK_qvstg_ProductTranslation_Country_Source] FOREIGN KEY ([SourceCountryHistoryIdAsIs]) REFERENCES [dbo].[Country] ([CountryHistoryId])
GO
ALTER TABLE [qvstg].[ProductTranslation] ADD CONSTRAINT [FK_qvstg_ProductTranslation_Culture_Source] FOREIGN KEY ([SourceCultureHistoryIdAsIs]) REFERENCES [dbo].[Culture] ([CultureHistoryId])
GO
ALTER TABLE [qvstg].[ProductTranslation] ADD CONSTRAINT [FK_qvstg_ProductTranslation_Culture_Translated] FOREIGN KEY ([TranslatedCultureHistoryIdAsIs]) REFERENCES [dbo].[Culture] ([CultureHistoryId])
GO
ALTER TABLE [qvstg].[ProductTranslation] ADD CONSTRAINT [FK_qvstg_ProductTranslation_qvstg_Product] FOREIGN KEY ([ProductKey]) REFERENCES [qvstg].[Product] ([ProductKey])
GO
ALTER TABLE [qvstg].[ProductTranslation] ADD CONSTRAINT [FK_qvstg_ProductTranslation_TranslationStatus] FOREIGN KEY ([TranslationStatusId]) REFERENCES [dbo].[TranslationStatus] ([TranslationStatusId])
GO
