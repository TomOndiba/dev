CREATE TABLE [psa].[ics_stg_movex_MITPOP]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_movex_MITPOP_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_movex_MITPOP_IsIncomplete] DEFAULT ('N'),
[MPCONO] [decimal] (18, 0) NOT NULL,
[MPALWT] [decimal] (18, 0) NOT NULL,
[MPALWQ] [nvarchar] (255) NULL,
[MPITNO] [nvarchar] (255) NOT NULL,
[MPPOPN] [nvarchar] (255) NOT NULL,
[MPE0PA] [nvarchar] (255) NOT NULL,
[MPVFDT] [decimal] (18, 0) NOT NULL,
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
ALTER TABLE [psa].[ics_stg_movex_MITPOP] ADD CONSTRAINT [PK_stg_movex_MITPOP] PRIMARY KEY CLUSTERED  ([MPALWT], [MPCONO], [MPE0PA], [MPITNO], [MPPOPN], [MPVFDT])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_MITPOP', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_MITPOP', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_MITPOP', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_MITPOP', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that last marked this record deleted/inactive; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_MITPOP', 'COLUMN', N'EtlDeletedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last marked this record deleted/inactive; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_MITPOP', 'COLUMN', N'EtlDeletedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The database-specific unique key of this record as identified within the ETL sub-system', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_MITPOP', 'COLUMN', N'EtlRecordId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from where this row was extracted', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_MITPOP', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_MITPOP', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_MITPOP', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record; will be the same as EtlCreatedBy when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_MITPOP', 'COLUMN', N'EtlUpdatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_MITPOP', 'COLUMN', N'EtlUpdatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_MITPOP', 'COLUMN', N'IsDeleted'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates whether ETL processing is complete.  Used on PSA staging tables to indicate that the row may have changes that need to be re-processed by the ETL process (regardless of current ETL Batch Run Id).  May be used for late arriving dimensions to force facts to be re-processed outside of their originating batch.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_MITPOP', 'COLUMN', N'IsIncomplete'
GO
