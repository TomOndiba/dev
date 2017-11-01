CREATE TABLE [tsa].[ics_land_m3_CSYTAB]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_m3_CSYTAB_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_m3_CSYTAB_IsDuplicate] DEFAULT ((0)),
[CTCONO] [decimal] (3, 0) NULL,
[CTDIVI] [nvarchar] (255) NULL,
[CTSTCO] [nvarchar] (255) NULL,
[CTSTKY] [nvarchar] (255) NULL,
[CTLNCD] [nvarchar] (255) NULL,
[CTTX40] [nvarchar] (255) NULL,
[CTTX15] [nvarchar] (255) NULL,
[CTPARM] [nvarchar] (255) NULL,
[CTTXID] [decimal] (13, 0) NULL,
[CTRGDT] [decimal] (8, 0) NULL,
[CTRGTM] [decimal] (6, 0) NULL,
[CTLMDT] [decimal] (8, 0) NULL,
[CTCHNO] [decimal] (3, 0) NULL,
[CTCHID] [nvarchar] (255) NULL,
[CTLMTS] [decimal] (18, 0) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3_CSYTAB_1] ON [tsa].[ics_land_m3_CSYTAB] ([CTCONO], [CTDIVI], [CTLNCD], [CTSTCO], [CTSTKY])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_CSYTAB', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_CSYTAB', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_CSYTAB', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_CSYTAB', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from where this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_CSYTAB', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_CSYTAB', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_CSYTAB', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_CSYTAB', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_CSYTAB', 'COLUMN', N'IsDuplicate'
GO
