CREATE TABLE [tsa].[ics_land_m3v7_MITLOC]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_m3v7_MITLOC_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_m3v7_MITLOC_IsDuplicate] DEFAULT ((0)),
[MLCONO] [decimal] (3, 0) NULL,
[MLWHLO] [nvarchar] (255) NULL,
[MLITNO] [nvarchar] (255) NULL,
[MLWHSL] [nvarchar] (255) NULL,
[MLBANO] [nvarchar] (255) NULL,
[MLCAMU] [nvarchar] (255) NULL,
[MLFACI] [nvarchar] (255) NULL,
[MLWHLT] [nvarchar] (255) NULL,
[MLSTQT] [decimal] (15, 6) NULL,
[MLPOCY] [decimal] (5, 2) NULL,
[MLALQT] [decimal] (15, 6) NULL,
[MLPLQT] [decimal] (15, 6) NULL,
[MLALOC] [decimal] (1, 0) NULL,
[MLPUAB] [decimal] (1, 0) NULL,
[MLSTAS] [nvarchar] (255) NULL,
[MLPPRI] [nvarchar] (255) NULL,
[MLPRDT] [decimal] (8, 0) NULL,
[MLREPN] [decimal] (10, 0) NULL,
[MLIDDT] [decimal] (8, 0) NULL,
[MLODDT] [decimal] (8, 0) NULL,
[MLINDT] [decimal] (8, 0) NULL,
[MLINON] [decimal] (1, 0) NULL,
[MLBREF] [nvarchar] (255) NULL,
[MLBRE2] [nvarchar] (255) NULL,
[MLBREM] [nvarchar] (255) NULL,
[MLSLTP] [nvarchar] (255) NULL,
[MLPACT] [nvarchar] (255) NULL,
[MLSTES] [decimal] (1, 0) NULL,
[MLTXID] [decimal] (13, 0) NULL,
[MLDTID] [decimal] (13, 0) NULL,
[MLAUDE] [decimal] (1, 0) NULL,
[MLAUDD] [decimal] (3, 0) NULL,
[MLRCLS] [decimal] (8, 0) NULL,
[MLRCLN] [decimal] (7, 0) NULL,
[MLATNR] [decimal] (17, 0) NULL,
[MLCNDT] [decimal] (8, 0) NULL,
[MLSEDT] [decimal] (8, 0) NULL,
[MLSTQM] [decimal] (15, 6) NULL,
[MLRGDT] [decimal] (8, 0) NULL,
[MLRGTM] [decimal] (6, 0) NULL,
[MLLMDT] [decimal] (8, 0) NULL,
[MLCHNO] [decimal] (3, 0) NULL,
[MLCHID] [nvarchar] (255) NULL,
[MLLMTS] [decimal] (18, 0) NULL,
[MLINVC] [decimal] (1, 0) NULL,
[MLATV1] [nvarchar] (255) NULL,
[MLATV2] [nvarchar] (255) NULL,
[MLATV3] [nvarchar] (255) NULL,
[MLATV4] [nvarchar] (255) NULL,
[MLATV5] [nvarchar] (255) NULL,
[MLCANB] [decimal] (17, 0) NULL,
[MLSTNB] [decimal] (10, 0) NULL,
[MLOPAN] [nvarchar] (255) NULL,
[MLCAWE] [decimal] (15, 6) NULL,
[MLINCW] [decimal] (15, 6) NULL,
[MLIQTY] [decimal] (15, 6) NULL,
[MLACUW] [decimal] (15, 6) NULL,
[MLACUQ] [decimal] (15, 6) NULL,
[MLADJW] [decimal] (15, 6) NULL,
[MLFIFL] [decimal] (1, 0) NULL,
[MLSEMO] [decimal] (2, 0) NULL,
[MLQIAD] [decimal] (8, 0) NULL,
[MLANNO] [decimal] (2, 0) NULL,
[MLNALO] [decimal] (1, 0) NULL,
[MLTIHM] [decimal] (4, 0) NULL,
[MLQRID] [nvarchar] (255) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3v7_MITLOC_1] ON [tsa].[ics_land_m3v7_MITLOC] ([MLBANO], [MLCONO], [MLITNO], [MLREPN], [MLWHLO], [MLWHSL])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3v7_MITLOC', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3v7_MITLOC', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3v7_MITLOC', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3v7_MITLOC', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3v7_MITLOC', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3v7_MITLOC', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3v7_MITLOC', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3v7_MITLOC', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3v7_MITLOC', 'COLUMN', N'IsDuplicate'
GO
