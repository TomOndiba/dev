CREATE TABLE [psa].[ics_stg_m3_OINVOH]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_m3_OINVOH_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_m3_OINVOH_IsIncomplete] DEFAULT ('N'),
[UHCONO] [decimal] (18, 0) NOT NULL,
[UHDIVI] [nvarchar] (255) NOT NULL,
[UHFACI] [nvarchar] (255) NULL,
[UHIVNO] [decimal] (18, 0) NOT NULL,
[UHYEA4] [decimal] (4, 0) NULL,
[UHPYNO] [nvarchar] (255) NULL,
[UHINST] [nvarchar] (255) NULL,
[UHIVAM] [decimal] (15, 2) NULL,
[UHIVLA] [decimal] (15, 2) NULL,
[UHCUCD] [nvarchar] (255) NULL,
[UHRAIN] [decimal] (11, 6) NULL,
[UHDUDT] [decimal] (8, 0) NULL,
[UHVSER] [nvarchar] (255) NULL,
[UHVONO] [decimal] (8, 0) NULL,
[UHIDAT] [decimal] (8, 0) NULL,
[UHACDT] [decimal] (8, 0) NULL,
[UHIVTP] [nvarchar] (255) NULL,
[UHUPEC] [decimal] (1, 0) NULL,
[UHUPBC] [decimal] (1, 0) NULL,
[UHUPAC] [decimal] (1, 0) NULL,
[UHINRC] [nvarchar] (255) NULL,
[UHNVAT] [decimal] (1, 0) NULL,
[UHMUST] [decimal] (1, 0) NULL,
[UHCASH] [decimal] (1, 0) NULL,
[UHRAFC] [decimal] (15, 2) NULL,
[UHRALC] [decimal] (15, 2) NULL,
[UHFAC2] [nvarchar] (255) NULL,
[UHORIG] [decimal] (1, 0) NULL,
[UHNREF] [nvarchar] (255) NULL,
[UH3RDP] [nvarchar] (255) NULL,
[UHRGDT] [decimal] (8, 0) NULL,
[UHRGTM] [decimal] (6, 0) NULL,
[UHLMDT] [decimal] (8, 0) NULL,
[UHCHNO] [decimal] (3, 0) NULL,
[UHCHID] [nvarchar] (255) NULL,
[UHRYEA] [decimal] (4, 0) NULL,
[UHRIVN] [decimal] (9, 0) NULL,
[UHINPX] [nvarchar] (255) NULL,
[UHEXIN] [nvarchar] (255) NULL,
[UHRINP] [nvarchar] (255) NULL,
[UHRXIN] [nvarchar] (255) NULL,
[UHLMTS] [decimal] (18, 0) NULL,
[UHSBTO] [decimal] (1, 0) NULL,
[UHNESI] [decimal] (1, 0) NULL,
[UHLCUR] [nvarchar] (255) NULL,
[UHLVAT] [decimal] (15, 2) NULL,
[UHARAT] [decimal] (11, 6) NULL,
[UHIVBA] [decimal] (15, 2) NULL,
[UHPDYR] [decimal] (4, 0) NULL,
[UHPDNO] [nvarchar] (255) NULL
)
GO
ALTER TABLE [psa].[ics_stg_m3_OINVOH] ADD CONSTRAINT [PK_stg_m3_OINVOH] PRIMARY KEY CLUSTERED  ([UHCONO], [UHIVNO], [UHDIVI])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3_OINVOH', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3_OINVOH', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3_OINVOH', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3_OINVOH', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that last marked this record deleted/inactive; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3_OINVOH', 'COLUMN', N'EtlDeletedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last marked this record deleted/inactive; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3_OINVOH', 'COLUMN', N'EtlDeletedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The database-specific unique key of this record as identified within the ETL sub-system', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3_OINVOH', 'COLUMN', N'EtlRecordId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from where this row was extracted', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3_OINVOH', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3_OINVOH', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3_OINVOH', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record; will be the same as EtlCreatedBy when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3_OINVOH', 'COLUMN', N'EtlUpdatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3_OINVOH', 'COLUMN', N'EtlUpdatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3_OINVOH', 'COLUMN', N'IsDeleted'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates whether ETL processing is complete.  Used on PSA staging tables to indicate that the row may have changes that need to be re-processed by the ETL process (regardless of current ETL Batch Run Id).  May be used for late arriving dimensions to force facts to be re-processed outside of their originating batch.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3_OINVOH', 'COLUMN', N'IsIncomplete'
GO
