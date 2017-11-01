CREATE TABLE [tsa].[ics_land_M3V10gen_POL_MPDEPR]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_gen_MPDEPR_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_gen_MPDEPR_IsDuplicate] DEFAULT ((0)),
[ILCMCO] [nchar] (2) NULL,
[ILCONO] [numeric] (3, 0) NULL,
[ILDSPN] [numeric] (11, 0) NULL,
[ILFDAT] [numeric] (8, 0) NULL,
[ILFPLP] [numeric] (1, 0) NULL,
[ILITNO] [nchar] (15) NULL,
[ILLEDT] [numeric] (8, 0) NULL,
[ILMEDC] [nchar] (10) NULL,
[ILORQA] [numeric] (15, 6) NULL,
[ILPLPN] [numeric] (7, 0) NULL,
[ILPLPS] [numeric] (3, 0) NULL,
[ILPNLI] [numeric] (3, 0) NULL,
[ILPNLS] [numeric] (3, 0) NULL,
[ILPRQA] [numeric] (15, 6) NULL,
[ILPUNO] [nchar] (7) NULL,
[ILRGTM] [numeric] (6, 0) NULL,
[ILRSIN] [numeric] (1, 0) NULL,
[ILVDDT] [numeric] (8, 0) NULL,
[ILWHLO] [nchar] (3) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_MPDEPR_1] ON [tsa].[ics_land_M3V10gen_POL_MPDEPR] ([ILCONO], [ILDSPN], [ILLEDT], [ILPLPN], [ILPLPS], [ILPNLI], [ILPNLS], [ILPUNO], [ILRGTM])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_MPDEPR', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_MPDEPR', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_MPDEPR', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_MPDEPR', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_MPDEPR', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_MPDEPR', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_MPDEPR', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_MPDEPR', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_MPDEPR', 'COLUMN', N'IsDuplicate'
GO
