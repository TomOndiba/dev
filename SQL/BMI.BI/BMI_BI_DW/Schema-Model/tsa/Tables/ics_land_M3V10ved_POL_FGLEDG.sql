CREATE TABLE [tsa].[ics_land_M3V10ved_POL_FGLEDG]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_land_ved_FGLEDG_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_land_ved_FGLEDG_IsDuplicate] DEFAULT ((0)),
[EGACAM] [numeric] (15, 2) NULL,
[EGACDT] [numeric] (8, 0) NULL,
[EGACQT] [numeric] (15, 6) NULL,
[EGAIT1] [nchar] (8) NULL,
[EGAIT2] [nchar] (8) NULL,
[EGAIT3] [nchar] (8) NULL,
[EGAIT4] [nchar] (8) NULL,
[EGAIT5] [nchar] (8) NULL,
[EGAIT6] [nchar] (8) NULL,
[EGAIT7] [nchar] (8) NULL,
[EGAPCD] [nchar] (10) NULL,
[EGAPRV] [numeric] (1, 0) NULL,
[EGARAT] [numeric] (11, 6) NULL,
[EGARCD] [numeric] (1, 0) NULL,
[EGAT04] [numeric] (1, 0) NULL,
[EGBSCD] [nchar] (3) NULL,
[EGCHID] [nchar] (10) NULL,
[EGCHNO] [numeric] (3, 0) NULL,
[EGCONO] [numeric] (3, 0) NULL,
[EGCRTP] [numeric] (2, 0) NULL,
[EGCUAM] [numeric] (15, 2) NULL,
[EGCUCD] [nchar] (3) NULL,
[EGCVT1] [numeric] (15, 2) NULL,
[EGCVT2] [numeric] (15, 2) NULL,
[EGCVT3] [numeric] (15, 2) NULL,
[EGCVT4] [numeric] (15, 2) NULL,
[EGDBCR] [nchar] (1) NULL,
[EGDCAM] [numeric] (1, 0) NULL,
[EGDCQT] [numeric] (1, 0) NULL,
[EGDIVI] [nchar] (3) NULL,
[EGECAR] [nchar] (2) NULL,
[EGEICD] [numeric] (1, 0) NULL,
[EGERDT] [numeric] (8, 0) NULL,
[EGFEID] [nchar] (4) NULL,
[EGFNCN] [numeric] (3, 0) NULL,
[EGFTCO] [nchar] (3) NULL,
[EGGFL1] [nchar] (1) NULL,
[EGGFL2] [nchar] (1) NULL,
[EGGFL3] [nchar] (1) NULL,
[EGGFL4] [nchar] (1) NULL,
[EGGFL5] [nchar] (1) NULL,
[EGJRNO] [numeric] (7, 0) NULL,
[EGJSNO] [numeric] (7, 0) NULL,
[EGLMDT] [numeric] (8, 0) NULL,
[EGLMTS] [numeric] (18, 0) NULL,
[EGOCDT] [numeric] (8, 0) NULL,
[EGRECO] [numeric] (1, 0) NULL,
[EGREDE] [numeric] (8, 0) NULL,
[EGRGDT] [numeric] (8, 0) NULL,
[EGRGTM] [numeric] (6, 0) NULL,
[EGSERS] [numeric] (2, 0) NULL,
[EGTCAM] [numeric] (15, 2) NULL,
[EGTCAR] [numeric] (11, 6) NULL,
[EGTCRT] [numeric] (2, 0) NULL,
[EGTDSC] [nchar] (10) NULL,
[EGTGCD] [numeric] (1, 0) NULL,
[EGTHCC] [nchar] (3) NULL,
[EGTOCD] [nchar] (1) NULL,
[EGTRCD] [numeric] (2, 0) NULL,
[EGTXID] [numeric] (13, 0) NULL,
[EGUNIT] [nchar] (3) NULL,
[EGVATD] [numeric] (8, 0) NULL,
[EGVATR] [nchar] (1) NULL,
[EGVDSC] [nchar] (7) NULL,
[EGVONO] [numeric] (8, 0) NULL,
[EGVRNE] [numeric] (1, 0) NULL,
[EGVRNO] [nchar] (16) NULL,
[EGVSER] [nchar] (3) NULL,
[EGVSNO] [numeric] (7, 0) NULL,
[EGVTCD] [numeric] (2, 0) NULL,
[EGVTP1] [numeric] (5, 2) NULL,
[EGVTP2] [numeric] (5, 2) NULL,
[EGVTXT] [nvarchar] (40) NULL,
[EGYEA4] [numeric] (4, 0) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_FGLEDG_1] ON [tsa].[ics_land_M3V10ved_POL_FGLEDG] ([EGCONO], [EGDIVI], [EGJRNO], [EGJSNO], [EGYEA4])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_FGLEDG', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_FGLEDG', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_FGLEDG', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_FGLEDG', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_FGLEDG', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_FGLEDG', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_FGLEDG', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_FGLEDG', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_FGLEDG', 'COLUMN', N'IsDuplicate'
GO
