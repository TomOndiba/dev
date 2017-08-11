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
EXEC sp_addextendedproperty N'MS_Description', N'This table record all countries and related information. This also records any changes to the details of each country', 'SCHEMA', N'dbo', 'TABLE', N'Country', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N' DW-specific unique identifier for a change record in the history of data changes for a Country (of any type).  Is unique across the entire table.', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'CountryHistoryId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The DW-specific surrogate key that uniquely identifies a Country (of any type).  Only unique in this table in conjunction with  RowValidFromUTC/To.', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'CountryKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Descriptive name of Country in English', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'CountryNameEnglish'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Descriptive name of Country in the local language', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'CountryNameLocal'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL Batch that added or last updated this record – soft link back to the BAT_MAN database which supports the Batch Control Framework', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added.', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last soft-delete of this record; will NOT be set back to null if this record is subsequently re-activated', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'EtlDeletedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last soft-deleted this record; will NOT be set back to null if this record is subsequently re-activated.', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'EtlDeletedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'An MD5 hash of all non-key, changeable values in this record - used by ETL processes to identify changed rows (included columns are defined within the ETL).', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'EtlDeltaHash'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record; will be the same as EtlCreatedBy when the record is first added', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'EtlUpdatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'EtlUpdatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this row is the current version of a Country change history.   Where Y indicates TRUE, N indicates FALSE and I indicates Excluded - typically whilst data is mid-load.', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'IsCurrent'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'IsDeleted'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Unique ISO two-character abbreviation for country', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'ISO3166Alpha2Code'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Unique ISO three-character abbreviation for country', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'ISO3166Alpha3Code'
GO
EXEC sp_addextendedproperty N'MS_Description', N'ISO approved short form of country name ', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'ISO3166OfficialEnglishShortName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The UTC date and time that this record was last touched by any process which includes but is not limited to any ETL process.  For example, this value would be updated if planned data migration release affects this record.', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'LastTouchedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Link to the EDW-specific unique identifier for the previous data change history record (if any).', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'PreviousHistoryId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'BMI Business Region in which the Country is located', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'RegionCode'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The UTC date and time from which this record was valid, defaults to UTC date and time of insert. On a row that represents a change, this value should be one second ahead of the Valid To Date/Time of the immediately preceding historic record for this entity instance.', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'RowValidFromUTC'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The UTC date and time, up to which this record is valid, if the current record this will always be 00:00:00.000 on 31-Dec-9999.  In a non-current record, this value should be one second behind the Valid From point of immediately following historic record for this entity instance.', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'RowValidToUTC'
GO
