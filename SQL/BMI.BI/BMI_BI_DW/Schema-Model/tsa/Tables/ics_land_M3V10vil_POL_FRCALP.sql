CREATE TABLE [tsa].[ics_land_M3V10vil_POL_FRCALP]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_vil_FRCALP_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_vil_FRCALP_IsDuplicate] DEFAULT ((0)),
[HEANBR] [numeric] (9, 0) NULL,
[HEBANO] [nvarchar] (20) NULL,
[HEBJNO] [nvarchar] (18) NULL,
[HEBSOB] [numeric] (15, 2) NULL,
[HECANB] [numeric] (17, 0) NULL,
[HECHID] [nchar] (10) NULL,
[HECHNO] [numeric] (3, 0) NULL,
[HECONO] [numeric] (3, 0) NULL,
[HEFACI] [nchar] (3) NULL,
[HEFSRC] [nchar] (1) NULL,
[HEGTYP] [nchar] (2) NULL,
[HEHACP] [numeric] (17, 6) NULL,
[HEITNO] [nchar] (15) NULL,
[HELMDT] [numeric] (8, 0) NULL,
[HELMTS] [numeric] (18, 0) NULL,
[HEMFCO] [numeric] (17, 6) NULL,
[HEMRGD] [numeric] (8, 0) NULL,
[HEMRGT] [numeric] (6, 0) NULL,
[HERGDT] [numeric] (8, 0) NULL,
[HERGTM] [numeric] (6, 0) NULL,
[HETMSX] [numeric] (3, 0) NULL,
[HETRDT] [numeric] (8, 0) NULL,
[HETRQT] [numeric] (15, 6) NULL,
[HETRTM] [numeric] (6, 0) NULL,
[HETRTP] [nchar] (3) NULL,
[HETTID] [nchar] (3) NULL,
[HETTYP] [numeric] (2, 0) NULL,
[HEWHLO] [nchar] (3) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_FRCALP_1] ON [tsa].[ics_land_M3V10vil_POL_FRCALP] ([HEBJNO], [HECONO], [HEITNO], [HEMRGD], [HEMRGT], [HETMSX], [HETRDT], [HETRTM], [HEWHLO])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_FRCALP', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_FRCALP', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_FRCALP', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_FRCALP', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_FRCALP', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_FRCALP', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_FRCALP', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_FRCALP', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_FRCALP', 'COLUMN', N'IsDuplicate'
GO
