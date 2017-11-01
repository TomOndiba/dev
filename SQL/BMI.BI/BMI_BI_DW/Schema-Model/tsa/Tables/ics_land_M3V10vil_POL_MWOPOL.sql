CREATE TABLE [tsa].[ics_land_M3V10vil_POL_MWOPOL]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_vil_MWOPOL_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_vil_MWOPOL_IsDuplicate] DEFAULT ((0)),
[BHCHID] [nchar] (10) NULL,
[BHCHNO] [numeric] (3, 0) NULL,
[BHCOFA] [numeric] (15, 9) NULL,
[BHCONO] [numeric] (3, 0) NULL,
[BHDMCF] [numeric] (1, 0) NULL,
[BHEMNO] [nchar] (10) NULL,
[BHFACI] [nchar] (3) NULL,
[BHLMDT] [numeric] (8, 0) NULL,
[BHLMTS] [numeric] (18, 0) NULL,
[BHMAQA] [numeric] (15, 6) NULL,
[BHMAQT] [numeric] (15, 6) NULL,
[BHMAUN] [nchar] (3) NULL,
[BHMCPL] [numeric] (1, 0) NULL,
[BHMFNO] [numeric] (7, 0) NULL,
[BHOADS] [numeric] (1, 0) NULL,
[BHOPNO] [numeric] (4, 0) NULL,
[BHPLCF] [numeric] (1, 0) NULL,
[BHPLNO] [numeric] (10, 0) NULL,
[BHPLOA] [numeric] (15, 6) NULL,
[BHPLOB] [numeric] (15, 6) NULL,
[BHPRNO] [nchar] (15) NULL,
[BHREFD] [numeric] (8, 0) NULL,
[BHRGDT] [numeric] (8, 0) NULL,
[BHRGTM] [numeric] (6, 0) NULL,
[BHRSDT] [numeric] (8, 0) NULL,
[BHSCQA] [numeric] (15, 6) NULL,
[BHSCQT] [numeric] (15, 6) NULL,
[BHUMAS] [numeric] (7, 2) NULL,
[BHUMAT] [numeric] (7, 2) NULL,
[BHUPIT] [numeric] (7, 2) NULL,
[BHUSET] [numeric] (7, 2) NULL,
[BHWOSQ] [numeric] (9, 0) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_MWOPOL_1] ON [tsa].[ics_land_M3V10vil_POL_MWOPOL] ([BHCONO], [BHFACI], [BHPLNO], [BHWOSQ])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MWOPOL', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MWOPOL', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MWOPOL', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MWOPOL', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MWOPOL', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MWOPOL', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MWOPOL', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MWOPOL', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MWOPOL', 'COLUMN', N'IsDuplicate'
GO
