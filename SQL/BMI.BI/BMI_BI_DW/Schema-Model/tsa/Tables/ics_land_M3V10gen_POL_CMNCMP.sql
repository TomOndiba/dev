CREATE TABLE [tsa].[ics_land_M3V10gen_POL_CMNCMP]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_gen_CMNCMP_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_gen_CMNCMP_IsDuplicate] DEFAULT ((0)),
[JICCRT] [numeric] (2, 0) NULL,
[JICCUC] [nchar] (3) NULL,
[JICHID] [nchar] (10) NULL,
[JICHNO] [numeric] (3, 0) NULL,
[JICMTP] [numeric] (1, 0) NULL,
[JICONO] [numeric] (3, 0) NULL,
[JIDBAS] [nchar] (10) NULL,
[JIDCFM] [nchar] (1) NULL,
[JIDFMN] [nchar] (10) NULL,
[JILL01] [nchar] (10) NULL,
[JILL02] [nchar] (10) NULL,
[JILL03] [nchar] (10) NULL,
[JILL04] [nchar] (10) NULL,
[JILL05] [nchar] (10) NULL,
[JILL06] [nchar] (10) NULL,
[JILL07] [nchar] (10) NULL,
[JILL08] [nchar] (10) NULL,
[JILL09] [nchar] (10) NULL,
[JILL10] [nchar] (10) NULL,
[JILMDT] [numeric] (8, 0) NULL,
[JIMNMN] [numeric] (1, 0) NULL,
[JIMNVR] [nchar] (10) NULL,
[JIMXV1] [nchar] (3) NULL,
[JIRGDT] [numeric] (8, 0) NULL,
[JIRGTM] [numeric] (6, 0) NULL,
[JISTMN] [nchar] (15) NULL,
[JITX40] [nvarchar] (40) NULL,
[JITXID] [numeric] (13, 0) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_CMNCMP_1] ON [tsa].[ics_land_M3V10gen_POL_CMNCMP] ([JICONO])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_CMNCMP', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_CMNCMP', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_CMNCMP', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_CMNCMP', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_CMNCMP', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_CMNCMP', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_CMNCMP', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_CMNCMP', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_CMNCMP', 'COLUMN', N'IsDuplicate'
GO
