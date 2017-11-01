CREATE TABLE [tsa].[ics_land_m3_MITAUN]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_m3_MITAUN_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_m3_MITAUN_IsDuplicate] DEFAULT ((0)),
[MUCONO] [decimal] (3, 0) NULL,
[MUITNO] [nvarchar] (255) NULL,
[MUAUTP] [decimal] (1, 0) NULL,
[MUALUN] [nvarchar] (255) NULL,
[MUDCCD] [decimal] (1, 0) NULL,
[MUCOFA] [decimal] (15, 9) NULL,
[MUDMCF] [decimal] (1, 0) NULL,
[MUPCOF] [decimal] (15, 9) NULL,
[MUAUS1] [decimal] (1, 0) NULL,
[MUAUS2] [decimal] (1, 0) NULL,
[MUAUS3] [decimal] (1, 0) NULL,
[MUAUS4] [decimal] (1, 0) NULL,
[MUAUS5] [decimal] (1, 0) NULL,
[MUAUS6] [decimal] (1, 0) NULL,
[MUAUS9] [decimal] (1, 0) NULL,
[MUUNMU] [decimal] (15, 6) NULL,
[MUFMID] [nvarchar] (255) NULL,
[MURESI] [nvarchar] (255) NULL,
[MUTXID] [decimal] (13, 0) NULL,
[MURGDT] [decimal] (8, 0) NULL,
[MURGTM] [decimal] (6, 0) NULL,
[MULMDT] [decimal] (8, 0) NULL,
[MUCHNO] [decimal] (3, 0) NULL,
[MUCHID] [nvarchar] (255) NULL,
[MULMTS] [decimal] (18, 0) NULL,
[MUPACT] [nvarchar] (255) NULL,
[MUAUSC] [decimal] (1, 0) NULL,
[MUAUSB] [decimal] (1, 0) NULL,
[MUCUEX] [nvarchar] (255) NULL,
[MULGUN] [decimal] (1, 0) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3_MITAUN_1] ON [tsa].[ics_land_m3_MITAUN] ([MUALUN], [MUAUTP], [MUITNO])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_MITAUN', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_MITAUN', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_MITAUN', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_MITAUN', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from where this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_MITAUN', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_MITAUN', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_MITAUN', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_MITAUN', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_MITAUN', 'COLUMN', N'IsDuplicate'
GO
