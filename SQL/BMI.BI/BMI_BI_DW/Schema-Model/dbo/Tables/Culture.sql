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
EXEC sp_addextendedproperty N'MS_Description', N'This table has an entry for each language/culture. This supports product names and descriptions etc in different languages', 'SCHEMA', N'dbo', 'TABLE', N'Culture', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the current state record of the System/ISO Country in which this culture/language is used', 'SCHEMA', N'dbo', 'TABLE', N'Culture', 'COLUMN', N'CountryHistoryIdAsIs'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the DW-specific key of the System/ISO Country in which this culture/language is used', 'SCHEMA', N'dbo', 'TABLE', N'Culture', 'COLUMN', N'CountryKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N' DW-specific unique identifier for a change record in the history of data changes for a Culture.  Is unique across the entire table.', 'SCHEMA', N'dbo', 'TABLE', N'Culture', 'COLUMN', N'CultureHistoryId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Unique, standard .Net culture code that represents a particular language/culture as used in a particular country.', 'SCHEMA', N'dbo', 'TABLE', N'Culture', 'COLUMN', N'CultureInfoCode'
GO
EXEC sp_addextendedproperty N'MS_Description', N'DW-specific unique identifier for a culture/language', 'SCHEMA', N'dbo', 'TABLE', N'Culture', 'COLUMN', N'CultureKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ID of the ETL Batch that added or last updated this record – soft link back to the BAT_MAN database which supports the Batch Control Framework', 'SCHEMA', N'dbo', 'TABLE', N'Culture', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added.', 'SCHEMA', N'dbo', 'TABLE', N'Culture', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record', 'SCHEMA', N'dbo', 'TABLE', N'Culture', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last soft-delete of this record; will NOT be set back to null if this record is subsequently re-activated', 'SCHEMA', N'dbo', 'TABLE', N'Culture', 'COLUMN', N'EtlDeletedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last soft-deleted this record; will NOT be set back to null if this record is subsequently re-activated.', 'SCHEMA', N'dbo', 'TABLE', N'Culture', 'COLUMN', N'EtlDeletedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'An MD5 hash of all non-key, changeable values in this record - used by ETL processes to identify changed rows (included columns are defined within the ETL).', 'SCHEMA', N'dbo', 'TABLE', N'Culture', 'COLUMN', N'EtlDeltaHash'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record; will be the same as EtlCreatedBy when the record is first added', 'SCHEMA', N'dbo', 'TABLE', N'Culture', 'COLUMN', N'EtlUpdatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'dbo', 'TABLE', N'Culture', 'COLUMN', N'EtlUpdatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this row is the current version of a Culture change history.   Where Y indicates TRUE, N indicates FALSE and I indicates Excluded - typically whilst data is mid-load.', 'SCHEMA', N'dbo', 'TABLE', N'Culture', 'COLUMN', N'IsCurrent'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'dbo', 'TABLE', N'Culture', 'COLUMN', N'IsDeleted'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of this language applicable to this culture in English', 'SCHEMA', N'dbo', 'TABLE', N'Culture', 'COLUMN', N'LanguageNameEnglish'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of this language applicable to this culture in the local language (if available)', 'SCHEMA', N'dbo', 'TABLE', N'Culture', 'COLUMN', N'LanguageNameLocal'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The UTC date and time that this record was last touched by any process which includes but is not limited to the ETL process.  For example, this value would be updated if planned data migration release affects this record.', 'SCHEMA', N'dbo', 'TABLE', N'Culture', 'COLUMN', N'LastTouchedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Link to the DW-specific unique identifier for the previous data change history record (if any).', 'SCHEMA', N'dbo', 'TABLE', N'Culture', 'COLUMN', N'PreviousHistoryId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The UTC date and time from which this record was valid, defaults to UTC date and time of insert. On a row that represents a change, this value should be one second ahead of the Valid To Date/Time of the immediately preceding historic record for this entity instance.', 'SCHEMA', N'dbo', 'TABLE', N'Culture', 'COLUMN', N'ValidFromUTC'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The UTC date and time, up to which this record is valid, if the current record this will always be 00:00:00 on 31-Dec-9999.  In a non-current record, this value should be one second behind the Valid From point of immediately following historic record for this entity instance.', 'SCHEMA', N'dbo', 'TABLE', N'Culture', 'COLUMN', N'ValidToUTC'
GO
