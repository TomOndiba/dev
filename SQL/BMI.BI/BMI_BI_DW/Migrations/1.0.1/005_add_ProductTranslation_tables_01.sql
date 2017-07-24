-- <Migration ID="f8a0c4bf-ceb2-464c-b2ab-043f731d7152" />
go

print N'Creating [qvstg].[ProductTranslation]'
go
create table [qvstg].[ProductTranslation]
(
[ProductTranslationId] [bigint] not null identity(1, 1),
[EtlDeltaHash] [char] (32) not null,
[EtlCreatedOn] [datetime] not null,
[EtlCreatedBy] [varchar] (200) not null,
[EtlUpdatedOn] [datetime] not null,
[EtlUpdatedBy] [varchar] (200) not null,
[ProductKey] [int] not null,
[SourceCultureHistoryIdAsIs] [bigint] not null,
[SourceCountryHistoryIdAsIs] [bigint] not null,
[TranslationService] [nvarchar] (50) not null,
[TranslatedCultureHistoryIdAsIs] [bigint] not null,
[TranslationStatusId] [int] not null constraint [DF_qvstg_ProductTranslation_TranslationStatusId] default ((1)),
[NativeProductName] [nvarchar] (100) null,
[NativeProductTypeName] [nvarchar] (50) null,
[NativeProductDescription1] [nvarchar] (100) null,
[NativeProductDescription2] [nvarchar] (100) null,
[BrandNameFromWords] [nvarchar] (200) null,
[BrandNameFromSentence] [nvarchar] (200) null,
[BrandNameFromManualInput] [nvarchar] (200) null,
[ProductNameFromWords] [nvarchar] (200) null,
[ProductNameFromSentence] [nvarchar] (200) null,
[ProductNameFromManualInput] [nvarchar] (200) null,
[ProductTypeNameFromWords] [nvarchar] (50) null,
[ProductTypeNameFromSentence] [nvarchar] (50) null,
[ProductTypeNameFromManualInput] [nvarchar] (50) null,
[ProductDescriptionFromWords] [nvarchar] (500) null,
[ProductDescriptionFromSentence] [nvarchar] (500) null,
[ProductDescriptionFromManualInput] [nvarchar] (500) null,
[ColourFromWords] [nvarchar] (200) null,
[ColourFromSentence] [nvarchar] (200) null,
[ColourFromManualInput] [nvarchar] (200) null,
[MaterialFromWords] [nvarchar] (200) null,
[MaterialFromSentence] [nvarchar] (200) null,
[MaterialFromManualInput] [nvarchar] (200) null,
[SizeFromWords] [nvarchar] (200) null,
[SizeFromSentence] [nvarchar] (200) null,
[SizeFromManualInput] [nvarchar] (200) null
)
go
print N'Creating primary key [PK_qvstg_ProductTranslation] on [qvstg].[ProductTranslation]'
go
alter table [qvstg].[ProductTranslation] add constraint [PK_qvstg_ProductTranslation] primary key clustered  ([ProductTranslationId])
go
print N'Adding constraints to [qvstg].[ProductTranslation]'
go
alter table [qvstg].[ProductTranslation] add constraint [AK_qvstg_ProductTranslation] unique nonclustered  ([ProductKey], [SourceCultureHistoryIdAsIs], [SourceCountryHistoryIdAsIs], [TranslationService], [TranslatedCultureHistoryIdAsIs])
go
print N'Creating [qvstg].[ProductColourTranslation]'
go
create table [qvstg].[ProductColourTranslation]
(
[ProductColourTranslationId] [bigint] not null identity(1, 1),
[EtlDeltaHash] [char] (32) not null,
[EtlCreatedOn] [datetime] not null,
[EtlCreatedBy] [varchar] (200) not null,
[EtlUpdatedOn] [datetime] not null,
[EtlUpdatedBy] [varchar] (200) not null,
[UserUpdatedOn] [datetime] null,
[UserUpdatedBy] [varchar] (200) null,
[UserApprovedOn] [datetime] null,
[UserApprovedBy] [varchar] (200) null,
[ProductKey] [int] not null,
[SourceCultureHistoryIdAsIs] [bigint] not null,
[SourceCountryHistoryIdAsIs] [bigint] not null,
[TranslationService] [nvarchar] (50) not null,
[TranslatedCultureHistoryIdAsIs] [bigint] not null,
[TranslationStatusId] [int] not null constraint [DF_qvstg_ProductColourTranslation_TranslationStatusId] default ((1)),
[ExtractColourName] [nvarchar] (100) null,
[ColourFromWords] [nvarchar] (200) null,
[ColourFromSentence] [nvarchar] (200) null,
[ColourFromManualInput] [nvarchar] (200) null,
[OtherColour01] [nvarchar] (200) null,
[OtherColour02] [nvarchar] (200) null,
[OtherColour03] [nvarchar] (200) null,
[OtherColour04] [nvarchar] (200) null,
[OtherColour05] [nvarchar] (200) null,
[OtherColour06] [nvarchar] (200) null,
[OtherColour07] [nvarchar] (200) null,
[OtherColour08] [nvarchar] (200) null,
[OtherColour09] [nvarchar] (200) null,
[OtherColour10] [nvarchar] (200) null
)
go
print N'Creating primary key [PK_qvstg_ProductColourTranslation] on [qvstg].[ProductColourTranslation]'
go
alter table [qvstg].[ProductColourTranslation] add constraint [PK_qvstg_ProductColourTranslation] primary key clustered  ([ProductColourTranslationId])
go
print N'Adding constraints to [qvstg].[ProductColourTranslation]'
go
alter table [qvstg].[ProductColourTranslation] add constraint [AK_qvstg_ProductColourTranslation] unique nonclustered  ([ProductKey], [SourceCultureHistoryIdAsIs], [SourceCountryHistoryIdAsIs], [TranslationService], [TranslatedCultureHistoryIdAsIs])
go
print N'Creating [dbo].[TranslationStatus]'
go
create table [dbo].[TranslationStatus]
(
[TranslationStatusId] [int] not null,
[TranslationStatusName] [varchar] (50) not null,
[Narrative] [varchar] (500) not null
)
go
print N'Creating primary key [PK_TranslationStatus] on [dbo].[TranslationStatus]'
go
alter table [dbo].[TranslationStatus] add constraint [PK_TranslationStatus] primary key clustered  ([TranslationStatusId])
go
print N'Adding constraints to [dbo].[TranslationStatus]'
go
alter table [dbo].[TranslationStatus] add constraint [AK_TranslationStatus] unique nonclustered  ([TranslationStatusName])
go
print N'Adding foreign keys to [qvstg].[ProductColourTranslation]'
go
alter table [qvstg].[ProductColourTranslation] add constraint [FK_qvstg_ProductColourTranslation_TranslationStatus] foreign key ([TranslationStatusId]) references [dbo].[TranslationStatus] ([TranslationStatusId])
go
alter table [qvstg].[ProductColourTranslation] add constraint [FK_qvstg_ProductColourTranslation_qvstg_Product] foreign key ([ProductKey]) references [qvstg].[Product] ([ProductKey])
go
alter table [qvstg].[ProductColourTranslation] add constraint [FK_qvstg_ProductColourTranslation_Culture_Source] foreign key ([SourceCultureHistoryIdAsIs]) references [dbo].[Culture] ([CultureHistoryId])
go
alter table [qvstg].[ProductColourTranslation] add constraint [FK_qvstg_ProductColourTranslation_Country_Source] foreign key ([SourceCountryHistoryIdAsIs]) references [dbo].[Country] ([CountryHistoryId])
go
alter table [qvstg].[ProductColourTranslation] add constraint [FK_qvstg_ProductColourTranslation_Culture_Translated] foreign key ([TranslatedCultureHistoryIdAsIs]) references [dbo].[Culture] ([CultureHistoryId])
go
print N'Adding foreign keys to [qvstg].[ProductTranslation]'
go
alter table [qvstg].[ProductTranslation] add constraint [FK_qvstg_ProductTranslation_TranslationStatus] foreign key ([TranslationStatusId]) references [dbo].[TranslationStatus] ([TranslationStatusId])
go
alter table [qvstg].[ProductTranslation] add constraint [FK_qvstg_ProductTranslation_qvstg_Product] foreign key ([ProductKey]) references [qvstg].[Product] ([ProductKey])
go
alter table [qvstg].[ProductTranslation] add constraint [FK_qvstg_ProductTranslation_Culture_Source] foreign key ([SourceCultureHistoryIdAsIs]) references [dbo].[Culture] ([CultureHistoryId])
go
alter table [qvstg].[ProductTranslation] add constraint [FK_qvstg_ProductTranslation_Country_Source] foreign key ([SourceCountryHistoryIdAsIs]) references [dbo].[Country] ([CountryHistoryId])
go
alter table [qvstg].[ProductTranslation] add constraint [FK_qvstg_ProductTranslation_Culture_Translated] foreign key ([TranslatedCultureHistoryIdAsIs]) references [dbo].[Culture] ([CultureHistoryId])
go
