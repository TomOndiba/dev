CREATE TABLE [psa].[ics_stg_M3V10gen_POL_ODHEAD]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_gen_ODHEAD_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_gen_ODHEAD_IsIncomplete] DEFAULT ('N'),
[UA3RDP] [nchar] (10) NULL,
[UAACDT] [numeric] (8, 0) NULL,
[UAADID] [nchar] (6) NULL,
[UAAICD] [numeric] (1, 0) NULL,
[UAAPBY] [nchar] (15) NULL,
[UAAPDT] [numeric] (8, 0) NULL,
[UABRAM] [numeric] (15, 2) NULL,
[UACHID] [nchar] (10) NULL,
[UACHNO] [numeric] (3, 0) NULL,
[UACIME] [numeric] (1, 0) NULL,
[UACONN] [numeric] (7, 0) NULL,
[UACONO] [numeric] (18, 0) NOT NULL,
[UACUCD] [nchar] (3) NULL,
[UACUNO] [nchar] (10) NULL,
[UADBCR] [nchar] (1) NULL,
[UADIVI] [nchar] (3) NULL,
[UADLDT] [numeric] (8, 0) NULL,
[UADLIX] [numeric] (18, 0) NOT NULL,
[UADLTM] [numeric] (6, 0) NULL,
[UADNNO] [nchar] (10) NULL,
[UADTID] [numeric] (13, 0) NULL,
[UAELNO] [nchar] (8) NULL,
[UAEXIN] [nchar] (14) NULL,
[UAFACI] [nchar] (3) NULL,
[UAFECN] [nchar] (10) NULL,
[UAGRWE] [numeric] (9, 3) NULL,
[UAINPX] [nchar] (6) NULL,
[UAINRC] [nchar] (10) NULL,
[UAINTM] [numeric] (6, 0) NULL,
[UAIVDT] [numeric] (8, 0) NULL,
[UAIVGP] [nchar] (3) NULL,
[UAIVNO] [numeric] (9, 0) NULL,
[UALMDT] [numeric] (8, 0) NULL,
[UALMTS] [numeric] (18, 0) NULL,
[UAMODL] [nchar] (3) NULL,
[UANEWE] [numeric] (9, 3) NULL,
[UANREF] [nvarchar] (20) NULL,
[UANTAM] [numeric] (15, 2) NULL,
[UAOPRI] [numeric] (1, 0) NULL,
[UAORNO] [nchar] (10) NOT NULL,
[UAORS1] [numeric] (1, 0) NULL,
[UAORS2] [numeric] (1, 0) NULL,
[UAORST] [nchar] (2) NULL,
[UAORTP] [nchar] (3) NULL,
[UAPLRI] [nchar] (10) NULL,
[UAPOTX] [numeric] (13, 0) NULL,
[UAPROJ] [nchar] (7) NULL,
[UAPRST] [nchar] (2) NULL,
[UAPRTX] [numeric] (13, 0) NULL,
[UAPYNO] [nchar] (10) NULL,
[UARAIN] [numeric] (11, 6) NULL,
[UARDLX] [numeric] (11, 0) NULL,
[UARGDT] [numeric] (8, 0) NULL,
[UARGTM] [numeric] (6, 0) NULL,
[UARINP] [nchar] (6) NULL,
[UARIVN] [numeric] (9, 0) NULL,
[UARODN] [numeric] (3, 0) NULL,
[UAROUT] [nchar] (6) NULL,
[UARXIN] [nchar] (14) NULL,
[UARYEA] [numeric] (4, 0) NULL,
[UATEDL] [nchar] (3) NULL,
[UATEPY] [nchar] (3) NULL,
[UATXID] [numeric] (13, 0) NULL,
[UAUPIS] [numeric] (1, 0) NULL,
[UAUPST] [numeric] (1, 0) NULL,
[UAVOL3] [numeric] (9, 3) NULL,
[UAWHLO] [nchar] (3) NOT NULL,
[UAYEA4] [numeric] (4, 0) NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_ODHEAD] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_ODHEAD] PRIMARY KEY CLUSTERED  ([UACONO], [UADLIX], [UAORNO], [UAWHLO])
GO
EXEC sp_addextendedproperty N'IncludeInMerge', N'Y', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_ODHEAD', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_ODHEAD', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_ODHEAD', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_ODHEAD', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_ODHEAD', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_ODHEAD', 'COLUMN', N'EtlDeletedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_ODHEAD', 'COLUMN', N'EtlDeletedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The database-specific unique key of this record as identified within the ETL sub-system', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_ODHEAD', 'COLUMN', N'EtlRecordId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_ODHEAD', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_ODHEAD', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_ODHEAD', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record on this table; will be the same as EtlCreatedBy when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_ODHEAD', 'COLUMN', N'EtlUpdatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record on this table; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_ODHEAD', 'COLUMN', N'EtlUpdatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_ODHEAD', 'COLUMN', N'IsDeleted'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates whether ETL processing is complete.  Used on PSA staging tables to indicate that the row may have changes that need to be re-processed by the ETL process (regardless of current ETL Batch Run Id).  May be used for late arriving dimensions to force facts to be re-processed outside of their originating batch.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_ODHEAD', 'COLUMN', N'IsIncomplete'
GO
