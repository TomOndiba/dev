CREATE TABLE [psa].[ics_stg_M3V10gen_POL_MPHEAD]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_gen_MPHEAD_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_gen_MPHEAD_IsIncomplete] DEFAULT ('N'),
[IAAGNT] [nchar] (10) NULL,
[IAAGRA] [numeric] (11, 6) NULL,
[IAATDT] [numeric] (8, 0) NULL,
[IAAURE] [nchar] (10) NULL,
[IABRAM] [numeric] (15, 2) NULL,
[IABUYE] [nchar] (10) NULL,
[IACHID] [nchar] (10) NULL,
[IACHNO] [numeric] (3, 0) NULL,
[IACMCO] [nchar] (2) NULL,
[IACOAM] [numeric] (17, 6) NULL,
[IACONO] [numeric] (18, 0) NOT NULL,
[IACPRI] [nchar] (5) NULL,
[IACUCD] [nchar] (3) NULL,
[IACUTE] [numeric] (1, 0) NULL,
[IADIVI] [nchar] (3) NULL,
[IADTID] [numeric] (13, 0) NULL,
[IADUDT] [numeric] (8, 0) NULL,
[IADWDT] [numeric] (8, 0) NULL,
[IAECLC] [nchar] (2) NULL,
[IAELNO] [nchar] (8) NULL,
[IAEXAT] [numeric] (1, 0) NULL,
[IAEXAV] [numeric] (1, 0) NULL,
[IAEXEP] [numeric] (15, 2) NULL,
[IAFACI] [nchar] (3) NULL,
[IAFIDS] [nchar] (6) NULL,
[IAFUSC] [nchar] (3) NULL,
[IAGRWE] [numeric] (9, 3) NULL,
[IAHAFE] [nchar] (6) NULL,
[IAHDDT] [numeric] (8, 0) NULL,
[IAINEP] [numeric] (15, 2) NULL,
[IALEDT] [numeric] (8, 0) NULL,
[IALIDT] [numeric] (8, 0) NULL,
[IALMDT] [numeric] (8, 0) NULL,
[IALMTS] [numeric] (18, 0) NULL,
[IALNCD] [nchar] (2) NULL,
[IALRED] [numeric] (8, 0) NULL,
[IAMEDC] [nchar] (10) NULL,
[IAMODL] [nchar] (3) NULL,
[IAMTDP] [numeric] (1, 0) NULL,
[IAMTWP] [numeric] (1, 0) NULL,
[IANOLN] [numeric] (3, 0) NULL,
[IANOPP] [numeric] (3, 0) NULL,
[IANTAM] [numeric] (15, 2) NULL,
[IAODAM] [numeric] (15, 2) NULL,
[IAORTY] [nchar] (3) NULL,
[IAOTBA] [numeric] (15, 2) NULL,
[IAOTPC] [numeric] (5, 2) NULL,
[IAOURR] [nchar] (10) NULL,
[IAOURT] [nchar] (1) NULL,
[IAPOPO] [numeric] (1, 0) NULL,
[IAPOTC] [nchar] (2) NULL,
[IAPOTX] [numeric] (13, 0) NULL,
[IAPRLA] [numeric] (1, 0) NULL,
[IAPROJ] [nchar] (7) NULL,
[IAPRSU] [nchar] (10) NULL,
[IAPRTX] [numeric] (13, 0) NULL,
[IAPTAC] [numeric] (1, 0) NULL,
[IAPUDT] [numeric] (8, 0) NULL,
[IAPUNO] [nchar] (7) NOT NULL,
[IAPURC] [nchar] (10) NULL,
[IAPUSL] [nchar] (2) NULL,
[IAPUST] [nchar] (2) NULL,
[IAPYAD] [nchar] (3) NULL,
[IAPYME] [nchar] (3) NULL,
[IARCDT] [numeric] (8, 0) NULL,
[IARFID] [nchar] (10) NULL,
[IARGDT] [numeric] (8, 0) NULL,
[IARGTM] [numeric] (6, 0) NULL,
[IARTAC] [numeric] (1, 0) NULL,
[IASCDT] [numeric] (8, 0) NULL,
[IASHVI] [nchar] (6) NULL,
[IASLDT] [numeric] (8, 0) NULL,
[IASUNO] [nchar] (10) NULL,
[IATEAF] [nchar] (3) NULL,
[IATEDL] [nchar] (3) NULL,
[IATEL1] [nvarchar] (36) NULL,
[IATEOR] [numeric] (1, 0) NULL,
[IATEPA] [nchar] (3) NULL,
[IATEPY] [nchar] (3) NULL,
[IATFNO] [nchar] (16) NULL,
[IATIHM] [numeric] (4, 0) NULL,
[IATLEX] [numeric] (15, 2) NULL,
[IATLIN] [numeric] (15, 2) NULL,
[IATOQT] [numeric] (15, 6) NULL,
[IATXID] [numeric] (13, 0) NULL,
[IAVOL3] [numeric] (9, 3) NULL,
[IAWHLO] [nchar] (3) NULL,
[IAYRE1] [nvarchar] (36) NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPHEAD] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_MPHEAD] PRIMARY KEY CLUSTERED  ([IACONO], [IAPUNO])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MPHEAD', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MPHEAD', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MPHEAD', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MPHEAD', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MPHEAD', 'COLUMN', N'EtlDeletedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last marked this record deleted/inactive on this table; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MPHEAD', 'COLUMN', N'EtlDeletedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The database-specific unique key of this record as identified within the ETL sub-system', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MPHEAD', 'COLUMN', N'EtlRecordId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MPHEAD', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MPHEAD', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MPHEAD', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record on this table; will be the same as EtlCreatedBy when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MPHEAD', 'COLUMN', N'EtlUpdatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record on this table; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MPHEAD', 'COLUMN', N'EtlUpdatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MPHEAD', 'COLUMN', N'IsDeleted'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates whether ETL processing is complete.  Used on PSA staging tables to indicate that the row may have changes that need to be re-processed by the ETL process (regardless of current ETL Batch Run Id).  May be used for late arriving dimensions to force facts to be re-processed outside of their originating batch.', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_M3V10gen_POL_MPHEAD', 'COLUMN', N'IsIncomplete'
GO
