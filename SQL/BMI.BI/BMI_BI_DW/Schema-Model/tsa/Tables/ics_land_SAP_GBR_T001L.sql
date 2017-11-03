CREATE TABLE [tsa].[ics_land_SAP_GBR_T001L]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T001L_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T001L_IsDuplicate] DEFAULT ((0)),
[MANDT] [nvarchar] (3) NULL,
[WERKS] [nvarchar] (4) NULL,
[LGORT] [nvarchar] (4) NULL,
[LGOBE] [nvarchar] (16) NULL,
[SPART] [nvarchar] (2) NULL,
[XLONG] [nvarchar] (1) NULL,
[XBUFX] [nvarchar] (1) NULL,
[DISKZ] [nvarchar] (1) NULL,
[XBLGO] [nvarchar] (1) NULL,
[XRESS] [nvarchar] (1) NULL,
[XHUPF] [nvarchar] (1) NULL,
[PARLG] [nvarchar] (4) NULL,
[VKORG] [nvarchar] (4) NULL,
[VTWEG] [nvarchar] (2) NULL,
[VSTEL] [nvarchar] (4) NULL,
[LIFNR] [nvarchar] (10) NULL,
[KUNNR] [nvarchar] (10) NULL,
[MESBS] [nvarchar] (60) NULL,
[MESST] [nvarchar] (1) NULL,
[OIH_LICNO] [nvarchar] (15) NULL,
[OIG_ITRFL] [nvarchar] (1) NULL,
[OIB_TNKASSIGN] [nvarchar] (1) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_GBR_T001L_1] ON [tsa].[ics_land_SAP_GBR_T001L] ([MANDT], [WERKS], [LGORT])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_SAP_GBR_T001L', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_SAP_GBR_T001L', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_SAP_GBR_T001L', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_SAP_GBR_T001L', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_SAP_GBR_T001L', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_SAP_GBR_T001L', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_SAP_GBR_T001L', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_SAP_GBR_T001L', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_SAP_GBR_T001L', 'COLUMN', N'IsDuplicate'
GO
