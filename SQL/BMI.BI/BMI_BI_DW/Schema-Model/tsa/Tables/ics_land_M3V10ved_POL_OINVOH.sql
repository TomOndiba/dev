CREATE TABLE [tsa].[ics_land_M3V10ved_POL_OINVOH]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_land_ved_OINVOH_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_land_ved_OINVOH_IsDuplicate] DEFAULT ((0)),
[UH3RDP] [nchar] (10) NULL,
[UHACDT] [numeric] (8, 0) NULL,
[UHCASH] [numeric] (1, 0) NULL,
[UHCHID] [nchar] (10) NULL,
[UHCHNO] [numeric] (3, 0) NULL,
[UHCONO] [numeric] (3, 0) NULL,
[UHCUCD] [nchar] (3) NULL,
[UHDIVI] [nchar] (3) NULL,
[UHDUDT] [numeric] (8, 0) NULL,
[UHEXIN] [nchar] (14) NULL,
[UHFAC2] [nchar] (3) NULL,
[UHFACI] [nchar] (3) NULL,
[UHIDAT] [numeric] (8, 0) NULL,
[UHINPX] [nchar] (6) NULL,
[UHINRC] [nchar] (10) NULL,
[UHINST] [nchar] (2) NULL,
[UHIVAM] [numeric] (15, 2) NULL,
[UHIVLA] [numeric] (15, 2) NULL,
[UHIVNO] [numeric] (9, 0) NULL,
[UHIVTP] [nchar] (2) NULL,
[UHLMDT] [numeric] (8, 0) NULL,
[UHLMTS] [numeric] (18, 0) NULL,
[UHMUST] [numeric] (1, 0) NULL,
[UHNESI] [numeric] (1, 0) NULL,
[UHNREF] [nvarchar] (20) NULL,
[UHNVAT] [numeric] (1, 0) NULL,
[UHORIG] [numeric] (1, 0) NULL,
[UHPYNO] [nchar] (10) NULL,
[UHRAFC] [numeric] (15, 2) NULL,
[UHRAIN] [numeric] (11, 6) NULL,
[UHRALC] [numeric] (15, 2) NULL,
[UHRGDT] [numeric] (8, 0) NULL,
[UHRGTM] [numeric] (6, 0) NULL,
[UHRINP] [nchar] (6) NULL,
[UHRIVN] [numeric] (9, 0) NULL,
[UHRXIN] [nchar] (14) NULL,
[UHRYEA] [numeric] (4, 0) NULL,
[UHSBTO] [numeric] (1, 0) NULL,
[UHUPAC] [numeric] (1, 0) NULL,
[UHUPBC] [numeric] (1, 0) NULL,
[UHUPEC] [numeric] (1, 0) NULL,
[UHVONO] [numeric] (8, 0) NULL,
[UHVSER] [nchar] (3) NULL,
[UHYEA4] [numeric] (4, 0) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_OINVOH_1] ON [tsa].[ics_land_M3V10ved_POL_OINVOH] ([UHCONO], [UHDIVI], [UHINPX], [UHIVNO], [UHYEA4])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OINVOH', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OINVOH', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OINVOH', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OINVOH', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OINVOH', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OINVOH', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OINVOH', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OINVOH', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OINVOH', 'COLUMN', N'IsDuplicate'
GO
