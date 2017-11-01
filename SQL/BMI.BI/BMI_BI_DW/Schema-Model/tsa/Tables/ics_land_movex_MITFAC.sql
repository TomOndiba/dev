CREATE TABLE [tsa].[ics_land_movex_MITFAC]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_movex_MITFAC_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_movex_MITFAC_IsDuplicate] DEFAULT ((0)),
[M9CONO] [decimal] (3, 0) NULL,
[M9FACI] [nvarchar] (255) NULL,
[M9ITNO] [nvarchar] (255) NULL,
[M9LEA4] [decimal] (3, 0) NULL,
[M9CSNO] [nvarchar] (255) NULL,
[M9SPFA] [decimal] (15, 9) NULL,
[M9ORCO] [nvarchar] (255) NULL,
[M9APPR] [decimal] (17, 6) NULL,
[M9UCOS] [decimal] (17, 6) NULL,
[M9SOCO] [decimal] (17, 6) NULL,
[M9EXPC] [decimal] (5, 2) NULL,
[M9BQTY] [decimal] (15, 6) NULL,
[M9BQTM] [decimal] (1, 0) NULL,
[M9LLCM] [decimal] (2, 0) NULL,
[M9DLET] [decimal] (1, 0) NULL,
[M9DLEF] [decimal] (3, 0) NULL,
[M9DIDY] [decimal] (1, 0) NULL,
[M9DIDF] [decimal] (3, 0) NULL,
[M9PRRA] [decimal] (1, 0) NULL,
[M9TRHC] [decimal] (5, 2) NULL,
[M9MARC] [decimal] (1, 0) NULL,
[M9JITF] [decimal] (1, 0) NULL,
[M9REWH] [nvarchar] (255) NULL,
[M9OPFQ] [decimal] (15, 6) NULL,
[M9FANO] [decimal] (15, 6) NULL,
[M9FANQ] [decimal] (15, 6) NULL,
[M9FANR] [decimal] (15, 6) NULL,
[M9FATM] [decimal] (1, 0) NULL,
[M9WCLN] [nvarchar] (255) NULL,
[M9EDEC] [nvarchar] (255) NULL,
[M9AUGE] [decimal] (1, 0) NULL,
[M9ECCC] [nvarchar] (255) NULL,
[M9ECAR] [nvarchar] (255) NULL,
[M9CPRI] [nvarchar] (255) NULL,
[M9CPRE] [nvarchar] (255) NULL,
[M9WSCA] [nvarchar] (255) NULL,
[M9PRCM] [nvarchar] (255) NULL,
[M9PLAP] [nvarchar] (255) NULL,
[M9PLUP] [nvarchar] (255) NULL,
[M9SCMO] [nvarchar] (255) NULL,
[M9CPL0] [decimal] (1, 0) NULL,
[M9CPL1] [decimal] (1, 0) NULL,
[M9CPL2] [decimal] (1, 0) NULL,
[M9PPL0] [decimal] (1, 0) NULL,
[M9PPL1] [decimal] (1, 0) NULL,
[M9PPL2] [decimal] (1, 0) NULL,
[M9TXID] [decimal] (13, 0) NULL,
[M9DTID] [decimal] (13, 0) NULL,
[M9CPDC] [decimal] (1, 0) NULL,
[M9COCD] [decimal] (5, 0) NULL,
[M9EVGR] [nvarchar] (255) NULL,
[M9VAMT] [decimal] (1, 0) NULL,
[M9LAMA] [decimal] (5, 2) NULL,
[M9GRTI] [nvarchar] (255) NULL,
[M9MOLL] [decimal] (5, 2) NULL,
[M9RGDT] [decimal] (8, 0) NULL,
[M9RGTM] [decimal] (6, 0) NULL,
[M9LMDT] [decimal] (8, 0) NULL,
[M9CHNO] [decimal] (3, 0) NULL,
[M9CHID] [nvarchar] (255) NULL,
[M9LMTS] [decimal] (18, 0) NULL,
[M9CRTM] [decimal] (1, 0) NULL,
[M9DICM] [nvarchar] (255) NULL,
[M9ACRF] [nvarchar] (255) NULL,
[M9ECVE] [nvarchar] (255) NULL,
[M9ATTC] [decimal] (1, 0) NULL,
[M9ATNR] [decimal] (17, 0) NULL,
[M9STCW] [decimal] (15, 6) NULL,
[M9QUCW] [decimal] (15, 6) NULL,
[M9RJCW] [decimal] (15, 6) NULL,
[M9CAWC] [decimal] (1, 0) NULL,
[M9COFA] [decimal] (15, 9) NULL,
[M9CUEX] [nvarchar] (2000) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_movex_MITFAC_1] ON [tsa].[ics_land_movex_MITFAC] ([M9CONO], [M9FACI], [M9ITNO])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_movex_MITFAC', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_movex_MITFAC', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_movex_MITFAC', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_movex_MITFAC', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_movex_MITFAC', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_movex_MITFAC', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_movex_MITFAC', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_movex_MITFAC', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_movex_MITFAC', 'COLUMN', N'IsDuplicate'
GO
