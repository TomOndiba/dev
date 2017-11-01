CREATE TABLE [tsa].[ics_land_M3V10gen_POL_FSCASH]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_gen_FSCASH_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_gen_FSCASH_IsDuplicate] DEFAULT ((0)),
[ESBCHN] [numeric] (5, 0) NULL,
[ESCDAM] [numeric] (15, 2) NULL,
[ESCDP1] [numeric] (4, 2) NULL,
[ESCDP2] [numeric] (4, 2) NULL,
[ESCDP3] [numeric] (4, 2) NULL,
[ESCDT1] [numeric] (8, 0) NULL,
[ESCDT2] [numeric] (8, 0) NULL,
[ESCDT3] [numeric] (8, 0) NULL,
[ESCINO] [nchar] (15) NULL,
[ESCONO] [numeric] (3, 0) NULL,
[ESDIVI] [nchar] (3) NULL,
[ESJBDT] [numeric] (6, 0) NULL,
[ESJBNO] [numeric] (6, 0) NULL,
[ESJBTM] [numeric] (6, 0) NULL,
[ESJRNO] [numeric] (7, 0) NULL,
[ESJSNO] [numeric] (7, 0) NULL,
[ESSPLT] [numeric] (1, 0) NULL,
[ESTECD] [nchar] (3) NULL,
[ESTRNO] [numeric] (7, 0) NULL,
[ESTSTM] [varchar] (26) NULL,
[ESVONO] [numeric] (8, 0) NULL,
[ESVSER] [nchar] (3) NULL,
[ESYEA4] [numeric] (4, 0) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_FSCASH_1] ON [tsa].[ics_land_M3V10gen_POL_FSCASH] ([ESCONO], [ESDIVI], [ESTSTM])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_FSCASH', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_FSCASH', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_FSCASH', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_FSCASH', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_FSCASH', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_FSCASH', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_FSCASH', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_FSCASH', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_FSCASH', 'COLUMN', N'IsDuplicate'
GO
