CREATE TABLE [psa].[ics_stg_M3V10ved_POL_MITFAC]
(
[EtlRecordId] [bigint] NOT NULL IDENTITY(1, 1),
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NULL,
[EtlDeletedBy] [varchar] (200) NULL,
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_ved_MITFAC_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_ved_MITFAC_IsIncomplete] DEFAULT ('N'),
[M9ACRF] [nchar] (8) NULL,
[M9APPR] [numeric] (17, 6) NULL,
[M9ATNR] [numeric] (17, 0) NULL,
[M9ATTC] [numeric] (1, 0) NULL,
[M9AUGE] [numeric] (1, 0) NULL,
[M9BQTM] [numeric] (1, 0) NULL,
[M9BQTY] [numeric] (15, 6) NULL,
[M9CAWC] [numeric] (1, 0) NULL,
[M9CHID] [nchar] (10) NULL,
[M9CHNO] [numeric] (3, 0) NULL,
[M9COCD] [numeric] (5, 0) NULL,
[M9CONO] [numeric] (18, 0) NOT NULL,
[M9CPDC] [numeric] (1, 0) NULL,
[M9CPL0] [numeric] (1, 0) NULL,
[M9CPL1] [numeric] (1, 0) NULL,
[M9CPL2] [numeric] (1, 0) NULL,
[M9CPRE] [nchar] (5) NULL,
[M9CPRI] [nchar] (5) NULL,
[M9CRTM] [numeric] (1, 0) NULL,
[M9CSNO] [nchar] (16) NULL,
[M9DICM] [nchar] (6) NULL,
[M9DIDF] [numeric] (3, 0) NULL,
[M9DIDY] [numeric] (1, 0) NULL,
[M9DLEF] [numeric] (3, 0) NULL,
[M9DLET] [numeric] (1, 0) NULL,
[M9DTID] [numeric] (13, 0) NULL,
[M9ECAR] [nchar] (2) NULL,
[M9ECCC] [nchar] (4) NULL,
[M9ECVE] [nchar] (4) NULL,
[M9EDEC] [nchar] (2) NULL,
[M9EVGR] [nchar] (2) NULL,
[M9EXPC] [numeric] (5, 2) NULL,
[M9FACI] [nchar] (3) NOT NULL,
[M9FANO] [numeric] (15, 6) NULL,
[M9FANQ] [numeric] (15, 6) NULL,
[M9FANR] [numeric] (15, 6) NULL,
[M9FATM] [numeric] (1, 0) NULL,
[M9GRTI] [nchar] (10) NULL,
[M9ITNO] [nchar] (15) NOT NULL,
[M9JITF] [numeric] (1, 0) NULL,
[M9LAMA] [numeric] (5, 2) NULL,
[M9LEA4] [numeric] (3, 0) NULL,
[M9LLCM] [numeric] (2, 0) NULL,
[M9LMDT] [numeric] (8, 0) NULL,
[M9LMTS] [numeric] (18, 0) NULL,
[M9MARC] [numeric] (1, 0) NULL,
[M9MOLL] [numeric] (5, 2) NULL,
[M9OPFQ] [numeric] (15, 6) NULL,
[M9ORCO] [nchar] (3) NULL,
[M9PLAP] [nchar] (15) NULL,
[M9PLUP] [nchar] (15) NULL,
[M9PPL0] [numeric] (1, 0) NULL,
[M9PPL1] [numeric] (1, 0) NULL,
[M9PPL2] [numeric] (1, 0) NULL,
[M9PRCM] [nchar] (6) NULL,
[M9PRRA] [numeric] (1, 0) NULL,
[M9QUCW] [numeric] (15, 6) NULL,
[M9REWH] [nchar] (3) NULL,
[M9RGDT] [numeric] (8, 0) NULL,
[M9RGTM] [numeric] (6, 0) NULL,
[M9RJCW] [numeric] (15, 6) NULL,
[M9SCMO] [nchar] (6) NULL,
[M9SOCO] [numeric] (17, 6) NULL,
[M9SPFA] [numeric] (15, 9) NULL,
[M9STCW] [numeric] (15, 6) NULL,
[M9TRHC] [numeric] (5, 2) NULL,
[M9TXID] [numeric] (13, 0) NULL,
[M9UCOS] [numeric] (17, 6) NULL,
[M9VAMT] [numeric] (1, 0) NULL,
[M9WCLN] [nchar] (8) NULL,
[M9WSCA] [nchar] (6) NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MITFAC] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_MITFAC] PRIMARY KEY CLUSTERED  ([M9CONO], [M9FACI], [M9ITNO])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_MITFAC', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_MITFAC', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_MITFAC', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_MITFAC', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_MITFAC', 'COLUMN', N'EtlDeletedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_MITFAC', 'COLUMN', N'EtlDeletedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The database-specific unique key of this record as identified within the ETL sub-system', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_MITFAC', 'COLUMN', N'EtlRecordId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_MITFAC', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_MITFAC', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_MITFAC', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record on this table; will be the same as EtlCreatedBy when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_MITFAC', 'COLUMN', N'EtlUpdatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record on this table; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_MITFAC', 'COLUMN', N'EtlUpdatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_MITFAC', 'COLUMN', N'IsDeleted'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates whether ETL processing is complete.  Used on PSA staging tables to indicate that the row may have changes that need to be re-processed by the ETL process (regardless of current ETL Batch Run Id).  May be used for late arriving dimensions to force facts to be re-processed outside of their originating batch.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_MITFAC', 'COLUMN', N'IsIncomplete'
GO
