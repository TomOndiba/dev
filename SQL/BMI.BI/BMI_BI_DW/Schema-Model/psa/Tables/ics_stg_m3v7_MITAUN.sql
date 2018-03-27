CREATE TABLE [psa].[ics_stg_m3v7_MITAUN]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_m3v7_MITAUN_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_m3v7_MITAUN_IsIncomplete] DEFAULT ('N'),
[MUCONO] [decimal] (3, 0) NULL,
[MUITNO] [nvarchar] (255) NOT NULL,
[MUAUTP] [decimal] (18, 0) NOT NULL,
[MUALUN] [nvarchar] (255) NOT NULL,
[MUDCCD] [decimal] (1, 0) NULL,
[MUCOFA] [decimal] (15, 9) NULL,
[MUDMCF] [decimal] (1, 0) NULL,
[MUPCOF] [decimal] (15, 9) NULL,
[MUAUS1] [decimal] (1, 0) NULL,
[MUAUS2] [decimal] (1, 0) NULL,
[MUAUS3] [decimal] (1, 0) NULL,
[MUAUS4] [decimal] (1, 0) NULL,
[MUAUS5] [decimal] (1, 0) NULL,
[MUAUS6] [decimal] (1, 0) NULL,
[MUAUS9] [decimal] (1, 0) NULL,
[MUUNMU] [decimal] (15, 6) NULL,
[MUFMID] [nvarchar] (255) NULL,
[MURESI] [nvarchar] (255) NULL,
[MUTXID] [decimal] (13, 0) NULL,
[MURGDT] [decimal] (8, 0) NULL,
[MURGTM] [decimal] (6, 0) NULL,
[MULMDT] [decimal] (8, 0) NULL,
[MUCHNO] [decimal] (3, 0) NULL,
[MUCHID] [nvarchar] (255) NULL,
[MULMTS] [decimal] (18, 0) NULL,
[MUPACT] [nvarchar] (255) NULL,
[MUAUSC] [decimal] (1, 0) NULL,
[MUAUSB] [decimal] (1, 0) NULL,
[MUCUEX] [nvarchar] (255) NULL,
[MULGUN] [decimal] (1, 0) NULL
)
GO
ALTER TABLE [psa].[ics_stg_m3v7_MITAUN] ADD CONSTRAINT [PK_stg_m3v7_MITAUN] PRIMARY KEY CLUSTERED  ([MUITNO], [MUAUTP], [MUALUN])
GO
EXEC sp_addextendedproperty N'IncludeInMerge', N'Y', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3v7_MITAUN', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3v7_MITAUN', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3v7_MITAUN', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3v7_MITAUN', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3v7_MITAUN', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3v7_MITAUN', 'COLUMN', N'EtlDeletedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3v7_MITAUN', 'COLUMN', N'EtlDeletedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The database-specific unique key of this record as identified within the ETL sub-system', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3v7_MITAUN', 'COLUMN', N'EtlRecordId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3v7_MITAUN', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3v7_MITAUN', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3v7_MITAUN', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record on this table; will be the same as EtlCreatedBy when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3v7_MITAUN', 'COLUMN', N'EtlUpdatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record on this table; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3v7_MITAUN', 'COLUMN', N'EtlUpdatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3v7_MITAUN', 'COLUMN', N'IsDeleted'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates whether ETL processing is complete.  Used on PSA staging tables to indicate that the row may have changes that need to be re-processed by the ETL process (regardless of current ETL Batch Run Id).  May be used for late arriving dimensions to force facts to be re-processed outside of their originating batch.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3v7_MITAUN', 'COLUMN', N'IsIncomplete'
GO
