CREATE TABLE [tsa].[ics_land_M3V10ved_POL_OCUSMA]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_land_ved_OCUSMA_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_land_ved_OCUSMA_IsDuplicate] DEFAULT ((0)),
[OKAACB] [nchar] (12) NULL,
[OKACEI] [numeric] (1, 0) NULL,
[OKACGR] [nchar] (10) NULL,
[OKACHK] [numeric] (1, 0) NULL,
[OKACLB] [nchar] (4) NULL,
[OKACRF] [nchar] (8) NULL,
[OKADBO] [numeric] (1, 0) NULL,
[OKADCA] [nchar] (3) NULL,
[OKADID] [nchar] (6) NULL,
[OKADTG] [numeric] (1, 0) NULL,
[OKADVI] [nchar] (6) NULL,
[OKAGAC] [nchar] (12) NULL,
[OKAGBG] [numeric] (10, 0) NULL,
[OKAGBP] [nchar] (16) NULL,
[OKAGCA] [numeric] (1, 0) NULL,
[OKAGCH] [numeric] (1, 0) NULL,
[OKAGCP] [nchar] (5) NULL,
[OKAGCT] [numeric] (1, 0) NULL,
[OKAGN2] [nchar] (10) NULL,
[OKAGN3] [nchar] (10) NULL,
[OKAGN4] [nchar] (10) NULL,
[OKAGN5] [nchar] (10) NULL,
[OKAGN6] [nchar] (10) NULL,
[OKAGN7] [nchar] (10) NULL,
[OKAGNT] [nchar] (10) NULL,
[OKAGPA] [numeric] (1, 0) NULL,
[OKAGPG] [numeric] (10, 0) NULL,
[OKAGPN] [nchar] (12) NULL,
[OKAGPY] [nvarchar] (18) NULL,
[OKAGTD] [numeric] (8, 0) NULL,
[OKAGTN] [numeric] (10, 0) NULL,
[OKAICD] [numeric] (1, 0) NULL,
[OKALCU] [nchar] (10) NULL,
[OKALWT] [numeric] (2, 0) NULL,
[OKATPR] [nchar] (1) NULL,
[OKAUGI] [numeric] (1, 0) NULL,
[OKBCKO] [numeric] (1, 0) NULL,
[OKBGRP] [nchar] (2) NULL,
[OKBLAC] [numeric] (1, 0) NULL,
[OKBLCD] [numeric] (1, 0) NULL,
[OKBLII] [numeric] (1, 0) NULL,
[OKBLPR] [numeric] (1, 0) NULL,
[OKBOCD] [numeric] (1, 0) NULL,
[OKBPCD] [numeric] (1, 0) NULL,
[OKBPEX] [numeric] (1, 0) NULL,
[OKBREC] [nchar] (10) NULL,
[OKBUSE] [numeric] (1, 0) NULL,
[OKCCUS] [nchar] (10) NULL,
[OKCDRC] [nchar] (3) NULL,
[OKCESA] [nvarchar] (32) NULL,
[OKCFC0] [nchar] (1) NULL,
[OKCFC1] [nchar] (10) NULL,
[OKCFC2] [numeric] (15, 2) NULL,
[OKCFC3] [nchar] (3) NULL,
[OKCFC4] [nchar] (5) NULL,
[OKCFC5] [nchar] (1) NULL,
[OKCFC6] [nchar] (10) NULL,
[OKCFC7] [numeric] (15, 2) NULL,
[OKCFC8] [nchar] (3) NULL,
[OKCFC9] [nchar] (5) NULL,
[OKCHCL] [numeric] (1, 0) NULL,
[OKCHID] [nchar] (10) NULL,
[OKCHNO] [numeric] (3, 0) NULL,
[OKCHSY] [nchar] (10) NULL,
[OKCLCD] [numeric] (1, 0) NULL,
[OKCONO] [numeric] (3, 0) NULL,
[OKCOR2] [nchar] (11) NULL,
[OKCORG] [nchar] (11) NULL,
[OKCRL2] [numeric] (15, 2) NULL,
[OKCRL3] [numeric] (15, 2) NULL,
[OKCRLM] [numeric] (15, 2) NULL,
[OKCRTP] [numeric] (2, 0) NULL,
[OKCSCD] [nchar] (3) NULL,
[OKCUA1] [nvarchar] (36) NULL,
[OKCUA2] [nvarchar] (36) NULL,
[OKCUA3] [nvarchar] (36) NULL,
[OKCUA4] [nvarchar] (36) NULL,
[OKCUCD] [nchar] (3) NULL,
[OKCUCL] [nchar] (3) NULL,
[OKCUIC] [nchar] (10) NULL,
[OKCUNM] [nvarchar] (36) NULL,
[OKCUNO] [nchar] (10) NULL,
[OKCUST] [nchar] (10) NULL,
[OKCUSU] [nchar] (10) NULL,
[OKCUTP] [numeric] (1, 0) NULL,
[OKDESV] [nchar] (2) NULL,
[OKDIGC] [nchar] (2) NULL,
[OKDIPC] [numeric] (5, 2) NULL,
[OKDIST] [numeric] (5, 0) NULL,
[OKDISY] [nchar] (10) NULL,
[OKDIVI] [nchar] (3) NULL,
[OKDMSO] [nchar] (10) NULL,
[OKDOGR] [nchar] (3) NULL,
[OKDTE1] [numeric] (8, 0) NULL,
[OKDTE2] [numeric] (8, 0) NULL,
[OKDTE3] [numeric] (8, 0) NULL,
[OKDTFM] [nchar] (3) NULL,
[OKDTID] [numeric] (13, 0) NULL,
[OKDTL1] [numeric] (8, 0) NULL,
[OKDTL2] [numeric] (8, 0) NULL,
[OKDUCD] [numeric] (1, 0) NULL,
[OKEALO] [numeric] (13, 0) NULL,
[OKECAR] [nchar] (2) NULL,
[OKECF1] [nchar] (5) NULL,
[OKECF2] [nchar] (5) NULL,
[OKECF3] [nchar] (5) NULL,
[OKECF4] [nchar] (5) NULL,
[OKECF5] [nchar] (5) NULL,
[OKECLC] [nchar] (2) NULL,
[OKEDES] [nchar] (10) NULL,
[OKEDIP] [numeric] (1, 0) NULL,
[OKEDIT] [nchar] (1) NULL,
[OKENHD] [numeric] (1, 0) NULL,
[OKESAL] [numeric] (1, 0) NULL,
[OKEURI] [numeric] (1, 0) NULL,
[OKEXCD] [nchar] (2) NULL,
[OKEXPT] [numeric] (1, 0) NULL,
[OKFACI] [nchar] (3) NULL,
[OKFRE1] [nchar] (5) NULL,
[OKFRE2] [nchar] (5) NULL,
[OKGEOC] [numeric] (9, 0) NULL,
[OKGRPY] [numeric] (1, 0) NULL,
[OKHAFE] [nchar] (6) NULL,
[OKIICT] [nchar] (3) NULL,
[OKINCO] [nchar] (10) NULL,
[OKININ] [numeric] (3, 0) NULL,
[OKINLI] [numeric] (15, 2) NULL,
[OKINRC] [nchar] (10) NULL,
[OKINSN] [nvarchar] (20) NULL,
[OKINSS] [numeric] (1, 0) NULL,
[OKINSU] [nchar] (10) NULL,
[OKIVGP] [nchar] (3) NULL,
[OKLHCD] [nchar] (2) NULL,
[OKLIDT] [numeric] (8, 0) NULL,
[OKLMDT] [numeric] (8, 0) NULL,
[OKLMTS] [numeric] (18, 0) NULL,
[OKLSAD] [nchar] (8) NULL,
[OKLSID] [nchar] (8) NULL,
[OKLSOI] [numeric] (8, 0) NULL,
[OKLZON] [numeric] (2, 0) NULL,
[OKMAIL] [numeric] (1, 0) NULL,
[OKMCON] [numeric] (1, 0) NULL,
[OKMCOS] [numeric] (1, 0) NULL,
[OKMEAL] [nchar] (10) NULL,
[OKMODL] [nchar] (3) NULL,
[OKMTIC] [numeric] (1, 0) NULL,
[OKNALI] [numeric] (15, 2) NULL,
[OKODTG] [numeric] (1, 0) NULL,
[OKODUD] [numeric] (3, 0) NULL,
[OKODUE] [numeric] (3, 0) NULL,
[OKOREF] [nvarchar] (30) NULL,
[OKORTP] [nchar] (3) NULL,
[OKOT75] [numeric] (1, 0) NULL,
[OKOT89] [numeric] (1, 0) NULL,
[OKPADL] [numeric] (1, 0) NULL,
[OKPHN2] [nchar] (16) NULL,
[OKPHNO] [nchar] (16) NULL,
[OKPLTB] [nchar] (10) NULL,
[OKPONO] [nchar] (10) NULL,
[OKPOPN] [nvarchar] (30) NULL,
[OKPRDL] [numeric] (1, 0) NULL,
[OKPRIC] [numeric] (1, 0) NULL,
[OKPRIO] [numeric] (1, 0) NULL,
[OKPRS1] [nchar] (2) NULL,
[OKPRS2] [nchar] (2) NULL,
[OKPRS3] [nchar] (2) NULL,
[OKPRS4] [nchar] (2) NULL,
[OKPRS5] [nchar] (2) NULL,
[OKPRVG] [nchar] (2) NULL,
[OKPWMT] [nchar] (10) NULL,
[OKPYCD] [nchar] (3) NULL,
[OKPYDI] [nchar] (3) NULL,
[OKPYNO] [nchar] (10) NULL,
[OKPYOP] [numeric] (1, 0) NULL,
[OKQUCK] [numeric] (1, 0) NULL,
[OKRAN1] [numeric] (2, 0) NULL,
[OKRAN2] [numeric] (2, 0) NULL,
[OKRAN3] [numeric] (2, 0) NULL,
[OKRAN4] [numeric] (2, 0) NULL,
[OKRESP] [nchar] (10) NULL,
[OKRGDT] [numeric] (8, 0) NULL,
[OKRGTM] [numeric] (6, 0) NULL,
[OKRMCT] [nchar] (3) NULL,
[OKRODN] [numeric] (3, 0) NULL,
[OKRONO] [nchar] (3) NULL,
[OKROUT] [nchar] (6) NULL,
[OKSCED] [numeric] (1, 0) NULL,
[OKSDST] [nchar] (3) NULL,
[OKSERC] [numeric] (2, 0) NULL,
[OKSMCD] [nchar] (4) NULL,
[OKSOOP] [numeric] (1, 0) NULL,
[OKSOTP] [nchar] (3) NULL,
[OKSPLM] [nchar] (8) NULL,
[OKSRES] [nchar] (4) NULL,
[OKSTAT] [nchar] (2) NULL,
[OKSTMR] [nchar] (3) NULL,
[OKSTMS] [numeric] (1, 0) NULL,
[OKTAXC] [nchar] (3) NULL,
[OKTBLG] [numeric] (15, 2) NULL,
[OKTCEX] [numeric] (1, 0) NULL,
[OKTDIN] [numeric] (15, 2) NULL,
[OKTECD] [nchar] (3) NULL,
[OKTECH] [nchar] (4) NULL,
[OKTECN] [nvarchar] (20) NULL,
[OKTEDL] [nchar] (3) NULL,
[OKTEEC] [numeric] (8, 0) NULL,
[OKTEPA] [nchar] (3) NULL,
[OKTEPY] [nchar] (3) NULL,
[OKTFNO] [nchar] (16) NULL,
[OKTINC] [numeric] (1, 0) NULL,
[OKTOIN] [numeric] (15, 2) NULL,
[OKTOWN] [nvarchar] (20) NULL,
[OKTRTI] [numeric] (7, 2) NULL,
[OKTVCD] [nchar] (2) NULL,
[OKTXAP] [numeric] (1, 0) NULL,
[OKTXID] [numeric] (13, 0) NULL,
[OKULZO] [nchar] (5) NULL,
[OKUSL1] [nchar] (10) NULL,
[OKUSL2] [nchar] (10) NULL,
[OKUSR1] [nchar] (10) NULL,
[OKUSR2] [nchar] (10) NULL,
[OKUSR3] [nchar] (10) NULL,
[OKVDLA] [numeric] (1, 0) NULL,
[OKVRCD] [nchar] (2) NULL,
[OKVRNO] [nchar] (16) NULL,
[OKVTCD] [numeric] (2, 0) NULL,
[OKWAYB] [numeric] (1, 0) NULL,
[OKWHLO] [nchar] (3) NULL,
[OKYRE2] [nvarchar] (30) NULL,
[OKYREF] [nvarchar] (30) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_OCUSMA_1] ON [tsa].[ics_land_M3V10ved_POL_OCUSMA] ([OKCONO], [OKCUNO])
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OCUSMA', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Batch Run Id context in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OCUSMA', 'COLUMN', N'EtlBatchRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OCUSMA', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record to this table.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OCUSMA', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the only or main table or object in the source system of record from which this row was extracted', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OCUSMA', 'COLUMN', N'EtlSourceTable'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Step Run Id context (within a Batch Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OCUSMA', 'COLUMN', N'EtlStepRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The Thread Run Id context (within a Step Run) in which this record was added or last updated on this table – soft link back to the Batch Management database (BMI_BAT_MAN).', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OCUSMA', 'COLUMN', N'EtlThreadRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA.  Indicates that this row should not be merged to PSA for some reason - e.g. becuae it is a possible duplicate.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OCUSMA', 'COLUMN', N'ExcludeFromMerge'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Used as part of ETL processing when merging from TSA to PSA. Indicates that this row is a suspected duplicate, one reason why a row might be excluded from the TSA-to-PSA merge.', 'SCHEMA', N'tsa', 'TABLE', N'ics_land_M3V10ved_POL_OCUSMA', 'COLUMN', N'IsDuplicate'
GO
