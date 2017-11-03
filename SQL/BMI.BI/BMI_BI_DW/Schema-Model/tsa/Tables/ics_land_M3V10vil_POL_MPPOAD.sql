CREATE TABLE [tsa].[ics_land_M3V10vil_POL_MPPOAD]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_vil_MPPOAD_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_vil_MPPOAD_IsDuplicate] DEFAULT ((0)),
[ADADID] [nchar] (6) NULL,
[ADADK2] [nchar] (3) NULL,
[ADADK3] [nchar] (3) NULL,
[ADADR1] [nvarchar] (36) NULL,
[ADADR2] [nvarchar] (36) NULL,
[ADADR3] [nvarchar] (36) NULL,
[ADADR4] [nvarchar] (36) NULL,
[ADCHID] [nchar] (10) NULL,
[ADCHNO] [numeric] (3, 0) NULL,
[ADCONM] [nvarchar] (36) NULL,
[ADCONO] [numeric] (3, 0) NULL,
[ADCSCD] [nchar] (3) NULL,
[ADECAR] [nchar] (2) NULL,
[ADFACI] [nchar] (3) NULL,
[ADLMDT] [numeric] (8, 0) NULL,
[ADPNLI] [numeric] (3, 0) NULL,
[ADPOAD] [numeric] (1, 0) NULL,
[ADPONO] [nchar] (10) NULL,
[ADPRIA] [numeric] (1, 0) NULL,
[ADPUNO] [nchar] (7) NULL,
[ADRGDT] [numeric] (8, 0) NULL,
[ADRGTM] [numeric] (6, 0) NULL,
[ADTOWN] [nvarchar] (20) NULL,
[ADTXID] [numeric] (13, 0) NULL,
[ADWHLO] [nchar] (3) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_MPPOAD_1] ON [tsa].[ics_land_M3V10vil_POL_MPPOAD] ([ADCONO], [ADPNLI], [ADPOAD], [ADPUNO])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MPPOAD', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MPPOAD', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MPPOAD', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MPPOAD', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MPPOAD', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MPPOAD', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MPPOAD', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MPPOAD', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MPPOAD', 'COLUMN', N'IsDuplicate'
GO
