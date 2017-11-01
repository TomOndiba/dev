CREATE TABLE [tsa].[ics_land_M3V10gen_POL_MPPOEX]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_gen_MPPOEX_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_gen_MPPOEX_IsDuplicate] DEFAULT ((0)),
[PECHID] [nchar] (10) NULL,
[PECHNO] [numeric] (3, 0) NULL,
[PECONO] [numeric] (3, 0) NULL,
[PEDTCD] [numeric] (1, 0) NULL,
[PEEALI] [numeric] (1, 0) NULL,
[PEFACI] [nchar] (3) NULL,
[PEFDAY] [numeric] (3, 0) NULL,
[PEFUDX] [numeric] (8, 0) NULL,
[PEFUPF] [numeric] (1, 0) NULL,
[PEFUSC] [nchar] (3) NULL,
[PELMDT] [numeric] (8, 0) NULL,
[PEPNLI] [numeric] (3, 0) NULL,
[PEPNLS] [numeric] (3, 0) NULL,
[PEPUNO] [nchar] (7) NULL,
[PEREMK] [nvarchar] (30) NULL,
[PERESP] [nchar] (10) NULL,
[PERGDT] [numeric] (8, 0) NULL,
[PERGTM] [numeric] (6, 0) NULL,
[PESTAT] [nchar] (2) NULL,
[PESUNO] [nchar] (10) NULL,
[PETXID] [numeric] (13, 0) NULL,
[PEWHLO] [nchar] (3) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_MPPOEX_1] ON [tsa].[ics_land_M3V10gen_POL_MPPOEX] ([PECONO], [PEFUDX], [PEPNLI], [PEPNLS], [PEPUNO])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_MPPOEX', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_MPPOEX', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_MPPOEX', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_MPPOEX', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_MPPOEX', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_MPPOEX', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_MPPOEX', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_MPPOEX', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_MPPOEX', 'COLUMN', N'IsDuplicate'
GO
