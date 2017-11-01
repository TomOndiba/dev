CREATE TABLE [tsa].[ics_land_SAP_GBR_T001W]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T001W_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T001W_IsDuplicate] DEFAULT ((0)),
[ACHVM] [nvarchar] (1) NULL,
[ADRNR] [nvarchar] (10) NULL,
[AWSLS] [nvarchar] (6) NULL,
[BEDPL] [nvarchar] (1) NULL,
[BETOL] [nvarchar] (3) NULL,
[BWKEY] [nvarchar] (4) NULL,
[BZIRK] [nvarchar] (6) NULL,
[BZQHL] [nvarchar] (1) NULL,
[CHAZV] [nvarchar] (1) NULL,
[CHAZV_OLD] [nvarchar] (1) NULL,
[CITYC] [nvarchar] (4) NULL,
[COUNC] [nvarchar] (3) NULL,
[DEP_STORE] [nvarchar] (4) NULL,
[DVSART] [nvarchar] (1) NULL,
[EKORG] [nvarchar] (4) NULL,
[FABKL] [nvarchar] (2) NULL,
[FPRFW] [nvarchar] (3) NULL,
[IWERK] [nvarchar] (4) NULL,
[J_1BBRANCH] [nvarchar] (4) NULL,
[KKOWK] [nvarchar] (1) NULL,
[KORDB] [nvarchar] (1) NULL,
[KUNNR] [nvarchar] (10) NULL,
[LAND1] [nvarchar] (3) NULL,
[LET01] [decimal] (18, 0) NULL,
[LET02] [decimal] (18, 0) NULL,
[LET03] [decimal] (18, 0) NULL,
[LIFNR] [nvarchar] (10) NULL,
[MANDT] [nvarchar] (3) NULL,
[MGVLAREVAL] [nvarchar] (1) NULL,
[MGVLAUPD] [nvarchar] (1) NULL,
[MGVUPD] [nvarchar] (1) NULL,
[MISCH] [nvarchar] (1) NULL,
[NAME1] [nvarchar] (30) NULL,
[NAME2] [nvarchar] (30) NULL,
[NODETYPE] [nvarchar] (3) NULL,
[NSCHEMA] [nvarchar] (4) NULL,
[OIHCREDIPI] [nvarchar] (1) NULL,
[OIHVTYPE] [nvarchar] (1) NULL,
[OILIVAL] [nvarchar] (1) NULL,
[ORT01] [nvarchar] (25) NULL,
[PFACH] [nvarchar] (10) NULL,
[PKOSA] [nvarchar] (1) NULL,
[PSTLZ] [nvarchar] (10) NULL,
[REGIO] [nvarchar] (3) NULL,
[SOURCING] [nvarchar] (1) NULL,
[SPART] [nvarchar] (2) NULL,
[SPRAS] [nvarchar] (1) NULL,
[STORETYPE] [nvarchar] (1) NULL,
[STRAS] [nvarchar] (30) NULL,
[TAXIW] [nvarchar] (1) NULL,
[TXJCD] [nvarchar] (15) NULL,
[TXNAM_MA1] [nvarchar] (16) NULL,
[TXNAM_MA2] [nvarchar] (16) NULL,
[TXNAM_MA3] [nvarchar] (16) NULL,
[VKORG] [nvarchar] (4) NULL,
[VLFKZ] [nvarchar] (1) NULL,
[VSTEL] [nvarchar] (4) NULL,
[VTBFI] [nvarchar] (2) NULL,
[VTWEG] [nvarchar] (2) NULL,
[WERKS] [nvarchar] (4) NULL,
[WKSOP] [nvarchar] (1) NULL,
[ZONE1] [nvarchar] (10) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_GBR_T001W_1] ON [tsa].[ics_land_SAP_GBR_T001W] ([WERKS])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_SAP_GBR_T001W', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_SAP_GBR_T001W', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_SAP_GBR_T001W', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_SAP_GBR_T001W', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_SAP_GBR_T001W', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_SAP_GBR_T001W', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_SAP_GBR_T001W', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_SAP_GBR_T001W', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_SAP_GBR_T001W', 'COLUMN', N'IsDuplicate'
GO
