CREATE TABLE [psa].[ics_stg_M3V10ved_POL_MWOPOL]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_ved_MWOPOL_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_ved_MWOPOL_IsIncomplete] DEFAULT ('N'),
[BHCHID] [nchar] (10) NULL,
[BHCHNO] [numeric] (3, 0) NULL,
[BHCOFA] [numeric] (15, 9) NULL,
[BHCONO] [numeric] (18, 0) NOT NULL,
[BHDMCF] [numeric] (1, 0) NULL,
[BHEMNO] [nchar] (10) NULL,
[BHFACI] [nchar] (3) NOT NULL,
[BHLMDT] [numeric] (8, 0) NULL,
[BHLMTS] [numeric] (18, 0) NULL,
[BHMAQA] [numeric] (15, 6) NULL,
[BHMAQT] [numeric] (15, 6) NULL,
[BHMAUN] [nchar] (3) NULL,
[BHMCPL] [numeric] (1, 0) NULL,
[BHMFNO] [numeric] (7, 0) NULL,
[BHOADS] [numeric] (1, 0) NULL,
[BHOPNO] [numeric] (4, 0) NULL,
[BHPLCF] [numeric] (1, 0) NULL,
[BHPLNO] [numeric] (18, 0) NOT NULL,
[BHPLOA] [numeric] (15, 6) NULL,
[BHPLOB] [numeric] (15, 6) NULL,
[BHPRNO] [nchar] (15) NULL,
[BHREFD] [numeric] (8, 0) NULL,
[BHRGDT] [numeric] (8, 0) NULL,
[BHRGTM] [numeric] (6, 0) NULL,
[BHRSDT] [numeric] (8, 0) NULL,
[BHSCQA] [numeric] (15, 6) NULL,
[BHSCQT] [numeric] (15, 6) NULL,
[BHUMAS] [numeric] (7, 2) NULL,
[BHUMAT] [numeric] (7, 2) NULL,
[BHUPIT] [numeric] (7, 2) NULL,
[BHUSET] [numeric] (7, 2) NULL,
[BHWOSQ] [numeric] (18, 0) NOT NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MWOPOL] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_MWOPOL] PRIMARY KEY CLUSTERED  ([BHCONO], [BHFACI], [BHPLNO], [BHWOSQ])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_MWOPOL', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_MWOPOL', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_MWOPOL', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_MWOPOL', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_MWOPOL', 'COLUMN', N'EtlDeletedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_MWOPOL', 'COLUMN', N'EtlDeletedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The database-specific unique key of this record as identified within the ETL sub-system', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_MWOPOL', 'COLUMN', N'EtlRecordId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_MWOPOL', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_MWOPOL', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_MWOPOL', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record on this table; will be the same as EtlCreatedBy when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_MWOPOL', 'COLUMN', N'EtlUpdatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record on this table; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_MWOPOL', 'COLUMN', N'EtlUpdatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_MWOPOL', 'COLUMN', N'IsDeleted'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates whether ETL processing is complete.  Used on PSA staging tables to indicate that the row may have changes that need to be re-processed by the ETL process (regardless of current ETL Batch Run Id).  May be used for late arriving dimensions to force facts to be re-processed outside of their originating batch.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_MWOPOL', 'COLUMN', N'IsIncomplete'
GO
