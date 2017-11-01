CREATE TABLE [tsa].[ics_land_M3V10ved_POL_MPLIND]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_land_ved_MPLIND_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_land_ved_MPLIND_IsDuplicate] DEFAULT ((0)),
[ICAGNB] [nchar] (7) NULL,
[ICARDT] [numeric] (8, 0) NULL,
[ICBANO] [nvarchar] (20) NULL,
[ICBOLN] [nchar] (14) NULL,
[ICCAMU] [nvarchar] (20) NULL,
[ICCARN] [nvarchar] (30) NULL,
[ICCHPO] [numeric] (1, 0) NULL,
[ICCONO] [numeric] (3, 0) NULL,
[ICDLIX] [numeric] (11, 0) NULL,
[ICDTID] [numeric] (13, 0) NULL,
[ICFACI] [nchar] (3) NULL,
[ICFWRF] [nchar] (10) NULL,
[ICLMTS] [numeric] (18, 0) NULL,
[ICNEAC] [numeric] (1, 0) NULL,
[ICNOPK] [numeric] (5, 0) NULL,
[ICOEND] [numeric] (1, 0) NULL,
[ICPACC] [nvarchar] (20) NULL,
[ICPACN] [nvarchar] (20) NULL,
[ICPLDT] [numeric] (8, 0) NULL,
[ICPNLI] [numeric] (3, 0) NULL,
[ICPNLS] [numeric] (3, 0) NULL,
[ICPNLX] [numeric] (5, 0) NULL,
[ICPUNO] [nchar] (7) NULL,
[ICPUOS] [nchar] (2) NULL,
[ICRENE] [nchar] (10) NULL,
[ICREOR] [numeric] (1, 0) NULL,
[ICREPN] [numeric] (10, 0) NULL,
[ICRESP] [nchar] (10) NULL,
[ICRGDT] [numeric] (8, 0) NULL,
[ICRGTM] [numeric] (6, 0) NULL,
[ICRPQA] [numeric] (15, 6) NULL,
[ICRPQT] [numeric] (15, 6) NULL,
[ICSCOP] [numeric] (17, 6) NULL,
[ICSERA] [numeric] (11, 6) NULL,
[ICSMDT] [numeric] (8, 0) NULL,
[ICSUDO] [nvarchar] (20) NULL,
[ICTIHM] [numeric] (4, 0) NULL,
[ICTRDT] [numeric] (8, 0) NULL,
[ICTXID] [numeric] (13, 0) NULL,
[ICUGCD] [numeric] (1, 0) NULL,
[ICWHLO] [nchar] (3) NULL,
[ICWHSL] [nchar] (10) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_MPLIND_1] ON [tsa].[ics_land_M3V10ved_POL_MPLIND] ([ICCONO], [ICPNLI], [ICPNLS], [ICPNLX], [ICPUNO])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MPLIND', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MPLIND', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MPLIND', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MPLIND', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MPLIND', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MPLIND', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MPLIND', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MPLIND', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MPLIND', 'COLUMN', N'IsDuplicate'
GO
