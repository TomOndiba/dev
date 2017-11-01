CREATE TABLE [tsa].[ics_land_M3V10vil_POL_MITWHL]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_vil_MITWHL_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_vil_MITWHL_IsDuplicate] DEFAULT ((0)),
[MWAASQ] [numeric] (1, 0) NULL,
[MWACGR] [nchar] (10) NULL,
[MWALAC] [numeric] (1, 0) NULL,
[MWALWH] [nchar] (3) NULL,
[MWALWQ] [nchar] (4) NULL,
[MWASOT] [numeric] (1, 0) NULL,
[MWAUAD] [numeric] (1, 0) NULL,
[MWCALV] [nchar] (6) NULL,
[MWCDPD] [numeric] (1, 0) NULL,
[MWCDPM] [numeric] (1, 0) NULL,
[MWCDYN] [numeric] (1, 0) NULL,
[MWCHID] [nchar] (10) NULL,
[MWCHNO] [numeric] (3, 0) NULL,
[MWCOMA] [nchar] (8) NULL,
[MWCONO] [numeric] (3, 0) NULL,
[MWCPTE] [numeric] (1, 0) NULL,
[MWCPWH] [nchar] (3) NULL,
[MWCSCD] [nchar] (3) NULL,
[MWCUNO] [nchar] (10) NULL,
[MWDAAS] [numeric] (2, 0) NULL,
[MWDDLO] [nchar] (10) NULL,
[MWDIVI] [nchar] (3) NULL,
[MWDMF0] [numeric] (3, 0) NULL,
[MWDMF1] [numeric] (3, 0) NULL,
[MWDMF2] [numeric] (3, 0) NULL,
[MWDMF3] [numeric] (3, 0) NULL,
[MWDMF4] [numeric] (3, 0) NULL,
[MWDMF5] [numeric] (3, 0) NULL,
[MWDMF6] [numeric] (3, 0) NULL,
[MWDMF7] [numeric] (3, 0) NULL,
[MWDMF8] [numeric] (3, 0) NULL,
[MWDMF9] [numeric] (3, 0) NULL,
[MWDMFC] [numeric] (1, 0) NULL,
[MWDTID] [numeric] (13, 0) NULL,
[MWECAR] [nchar] (2) NULL,
[MWEPUL] [numeric] (1, 0) NULL,
[MWEXDL] [numeric] (1, 0) NULL,
[MWFACI] [nchar] (3) NULL,
[MWGEOC] [numeric] (9, 0) NULL,
[MWGEOX] [numeric] (15, 6) NULL,
[MWGEOY] [numeric] (15, 6) NULL,
[MWGEOZ] [numeric] (15, 6) NULL,
[MWINUL] [numeric] (1, 0) NULL,
[MWITDL] [numeric] (1, 0) NULL,
[MWLEAM] [numeric] (3, 0) NULL,
[MWLMDT] [numeric] (8, 0) NULL,
[MWLMTS] [numeric] (18, 0) NULL,
[MWLNCD] [nchar] (2) NULL,
[MWLSPM] [numeric] (1, 0) NULL,
[MWNBID] [nchar] (1) NULL,
[MWOREF] [nvarchar] (30) NULL,
[MWPAHF] [numeric] (4, 0) NULL,
[MWPATF] [numeric] (3, 0) NULL,
[MWPHNO] [nchar] (16) NULL,
[MWPIDL] [numeric] (1, 0) NULL,
[MWPLIS] [nchar] (16) NULL,
[MWPMHF] [numeric] (4, 0) NULL,
[MWPMTF] [numeric] (3, 0) NULL,
[MWRESP] [nchar] (10) NULL,
[MWRGDT] [numeric] (8, 0) NULL,
[MWRGTM] [numeric] (6, 0) NULL,
[MWRSTN] [nchar] (10) NULL,
[MWSCED] [numeric] (1, 0) NULL,
[MWSDES] [nchar] (10) NULL,
[MWSHNM] [nvarchar] (25) NULL,
[MWSTOF] [numeric] (1, 0) NULL,
[MWSUNO] [nchar] (10) NULL,
[MWTAXC] [nchar] (3) NULL,
[MWTWSL] [nchar] (10) NULL,
[MWTXID] [numeric] (13, 0) NULL,
[MWUNST] [nchar] (3) NULL,
[MWVRNO] [nchar] (16) NULL,
[MWWHLO] [nchar] (3) NULL,
[MWWHNM] [nvarchar] (36) NULL,
[MWWHPL] [nchar] (3) NULL,
[MWWHSY] [nchar] (1) NULL,
[MWWHTY] [nchar] (2) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_MITWHL_1] ON [tsa].[ics_land_M3V10vil_POL_MITWHL] ([MWCONO], [MWWHLO])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MITWHL', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MITWHL', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MITWHL', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MITWHL', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MITWHL', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MITWHL', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MITWHL', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MITWHL', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_MITWHL', 'COLUMN', N'IsDuplicate'
GO
