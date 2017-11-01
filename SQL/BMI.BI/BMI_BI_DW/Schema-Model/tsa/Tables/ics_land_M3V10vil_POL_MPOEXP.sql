CREATE TABLE [tsa].[ics_land_M3V10vil_POL_MPOEXP]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_vil_MPOEXP_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_vil_MPOEXP_IsDuplicate] DEFAULT ((0)),
[IVACIN] [numeric] (15, 2) NULL,
[IVBANO] [nvarchar] (20) NULL,
[IVCDSE] [numeric] (4, 0) NULL,
[IVCEID] [nchar] (6) NULL,
[IVCEVA] [numeric] (15, 2) NULL,
[IVCEVJ] [numeric] (15, 2) NULL,
[IVCHID] [nchar] (10) NULL,
[IVCHNO] [numeric] (3, 0) NULL,
[IVCONO] [numeric] (3, 0) NULL,
[IVCUCD] [nchar] (3) NULL,
[IVEXIC] [numeric] (1, 0) NULL,
[IVEXTY] [numeric] (1, 0) NULL,
[IVIVCQ] [numeric] (1, 0) NULL,
[IVLMDT] [numeric] (8, 0) NULL,
[IVOVHE] [numeric] (15, 2) NULL,
[IVPNLI] [numeric] (3, 0) NULL,
[IVPNLS] [numeric] (3, 0) NULL,
[IVPOOV] [numeric] (1, 0) NULL,
[IVPUNO] [nchar] (7) NULL,
[IVREPN] [numeric] (10, 0) NULL,
[IVRGDT] [numeric] (8, 0) NULL,
[IVRGTM] [numeric] (6, 0) NULL,
[IVTHPR] [numeric] (1, 0) NULL,
[IVWSOP] [nchar] (2) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_MPOEXP_1] ON [tsa].[ics_land_M3V10vil_POL_MPOEXP] ([IVBANO], [IVCDSE], [IVCEID], [IVCONO], [IVEXTY], [IVPNLI], [IVPNLS], [IVPUNO], [IVREPN])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MPOEXP', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MPOEXP', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MPOEXP', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MPOEXP', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MPOEXP', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MPOEXP', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MPOEXP', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MPOEXP', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MPOEXP', 'COLUMN', N'IsDuplicate'
GO
