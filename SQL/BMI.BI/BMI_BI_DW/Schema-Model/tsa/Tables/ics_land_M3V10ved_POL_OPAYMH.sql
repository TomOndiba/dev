CREATE TABLE [tsa].[ics_land_M3V10ved_POL_OPAYMH]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_land_ved_OPAYMH_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_land_ved_OPAYMH_IsDuplicate] DEFAULT ((0)),
[UJACDT] [numeric] (8, 0) NULL,
[UJBKID] [nchar] (5) NULL,
[UJCDTT] [numeric] (2, 0) NULL,
[UJCHID] [nchar] (10) NULL,
[UJCHNO] [numeric] (3, 0) NULL,
[UJCKNO] [nchar] (15) NULL,
[UJCONO] [numeric] (3, 0) NULL,
[UJCRTP] [numeric] (2, 0) NULL,
[UJCSHD] [nchar] (5) NULL,
[UJCUCD] [nchar] (3) NULL,
[UJCUNM] [nvarchar] (36) NULL,
[UJDIVI] [nchar] (3) NULL,
[UJFACI] [nchar] (3) NULL,
[UJLMDT] [numeric] (8, 0) NULL,
[UJPLNB] [numeric] (2, 0) NULL,
[UJPMAM] [numeric] (15, 2) NULL,
[UJPMLA] [numeric] (15, 2) NULL,
[UJPMNB] [numeric] (9, 0) NULL,
[UJPTST] [nchar] (2) NULL,
[UJPYCD] [nchar] (3) NULL,
[UJPYDT] [numeric] (8, 0) NULL,
[UJPYNO] [nchar] (10) NULL,
[UJRAPM] [numeric] (11, 6) NULL,
[UJRGDT] [numeric] (8, 0) NULL,
[UJRGTM] [numeric] (6, 0) NULL,
[UJVONO] [numeric] (8, 0) NULL,
[UJVSER] [nchar] (3) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_OPAYMH_1] ON [tsa].[ics_land_M3V10ved_POL_OPAYMH] ([UJCONO], [UJPLNB], [UJPMNB])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OPAYMH', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OPAYMH', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OPAYMH', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OPAYMH', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OPAYMH', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OPAYMH', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OPAYMH', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OPAYMH', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OPAYMH', 'COLUMN', N'IsDuplicate'
GO
