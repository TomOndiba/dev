CREATE TABLE [dbo].[Culture]
(
[CultureHistoryId] [bigint] NOT NULL CONSTRAINT [DF_Culture_CultureHistoryId] DEFAULT (NEXT VALUE FOR [dbo].[ReferenceTypeHistorySequence]),
[CultureKey] [int] NOT NULL CONSTRAINT [DF_Culture_CultureKey] DEFAULT (NEXT VALUE FOR [dbo].[ReferenceTypeKeySequence]),
[ValidFromUTC] [datetime] NOT NULL CONSTRAINT [DF_Culture_ValidFromUTC] DEFAULT (getutcdate()),
[ValidToUTC] [datetime] NOT NULL CONSTRAINT [DF_Culture_ValidToUTC] DEFAULT ('99991231 00:00:00'),
[IsCurrent] [char] (1) NOT NULL CONSTRAINT [DF_Culture_IsCurrent] DEFAULT ('I'),
[PreviousHistoryId] [bigint] NULL,
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_Culture_IsDeleted] DEFAULT ('N'),
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
[CultureInfoCode] [varchar] (20) NOT NULL,
[LanguageNameEnglish] [varchar] (100) NOT NULL,
[LanguageNameLocal] [nvarchar] (100) NULL,
[CountryKey] [int] NOT NULL,
[CountryHistoryIdAsIs] [bigint] NOT NULL
)
GO
ALTER TABLE [dbo].[Culture] ADD CONSTRAINT [CK_Culture_IsCurrent] CHECK (([IsCurrent]='N' OR [IsCurrent]='Y' OR [IsCurrent]='I'))
GO
ALTER TABLE [dbo].[Culture] ADD CONSTRAINT [CK_Culture_IsDeleted] CHECK (([IsDeleted]='N' OR [IsDeleted]='Y'))
GO
ALTER TABLE [dbo].[Culture] ADD CONSTRAINT [CK_Culture_ValidFromUTC_LessThan_ValidToUTC] CHECK (([ValidFromUTC]<[ValidToUTC]))
GO
ALTER TABLE [dbo].[Culture] ADD CONSTRAINT [PK_Culture] PRIMARY KEY CLUSTERED  ([CultureHistoryId])
GO
ALTER TABLE [dbo].[Culture] ADD CONSTRAINT [AK_Culture_CultureInfoCode_ValidFromUTC] UNIQUE NONCLUSTERED  ([CultureInfoCode], [ValidFromUTC])
GO
ALTER TABLE [dbo].[Culture] ADD CONSTRAINT [AK_Culture_CultureInfoCode_ValidToUTC] UNIQUE NONCLUSTERED  ([CultureInfoCode], [ValidToUTC], [IsCurrent])
GO
ALTER TABLE [dbo].[Culture] ADD CONSTRAINT [AK_Culture_CultureKey_ValidFromUTC] UNIQUE NONCLUSTERED  ([CultureKey], [ValidFromUTC])
GO
ALTER TABLE [dbo].[Culture] ADD CONSTRAINT [AK_Culture_CultureKey_ValidToUTC] UNIQUE NONCLUSTERED  ([CultureKey], [ValidToUTC], [IsCurrent])
GO
ALTER TABLE [dbo].[Culture] ADD CONSTRAINT [FK_Culture_Country_AsIs] FOREIGN KEY ([CountryHistoryIdAsIs]) REFERENCES [dbo].[Country] ([CountryHistoryId])
GO
ALTER TABLE [dbo].[Culture] ADD CONSTRAINT [FK_Culture_Culture] FOREIGN KEY ([PreviousHistoryId]) REFERENCES [dbo].[Culture] ([CultureHistoryId])
GO
