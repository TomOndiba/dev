CREATE TABLE [tsa].[ics_land_M3V10vil_POL_FSLEDG]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_vil_FSLEDG_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_vil_FSLEDG_IsDuplicate] DEFAULT ((0)),
[ESACBL] [numeric] (1, 0) NULL,
[ESACDT] [numeric] (8, 0) NULL,
[ESADAT] [numeric] (8, 0) NULL,
[ESAPRV] [numeric] (1, 0) NULL,
[ESARAT] [numeric] (11, 6) NULL,
[ESARCD] [numeric] (1, 0) NULL,
[ESBKID] [nchar] (5) NULL,
[ESBLBY] [nchar] (10) NULL,
[ESBLDT] [numeric] (8, 0) NULL,
[ESCHID] [nchar] (10) NULL,
[ESCHNO] [numeric] (3, 0) NULL,
[ESCINO] [nchar] (15) NULL,
[ESCLCD] [numeric] (1, 0) NULL,
[ESCLST] [numeric] (1, 0) NULL,
[ESCONO] [numeric] (3, 0) NULL,
[ESCRST] [numeric] (1, 0) NULL,
[ESCRTP] [numeric] (2, 0) NULL,
[ESCUAM] [numeric] (15, 2) NULL,
[ESCUCD] [nchar] (3) NULL,
[ESCUCL] [nchar] (3) NULL,
[ESCUNO] [nchar] (10) NULL,
[ESDCAM] [numeric] (1, 0) NULL,
[ESDFPD] [numeric] (8, 0) NULL,
[ESDFPT] [numeric] (1, 0) NULL,
[ESDIVI] [nchar] (3) NULL,
[ESDNRE] [nchar] (8) NULL,
[ESDTP5] [numeric] (8, 0) NULL,
[ESDUDT] [numeric] (8, 0) NULL,
[ESGRPD] [numeric] (8, 0) NULL,
[ESIIAM] [numeric] (15, 2) NULL,
[ESIICD] [numeric] (1, 0) NULL,
[ESIIST] [numeric] (1, 0) NULL,
[ESINYR] [numeric] (4, 0) NULL,
[ESIVCL] [nchar] (5) NULL,
[ESIVDT] [numeric] (8, 0) NULL,
[ESIVTP] [nchar] (2) NULL,
[ESJRNO] [numeric] (7, 0) NULL,
[ESJSNO] [numeric] (7, 0) NULL,
[ESLMDT] [numeric] (8, 0) NULL,
[ESLMTS] [numeric] (18, 0) NULL,
[ESLRDT] [numeric] (8, 0) NULL,
[ESPYCD] [nchar] (3) NULL,
[ESPYNO] [nchar] (10) NULL,
[ESPYRS] [nchar] (2) NULL,
[ESPYTP] [nchar] (2) NULL,
[ESRECO] [numeric] (1, 0) NULL,
[ESREDE] [numeric] (8, 0) NULL,
[ESRESP] [nchar] (10) NULL,
[ESRGDT] [numeric] (8, 0) NULL,
[ESRGTM] [numeric] (6, 0) NULL,
[ESRMBL] [numeric] (1, 0) NULL,
[ESRMQT] [numeric] (1, 0) NULL,
[ESRMST] [numeric] (1, 0) NULL,
[ESRVDT] [numeric] (8, 0) NULL,
[ESSAGS] [numeric] (2, 0) NULL,
[ESSLOP] [numeric] (2, 0) NULL,
[ESSMCD] [nchar] (4) NULL,
[ESTDSC] [nchar] (10) NULL,
[ESTECD] [nchar] (3) NULL,
[ESTEPY] [nchar] (3) NULL,
[ESTRCD] [numeric] (2, 0) NULL,
[ESTXID] [numeric] (13, 0) NULL,
[ESVONO] [numeric] (8, 0) NULL,
[ESVSER] [nchar] (3) NULL,
[ESVTAM] [numeric] (15, 2) NULL,
[ESYEA4] [numeric] (4, 0) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_FSLEDG_1] ON [tsa].[ics_land_M3V10vil_POL_FSLEDG] ([ESCONO], [ESDIVI], [ESJRNO], [ESJSNO], [ESYEA4])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_FSLEDG', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_FSLEDG', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_FSLEDG', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_FSLEDG', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_FSLEDG', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_FSLEDG', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_FSLEDG', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_FSLEDG', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_FSLEDG', 'COLUMN', N'IsDuplicate'
GO
