CREATE TABLE [tsa].[ics_land_SAP_GBR_MARD]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_MARD_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_MARD_IsDuplicate] DEFAULT ((0)),
[BSKRF] [float] NULL,
[DISKZ] [nvarchar] (1) NULL,
[DLINL] [datetime] NULL,
[EINME] [decimal] (18, 0) NULL,
[ERSDA] [datetime] NULL,
[EXPPG] [nvarchar] (1) NULL,
[EXVER] [nvarchar] (2) NULL,
[HERKL] [nvarchar] (3) NULL,
[INSME] [decimal] (18, 0) NULL,
[KEINM] [decimal] (18, 0) NULL,
[KINSM] [decimal] (18, 0) NULL,
[KLABS] [decimal] (18, 0) NULL,
[KSPEM] [decimal] (18, 0) NULL,
[KZILE] [nvarchar] (3) NULL,
[KZILL] [nvarchar] (3) NULL,
[KZILQ] [nvarchar] (3) NULL,
[KZILS] [nvarchar] (3) NULL,
[KZVLE] [nvarchar] (3) NULL,
[KZVLL] [nvarchar] (3) NULL,
[KZVLQ] [nvarchar] (3) NULL,
[KZVLS] [nvarchar] (3) NULL,
[LABST] [decimal] (18, 0) NULL,
[LBSTF] [decimal] (18, 0) NULL,
[LFGJA] [nvarchar] (4) NULL,
[LFMON] [nvarchar] (2) NULL,
[LGORT] [nvarchar] (4) NULL,
[LGPBE] [nvarchar] (10) NULL,
[LMINB] [decimal] (18, 0) NULL,
[LSOBS] [nvarchar] (2) NULL,
[LVORM] [nvarchar] (1) NULL,
[LWMKB] [nvarchar] (3) NULL,
[MANDT] [nvarchar] (3) NULL,
[MATNR] [nvarchar] (18) NULL,
[MDJIN] [nvarchar] (4) NULL,
[MDRUE] [nvarchar] (1) NULL,
[PRCTL] [nvarchar] (10) NULL,
[PSTAT] [nvarchar] (15) NULL,
[RETME] [decimal] (18, 0) NULL,
[SPEME] [decimal] (18, 0) NULL,
[SPERR] [nvarchar] (1) NULL,
[UMLME] [decimal] (18, 0) NULL,
[VKLAB] [decimal] (18, 0) NULL,
[VKUML] [decimal] (18, 0) NULL,
[VMEIN] [decimal] (18, 0) NULL,
[VMINS] [decimal] (18, 0) NULL,
[VMLAB] [decimal] (18, 0) NULL,
[VMRET] [decimal] (18, 0) NULL,
[VMSPE] [decimal] (18, 0) NULL,
[VMUML] [decimal] (18, 0) NULL,
[WERKS] [nvarchar] (4) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_SAP_GBR_MARD_1] ON [tsa].[ics_land_SAP_GBR_MARD] ([LGORT], [MATNR], [WERKS])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_SAP_GBR_MARD', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_SAP_GBR_MARD', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_SAP_GBR_MARD', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_SAP_GBR_MARD', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_SAP_GBR_MARD', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_SAP_GBR_MARD', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_SAP_GBR_MARD', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_SAP_GBR_MARD', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_SAP_GBR_MARD', 'COLUMN', N'IsDuplicate'
GO
