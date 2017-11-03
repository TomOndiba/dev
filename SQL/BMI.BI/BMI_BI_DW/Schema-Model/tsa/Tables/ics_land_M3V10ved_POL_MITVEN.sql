CREATE TABLE [tsa].[ics_land_M3V10ved_POL_MITVEN]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_land_ved_MITVEN_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_land_ved_MITVEN_IsDuplicate] DEFAULT ((0)),
[IFAPDT] [numeric] (8, 0) NULL,
[IFCHID] [nchar] (10) NULL,
[IFCHNO] [numeric] (3, 0) NULL,
[IFCMCO] [nchar] (2) NULL,
[IFCONO] [numeric] (3, 0) NULL,
[IFCRTP] [numeric] (2, 0) NULL,
[IFCUCD] [nchar] (3) NULL,
[IFDTID] [numeric] (13, 0) NULL,
[IFFACI] [nchar] (3) NULL,
[IFFVD1] [numeric] (8, 0) NULL,
[IFFVDT] [numeric] (8, 0) NULL,
[IFGRMT] [nchar] (3) NULL,
[IFISRS] [nchar] (2) NULL,
[IFITNO] [nchar] (15) NULL,
[IFLEA1] [numeric] (3, 0) NULL,
[IFLEA5] [numeric] (3, 0) NULL,
[IFLMDT] [numeric] (8, 0) NULL,
[IFLMTS] [numeric] (18, 0) NULL,
[IFLOQT] [numeric] (15, 6) NULL,
[IFLPCD] [numeric] (8, 0) NULL,
[IFMCPR] [numeric] (5, 2) NULL,
[IFMEDC] [nchar] (10) NULL,
[IFMPSH] [numeric] (5, 2) NULL,
[IFORCO] [nchar] (3) NULL,
[IFORTY] [nchar] (3) NULL,
[IFPAAM] [numeric] (15, 2) NULL,
[IFPACT] [nchar] (6) NULL,
[IFPCCP] [numeric] (17, 6) NULL,
[IFPPUN] [nchar] (3) NULL,
[IFPRCS] [nchar] (3) NULL,
[IFPUCD] [numeric] (5, 0) NULL,
[IFPUP1] [numeric] (17, 6) NULL,
[IFPUPR] [numeric] (17, 6) NULL,
[IFPUQT] [numeric] (15, 6) NULL,
[IFPUUN] [nchar] (3) NULL,
[IFQCUD] [numeric] (8, 0) NULL,
[IFQUCL] [nchar] (2) NULL,
[IFRCDT] [numeric] (8, 0) NULL,
[IFRESP] [nchar] (10) NULL,
[IFRFID] [nchar] (10) NULL,
[IFRGDT] [numeric] (8, 0) NULL,
[IFRGTM] [numeric] (6, 0) NULL,
[IFRTYP] [nchar] (1) NULL,
[IFSITD] [nvarchar] (30) NULL,
[IFSITE] [nvarchar] (30) NULL,
[IFSITT] [nvarchar] (60) NULL,
[IFSMSQ] [numeric] (15, 6) NULL,
[IFSTAP] [nchar] (1) NULL,
[IFSUFI] [nvarchar] (20) NULL,
[IFSUNO] [nchar] (10) NULL,
[IFSUP1] [numeric] (15, 2) NULL,
[IFSUPR] [numeric] (15, 2) NULL,
[IFTXID] [numeric] (13, 0) NULL,
[IFUNMU] [numeric] (15, 6) NULL,
[IFUVD1] [numeric] (8, 0) NULL,
[IFUVDT] [numeric] (8, 0) NULL,
[IFWHLO] [nchar] (3) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_MITVEN_1] ON [tsa].[ics_land_M3V10ved_POL_MITVEN] ([IFCONO], [IFITNO], [IFPRCS], [IFSUFI], [IFSUNO])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MITVEN', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MITVEN', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MITVEN', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MITVEN', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MITVEN', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MITVEN', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MITVEN', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MITVEN', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_MITVEN', 'COLUMN', N'IsDuplicate'
GO
