CREATE TABLE [tsa].[ics_land_M3V10gen_POL_MPHEAD]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_gen_MPHEAD_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_gen_MPHEAD_IsDuplicate] DEFAULT ((0)),
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
[IACONO] [numeric] (3, 0) NULL,
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
[IAPUNO] [nchar] (7) NULL,
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
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_MPHEAD_1] ON [tsa].[ics_land_M3V10gen_POL_MPHEAD] ([IACONO], [IAPUNO])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_MPHEAD', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_MPHEAD', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_MPHEAD', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_MPHEAD', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_MPHEAD', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_MPHEAD', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_MPHEAD', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_MPHEAD', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10gen_POL_MPHEAD', 'COLUMN', N'IsDuplicate'
GO
