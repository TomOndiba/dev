CREATE TABLE [psa].[ics_stg_movex_OINVOL]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_movex_OINVOL_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_movex_OINVOL_IsIncomplete] DEFAULT ('N'),
[ONCONO] [decimal] (18, 0) NOT NULL,
[ONDIVI] [nvarchar] (255) NOT NULL,
[ONIVNO] [decimal] (18, 0) NOT NULL,
[ONYEA4] [decimal] (18, 0) NOT NULL,
[ONPYNO] [nvarchar] (255) NULL,
[ONIVSQ] [decimal] (18, 0) NOT NULL,
[ONIVTP] [nvarchar] (255) NOT NULL,
[ONORNO] [nvarchar] (255) NOT NULL,
[ONDLIX] [decimal] (18, 0) NOT NULL,
[ONWHLO] [nvarchar] (255) NOT NULL,
[ONIVRF] [nvarchar] (255) NOT NULL,
[ONIVAM] [decimal] (15, 2) NULL,
[ONIVLA] [decimal] (15, 2) NULL,
[ONIVBA] [decimal] (15, 2) NULL,
[ONCVT1] [decimal] (15, 2) NULL,
[ONCVT2] [decimal] (15, 2) NULL,
[ONVTAM] [decimal] (15, 2) NULL,
[ONIVFR] [nvarchar] (255) NULL,
[ONIVAV] [decimal] (15, 2) NULL,
[ONBSCD] [nvarchar] (255) NULL,
[ONECAR] [nvarchar] (255) NULL,
[ONFTCO] [nvarchar] (255) NULL,
[ONVTCD] [decimal] (2, 0) NULL,
[ONVTP1] [decimal] (5, 2) NULL,
[ONVTP2] [decimal] (5, 2) NULL,
[ONVRIN] [nvarchar] (255) NULL,
[ONVRNO] [nvarchar] (255) NULL,
[ONRGDT] [decimal] (8, 0) NULL,
[ONRGTM] [decimal] (6, 0) NULL,
[ONLMDT] [decimal] (8, 0) NULL,
[ONCHNO] [decimal] (3, 0) NULL,
[ONCHID] [nvarchar] (255) NULL,
[ONINPX] [nvarchar] (255) NULL,
[ONEXIN] [nvarchar] (255) NULL,
[ONTEPY] [nvarchar] (255) NULL,
[ONCVDT] [decimal] (8, 0) NULL
)
GO
ALTER TABLE [psa].[ics_stg_movex_OINVOL] ADD CONSTRAINT [PK_stg_movex_OINVOL] PRIMARY KEY CLUSTERED  ([ONCONO], [ONDIVI], [ONDLIX], [ONIVNO], [ONIVRF], [ONIVSQ], [ONIVTP], [ONORNO], [ONWHLO], [ONYEA4])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_OINVOL', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_OINVOL', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_OINVOL', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_OINVOL', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_OINVOL', 'COLUMN', N'EtlDeletedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_OINVOL', 'COLUMN', N'EtlDeletedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The database-specific unique key of this record as identified within the ETL sub-system', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_OINVOL', 'COLUMN', N'EtlRecordId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_OINVOL', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_OINVOL', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_OINVOL', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record on this table; will be the same as EtlCreatedBy when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_OINVOL', 'COLUMN', N'EtlUpdatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record on this table; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_OINVOL', 'COLUMN', N'EtlUpdatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_OINVOL', 'COLUMN', N'IsDeleted'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates whether ETL processing is complete.  Used on PSA staging tables to indicate that the row may have changes that need to be re-processed by the ETL process (regardless of current ETL Batch Run Id).  May be used for late arriving dimensions to force facts to be re-processed outside of their originating batch.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_movex_OINVOL', 'COLUMN', N'IsIncomplete'
GO
