CREATE TABLE [psa].[ics_stg_movex_MILOMA]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_movex_MILOMA_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_movex_MILOMA_IsIncomplete] DEFAULT ('N'),
[LMCONO] [decimal] (3, 0) NULL,
[LMITNO] [nvarchar] (255) NOT NULL,
[LMBANO] [nvarchar] (255) NOT NULL,
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
ALTER TABLE [psa].[ics_stg_movex_MILOMA] ADD CONSTRAINT [PK_stg_movex_MILOMA] PRIMARY KEY CLUSTERED  ([LMBANO], [LMITNO])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_MILOMA', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_MILOMA', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_MILOMA', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_MILOMA', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that last marked this record deleted/inactive; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_MILOMA', 'COLUMN', N'EtlDeletedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last marked this record deleted/inactive; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_MILOMA', 'COLUMN', N'EtlDeletedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The database-specific unique key of this record as identified within the ETL sub-system', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_MILOMA', 'COLUMN', N'EtlRecordId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from where this row was extracted', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_MILOMA', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_MILOMA', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_MILOMA', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record; will be the same as EtlCreatedBy when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_MILOMA', 'COLUMN', N'EtlUpdatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_MILOMA', 'COLUMN', N'EtlUpdatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_MILOMA', 'COLUMN', N'IsDeleted'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates whether ETL processing is complete.  Used on PSA staging tables to indicate that the row may have changes that need to be re-processed by the ETL process (regardless of current ETL Batch Run Id).  May be used for late arriving dimensions to force facts to be re-processed outside of their originating batch.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_MILOMA', 'COLUMN', N'IsIncomplete'
GO
