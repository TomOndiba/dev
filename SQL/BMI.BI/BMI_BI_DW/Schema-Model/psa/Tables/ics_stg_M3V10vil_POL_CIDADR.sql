CREATE TABLE [psa].[ics_stg_M3V10vil_POL_CIDADR]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_vil_CIDADR_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_vil_CIDADR_IsIncomplete] DEFAULT ('N'),
[SAADID] [nchar] (6) NOT NULL,
[SAADR1] [nvarchar] (36) NULL,
[SAADR2] [nvarchar] (36) NULL,
[SAADR3] [nvarchar] (36) NULL,
[SAADR4] [nvarchar] (36) NULL,
[SAADTE] [numeric] (18, 0) NOT NULL,
[SAADVI] [nchar] (6) NULL,
[SACHID] [nchar] (10) NULL,
[SACHNO] [numeric] (3, 0) NULL,
[SACONO] [numeric] (18, 0) NOT NULL,
[SACSCD] [nchar] (3) NULL,
[SAECAR] [nchar] (2) NULL,
[SAEDES] [nchar] (10) NULL,
[SAGEOC] [numeric] (9, 0) NULL,
[SAGEOX] [numeric] (15, 6) NULL,
[SAGEOY] [numeric] (15, 6) NULL,
[SAGEOZ] [numeric] (15, 6) NULL,
[SALMDT] [numeric] (8, 0) NULL,
[SALMTS] [numeric] (18, 0) NULL,
[SAPNOD] [nchar] (15) NULL,
[SAPONO] [nchar] (10) NULL,
[SAPRIA] [numeric] (1, 0) NULL,
[SARGDT] [numeric] (8, 0) NULL,
[SARGTM] [numeric] (6, 0) NULL,
[SASTDT] [numeric] (18, 0) NOT NULL,
[SASUNM] [nvarchar] (36) NULL,
[SASUNO] [nchar] (10) NOT NULL,
[SATAXC] [nchar] (3) NULL,
[SATOWN] [nvarchar] (20) NULL,
[SATXID] [numeric] (13, 0) NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CIDADR] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_CIDADR] PRIMARY KEY CLUSTERED  ([SAADID], [SAADTE], [SACONO], [SASTDT], [SASUNO])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_CIDADR', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_CIDADR', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_CIDADR', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_CIDADR', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_CIDADR', 'COLUMN', N'EtlDeletedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_CIDADR', 'COLUMN', N'EtlDeletedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The database-specific unique key of this record as identified within the ETL sub-system', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_CIDADR', 'COLUMN', N'EtlRecordId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_CIDADR', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_CIDADR', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_CIDADR', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record on this table; will be the same as EtlCreatedBy when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_CIDADR', 'COLUMN', N'EtlUpdatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record on this table; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_CIDADR', 'COLUMN', N'EtlUpdatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_CIDADR', 'COLUMN', N'IsDeleted'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates whether ETL processing is complete.  Used on PSA staging tables to indicate that the row may have changes that need to be re-processed by the ETL process (regardless of current ETL Batch Run Id).  May be used for late arriving dimensions to force facts to be re-processed outside of their originating batch.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_CIDADR', 'COLUMN', N'IsIncomplete'
GO
