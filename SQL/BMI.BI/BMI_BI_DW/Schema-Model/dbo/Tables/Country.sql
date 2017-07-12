CREATE TABLE [dbo].[Country]
(
[CountryHistoryId] [bigint] NOT NULL CONSTRAINT [DF_Country_CountryHistoryId] DEFAULT (NEXT VALUE FOR [dbo].[ReferenceTypeHistorySequence]),
[CountryKey] [int] NOT NULL CONSTRAINT [DF_Country_CountryKey] DEFAULT (NEXT VALUE FOR [dbo].[ReferenceTypeKeySequence]),
[RowValidFromUTC] [datetime] NOT NULL CONSTRAINT [DF_Country_RowValidFromUTC] DEFAULT (getutcdate()),
[RowValidToUTC] [datetime] NOT NULL CONSTRAINT [DF_Country_RowValidToUTC] DEFAULT ('99991231 00:00:00'),
[IsCurrent] [char] (1) NOT NULL CONSTRAINT [DF_Country_IsCurrent] DEFAULT ('I'),
[PreviousHistoryId] [bigint] NULL,
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_Country_IsDeleted] DEFAULT ('N'),
[LastTouchedOn] [datetime] NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NULL,
[EtlDeletedBy] [varchar] (200) NULL,
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[EtlDeltaHash] [varchar] (100) NULL,
[ISO3166Alpha2Code] [char] (2) NOT NULL,
[ISO3166Alpha3Code] [char] (3) NOT NULL,
[ISO3166OfficialEnglishShortName] [varchar] (100) NOT NULL,
[CountryNameEnglish] [nvarchar] (200) NULL,
[CountryNameLocal] [nvarchar] (200) NOT NULL,
[RegionCode] [varchar] (4) NOT NULL
)
GO
ALTER TABLE [dbo].[Country] ADD CONSTRAINT [CK_Country_IsCurrent] CHECK (([IsCurrent]='N' OR [IsCurrent]='Y' OR [IsCurrent]='I'))
GO
ALTER TABLE [dbo].[Country] ADD CONSTRAINT [CK_Country_IsDeleted] CHECK (([IsDeleted]='N' OR [IsDeleted]='Y'))
GO
ALTER TABLE [dbo].[Country] ADD CONSTRAINT [CK_Country_RowValidFromUTC_LessThan_RowValidToUTC] CHECK (([RowValidFromUTC]<[RowValidToUTC]))
GO
ALTER TABLE [dbo].[Country] ADD CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED  ([CountryHistoryId])
GO
ALTER TABLE [dbo].[Country] ADD CONSTRAINT [AK_Country_CountryKey_RowValidFromUTC] UNIQUE NONCLUSTERED  ([CountryKey], [RowValidFromUTC])
GO
ALTER TABLE [dbo].[Country] ADD CONSTRAINT [AK_Country_CountryKey_RowValidToUTC] UNIQUE NONCLUSTERED  ([CountryKey], [RowValidToUTC], [IsCurrent])
GO
ALTER TABLE [dbo].[Country] ADD CONSTRAINT [AK_Country_ISO3166Alpha2Code_RowValidToUTC] UNIQUE NONCLUSTERED  ([ISO3166Alpha2Code], [RowValidToUTC], [IsCurrent])
GO
ALTER TABLE [dbo].[Country] ADD CONSTRAINT [AK_Country_ISO3166Alpha3Code_RowValidToUTC] UNIQUE NONCLUSTERED  ([ISO3166Alpha3Code], [RowValidToUTC], [IsCurrent])
GO
ALTER TABLE [dbo].[Country] ADD CONSTRAINT [FK_Country_Country] FOREIGN KEY ([PreviousHistoryId]) REFERENCES [dbo].[Country] ([CountryHistoryId])
GO
