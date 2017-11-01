CREATE TABLE [tsa].[ics_land_m3v7_OCHCUS]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_m3v7_OCHCUS_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_m3v7_OCHCUS_IsDuplicate] DEFAULT ((0)),
[OSCONO] [decimal] (3, 0) NULL,
[OSCUNO] [nvarchar] (255) NULL,
[OSCHCT] [nvarchar] (255) NULL,
[OSCHL1] [nvarchar] (255) NULL,
[OSCHL2] [nvarchar] (255) NULL,
[OSCHL3] [nvarchar] (255) NULL,
[OSCHL4] [nvarchar] (255) NULL,
[OSFVDT] [decimal] (8, 0) NULL,
[OSLVDT] [decimal] (8, 0) NULL,
[OSCHMB] [nvarchar] (255) NULL,
[OSMBST] [decimal] (1, 0) NULL,
[OSTXID] [decimal] (13, 0) NULL,
[OSRGDT] [decimal] (8, 0) NULL,
[OSRGTM] [decimal] (6, 0) NULL,
[OSLMDT] [decimal] (8, 0) NULL,
[OSCHNO] [decimal] (3, 0) NULL,
[OSCHID] [nvarchar] (255) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3v7_OCHCUS_1] ON [tsa].[ics_land_m3v7_OCHCUS] ([OSCONO], [OSCUNO], [OSFVDT])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3v7_OCHCUS', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3v7_OCHCUS', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3v7_OCHCUS', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3v7_OCHCUS', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from where this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3v7_OCHCUS', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3v7_OCHCUS', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3v7_OCHCUS', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3v7_OCHCUS', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3v7_OCHCUS', 'COLUMN', N'IsDuplicate'
GO
