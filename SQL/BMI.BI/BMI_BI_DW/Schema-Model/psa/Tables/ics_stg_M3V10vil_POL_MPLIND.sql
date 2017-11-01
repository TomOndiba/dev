CREATE TABLE [psa].[ics_stg_M3V10vil_POL_MPLIND]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_vil_MPLIND_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_vil_MPLIND_IsIncomplete] DEFAULT ('N'),
[ICAGNB] [nchar] (7) NULL,
[ICARDT] [numeric] (8, 0) NULL,
[ICBANO] [nvarchar] (20) NULL,
[ICBOLN] [nchar] (14) NULL,
[ICCAMU] [nvarchar] (20) NULL,
[ICCARN] [nvarchar] (30) NULL,
[ICCHPO] [numeric] (1, 0) NULL,
[ICCONO] [numeric] (18, 0) NOT NULL,
[ICDLIX] [numeric] (11, 0) NULL,
[ICDTID] [numeric] (13, 0) NULL,
[ICFACI] [nchar] (3) NULL,
[ICFWRF] [nchar] (10) NULL,
[ICLMTS] [numeric] (18, 0) NULL,
[ICNEAC] [numeric] (1, 0) NULL,
[ICNOPK] [numeric] (5, 0) NULL,
[ICOEND] [numeric] (1, 0) NULL,
[ICPACC] [nvarchar] (20) NULL,
[ICPACN] [nvarchar] (20) NULL,
[ICPLDT] [numeric] (8, 0) NULL,
[ICPNLI] [numeric] (18, 0) NOT NULL,
[ICPNLS] [numeric] (18, 0) NOT NULL,
[ICPNLX] [numeric] (18, 0) NOT NULL,
[ICPUNO] [nchar] (7) NOT NULL,
[ICPUOS] [nchar] (2) NULL,
[ICRENE] [nchar] (10) NULL,
[ICREOR] [numeric] (1, 0) NULL,
[ICREPN] [numeric] (10, 0) NULL,
[ICRESP] [nchar] (10) NULL,
[ICRGDT] [numeric] (8, 0) NULL,
[ICRGTM] [numeric] (6, 0) NULL,
[ICRPQA] [numeric] (15, 6) NULL,
[ICRPQT] [numeric] (15, 6) NULL,
[ICSCOP] [numeric] (17, 6) NULL,
[ICSERA] [numeric] (11, 6) NULL,
[ICSMDT] [numeric] (8, 0) NULL,
[ICSUDO] [nvarchar] (20) NULL,
[ICTIHM] [numeric] (4, 0) NULL,
[ICTRDT] [numeric] (8, 0) NULL,
[ICTXID] [numeric] (13, 0) NULL,
[ICUGCD] [numeric] (1, 0) NULL,
[ICWHLO] [nchar] (3) NULL,
[ICWHSL] [nchar] (10) NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPLIND] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_MPLIND] PRIMARY KEY CLUSTERED  ([ICCONO], [ICPNLI], [ICPNLS], [ICPNLX], [ICPUNO])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_MPLIND', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_MPLIND', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_MPLIND', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_MPLIND', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_MPLIND', 'COLUMN', N'EtlDeletedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_MPLIND', 'COLUMN', N'EtlDeletedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The database-specific unique key of this record as identified within the ETL sub-system', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_MPLIND', 'COLUMN', N'EtlRecordId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_MPLIND', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_MPLIND', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_MPLIND', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record on this table; will be the same as EtlCreatedBy when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_MPLIND', 'COLUMN', N'EtlUpdatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record on this table; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_MPLIND', 'COLUMN', N'EtlUpdatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_MPLIND', 'COLUMN', N'IsDeleted'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates whether ETL processing is complete.  Used on PSA staging tables to indicate that the row may have changes that need to be re-processed by the ETL process (regardless of current ETL Batch Run Id).  May be used for late arriving dimensions to force facts to be re-processed outside of their originating batch.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10vil_POL_MPLIND', 'COLUMN', N'IsIncomplete'
GO
