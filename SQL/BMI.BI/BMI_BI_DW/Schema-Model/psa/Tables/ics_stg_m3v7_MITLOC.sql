CREATE TABLE [psa].[ics_stg_m3v7_MITLOC]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_m3v7_MITLOC_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_m3v7_MITLOC_IsIncomplete] DEFAULT ('N'),
[MLCONO] [decimal] (18, 0) NOT NULL,
[MLWHLO] [nvarchar] (255) NOT NULL,
[MLITNO] [nvarchar] (255) NOT NULL,
[MLWHSL] [nvarchar] (255) NOT NULL,
[MLBANO] [nvarchar] (255) NOT NULL,
[MLCAMU] [nvarchar] (255) NULL,
[MLFACI] [nvarchar] (255) NULL,
[MLWHLT] [nvarchar] (255) NULL,
[MLSTQT] [decimal] (15, 6) NULL,
[MLPOCY] [decimal] (5, 2) NULL,
[MLALQT] [decimal] (15, 6) NULL,
[MLPLQT] [decimal] (15, 6) NULL,
[MLALOC] [decimal] (1, 0) NULL,
[MLPUAB] [decimal] (1, 0) NULL,
[MLSTAS] [nvarchar] (255) NULL,
[MLPPRI] [nvarchar] (255) NULL,
[MLPRDT] [decimal] (8, 0) NULL,
[MLREPN] [decimal] (18, 0) NOT NULL,
[MLIDDT] [decimal] (8, 0) NULL,
[MLODDT] [decimal] (8, 0) NULL,
[MLINDT] [decimal] (8, 0) NULL,
[MLINON] [decimal] (1, 0) NULL,
[MLBREF] [nvarchar] (255) NULL,
[MLBRE2] [nvarchar] (255) NULL,
[MLBREM] [nvarchar] (255) NULL,
[MLSLTP] [nvarchar] (255) NULL,
[MLPACT] [nvarchar] (255) NULL,
[MLSTES] [decimal] (1, 0) NULL,
[MLTXID] [decimal] (13, 0) NULL,
[MLDTID] [decimal] (13, 0) NULL,
[MLAUDE] [decimal] (1, 0) NULL,
[MLAUDD] [decimal] (3, 0) NULL,
[MLRCLS] [decimal] (8, 0) NULL,
[MLRCLN] [decimal] (7, 0) NULL,
[MLATNR] [decimal] (17, 0) NULL,
[MLCNDT] [decimal] (8, 0) NULL,
[MLSEDT] [decimal] (8, 0) NULL,
[MLSTQM] [decimal] (15, 6) NULL,
[MLRGDT] [decimal] (8, 0) NULL,
[MLRGTM] [decimal] (6, 0) NULL,
[MLLMDT] [decimal] (8, 0) NULL,
[MLCHNO] [decimal] (3, 0) NULL,
[MLCHID] [nvarchar] (255) NULL,
[MLLMTS] [decimal] (18, 0) NULL,
[MLINVC] [decimal] (1, 0) NULL,
[MLATV1] [nvarchar] (255) NULL,
[MLATV2] [nvarchar] (255) NULL,
[MLATV3] [nvarchar] (255) NULL,
[MLATV4] [nvarchar] (255) NULL,
[MLATV5] [nvarchar] (255) NULL,
[MLCANB] [decimal] (17, 0) NULL,
[MLSTNB] [decimal] (10, 0) NULL,
[MLOPAN] [nvarchar] (255) NULL,
[MLCAWE] [decimal] (15, 6) NULL,
[MLINCW] [decimal] (15, 6) NULL,
[MLIQTY] [decimal] (15, 6) NULL,
[MLACUW] [decimal] (15, 6) NULL,
[MLACUQ] [decimal] (15, 6) NULL,
[MLADJW] [decimal] (15, 6) NULL,
[MLFIFL] [decimal] (1, 0) NULL,
[MLSEMO] [decimal] (2, 0) NULL,
[MLQIAD] [decimal] (8, 0) NULL,
[MLANNO] [decimal] (2, 0) NULL,
[MLNALO] [decimal] (1, 0) NULL,
[MLTIHM] [decimal] (4, 0) NULL,
[MLQRID] [nvarchar] (255) NULL
)
GO
ALTER TABLE [psa].[ics_stg_m3v7_MITLOC] ADD CONSTRAINT [PK_stg_m3v7_MITLOC] PRIMARY KEY CLUSTERED  ([MLREPN], [MLCONO], [MLWHLO], [MLITNO], [MLWHSL], [MLBANO])
GO
EXEC sp_addextendedproperty N'IncludeInMerge', N'Y', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3v7_MITLOC', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3v7_MITLOC', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3v7_MITLOC', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3v7_MITLOC', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3v7_MITLOC', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3v7_MITLOC', 'COLUMN', N'EtlDeletedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3v7_MITLOC', 'COLUMN', N'EtlDeletedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The database-specific unique key of this record as identified within the ETL sub-system', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3v7_MITLOC', 'COLUMN', N'EtlRecordId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3v7_MITLOC', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3v7_MITLOC', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3v7_MITLOC', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record on this table; will be the same as EtlCreatedBy when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3v7_MITLOC', 'COLUMN', N'EtlUpdatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record on this table; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3v7_MITLOC', 'COLUMN', N'EtlUpdatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3v7_MITLOC', 'COLUMN', N'IsDeleted'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates whether ETL processing is complete.  Used on PSA staging tables to indicate that the row may have changes that need to be re-processed by the ETL process (regardless of current ETL Batch Run Id).  May be used for late arriving dimensions to force facts to be re-processed outside of their originating batch.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3v7_MITLOC', 'COLUMN', N'IsIncomplete'
GO
