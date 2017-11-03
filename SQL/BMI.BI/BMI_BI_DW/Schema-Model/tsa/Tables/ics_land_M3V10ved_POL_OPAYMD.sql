CREATE TABLE [tsa].[ics_land_M3V10ved_POL_OPAYMD]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_land_ved_OPAYMD_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_land_ved_OPAYMD_IsDuplicate] DEFAULT ((0)),
[ULCHID] [nchar] (10) NULL,
[ULCHNO] [numeric] (3, 0) NULL,
[ULCONO] [numeric] (3, 0) NULL,
[ULCSHD] [nchar] (5) NULL,
[ULCUIN] [nchar] (3) NULL,
[ULDIVI] [nchar] (3) NULL,
[ULDUDT] [numeric] (8, 0) NULL,
[ULEXIN] [nchar] (14) NULL,
[ULIDAT] [numeric] (8, 0) NULL,
[ULINPX] [nchar] (6) NULL,
[ULIVNO] [numeric] (9, 0) NULL,
[ULLMDT] [numeric] (8, 0) NULL,
[ULPLNB] [numeric] (2, 0) NULL,
[ULPMAM] [numeric] (15, 2) NULL,
[ULPMIA] [numeric] (15, 2) NULL,
[ULPMLA] [numeric] (15, 2) NULL,
[ULPMNB] [numeric] (9, 0) NULL,
[ULRAIN] [numeric] (11, 6) NULL,
[ULRGDT] [numeric] (8, 0) NULL,
[ULRGTM] [numeric] (6, 0) NULL,
[ULYEA4] [numeric] (4, 0) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_OPAYMD_1] ON [tsa].[ics_land_M3V10ved_POL_OPAYMD] ([ULCONO], [ULINPX], [ULIVNO], [ULPLNB], [ULPMNB], [ULYEA4])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OPAYMD', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OPAYMD', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OPAYMD', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OPAYMD', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OPAYMD', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OPAYMD', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OPAYMD', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OPAYMD', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OPAYMD', 'COLUMN', N'IsDuplicate'
GO
