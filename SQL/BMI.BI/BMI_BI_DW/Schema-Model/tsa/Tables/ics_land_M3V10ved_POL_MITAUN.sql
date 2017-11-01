CREATE TABLE [tsa].[ics_land_M3V10ved_POL_MITAUN]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_land_ved_MITAUN_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_land_ved_MITAUN_IsDuplicate] DEFAULT ((0)),
[MUALUN] [nchar] (3) NULL,
[MUAUS1] [numeric] (1, 0) NULL,
[MUAUS2] [numeric] (1, 0) NULL,
[MUAUS3] [numeric] (1, 0) NULL,
[MUAUS4] [numeric] (1, 0) NULL,
[MUAUS5] [numeric] (1, 0) NULL,
[MUAUS6] [numeric] (1, 0) NULL,
[MUAUS9] [numeric] (1, 0) NULL,
[MUAUSB] [numeric] (1, 0) NULL,
[MUAUSC] [numeric] (1, 0) NULL,
[MUAUTP] [numeric] (1, 0) NULL,
[MUCHID] [nchar] (10) NULL,
[MUCHNO] [numeric] (3, 0) NULL,
[MUCOFA] [numeric] (15, 9) NULL,
[MUCONO] [numeric] (3, 0) NULL,
[MUDCCD] [numeric] (1, 0) NULL,
[MUDMCF] [numeric] (1, 0) NULL,
[MUFMID] [nchar] (5) NULL,
[MUITNO] [nchar] (15) NULL,
[MULMDT] [numeric] (8, 0) NULL,
[MULMTS] [numeric] (18, 0) NULL,
[MUPACT] [nchar] (6) NULL,
[MUPCOF] [numeric] (15, 9) NULL,
[MURESI] [nchar] (5) NULL,
[MURGDT] [numeric] (8, 0) NULL,
[MURGTM] [numeric] (6, 0) NULL,
[MUTXID] [numeric] (13, 0) NULL,
[MUUNMU] [numeric] (15, 6) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_MITAUN_1] ON [tsa].[ics_land_M3V10ved_POL_MITAUN] ([MUALUN], [MUAUTP], [MUCONO], [MUITNO])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MITAUN', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MITAUN', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MITAUN', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MITAUN', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MITAUN', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MITAUN', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MITAUN', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MITAUN', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MITAUN', 'COLUMN', N'IsDuplicate'
GO
