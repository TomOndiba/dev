CREATE TABLE [psa].[ics_stg_M3V10gen_POL_CIDVEN]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_gen_CIDVEN_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_gen_CIDVEN_IsIncomplete] DEFAULT ('N'),
[IIABSK] [nchar] (1) NULL,
[IIABSM] [numeric] (1, 0) NULL,
[IIACRF] [nchar] (8) NULL,
[IIAGNT] [nchar] (10) NULL,
[IIATPR] [nchar] (1) NULL,
[IIAVCD] [nchar] (3) NULL,
[IIBUYE] [nchar] (10) NULL,
[IICFI1] [nchar] (10) NULL,
[IICFI2] [numeric] (15, 2) NULL,
[IICFI3] [nchar] (3) NULL,
[IICFI4] [nchar] (5) NULL,
[IICFI5] [nchar] (1) NULL,
[IICHID] [nchar] (10) NULL,
[IICHNO] [numeric] (3, 0) NULL,
[IICOBI] [nchar] (10) NULL,
[IICONO] [numeric] (18, 0) NOT NULL,
[IICRTP] [numeric] (2, 0) NULL,
[IICUCD] [nchar] (3) NULL,
[IIDCSM] [numeric] (1, 0) NULL,
[IIDT4T] [numeric] (1, 0) NULL,
[IIDTCD] [numeric] (1, 0) NULL,
[IIDTDY] [numeric] (2, 0) NULL,
[IIFUSC] [nchar] (3) NULL,
[IIGRPY] [numeric] (1, 0) NULL,
[IIIAPC] [numeric] (1, 0) NULL,
[IIIAPE] [numeric] (1, 0) NULL,
[IIIAPF] [numeric] (1, 0) NULL,
[IIIAPT] [numeric] (1, 0) NULL,
[IILIDT] [numeric] (8, 0) NULL,
[IILMDT] [numeric] (8, 0) NULL,
[IILMTS] [numeric] (18, 0) NULL,
[IIMODL] [nchar] (3) NULL,
[IIORTY] [nchar] (3) NULL,
[IIOUCN] [nchar] (10) NULL,
[IIPACD] [nchar] (1) NULL,
[IIPOOT] [nchar] (3) NULL,
[IIPRSU] [nchar] (10) NULL,
[IIPSTM] [nchar] (8) NULL,
[IIPTDY] [numeric] (2, 0) NULL,
[IIPWMT] [nchar] (10) NULL,
[IIPYME] [nchar] (3) NULL,
[IIQUCL] [nchar] (2) NULL,
[IIREGR] [numeric] (3, 0) NULL,
[IIRESP] [nchar] (10) NULL,
[IIRGDT] [numeric] (8, 0) NULL,
[IIRGTM] [numeric] (6, 0) NULL,
[IISBPE] [numeric] (1, 0) NULL,
[IISCNO] [nchar] (10) NULL,
[IISERS] [numeric] (2, 0) NULL,
[IISHAC] [numeric] (1, 0) NULL,
[IISHST] [numeric] (1, 0) NULL,
[IISPFC] [nchar] (2) NULL,
[IISUCL] [nchar] (3) NULL,
[IISUGR] [nchar] (10) NULL,
[IISUNO] [nchar] (10) NOT NULL,
[IISUST] [numeric] (1, 0) NULL,
[IISUSY] [numeric] (2, 0) NULL,
[IITAME] [numeric] (1, 0) NULL,
[IITAXC] [nchar] (3) NULL,
[IITDCD] [nchar] (4) NULL,
[IITEAF] [nchar] (3) NULL,
[IITECD] [nchar] (3) NULL,
[IITEDL] [nchar] (3) NULL,
[IITEPA] [nchar] (3) NULL,
[IITEPY] [nchar] (3) NULL,
[IITIDN] [numeric] (9, 0) NULL,
[IITINO] [nchar] (15) NULL,
[IITXAP] [numeric] (1, 0) NULL,
[IITXID] [numeric] (13, 0) NULL,
[IIVTCD] [numeric] (2, 0) NULL,
[IIWIPR] [numeric] (4, 0) NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CIDVEN] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_CIDVEN] PRIMARY KEY CLUSTERED  ([IICONO], [IISUNO])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_CIDVEN', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_CIDVEN', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_CIDVEN', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_CIDVEN', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_CIDVEN', 'COLUMN', N'EtlDeletedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_CIDVEN', 'COLUMN', N'EtlDeletedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The database-specific unique key of this record as identified within the ETL sub-system', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_CIDVEN', 'COLUMN', N'EtlRecordId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_CIDVEN', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_CIDVEN', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_CIDVEN', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record on this table; will be the same as EtlCreatedBy when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_CIDVEN', 'COLUMN', N'EtlUpdatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record on this table; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_CIDVEN', 'COLUMN', N'EtlUpdatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_CIDVEN', 'COLUMN', N'IsDeleted'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates whether ETL processing is complete.  Used on PSA staging tables to indicate that the row may have changes that need to be re-processed by the ETL process (regardless of current ETL Batch Run Id).  May be used for late arriving dimensions to force facts to be re-processed outside of their originating batch.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_CIDVEN', 'COLUMN', N'IsIncomplete'
GO
