CREATE TABLE [tsa].[ics_land_M3V10vil_POL_CIDVEN]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_vil_CIDVEN_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_vil_CIDVEN_IsDuplicate] DEFAULT ((0)),
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
[IICONO] [numeric] (3, 0) NULL,
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
[IISUNO] [nchar] (10) NULL,
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
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_CIDVEN_1] ON [tsa].[ics_land_M3V10vil_POL_CIDVEN] ([IICONO], [IISUNO])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_CIDVEN', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_CIDVEN', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_CIDVEN', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_CIDVEN', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_CIDVEN', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_CIDVEN', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_CIDVEN', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_CIDVEN', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_CIDVEN', 'COLUMN', N'IsDuplicate'
GO
