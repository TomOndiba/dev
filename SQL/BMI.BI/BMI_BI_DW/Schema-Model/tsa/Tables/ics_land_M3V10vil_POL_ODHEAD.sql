CREATE TABLE [tsa].[ics_land_M3V10vil_POL_ODHEAD]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_vil_ODHEAD_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_vil_ODHEAD_IsDuplicate] DEFAULT ((0)),
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
[UACONO] [numeric] (3, 0) NULL,
[UACUCD] [nchar] (3) NULL,
[UACUNO] [nchar] (10) NULL,
[UADBCR] [nchar] (1) NULL,
[UADIVI] [nchar] (3) NULL,
[UADLDT] [numeric] (8, 0) NULL,
[UADLIX] [numeric] (11, 0) NULL,
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
[UAORNO] [nchar] (10) NULL,
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
[UAWHLO] [nchar] (3) NULL,
[UAYEA4] [numeric] (4, 0) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_ODHEAD_1] ON [tsa].[ics_land_M3V10vil_POL_ODHEAD] ([UACONO], [UADLIX], [UAORNO], [UAWHLO])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_ODHEAD', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_ODHEAD', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_ODHEAD', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_ODHEAD', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_ODHEAD', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_ODHEAD', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_ODHEAD', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_ODHEAD', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_ODHEAD', 'COLUMN', N'IsDuplicate'
GO
