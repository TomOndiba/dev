CREATE TABLE [psa].[ics_stg_SAP_GBR_MARD]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MARD_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_ics_stg_SAP_GBR_MARD_IsIncomplete] DEFAULT ('N'),
[BSKRF] [float] NULL,
[DISKZ] [nvarchar] (1) NULL,
[DLINL] [datetime] NULL,
[EINME] [decimal] (18, 0) NULL,
[ERSDA] [datetime] NULL,
[EXPPG] [nvarchar] (1) NULL,
[EXVER] [nvarchar] (2) NULL,
[HERKL] [nvarchar] (3) NULL,
[INSME] [decimal] (18, 0) NULL,
[KEINM] [decimal] (18, 0) NULL,
[KINSM] [decimal] (18, 0) NULL,
[KLABS] [decimal] (18, 0) NULL,
[KSPEM] [decimal] (18, 0) NULL,
[KZILE] [nvarchar] (3) NULL,
[KZILL] [nvarchar] (3) NULL,
[KZILQ] [nvarchar] (3) NULL,
[KZILS] [nvarchar] (3) NULL,
[KZVLE] [nvarchar] (3) NULL,
[KZVLL] [nvarchar] (3) NULL,
[KZVLQ] [nvarchar] (3) NULL,
[KZVLS] [nvarchar] (3) NULL,
[LABST] [decimal] (18, 0) NULL,
[LBSTF] [decimal] (18, 0) NULL,
[LFGJA] [nvarchar] (4) NULL,
[LFMON] [nvarchar] (2) NULL,
[LGORT] [nvarchar] (4) NOT NULL,
[LGPBE] [nvarchar] (10) NULL,
[LMINB] [decimal] (18, 0) NULL,
[LSOBS] [nvarchar] (2) NULL,
[LVORM] [nvarchar] (1) NULL,
[LWMKB] [nvarchar] (3) NULL,
[MANDT] [nvarchar] (3) NULL,
[MATNR] [nvarchar] (18) NOT NULL,
[MDJIN] [nvarchar] (4) NULL,
[MDRUE] [nvarchar] (1) NULL,
[PRCTL] [nvarchar] (10) NULL,
[PSTAT] [nvarchar] (15) NULL,
[RETME] [decimal] (18, 0) NULL,
[SPEME] [decimal] (18, 0) NULL,
[SPERR] [nvarchar] (1) NULL,
[UMLME] [decimal] (18, 0) NULL,
[VKLAB] [decimal] (18, 0) NULL,
[VKUML] [decimal] (18, 0) NULL,
[VMEIN] [decimal] (18, 0) NULL,
[VMINS] [decimal] (18, 0) NULL,
[VMLAB] [decimal] (18, 0) NULL,
[VMRET] [decimal] (18, 0) NULL,
[VMSPE] [decimal] (18, 0) NULL,
[VMUML] [decimal] (18, 0) NULL,
[WERKS] [nvarchar] (4) NOT NULL
)
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_MARD] ADD CONSTRAINT [psa_ics_stg_SAP_GBR_MARD_PK] PRIMARY KEY CLUSTERED  ([MATNR], [WERKS], [LGORT])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_SAP_GBR_MARD', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_SAP_GBR_MARD', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_SAP_GBR_MARD', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_SAP_GBR_MARD', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_SAP_GBR_MARD', 'COLUMN', N'EtlDeletedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_SAP_GBR_MARD', 'COLUMN', N'EtlDeletedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The database-specific unique key of this record as identified within the ETL sub-system', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_SAP_GBR_MARD', 'COLUMN', N'EtlRecordId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_SAP_GBR_MARD', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_SAP_GBR_MARD', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_SAP_GBR_MARD', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record on this table; will be the same as EtlCreatedBy when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_SAP_GBR_MARD', 'COLUMN', N'EtlUpdatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record on this table; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_SAP_GBR_MARD', 'COLUMN', N'EtlUpdatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_SAP_GBR_MARD', 'COLUMN', N'IsDeleted'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates whether ETL processing is complete.  Used on PSA staging tables to indicate that the row may have changes that need to be re-processed by the ETL process (regardless of current ETL Batch Run Id).  May be used for late arriving dimensions to force facts to be re-processed outside of their originating batch.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_SAP_GBR_MARD', 'COLUMN', N'IsIncomplete'
GO
