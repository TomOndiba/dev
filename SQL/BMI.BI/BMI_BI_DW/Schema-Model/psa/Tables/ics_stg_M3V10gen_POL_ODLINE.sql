CREATE TABLE [psa].[ics_stg_M3V10gen_POL_ODLINE]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_gen_ODLINE_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_gen_ODLINE_IsIncomplete] DEFAULT ('N'),
[UBALUN] [nchar] (3) NULL,
[UBAPBA] [numeric] (1, 0) NULL,
[UBCHID] [nchar] (10) NULL,
[UBCHNO] [numeric] (3, 0) NULL,
[UBCHQT] [numeric] (15, 6) NULL,
[UBCMNO] [nchar] (4) NULL,
[UBCONO] [numeric] (18, 0) NOT NULL,
[UBCUCT] [nchar] (3) NULL,
[UBCUOR] [nvarchar] (20) NULL,
[UBDCOS] [numeric] (17, 6) NULL,
[UBDIA1] [numeric] (15, 2) NULL,
[UBDIA2] [numeric] (15, 2) NULL,
[UBDIA3] [numeric] (15, 2) NULL,
[UBDIA4] [numeric] (15, 2) NULL,
[UBDIA5] [numeric] (15, 2) NULL,
[UBDIA6] [numeric] (15, 2) NULL,
[UBDIC1] [numeric] (1, 0) NULL,
[UBDIC2] [numeric] (1, 0) NULL,
[UBDIC3] [numeric] (1, 0) NULL,
[UBDIC4] [numeric] (1, 0) NULL,
[UBDIC5] [numeric] (1, 0) NULL,
[UBDIC6] [numeric] (1, 0) NULL,
[UBDIP1] [numeric] (5, 2) NULL,
[UBDIP2] [numeric] (5, 2) NULL,
[UBDIP3] [numeric] (5, 2) NULL,
[UBDIP4] [numeric] (5, 2) NULL,
[UBDIP5] [numeric] (5, 2) NULL,
[UBDIP6] [numeric] (5, 2) NULL,
[UBDIVI] [nchar] (3) NULL,
[UBDLIX] [numeric] (18, 0) NOT NULL,
[UBDLQA] [numeric] (15, 6) NULL,
[UBDLQS] [numeric] (15, 6) NULL,
[UBDLQT] [numeric] (15, 6) NULL,
[UBDTID] [numeric] (13, 0) NULL,
[UBELNO] [nchar] (8) NULL,
[UBEXIN] [nchar] (14) NULL,
[UBFACI] [nchar] (3) NULL,
[UBGWTP] [nchar] (10) NULL,
[UBHDPR] [nchar] (15) NULL,
[UBINPR] [numeric] (17, 6) NULL,
[UBINPX] [nchar] (6) NULL,
[UBITNO] [nchar] (15) NULL,
[UBIVNO] [numeric] (9, 0) NULL,
[UBIVQA] [numeric] (15, 6) NULL,
[UBIVQS] [numeric] (15, 6) NULL,
[UBIVQT] [numeric] (15, 6) NULL,
[UBLMDT] [numeric] (8, 0) NULL,
[UBLNAM] [numeric] (15, 2) NULL,
[UBLTYP] [nchar] (1) NULL,
[UBNEPR] [numeric] (17, 6) NULL,
[UBORNO] [nchar] (10) NOT NULL,
[UBPONR] [numeric] (18, 0) NOT NULL,
[UBPOSX] [numeric] (18, 0) NOT NULL,
[UBPOTX] [numeric] (13, 0) NULL,
[UBPRCH] [numeric] (1, 0) NULL,
[UBPRMO] [nchar] (1) NULL,
[UBPROJ] [nchar] (7) NULL,
[UBPRPR] [numeric] (1, 0) NULL,
[UBPRTX] [numeric] (13, 0) NULL,
[UBRGDT] [numeric] (8, 0) NULL,
[UBRGTM] [numeric] (6, 0) NULL,
[UBRTQA] [numeric] (15, 6) NULL,
[UBRTQT] [numeric] (15, 6) NULL,
[UBSACD] [numeric] (5, 0) NULL,
[UBSAPR] [numeric] (17, 6) NULL,
[UBSPUN] [nchar] (3) NULL,
[UBSTCD] [numeric] (1, 0) NULL,
[UBSUNO] [nchar] (10) NULL,
[UBUCCD] [numeric] (1, 0) NULL,
[UBUCOS] [numeric] (17, 6) NULL,
[UBWATP] [nchar] (10) NULL,
[UBWHLO] [nchar] (3) NOT NULL,
[UBYEA4] [numeric] (4, 0) NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_ODLINE] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_ODLINE] PRIMARY KEY CLUSTERED  ([UBCONO], [UBDLIX], [UBORNO], [UBPONR], [UBPOSX], [UBWHLO])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_ODLINE', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_ODLINE', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_ODLINE', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_ODLINE', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_ODLINE', 'COLUMN', N'EtlDeletedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_ODLINE', 'COLUMN', N'EtlDeletedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The database-specific unique key of this record as identified within the ETL sub-system', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_ODLINE', 'COLUMN', N'EtlRecordId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_ODLINE', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_ODLINE', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_ODLINE', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record on this table; will be the same as EtlCreatedBy when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_ODLINE', 'COLUMN', N'EtlUpdatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record on this table; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_ODLINE', 'COLUMN', N'EtlUpdatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_ODLINE', 'COLUMN', N'IsDeleted'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates whether ETL processing is complete.  Used on PSA staging tables to indicate that the row may have changes that need to be re-processed by the ETL process (regardless of current ETL Batch Run Id).  May be used for late arriving dimensions to force facts to be re-processed outside of their originating batch.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_ODLINE', 'COLUMN', N'IsIncomplete'
GO
