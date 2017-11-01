CREATE TABLE [psa].[ics_stg_M3V10ved_POL_FRCALP]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_ved_FRCALP_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_ved_FRCALP_IsIncomplete] DEFAULT ('N'),
[HEANBR] [numeric] (9, 0) NULL,
[HEBANO] [nvarchar] (20) NULL,
[HEBJNO] [nvarchar] (18) NOT NULL,
[HEBSOB] [numeric] (15, 2) NULL,
[HECANB] [numeric] (17, 0) NULL,
[HECHID] [nchar] (10) NULL,
[HECHNO] [numeric] (3, 0) NULL,
[HECONO] [numeric] (18, 0) NOT NULL,
[HEFACI] [nchar] (3) NULL,
[HEFSRC] [nchar] (1) NULL,
[HEGTYP] [nchar] (2) NULL,
[HEHACP] [numeric] (17, 6) NULL,
[HEITNO] [nchar] (15) NOT NULL,
[HELMDT] [numeric] (8, 0) NULL,
[HELMTS] [numeric] (18, 0) NULL,
[HEMFCO] [numeric] (17, 6) NULL,
[HEMRGD] [numeric] (18, 0) NOT NULL,
[HEMRGT] [numeric] (18, 0) NOT NULL,
[HERGDT] [numeric] (8, 0) NULL,
[HERGTM] [numeric] (6, 0) NULL,
[HETMSX] [numeric] (18, 0) NOT NULL,
[HETRDT] [numeric] (18, 0) NOT NULL,
[HETRQT] [numeric] (15, 6) NULL,
[HETRTM] [numeric] (18, 0) NOT NULL,
[HETRTP] [nchar] (3) NULL,
[HETTID] [nchar] (3) NULL,
[HETTYP] [numeric] (2, 0) NULL,
[HEWHLO] [nchar] (3) NOT NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_FRCALP] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_FRCALP] PRIMARY KEY CLUSTERED  ([HEBJNO], [HECONO], [HEITNO], [HEMRGD], [HEMRGT], [HETMSX], [HETRDT], [HETRTM], [HEWHLO])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_FRCALP', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_FRCALP', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_FRCALP', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_FRCALP', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_FRCALP', 'COLUMN', N'EtlDeletedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_FRCALP', 'COLUMN', N'EtlDeletedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The database-specific unique key of this record as identified within the ETL sub-system', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_FRCALP', 'COLUMN', N'EtlRecordId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_FRCALP', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_FRCALP', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_FRCALP', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record on this table; will be the same as EtlCreatedBy when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_FRCALP', 'COLUMN', N'EtlUpdatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record on this table; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_FRCALP', 'COLUMN', N'EtlUpdatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_FRCALP', 'COLUMN', N'IsDeleted'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates whether ETL processing is complete.  Used on PSA staging tables to indicate that the row may have changes that need to be re-processed by the ETL process (regardless of current ETL Batch Run Id).  May be used for late arriving dimensions to force facts to be re-processed outside of their originating batch.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10ved_POL_FRCALP', 'COLUMN', N'IsIncomplete'
GO
