CREATE TABLE [tsa].[ics_land_m3_MITPOP]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_m3_MITPOP_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_m3_MITPOP_IsDuplicate] DEFAULT ((0)),
[MPCONO] [decimal] (3, 0) NULL,
[MPALWT] [decimal] (2, 0) NULL,
[MPALWQ] [nvarchar] (255) NULL,
[MPITNO] [nvarchar] (255) NULL,
[MPPOPN] [nvarchar] (255) NULL,
[MPE0PA] [nvarchar] (255) NULL,
[MPVFDT] [decimal] (8, 0) NULL,
[MPLVDT] [decimal] (8, 0) NULL,
[MPCNQT] [decimal] (15, 6) NULL,
[MPALUN] [nvarchar] (255) NULL,
[MPORCO] [nvarchar] (255) NULL,
[MPSEQN] [decimal] (7, 0) NULL,
[MPREMK] [nvarchar] (255) NULL,
[MPCFIN] [decimal] (10, 0) NULL,
[MPTXID] [decimal] (13, 0) NULL,
[MPSEA1] [nvarchar] (255) NULL,
[MPATPE] [nvarchar] (255) NULL,
[MPATNR] [decimal] (17, 0) NULL,
[MPRGDT] [decimal] (8, 0) NULL,
[MPRGTM] [decimal] (6, 0) NULL,
[MPLMDT] [decimal] (8, 0) NULL,
[MPCHNO] [decimal] (3, 0) NULL,
[MPCHID] [nvarchar] (255) NULL,
[MPLMTS] [decimal] (18, 0) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3_MITPOP_1] ON [tsa].[ics_land_m3_MITPOP] ([MPALWT], [MPCONO], [MPE0PA], [MPITNO], [MPPOPN], [MPVFDT])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_MITPOP', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_MITPOP', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_MITPOP', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_MITPOP', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from where this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_MITPOP', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_MITPOP', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_MITPOP', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_MITPOP', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_m3_MITPOP', 'COLUMN', N'IsDuplicate'
GO
