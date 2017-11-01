CREATE TABLE [psa].[ics_stg_M3V10ved_POL_OINVOL]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_ved_OINVOL_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_ved_OINVOL_IsIncomplete] DEFAULT ('N'),
[ONBSCD] [nchar] (3) NULL,
[ONCHID] [nchar] (10) NULL,
[ONCHNO] [numeric] (3, 0) NULL,
[ONCONO] [numeric] (18, 0) NOT NULL,
[ONCVT1] [numeric] (15, 2) NULL,
[ONCVT2] [numeric] (15, 2) NULL,
[ONDIVI] [nchar] (3) NOT NULL,
[ONDLIX] [numeric] (18, 0) NOT NULL,
[ONECAR] [nchar] (2) NULL,
[ONEXIN] [nchar] (14) NULL,
[ONFTCO] [nchar] (3) NULL,
[ONINPX] [nchar] (6) NOT NULL,
[ONIVAM] [numeric] (15, 2) NULL,
[ONIVAV] [numeric] (15, 2) NULL,
[ONIVBA] [numeric] (15, 2) NULL,
[ONIVFR] [nvarchar] (30) NULL,
[ONIVLA] [numeric] (15, 2) NULL,
[ONIVNO] [numeric] (18, 0) NOT NULL,
[ONIVRF] [nvarchar] (20) NOT NULL,
[ONIVSQ] [numeric] (3, 0) NULL,
[ONIVTP] [nchar] (2) NOT NULL,
[ONLMDT] [numeric] (8, 0) NULL,
[ONORNO] [nchar] (10) NOT NULL,
[ONPYNO] [nchar] (10) NULL,
[ONRGDT] [numeric] (8, 0) NULL,
[ONRGTM] [numeric] (6, 0) NULL,
[ONVRIN] [nchar] (16) NULL,
[ONVRNO] [nchar] (16) NULL,
[ONVTAM] [numeric] (15, 2) NULL,
[ONVTCD] [numeric] (2, 0) NULL,
[ONVTP1] [numeric] (5, 2) NULL,
[ONVTP2] [numeric] (5, 2) NULL,
[ONWHLO] [nchar] (3) NOT NULL,
[ONYEA4] [numeric] (18, 0) NOT NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_OINVOL] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_OINVOL] PRIMARY KEY CLUSTERED  ([ONCONO], [ONDIVI], [ONDLIX], [ONINPX], [ONIVNO], [ONIVRF], [ONIVTP], [ONORNO], [ONWHLO], [ONYEA4])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_OINVOL', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_OINVOL', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_OINVOL', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_OINVOL', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_OINVOL', 'COLUMN', N'EtlDeletedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_OINVOL', 'COLUMN', N'EtlDeletedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The database-specific unique key of this record as identified within the ETL sub-system', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_OINVOL', 'COLUMN', N'EtlRecordId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_OINVOL', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_OINVOL', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_OINVOL', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record on this table; will be the same as EtlCreatedBy when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_OINVOL', 'COLUMN', N'EtlUpdatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record on this table; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_OINVOL', 'COLUMN', N'EtlUpdatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_OINVOL', 'COLUMN', N'IsDeleted'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates whether ETL processing is complete.  Used on PSA staging tables to indicate that the row may have changes that need to be re-processed by the ETL process (regardless of current ETL Batch Run Id).  May be used for late arriving dimensions to force facts to be re-processed outside of their originating batch.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_OINVOL', 'COLUMN', N'IsIncomplete'
GO
