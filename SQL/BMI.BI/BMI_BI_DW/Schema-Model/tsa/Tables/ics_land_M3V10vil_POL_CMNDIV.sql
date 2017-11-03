CREATE TABLE [tsa].[ics_land_M3V10vil_POL_CMNDIV]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_vil_CMNDIV_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_vil_CMNDIV_IsDuplicate] DEFAULT ((0)),
[CCACGR] [nchar] (10) NULL,
[CCCCD0] [nchar] (1) NULL,
[CCCCD1] [nchar] (10) NULL,
[CCCCD2] [numeric] (15, 2) NULL,
[CCCCD3] [nchar] (3) NULL,
[CCCCD4] [nchar] (5) NULL,
[CCCCD5] [nchar] (1) NULL,
[CCCCD6] [nchar] (10) NULL,
[CCCCD7] [numeric] (15, 2) NULL,
[CCCCD8] [nchar] (3) NULL,
[CCCCD9] [nchar] (5) NULL,
[CCCDCD] [numeric] (1, 0) NULL,
[CCCHID] [nchar] (10) NULL,
[CCCHNO] [numeric] (3, 0) NULL,
[CCCOA1] [nvarchar] (36) NULL,
[CCCOA2] [nvarchar] (36) NULL,
[CCCOA3] [nvarchar] (36) NULL,
[CCCOA4] [nvarchar] (36) NULL,
[CCCONL] [numeric] (3, 0) NULL,
[CCCONM] [nvarchar] (36) NULL,
[CCCONO] [numeric] (3, 0) NULL,
[CCCSCD] [nchar] (3) NULL,
[CCDCFM] [nchar] (1) NULL,
[CCDIVI] [nchar] (3) NULL,
[CCDMCU] [numeric] (1, 0) NULL,
[CCDTFM] [nchar] (3) NULL,
[CCECAR] [nchar] (2) NULL,
[CCFACI] [nchar] (3) NULL,
[CCFIRM] [nchar] (7) NULL,
[CCGEOC] [numeric] (9, 0) NULL,
[CCHCMA] [numeric] (1, 0) NULL,
[CCISTA] [numeric] (1, 0) NULL,
[CCLL01] [nchar] (10) NULL,
[CCLL02] [nchar] (10) NULL,
[CCLL03] [nchar] (10) NULL,
[CCLL04] [nchar] (10) NULL,
[CCLL05] [nchar] (10) NULL,
[CCLL06] [nchar] (10) NULL,
[CCLL07] [nchar] (10) NULL,
[CCLL08] [nchar] (10) NULL,
[CCLL09] [nchar] (10) NULL,
[CCLL10] [nchar] (10) NULL,
[CCLLID] [nchar] (10) NULL,
[CCLMDT] [numeric] (8, 0) NULL,
[CCLOCD] [nchar] (3) NULL,
[CCMXAP] [numeric] (1, 0) NULL,
[CCMXAR] [numeric] (1, 0) NULL,
[CCMXAT] [numeric] (1, 0) NULL,
[CCMXBU] [numeric] (1, 0) NULL,
[CCMXCA] [numeric] (1, 0) NULL,
[CCMXCF] [numeric] (1, 0) NULL,
[CCMXCP] [numeric] (1, 0) NULL,
[CCMXCR] [numeric] (1, 0) NULL,
[CCMXDC] [numeric] (1, 0) NULL,
[CCMXDO] [numeric] (1, 0) NULL,
[CCMXDP] [numeric] (1, 0) NULL,
[CCMXDR] [numeric] (1, 0) NULL,
[CCMXDS] [numeric] (1, 0) NULL,
[CCMXDT] [numeric] (1, 0) NULL,
[CCMXEC] [numeric] (1, 0) NULL,
[CCMXED] [numeric] (1, 0) NULL,
[CCMXEM] [numeric] (1, 0) NULL,
[CCMXEP] [numeric] (1, 0) NULL,
[CCMXET] [numeric] (1, 0) NULL,
[CCMXEV] [numeric] (1, 0) NULL,
[CCMXFA] [numeric] (1, 0) NULL,
[CCMXFC] [numeric] (1, 0) NULL,
[CCMXGL] [numeric] (1, 0) NULL,
[CCMXGM] [numeric] (1, 0) NULL,
[CCMXIC] [numeric] (1, 0) NULL,
[CCMXIP] [numeric] (1, 0) NULL,
[CCMXJO] [numeric] (1, 0) NULL,
[CCMXJQ] [numeric] (1, 0) NULL,
[CCMXLI] [numeric] (1, 0) NULL,
[CCMXLT] [numeric] (1, 0) NULL,
[CCMXMA] [numeric] (1, 0) NULL,
[CCMXMC] [numeric] (1, 0) NULL,
[CCMXMD] [numeric] (1, 0) NULL,
[CCMXMF] [numeric] (1, 0) NULL,
[CCMXMI] [numeric] (1, 0) NULL,
[CCMXMM] [numeric] (1, 0) NULL,
[CCMXMN] [numeric] (1, 0) NULL,
[CCMXMO] [numeric] (1, 0) NULL,
[CCMXMP] [numeric] (1, 0) NULL,
[CCMXMQ] [numeric] (1, 0) NULL,
[CCMXMS] [numeric] (1, 0) NULL,
[CCMXOC] [numeric] (1, 0) NULL,
[CCMXOD] [numeric] (1, 0) NULL,
[CCMXOI] [numeric] (1, 0) NULL,
[CCMXOQ] [numeric] (1, 0) NULL,
[CCMXOS] [numeric] (1, 0) NULL,
[CCMXPA] [numeric] (1, 0) NULL,
[CCMXPC] [numeric] (1, 0) NULL,
[CCMXPD] [numeric] (1, 0) NULL,
[CCMXPM] [numeric] (1, 0) NULL,
[CCMXPO] [numeric] (1, 0) NULL,
[CCMXPP] [numeric] (1, 0) NULL,
[CCMXPQ] [numeric] (1, 0) NULL,
[CCMXPR] [numeric] (1, 0) NULL,
[CCMXPS] [numeric] (1, 0) NULL,
[CCMXQP] [numeric] (1, 0) NULL,
[CCMXRC] [numeric] (1, 0) NULL,
[CCMXRG] [numeric] (1, 0) NULL,
[CCMXRM] [numeric] (1, 0) NULL,
[CCMXRP] [numeric] (1, 0) NULL,
[CCMXRR] [numeric] (1, 0) NULL,
[CCMXRS] [numeric] (1, 0) NULL,
[CCMXSA] [numeric] (1, 0) NULL,
[CCMXSB] [numeric] (1, 0) NULL,
[CCMXSE] [numeric] (1, 0) NULL,
[CCMXSO] [numeric] (1, 0) NULL,
[CCMXSP] [numeric] (1, 0) NULL,
[CCMXST] [numeric] (1, 0) NULL,
[CCMXTA] [numeric] (1, 0) NULL,
[CCMXTE] [numeric] (1, 0) NULL,
[CCMXTM] [numeric] (1, 0) NULL,
[CCMXTP] [numeric] (1, 0) NULL,
[CCMXV1] [nchar] (3) NULL,
[CCMXV2] [nchar] (3) NULL,
[CCMXWO] [numeric] (1, 0) NULL,
[CCMXWP] [numeric] (1, 0) NULL,
[CCMXWT] [numeric] (1, 0) NULL,
[CCNPT1] [numeric] (2, 0) NULL,
[CCNPT2] [numeric] (2, 0) NULL,
[CCNPT3] [numeric] (2, 0) NULL,
[CCNPT4] [numeric] (2, 0) NULL,
[CCNPT5] [numeric] (2, 0) NULL,
[CCOREF] [nvarchar] (30) NULL,
[CCPHN2] [nchar] (16) NULL,
[CCPHNO] [nchar] (16) NULL,
[CCPONO] [nchar] (10) NULL,
[CCPSND] [nchar] (1) NULL,
[CCPTEI] [numeric] (1, 0) NULL,
[CCPTFA] [numeric] (1, 0) NULL,
[CCPTMP] [numeric] (1, 0) NULL,
[CCPTOI] [numeric] (1, 0) NULL,
[CCPTPA] [numeric] (1, 0) NULL,
[CCRAEM] [numeric] (1, 0) NULL,
[CCRGDT] [numeric] (8, 0) NULL,
[CCRGTM] [numeric] (6, 0) NULL,
[CCROW2] [nvarchar] (17) NULL,
[CCROW3] [nvarchar] (78) NULL,
[CCRROF] [nchar] (2) NULL,
[CCSYRE] [numeric] (1, 0) NULL,
[CCTATM] [numeric] (1, 0) NULL,
[CCTFNO] [nchar] (16) NULL,
[CCTIZO] [nchar] (5) NULL,
[CCTLNO] [nchar] (16) NULL,
[CCTOWN] [nvarchar] (20) NULL,
[CCTX15] [nchar] (15) NULL,
[CCTXID] [numeric] (13, 0) NULL,
[CCUNST] [nchar] (3) NULL,
[CCVDME] [numeric] (1, 0) NULL,
[CCVRNL] [nchar] (16) NULL,
[CCVRNO] [nchar] (16) NULL,
[CCWHLO] [nchar] (3) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_CMNDIV_1] ON [tsa].[ics_land_M3V10vil_POL_CMNDIV] ([CCCONO], [CCDIVI])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_CMNDIV', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_CMNDIV', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_CMNDIV', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_CMNDIV', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_CMNDIV', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_CMNDIV', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_CMNDIV', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_CMNDIV', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10vil_POL_CMNDIV', 'COLUMN', N'IsDuplicate'
GO
