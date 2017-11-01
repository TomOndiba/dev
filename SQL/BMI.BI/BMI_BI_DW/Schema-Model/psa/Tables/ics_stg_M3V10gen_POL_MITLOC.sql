CREATE TABLE [psa].[ics_stg_M3V10gen_POL_MITLOC]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_gen_MITLOC_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_gen_MITLOC_IsIncomplete] DEFAULT ('N'),
[MLACUQ] [numeric] (15, 6) NULL,
[MLACUW] [numeric] (15, 6) NULL,
[MLADJW] [numeric] (15, 6) NULL,
[MLALOC] [numeric] (1, 0) NULL,
[MLALQT] [numeric] (15, 6) NULL,
[MLATNR] [numeric] (17, 0) NULL,
[MLATV1] [nchar] (15) NULL,
[MLATV2] [nchar] (15) NULL,
[MLATV3] [nchar] (15) NULL,
[MLATV4] [nchar] (15) NULL,
[MLATV5] [nchar] (15) NULL,
[MLAUDD] [numeric] (3, 0) NULL,
[MLAUDE] [numeric] (1, 0) NULL,
[MLBANO] [nvarchar] (20) NOT NULL,
[MLBRE2] [nvarchar] (20) NULL,
[MLBREF] [nvarchar] (20) NULL,
[MLBREM] [nvarchar] (20) NULL,
[MLCAMU] [nvarchar] (20) NOT NULL,
[MLCANB] [numeric] (17, 0) NULL,
[MLCAWE] [numeric] (15, 6) NULL,
[MLCHID] [nchar] (10) NULL,
[MLCHNO] [numeric] (3, 0) NULL,
[MLCNDT] [numeric] (8, 0) NULL,
[MLCONO] [numeric] (18, 0) NOT NULL,
[MLDTID] [numeric] (13, 0) NULL,
[MLFACI] [nchar] (3) NULL,
[MLFIFL] [numeric] (1, 0) NULL,
[MLIDDT] [numeric] (8, 0) NULL,
[MLINCW] [numeric] (15, 6) NULL,
[MLINDT] [numeric] (8, 0) NULL,
[MLINON] [numeric] (1, 0) NULL,
[MLINVC] [numeric] (1, 0) NULL,
[MLIQTY] [numeric] (15, 6) NULL,
[MLITNO] [nchar] (15) NOT NULL,
[MLLMDT] [numeric] (8, 0) NULL,
[MLLMTS] [numeric] (18, 0) NULL,
[MLODDT] [numeric] (8, 0) NULL,
[MLOPAN] [nvarchar] (20) NULL,
[MLPACT] [nchar] (6) NULL,
[MLPLQT] [numeric] (15, 6) NULL,
[MLPOCY] [numeric] (5, 2) NULL,
[MLPPRI] [nchar] (1) NULL,
[MLPRDT] [numeric] (8, 0) NULL,
[MLPUAB] [numeric] (1, 0) NULL,
[MLRCLN] [numeric] (7, 0) NULL,
[MLRCLS] [numeric] (8, 0) NULL,
[MLREPN] [numeric] (18, 0) NOT NULL,
[MLRGDT] [numeric] (8, 0) NULL,
[MLRGTM] [numeric] (6, 0) NULL,
[MLSEDT] [numeric] (8, 0) NULL,
[MLSLTP] [nchar] (2) NULL,
[MLSTAS] [nchar] (1) NULL,
[MLSTES] [numeric] (1, 0) NULL,
[MLSTNB] [numeric] (10, 0) NULL,
[MLSTQM] [numeric] (15, 6) NULL,
[MLSTQT] [numeric] (15, 6) NULL,
[MLTXID] [numeric] (13, 0) NULL,
[MLWHLO] [nchar] (3) NOT NULL,
[MLWHLT] [nchar] (2) NULL,
[MLWHSL] [nchar] (10) NOT NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITLOC] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_MITLOC] PRIMARY KEY CLUSTERED  ([MLBANO], [MLCAMU], [MLCONO], [MLITNO], [MLREPN], [MLWHLO], [MLWHSL])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MITLOC', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MITLOC', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MITLOC', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MITLOC', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MITLOC', 'COLUMN', N'EtlDeletedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MITLOC', 'COLUMN', N'EtlDeletedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The database-specific unique key of this record as identified within the ETL sub-system', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MITLOC', 'COLUMN', N'EtlRecordId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MITLOC', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MITLOC', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MITLOC', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record on this table; will be the same as EtlCreatedBy when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MITLOC', 'COLUMN', N'EtlUpdatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record on this table; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MITLOC', 'COLUMN', N'EtlUpdatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MITLOC', 'COLUMN', N'IsDeleted'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates whether ETL processing is complete.  Used on PSA staging tables to indicate that the row may have changes that need to be re-processed by the ETL process (regardless of current ETL Batch Run Id).  May be used for late arriving dimensions to force facts to be re-processed outside of their originating batch.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MITLOC', 'COLUMN', N'IsIncomplete'
GO
