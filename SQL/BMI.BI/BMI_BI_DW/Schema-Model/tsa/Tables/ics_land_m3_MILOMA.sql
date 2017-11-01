CREATE TABLE [tsa].[ics_land_m3_MILOMA]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_m3_MILOMA_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_m3_MILOMA_IsDuplicate] DEFAULT ((0)),
[LMCONO] [decimal] (3, 0) NULL,
[LMITNO] [nvarchar] (255) NULL,
[LMBANO] [nvarchar] (255) NULL,
[LMLOTY] [decimal] (1, 0) NULL,
[LMINRE] [decimal] (1, 0) NULL,
[LMALOC] [decimal] (1, 0) NULL,
[LMARLA] [nvarchar] (255) NULL,
[LMIDET] [nvarchar] (255) NULL,
[LMRORC] [decimal] (1, 0) NULL,
[LMRORN] [nvarchar] (255) NULL,
[LMRORL] [decimal] (6, 0) NULL,
[LMREPN] [decimal] (10, 0) NULL,
[LMSUNO] [nvarchar] (255) NULL,
[LMMFIT] [nvarchar] (255) NULL,
[LMMFSN] [nvarchar] (255) NULL,
[LMPROD] [nvarchar] (255) NULL,
[LMBREF] [nvarchar] (255) NULL,
[LMBRE2] [nvarchar] (255) NULL,
[LMOWNC] [nvarchar] (255) NULL,
[LMLPCY] [decimal] (5, 2) NULL,
[LMORCO] [nvarchar] (255) NULL,
[LMLOTC] [decimal] (17, 6) NULL,
[LMREDA] [decimal] (8, 0) NULL,
[LMQIAD] [decimal] (8, 0) NULL,
[LMMFDT] [decimal] (8, 0) NULL,
[LMEXPI] [decimal] (8, 0) NULL,
[LMCNDT] [decimal] (8, 0) NULL,
[LMSEDT] [decimal] (8, 0) NULL,
[LMRCLS] [decimal] (8, 0) NULL,
[LMLATD] [decimal] (8, 0) NULL,
[LMCFI3] [nvarchar] (255) NULL,
[LMCFJ0] [nvarchar] (255) NULL,
[LMCFI2] [decimal] (15, 2) NULL,
[LMECVE] [nvarchar] (255) NULL,
[LMFACI] [nvarchar] (255) NULL,
[LMAAGN] [nvarchar] (255) NULL,
[LMTXID] [decimal] (13, 0) NULL,
[LMATNR] [decimal] (17, 0) NULL,
[LMRGDT] [decimal] (8, 0) NULL,
[LMRGTM] [decimal] (6, 0) NULL,
[LMLMDT] [decimal] (8, 0) NULL,
[LMCHNO] [decimal] (3, 0) NULL,
[LMCHID] [nvarchar] (255) NULL,
[LMRORX] [decimal] (3, 0) NULL,
[LMLMTS] [decimal] (18, 0) NULL,
[LMLIRR] [decimal] (1, 0) NULL,
[LMBBDT] [decimal] (8, 0) NULL,
[LMHVDT] [decimal] (8, 0) NULL,
[LMHVIT] [nvarchar] (255) NULL,
[LMHVLT] [nvarchar] (255) NULL,
[LMTIHM] [decimal] (4, 0) NULL,
[LMCUEX] [nvarchar] (2000) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3_MILOMA_1] ON [tsa].[ics_land_m3_MILOMA] ([LMBANO], [LMITNO])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_MILOMA', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_MILOMA', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_MILOMA', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_MILOMA', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from where this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_MILOMA', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_MILOMA', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_MILOMA', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_MILOMA', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_MILOMA', 'COLUMN', N'IsDuplicate'
GO
