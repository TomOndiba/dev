CREATE TABLE [psa].[ics_stg_M3V10vil_POL_OINVOH]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_vil_OINVOH_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_vil_OINVOH_IsIncomplete] DEFAULT ('N'),
[UH3RDP] [nchar] (10) NULL,
[UHACDT] [numeric] (8, 0) NULL,
[UHCASH] [numeric] (1, 0) NULL,
[UHCHID] [nchar] (10) NULL,
[UHCHNO] [numeric] (3, 0) NULL,
[UHCONO] [numeric] (18, 0) NOT NULL,
[UHCUCD] [nchar] (3) NULL,
[UHDIVI] [nchar] (3) NOT NULL,
[UHDUDT] [numeric] (8, 0) NULL,
[UHEXIN] [nchar] (14) NULL,
[UHFAC2] [nchar] (3) NULL,
[UHFACI] [nchar] (3) NULL,
[UHIDAT] [numeric] (8, 0) NULL,
[UHINPX] [nchar] (6) NOT NULL,
[UHINRC] [nchar] (10) NULL,
[UHINST] [nchar] (2) NULL,
[UHIVAM] [numeric] (15, 2) NULL,
[UHIVLA] [numeric] (15, 2) NULL,
[UHIVNO] [numeric] (18, 0) NOT NULL,
[UHIVTP] [nchar] (2) NULL,
[UHLMDT] [numeric] (8, 0) NULL,
[UHLMTS] [numeric] (18, 0) NULL,
[UHMUST] [numeric] (1, 0) NULL,
[UHNESI] [numeric] (1, 0) NULL,
[UHNREF] [nvarchar] (20) NULL,
[UHNVAT] [numeric] (1, 0) NULL,
[UHORIG] [numeric] (1, 0) NULL,
[UHPYNO] [nchar] (10) NULL,
[UHRAFC] [numeric] (15, 2) NULL,
[UHRAIN] [numeric] (11, 6) NULL,
[UHRALC] [numeric] (15, 2) NULL,
[UHRGDT] [numeric] (8, 0) NULL,
[UHRGTM] [numeric] (6, 0) NULL,
[UHRINP] [nchar] (6) NULL,
[UHRIVN] [numeric] (9, 0) NULL,
[UHRXIN] [nchar] (14) NULL,
[UHRYEA] [numeric] (4, 0) NULL,
[UHSBTO] [numeric] (1, 0) NULL,
[UHUPAC] [numeric] (1, 0) NULL,
[UHUPBC] [numeric] (1, 0) NULL,
[UHUPEC] [numeric] (1, 0) NULL,
[UHVONO] [numeric] (8, 0) NULL,
[UHVSER] [nchar] (3) NULL,
[UHYEA4] [numeric] (18, 0) NOT NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_OINVOH] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_OINVOH] PRIMARY KEY CLUSTERED  ([UHCONO], [UHDIVI], [UHINPX], [UHIVNO], [UHYEA4])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_OINVOH', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_OINVOH', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_OINVOH', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_OINVOH', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_OINVOH', 'COLUMN', N'EtlDeletedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_OINVOH', 'COLUMN', N'EtlDeletedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The database-specific unique key of this record as identified within the ETL sub-system', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_OINVOH', 'COLUMN', N'EtlRecordId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_OINVOH', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_OINVOH', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_OINVOH', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record on this table; will be the same as EtlCreatedBy when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_OINVOH', 'COLUMN', N'EtlUpdatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record on this table; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_OINVOH', 'COLUMN', N'EtlUpdatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_OINVOH', 'COLUMN', N'IsDeleted'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates whether ETL processing is complete.  Used on PSA staging tables to indicate that the row may have changes that need to be re-processed by the ETL process (regardless of current ETL Batch Run Id).  May be used for late arriving dimensions to force facts to be re-processed outside of their originating batch.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_OINVOH', 'COLUMN', N'IsIncomplete'
GO
