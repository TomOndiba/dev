CREATE TABLE [psa].[ics_stg_m3_MITFAC]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_m3_MITFAC_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_m3_MITFAC_IsIncomplete] DEFAULT ('N'),
[M9CONO] [decimal] (18, 0) NOT NULL,
[M9FACI] [nvarchar] (255) NOT NULL,
[M9ITNO] [nvarchar] (255) NOT NULL,
[M9LEA4] [decimal] (3, 0) NULL,
[M9CSNO] [nvarchar] (255) NULL,
[M9SPFA] [decimal] (15, 9) NULL,
[M9ORCO] [nvarchar] (255) NULL,
[M9APPR] [decimal] (17, 6) NULL,
[M9UCOS] [decimal] (17, 6) NULL,
[M9SOCO] [decimal] (17, 6) NULL,
[M9EXPC] [decimal] (5, 2) NULL,
[M9BQTY] [decimal] (15, 6) NULL,
[M9BQTM] [decimal] (1, 0) NULL,
[M9LLCM] [decimal] (2, 0) NULL,
[M9DLET] [decimal] (1, 0) NULL,
[M9DLEF] [decimal] (3, 0) NULL,
[M9DIDY] [decimal] (1, 0) NULL,
[M9DIDF] [decimal] (3, 0) NULL,
[M9PRRA] [decimal] (1, 0) NULL,
[M9TRHC] [decimal] (5, 2) NULL,
[M9MARC] [decimal] (1, 0) NULL,
[M9JITF] [decimal] (1, 0) NULL,
[M9REWH] [nvarchar] (255) NULL,
[M9OPFQ] [decimal] (15, 6) NULL,
[M9FANO] [decimal] (15, 6) NULL,
[M9FANQ] [decimal] (15, 6) NULL,
[M9FANR] [decimal] (15, 6) NULL,
[M9FATM] [decimal] (1, 0) NULL,
[M9WCLN] [nvarchar] (255) NULL,
[M9EDEC] [nvarchar] (255) NULL,
[M9AUGE] [decimal] (1, 0) NULL,
[M9ECCC] [nvarchar] (255) NULL,
[M9ECAR] [nvarchar] (255) NULL,
[M9CPRI] [nvarchar] (255) NULL,
[M9CPRE] [nvarchar] (255) NULL,
[M9WSCA] [nvarchar] (255) NULL,
[M9PRCM] [nvarchar] (255) NULL,
[M9PLAP] [nvarchar] (255) NULL,
[M9PLUP] [nvarchar] (255) NULL,
[M9SCMO] [nvarchar] (255) NULL,
[M9CPL0] [decimal] (1, 0) NULL,
[M9CPL1] [decimal] (1, 0) NULL,
[M9CPL2] [decimal] (1, 0) NULL,
[M9PPL0] [decimal] (1, 0) NULL,
[M9PPL1] [decimal] (1, 0) NULL,
[M9PPL2] [decimal] (1, 0) NULL,
[M9TXID] [decimal] (13, 0) NULL,
[M9DTID] [decimal] (13, 0) NULL,
[M9CPDC] [decimal] (1, 0) NULL,
[M9COCD] [decimal] (5, 0) NULL,
[M9EVGR] [nvarchar] (255) NULL,
[M9VAMT] [decimal] (1, 0) NULL,
[M9LAMA] [decimal] (5, 2) NULL,
[M9GRTI] [nvarchar] (255) NULL,
[M9MOLL] [decimal] (5, 2) NULL,
[M9RGDT] [decimal] (8, 0) NULL,
[M9RGTM] [decimal] (6, 0) NULL,
[M9LMDT] [decimal] (8, 0) NULL,
[M9CHNO] [decimal] (3, 0) NULL,
[M9CHID] [nvarchar] (255) NULL,
[M9LMTS] [decimal] (18, 0) NULL,
[M9CRTM] [decimal] (1, 0) NULL,
[M9DICM] [nvarchar] (255) NULL,
[M9ACRF] [nvarchar] (255) NULL,
[M9ECVE] [nvarchar] (255) NULL,
[M9ATTC] [decimal] (1, 0) NULL,
[M9ATNR] [decimal] (17, 0) NULL,
[M9STCW] [decimal] (15, 6) NULL,
[M9QUCW] [decimal] (15, 6) NULL,
[M9RJCW] [decimal] (15, 6) NULL,
[M9CAWC] [decimal] (1, 0) NULL,
[M9COFA] [decimal] (15, 9) NULL,
[M9CUEX] [nvarchar] (2000) NULL
)
GO
ALTER TABLE [psa].[ics_stg_m3_MITFAC] ADD CONSTRAINT [PK_stg_m3_MITFAC] PRIMARY KEY CLUSTERED  ([M9CONO], [M9FACI], [M9ITNO])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3_MITFAC', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3_MITFAC', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3_MITFAC', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3_MITFAC', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that last marked this record deleted/inactive; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3_MITFAC', 'COLUMN', N'EtlDeletedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last marked this record deleted/inactive; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3_MITFAC', 'COLUMN', N'EtlDeletedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The database-specific unique key of this record as identified within the ETL sub-system', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3_MITFAC', 'COLUMN', N'EtlRecordId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from where this row was extracted', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3_MITFAC', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3_MITFAC', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3_MITFAC', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record; will be the same as EtlCreatedBy when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3_MITFAC', 'COLUMN', N'EtlUpdatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3_MITFAC', 'COLUMN', N'EtlUpdatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3_MITFAC', 'COLUMN', N'IsDeleted'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates whether ETL processing is complete.  Used on PSA staging tables to indicate that the row may have changes that need to be re-processed by the ETL process (regardless of current ETL Batch Run Id).  May be used for late arriving dimensions to force facts to be re-processed outside of their originating batch.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_m3_MITFAC', 'COLUMN', N'IsIncomplete'
GO
