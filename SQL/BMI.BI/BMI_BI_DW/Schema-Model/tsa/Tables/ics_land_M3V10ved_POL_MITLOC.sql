CREATE TABLE [tsa].[ics_land_M3V10ved_POL_MITLOC]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_land_ved_MITLOC_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_land_ved_MITLOC_IsDuplicate] DEFAULT ((0)),
[MLACUQ] [numeric] (15, 6) NULL,
[MLACUW] [numeric] (15, 6) NULL,
[MLADJW] [numeric] (15, 6) NULL,
[MLALOC] [numeric] (1, 0) NULL,
[MLALQT] [numeric] (15, 6) NULL,
[MLATNR] [numeric] (17, 0) NULL,
[MLATV1] [nchar] (15) NULL,
[MLATV2] [nchar] (15) NULL,
[MLATV3] [nchar] (15) NULL,
[MLATV4] [nchar] (15) NULL,
[MLATV5] [nchar] (15) NULL,
[MLAUDD] [numeric] (3, 0) NULL,
[MLAUDE] [numeric] (1, 0) NULL,
[MLBANO] [nvarchar] (20) NULL,
[MLBRE2] [nvarchar] (20) NULL,
[MLBREF] [nvarchar] (20) NULL,
[MLBREM] [nvarchar] (20) NULL,
[MLCAMU] [nvarchar] (20) NULL,
[MLCANB] [numeric] (17, 0) NULL,
[MLCAWE] [numeric] (15, 6) NULL,
[MLCHID] [nchar] (10) NULL,
[MLCHNO] [numeric] (3, 0) NULL,
[MLCNDT] [numeric] (8, 0) NULL,
[MLCONO] [numeric] (3, 0) NULL,
[MLDTID] [numeric] (13, 0) NULL,
[MLFACI] [nchar] (3) NULL,
[MLFIFL] [numeric] (1, 0) NULL,
[MLIDDT] [numeric] (8, 0) NULL,
[MLINCW] [numeric] (15, 6) NULL,
[MLINDT] [numeric] (8, 0) NULL,
[MLINON] [numeric] (1, 0) NULL,
[MLINVC] [numeric] (1, 0) NULL,
[MLIQTY] [numeric] (15, 6) NULL,
[MLITNO] [nchar] (15) NULL,
[MLLMDT] [numeric] (8, 0) NULL,
[MLLMTS] [numeric] (18, 0) NULL,
[MLODDT] [numeric] (8, 0) NULL,
[MLOPAN] [nvarchar] (20) NULL,
[MLPACT] [nchar] (6) NULL,
[MLPLQT] [numeric] (15, 6) NULL,
[MLPOCY] [numeric] (5, 2) NULL,
[MLPPRI] [nchar] (1) NULL,
[MLPRDT] [numeric] (8, 0) NULL,
[MLPUAB] [numeric] (1, 0) NULL,
[MLRCLN] [numeric] (7, 0) NULL,
[MLRCLS] [numeric] (8, 0) NULL,
[MLREPN] [numeric] (10, 0) NULL,
[MLRGDT] [numeric] (8, 0) NULL,
[MLRGTM] [numeric] (6, 0) NULL,
[MLSEDT] [numeric] (8, 0) NULL,
[MLSLTP] [nchar] (2) NULL,
[MLSTAS] [nchar] (1) NULL,
[MLSTES] [numeric] (1, 0) NULL,
[MLSTNB] [numeric] (10, 0) NULL,
[MLSTQM] [numeric] (15, 6) NULL,
[MLSTQT] [numeric] (15, 6) NULL,
[MLTXID] [numeric] (13, 0) NULL,
[MLWHLO] [nchar] (3) NULL,
[MLWHLT] [nchar] (2) NULL,
[MLWHSL] [nchar] (10) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_MITLOC_1] ON [tsa].[ics_land_M3V10ved_POL_MITLOC] ([MLBANO], [MLCAMU], [MLCONO], [MLITNO], [MLREPN], [MLWHLO], [MLWHSL])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MITLOC', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MITLOC', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MITLOC', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MITLOC', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MITLOC', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MITLOC', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MITLOC', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MITLOC', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MITLOC', 'COLUMN', N'IsDuplicate'
GO
