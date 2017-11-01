CREATE TABLE [psa].[ics_stg_M3V10gen_POL_MITTRA]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_gen_MITTRA_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_gen_MITTRA_IsIncomplete] DEFAULT ('N'),
[MTACRF] [nchar] (8) NULL,
[MTADCU] [numeric] (3, 0) NULL,
[MTANBR] [numeric] (9, 0) NULL,
[MTATNB] [numeric] (17, 0) NULL,
[MTATNR] [numeric] (17, 0) NULL,
[MTBANO] [nvarchar] (20) NULL,
[MTBIRT] [numeric] (10, 0) NULL,
[MTBRE2] [nvarchar] (20) NULL,
[MTBREF] [nvarchar] (20) NULL,
[MTCAMU] [nvarchar] (20) NULL,
[MTCANB] [numeric] (17, 0) NULL,
[MTCAWE] [numeric] (15, 6) NULL,
[MTCDTP] [numeric] (1, 0) NULL,
[MTCFGL] [nchar] (15) NULL,
[MTCNDA] [numeric] (8, 0) NULL,
[MTCONO] [numeric] (18, 0) NOT NULL,
[MTCSQT] [numeric] (15, 6) NULL,
[MTCWTQ] [numeric] (15, 6) NULL,
[MTCWTT] [numeric] (15, 6) NULL,
[MTDEID] [numeric] (7, 0) NULL,
[MTECVE] [nchar] (4) NULL,
[MTELNO] [nchar] (8) NULL,
[MTFIAS] [numeric] (1, 0) NULL,
[MTHACP] [numeric] (17, 6) NULL,
[MTHACS] [numeric] (1, 0) NULL,
[MTINDI] [numeric] (1, 0) NULL,
[MTINER] [numeric] (1, 0) NULL,
[MTITNO] [nchar] (15) NOT NULL,
[MTLMTS] [numeric] (18, 0) NULL,
[MTLOCH] [numeric] (1, 0) NULL,
[MTMFCO] [numeric] (17, 6) NULL,
[MTNHAI] [nchar] (15) NULL,
[MTNHSN] [nvarchar] (20) NULL,
[MTNSTQ] [numeric] (15, 6) NULL,
[MTNSTT] [numeric] (15, 6) NULL,
[MTOPAN] [nvarchar] (20) NULL,
[MTPANR] [nvarchar] (20) NULL,
[MTPLSX] [numeric] (3, 0) NULL,
[MTPRMF] [numeric] (7, 0) NULL,
[MTPROJ] [nchar] (7) NULL,
[MTREPN] [numeric] (10, 0) NULL,
[MTRESP] [nchar] (10) NULL,
[MTRFTX] [nvarchar] (40) NULL,
[MTRGDT] [numeric] (18, 0) NOT NULL,
[MTRGTM] [numeric] (18, 0) NOT NULL,
[MTRIDI] [numeric] (11, 0) NULL,
[MTRIDL] [numeric] (6, 0) NULL,
[MTRIDN] [nchar] (10) NULL,
[MTRIDO] [numeric] (6, 0) NULL,
[MTRIDX] [numeric] (3, 0) NULL,
[MTRORC] [numeric] (1, 0) NULL,
[MTRORL] [numeric] (6, 0) NULL,
[MTRORN] [nchar] (10) NULL,
[MTRORX] [numeric] (3, 0) NULL,
[MTRPRT] [numeric] (1, 0) NULL,
[MTRSCD] [nchar] (3) NULL,
[MTSCNB] [nchar] (10) NULL,
[MTSLTP] [nchar] (2) NULL,
[MTSTAS] [nchar] (1) NULL,
[MTSTCD] [numeric] (1, 0) NULL,
[MTSTNO] [numeric] (15, 6) NULL,
[MTSUDO] [nvarchar] (20) NULL,
[MTTMSX] [numeric] (18, 0) NOT NULL,
[MTTRDT] [numeric] (8, 0) NULL,
[MTTRPR] [numeric] (17, 6) NULL,
[MTTRQA] [numeric] (15, 6) NULL,
[MTTRQT] [numeric] (15, 6) NULL,
[MTTRTM] [numeric] (6, 0) NULL,
[MTTRTP] [nchar] (3) NULL,
[MTTTID] [nchar] (3) NULL,
[MTTTYP] [numeric] (2, 0) NULL,
[MTTUPC] [numeric] (1, 0) NULL,
[MTUPIS] [numeric] (1, 0) NULL,
[MTWHLO] [nchar] (3) NOT NULL,
[MTWHSL] [nchar] (10) NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MITTRA] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_MITTRA] PRIMARY KEY CLUSTERED  ([MTCONO], [MTITNO], [MTRGDT], [MTRGTM], [MTTMSX], [MTWHLO])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MITTRA', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MITTRA', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MITTRA', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MITTRA', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MITTRA', 'COLUMN', N'EtlDeletedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MITTRA', 'COLUMN', N'EtlDeletedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The database-specific unique key of this record as identified within the ETL sub-system', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MITTRA', 'COLUMN', N'EtlRecordId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MITTRA', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MITTRA', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MITTRA', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record on this table; will be the same as EtlCreatedBy when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MITTRA', 'COLUMN', N'EtlUpdatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record on this table; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MITTRA', 'COLUMN', N'EtlUpdatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MITTRA', 'COLUMN', N'IsDeleted'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates whether ETL processing is complete.  Used on PSA staging tables to indicate that the row may have changes that need to be re-processed by the ETL process (regardless of current ETL Batch Run Id).  May be used for late arriving dimensions to force facts to be re-processed outside of their originating batch.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MITTRA', 'COLUMN', N'IsIncomplete'
GO
