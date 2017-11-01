CREATE TABLE [tsa].[ics_land_m3_OINVOL]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_m3_OINVOL_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_m3_OINVOL_IsDuplicate] DEFAULT ((0)),
[ONCONO] [decimal] (3, 0) NULL,
[ONDIVI] [nvarchar] (255) NULL,
[ONIVNO] [decimal] (9, 0) NULL,
[ONYEA4] [decimal] (4, 0) NULL,
[ONPYNO] [nvarchar] (255) NULL,
[ONIVSQ] [decimal] (3, 0) NULL,
[ONIVTP] [nvarchar] (255) NULL,
[ONORNO] [nvarchar] (255) NULL,
[ONDLIX] [decimal] (11, 0) NULL,
[ONWHLO] [nvarchar] (255) NULL,
[ONIVRF] [nvarchar] (255) NULL,
[ONIVAM] [decimal] (15, 2) NULL,
[ONIVLA] [decimal] (15, 2) NULL,
[ONIVBA] [decimal] (15, 2) NULL,
[ONCVT1] [decimal] (15, 2) NULL,
[ONCVT2] [decimal] (15, 2) NULL,
[ONVTAM] [decimal] (15, 2) NULL,
[ONIVFR] [nvarchar] (255) NULL,
[ONIVAV] [decimal] (15, 2) NULL,
[ONBSCD] [nvarchar] (255) NULL,
[ONECAR] [nvarchar] (255) NULL,
[ONFTCO] [nvarchar] (255) NULL,
[ONVTCD] [decimal] (2, 0) NULL,
[ONVTP1] [decimal] (5, 2) NULL,
[ONVTP2] [decimal] (5, 2) NULL,
[ONVRIN] [nvarchar] (255) NULL,
[ONVRNO] [nvarchar] (255) NULL,
[ONRGDT] [decimal] (8, 0) NULL,
[ONRGTM] [decimal] (6, 0) NULL,
[ONLMDT] [decimal] (8, 0) NULL,
[ONCHNO] [decimal] (3, 0) NULL,
[ONCHID] [nvarchar] (255) NULL,
[ONINPX] [nvarchar] (255) NULL,
[ONEXIN] [nvarchar] (255) NULL,
[ONTEPY] [nvarchar] (255) NULL,
[ONCVDT] [decimal] (8, 0) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3_OINVOL_1] ON [tsa].[ics_land_m3_OINVOL] ([ONCONO], [ONDIVI], [ONDLIX], [ONINPX], [ONIVNO], [ONIVRF], [ONIVSQ], [ONIVTP], [ONORNO], [ONWHLO], [ONYEA4])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_OINVOL', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_OINVOL', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_OINVOL', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_OINVOL', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_OINVOL', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_OINVOL', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_OINVOL', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_OINVOL', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_OINVOL', 'COLUMN', N'IsDuplicate'
GO
