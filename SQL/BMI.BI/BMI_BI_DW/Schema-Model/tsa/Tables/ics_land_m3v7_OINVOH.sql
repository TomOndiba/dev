CREATE TABLE [tsa].[ics_land_m3v7_OINVOH]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_m3v7_OINVOH_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_m3v7_OINVOH_IsDuplicate] DEFAULT ((0)),
[UHCONO] [decimal] (3, 0) NULL,
[UHDIVI] [nvarchar] (255) NULL,
[UHFACI] [nvarchar] (255) NULL,
[UHIVNO] [decimal] (9, 0) NULL,
[UHYEA4] [decimal] (4, 0) NULL,
[UHPYNO] [nvarchar] (255) NULL,
[UHINST] [nvarchar] (255) NULL,
[UHIVAM] [decimal] (15, 2) NULL,
[UHIVLA] [decimal] (15, 2) NULL,
[UHCUCD] [nvarchar] (255) NULL,
[UHRAIN] [decimal] (11, 6) NULL,
[UHDUDT] [decimal] (8, 0) NULL,
[UHVSER] [nvarchar] (255) NULL,
[UHVONO] [decimal] (8, 0) NULL,
[UHIDAT] [decimal] (8, 0) NULL,
[UHACDT] [decimal] (8, 0) NULL,
[UHIVTP] [nvarchar] (255) NULL,
[UHUPEC] [decimal] (1, 0) NULL,
[UHUPBC] [decimal] (1, 0) NULL,
[UHUPAC] [decimal] (1, 0) NULL,
[UHINRC] [nvarchar] (255) NULL,
[UHNVAT] [decimal] (1, 0) NULL,
[UHMUST] [decimal] (1, 0) NULL,
[UHCASH] [decimal] (1, 0) NULL,
[UHRAFC] [decimal] (15, 2) NULL,
[UHRALC] [decimal] (15, 2) NULL,
[UHFAC2] [nvarchar] (255) NULL,
[UHORIG] [decimal] (1, 0) NULL,
[UHNREF] [nvarchar] (255) NULL,
[UH3RDP] [nvarchar] (255) NULL,
[UHRGDT] [decimal] (8, 0) NULL,
[UHRGTM] [decimal] (6, 0) NULL,
[UHLMDT] [decimal] (8, 0) NULL,
[UHCHNO] [decimal] (3, 0) NULL,
[UHCHID] [nvarchar] (255) NULL,
[UHRYEA] [decimal] (4, 0) NULL,
[UHRIVN] [decimal] (9, 0) NULL,
[UHINPX] [nvarchar] (255) NULL,
[UHEXIN] [nvarchar] (255) NULL,
[UHRINP] [nvarchar] (255) NULL,
[UHRXIN] [nvarchar] (255) NULL,
[UHLMTS] [decimal] (18, 0) NULL,
[UHSBTO] [decimal] (1, 0) NULL,
[UHNESI] [decimal] (1, 0) NULL,
[UHLCUR] [nvarchar] (255) NULL,
[UHLVAT] [decimal] (15, 2) NULL,
[UHARAT] [decimal] (11, 6) NULL,
[UHIVBA] [decimal] (15, 2) NULL,
[UHPDYR] [decimal] (4, 0) NULL,
[UHPDNO] [nvarchar] (255) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3v7_OINVOH_1] ON [tsa].[ics_land_m3v7_OINVOH] ([UHCONO], [UHIVNO])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3v7_OINVOH', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3v7_OINVOH', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3v7_OINVOH', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3v7_OINVOH', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3v7_OINVOH', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3v7_OINVOH', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3v7_OINVOH', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3v7_OINVOH', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3v7_OINVOH', 'COLUMN', N'IsDuplicate'
GO
