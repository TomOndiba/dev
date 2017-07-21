-- <Migration ID="1a402813-d7d3-4872-a90d-0df61ef4ae47" />
go

print N'Creating [dbo].[Country]'
go
create table [dbo].[Country]
(
[CountryHistoryId] [bigint] not null constraint [DF_Country_CountryHistoryId] default (next value for [dbo].[ReferenceTypeHistorySequence]),
[CountryKey] [int] not null constraint [DF_Country_CountryKey] default (next value for [dbo].[ReferenceTypeKeySequence]),
[RowValidFromUTC] [datetime] not null constraint [DF_Country_RowValidFromUTC] default (getutcdate()),
[RowValidToUTC] [datetime] not null constraint [DF_Country_RowValidToUTC] default ('99991231 00:00:00'),
[IsCurrent] [char] (1) not null constraint [DF_Country_IsCurrent] default ('I'),
[PreviousHistoryId] [bigint] null,
[IsDeleted] [char] (1) not null constraint [DF_Country_IsDeleted] default ('N'),
[LastTouchedOn] [datetime] not null,
[EtlCreatedOn] [datetime] not null,
[EtlCreatedBy] [varchar] (200) not null,
[EtlUpdatedOn] [datetime] not null,
[EtlUpdatedBy] [varchar] (200) not null,
[EtlDeletedOn] [datetime] null,
[EtlDeletedBy] [varchar] (200) null,
[EtlBatchRunId] [int] not null,
[EtlStepRunId] [int] not null,
[EtlThreadRunId] [int] not null,
[EtlDeltaHash] [varchar] (100) null,
[ISO3166Alpha2Code] [char] (2) not null,
[ISO3166Alpha3Code] [char] (3) not null,
[ISO3166OfficialEnglishShortName] [varchar] (100) not null,
[CountryNameEnglish] [nvarchar] (200) null,
[CountryNameLocal] [nvarchar] (200) not null,
[RegionCode] [varchar] (4) not null
)
go
print N'Creating primary key [PK_Country] on [dbo].[Country]'
go
alter table [dbo].[Country] add constraint [PK_Country] primary key clustered  ([CountryHistoryId])
go
print N'Adding constraints to [dbo].[Country]'
go
alter table [dbo].[Country] add constraint [AK_Country_CountryKey_RowValidFromUTC] unique nonclustered  ([CountryKey], [RowValidFromUTC])
go
print N'Adding constraints to [dbo].[Country]'
go
alter table [dbo].[Country] add constraint [AK_Country_CountryKey_RowValidToUTC] unique nonclustered  ([CountryKey], [RowValidToUTC], [IsCurrent])
go
print N'Adding constraints to [dbo].[Country]'
go
alter table [dbo].[Country] add constraint [AK_Country_ISO3166Alpha2Code_RowValidToUTC] unique nonclustered  ([ISO3166Alpha2Code], [RowValidToUTC], [IsCurrent])
go
print N'Adding constraints to [dbo].[Country]'
go
alter table [dbo].[Country] add constraint [AK_Country_ISO3166Alpha3Code_RowValidToUTC] unique nonclustered  ([ISO3166Alpha3Code], [RowValidToUTC], [IsCurrent])
go
print N'Adding constraints to [dbo].[Country]'
go
alter table [dbo].[Country] add constraint [CK_Country_IsCurrent] check (([IsCurrent]='N' or [IsCurrent]='Y' or [IsCurrent]='I'))
go
alter table [dbo].[Country] add constraint [CK_Country_IsDeleted] check (([IsDeleted]='N' or [IsDeleted]='Y'))
go
alter table [dbo].[Country] add constraint [CK_Country_RowValidFromUTC_LessThan_RowValidToUTC] check (([RowValidFromUTC]<[RowValidToUTC]))
go
print N'Adding foreign keys to [dbo].[Country]'
go
alter table [dbo].[Country] add constraint [FK_Country_Country] foreign key ([PreviousHistoryId]) references [dbo].[Country] ([CountryHistoryId])
go

exec sp_addextendedproperty N'MS_Description', N'This table record all countries and related information. This also records any changes to the details of each country', 'SCHEMA', N'dbo', 'TABLE', N'Country', null, null
go
exec sp_addextendedproperty N'MS_Description', N' DW-specific unique identifier for a change record in the history of data changes for a Country (of any type).  Is unique across the entire table.', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'CountryHistoryId'
go
exec sp_addextendedproperty N'MS_Description', N'The DW-specific surrogate key that uniquely identifies a Country (of any type).  Only unique in this table in conjunction with  RowValidFromUTC/To.', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'CountryKey'
go
exec sp_addextendedproperty N'MS_Description', N'Descriptive name of Country in English', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'CountryNameEnglish'
go
exec sp_addextendedproperty N'MS_Description', N'Descriptive name of Country in the local language', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'CountryNameLocal'
go
exec sp_addextendedproperty N'MS_Description', N'The ETL Batch that added or last updated this record – soft link back to the BAT_MAN database which supports the Batch Control Framework', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'EtlBatchRunId'
go
exec sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added.', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'EtlCreatedBy'
go
exec sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'EtlCreatedOn'
go
exec sp_addextendedproperty N'MS_Description', N'An MD5 hash of all non-key, changeable values in this record - used by ETL processes to identify changed rows (included columns are defined within the ETL).', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'EtlDeltaHash'
go
exec sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record; will be the same as EtlCreatedBy when the record is first added', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'EtlUpdatedBy'
go
exec sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'EtlUpdatedOn'
go
exec sp_addextendedproperty N'MS_Description', N'Indicates that this row is the current version of a Country change history.   Where Y indicates TRUE, N indicates FALSE and I indicates Excluded - typically whilst data is mid-load.', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'IsCurrent'
go
exec sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'IsDeleted'
go
exec sp_addextendedproperty N'MS_Description', N'Unique ISO two-character abbreviation for country', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'ISO3166Alpha2Code'
go
exec sp_addextendedproperty N'MS_Description', N'Unique ISO three-character abbreviation for country', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'ISO3166Alpha3Code'
go
exec sp_addextendedproperty N'MS_Description', N'ISO approved short form of country name ', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'ISO3166OfficialEnglishShortName'
go
exec sp_addextendedproperty N'MS_Description', N'The UTC date and time that this record was last touched by any process which includes but is not limited to any ETL process.  For example, this value would be updated if planned data migration release affects this record.', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'LastTouchedOn'
go
exec sp_addextendedproperty N'MS_Description', N'Link to the EDW-specific unique identifier for the previous data change history record (if any).', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'PreviousHistoryId'
go
exec sp_addextendedproperty N'MS_Description', N'BMI Business Region in which the Country is located', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'RegionCode'
go
exec sp_addextendedproperty N'MS_Description', N'The UTC date and time from which this record was valid, defaults to UTC date and time of insert. On a row that represents a change, this value should be one second ahead of the Valid To Date/Time of the immediately preceding historic record for this entity instance.', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'RowValidFromUTC'
go
exec sp_addextendedproperty N'MS_Description', N'The UTC date and time, up to which this record is valid, if the current record this will always be 00:00:00.000 on 31-Dec-9999.  In a non-current record, this value should be one second behind the Valid From point of immediately following historic record for this entity instance.', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'RowValidToUTC'
go
exec sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last soft-delete of this record; will NOT be set back to null if this record is subsequently re-activated', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'EtlDeletedBy'
go
exec sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last soft-deleted this record; will NOT be set back to null if this record is subsequently re-activated.', 'SCHEMA', N'dbo', 'TABLE', N'Country', 'COLUMN', N'EtlDeletedOn'
go
