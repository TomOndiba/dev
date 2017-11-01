CREATE TABLE [tsa].[ics_land_M3V10gen_POL_CIDMAS]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_gen_CIDMAS_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_gen_CIDMAS_IsDuplicate] DEFAULT ((0)),
[IDALSU] [nchar] (10) NULL,
[IDCFI1] [nchar] (10) NULL,
[IDCFI2] [numeric] (15, 2) NULL,
[IDCFI3] [nchar] (3) NULL,
[IDCFI4] [nchar] (5) NULL,
[IDCFI5] [nchar] (1) NULL,
[IDCHID] [nchar] (10) NULL,
[IDCHNO] [numeric] (3, 0) NULL,
[IDCONO] [numeric] (3, 0) NULL,
[IDCOR2] [nchar] (11) NULL,
[IDCORG] [nchar] (11) NULL,
[IDCSCD] [nchar] (3) NULL,
[IDDESV] [nchar] (2) NULL,
[IDDTFM] [nchar] (3) NULL,
[IDECAR] [nchar] (2) NULL,
[IDEDIT] [nchar] (1) NULL,
[IDFWSC] [nchar] (4) NULL,
[IDHAFE] [nchar] (6) NULL,
[IDLMDT] [numeric] (8, 0) NULL,
[IDLMTS] [numeric] (18, 0) NULL,
[IDLNCD] [nchar] (2) NULL,
[IDMEPF] [nchar] (2) NULL,
[IDPHN2] [nchar] (16) NULL,
[IDPHNO] [nchar] (16) NULL,
[IDPODA] [numeric] (3, 0) NULL,
[IDPPIN] [numeric] (1, 0) NULL,
[IDRGDT] [numeric] (8, 0) NULL,
[IDRGTM] [numeric] (6, 0) NULL,
[IDSTAT] [nchar] (2) NULL,
[IDSUAL] [nchar] (3) NULL,
[IDSUCM] [nvarchar] (20) NULL,
[IDSUCO] [nchar] (10) NULL,
[IDSUNM] [nvarchar] (36) NULL,
[IDSUNO] [nchar] (10) NULL,
[IDSUTY] [numeric] (1, 0) NULL,
[IDTFNO] [nchar] (16) NULL,
[IDTIZO] [nchar] (5) NULL,
[IDTLNO] [nchar] (16) NULL,
[IDTXID] [numeric] (13, 0) NULL,
[IDVRNO] [nchar] (16) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_CIDMAS_1] ON [tsa].[ics_land_M3V10gen_POL_CIDMAS] ([IDCONO], [IDSUNO])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_CIDMAS', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_CIDMAS', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_CIDMAS', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_CIDMAS', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_CIDMAS', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_CIDMAS', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_CIDMAS', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_CIDMAS', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_CIDMAS', 'COLUMN', N'IsDuplicate'
GO
