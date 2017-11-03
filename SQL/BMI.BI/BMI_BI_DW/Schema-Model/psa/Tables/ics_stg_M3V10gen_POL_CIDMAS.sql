CREATE TABLE [psa].[ics_stg_M3V10gen_POL_CIDMAS]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_gen_CIDMAS_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_gen_CIDMAS_IsIncomplete] DEFAULT ('N'),
[IDALSU] [nchar] (10) NULL,
[IDCFI1] [nchar] (10) NULL,
[IDCFI2] [numeric] (15, 2) NULL,
[IDCFI3] [nchar] (3) NULL,
[IDCFI4] [nchar] (5) NULL,
[IDCFI5] [nchar] (1) NULL,
[IDCHID] [nchar] (10) NULL,
[IDCHNO] [numeric] (3, 0) NULL,
[IDCONO] [numeric] (18, 0) NOT NULL,
[IDCOR2] [nchar] (11) NULL,
[IDCORG] [nchar] (11) NULL,
[IDCSCD] [nchar] (3) NULL,
[IDDESV] [nchar] (2) NULL,
[IDDTFM] [nchar] (3) NULL,
[IDECAR] [nchar] (2) NULL,
[IDEDIT] [nchar] (1) NULL,
[IDFWSC] [nchar] (4) NULL,
[IDHAFE] [nchar] (6) NULL,
[IDLMDT] [numeric] (8, 0) NULL,
[IDLMTS] [numeric] (18, 0) NULL,
[IDLNCD] [nchar] (2) NULL,
[IDMEPF] [nchar] (2) NULL,
[IDPHN2] [nchar] (16) NULL,
[IDPHNO] [nchar] (16) NULL,
[IDPODA] [numeric] (3, 0) NULL,
[IDPPIN] [numeric] (1, 0) NULL,
[IDRGDT] [numeric] (8, 0) NULL,
[IDRGTM] [numeric] (6, 0) NULL,
[IDSTAT] [nchar] (2) NULL,
[IDSUAL] [nchar] (3) NULL,
[IDSUCM] [nvarchar] (20) NULL,
[IDSUCO] [nchar] (10) NULL,
[IDSUNM] [nvarchar] (36) NULL,
[IDSUNO] [nchar] (10) NOT NULL,
[IDSUTY] [numeric] (1, 0) NULL,
[IDTFNO] [nchar] (16) NULL,
[IDTIZO] [nchar] (5) NULL,
[IDTLNO] [nchar] (16) NULL,
[IDTXID] [numeric] (13, 0) NULL,
[IDVRNO] [nchar] (16) NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CIDMAS] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_CIDMAS] PRIMARY KEY CLUSTERED  ([IDCONO], [IDSUNO])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_CIDMAS', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_CIDMAS', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_CIDMAS', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_CIDMAS', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_CIDMAS', 'COLUMN', N'EtlDeletedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_CIDMAS', 'COLUMN', N'EtlDeletedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The database-specific unique key of this record as identified within the ETL sub-system', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_CIDMAS', 'COLUMN', N'EtlRecordId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_CIDMAS', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_CIDMAS', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_CIDMAS', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record on this table; will be the same as EtlCreatedBy when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_CIDMAS', 'COLUMN', N'EtlUpdatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record on this table; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_CIDMAS', 'COLUMN', N'EtlUpdatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_CIDMAS', 'COLUMN', N'IsDeleted'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates whether ETL processing is complete.  Used on PSA staging tables to indicate that the row may have changes that need to be re-processed by the ETL process (regardless of current ETL Batch Run Id).  May be used for late arriving dimensions to force facts to be re-processed outside of their originating batch.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_CIDMAS', 'COLUMN', N'IsIncomplete'
GO
