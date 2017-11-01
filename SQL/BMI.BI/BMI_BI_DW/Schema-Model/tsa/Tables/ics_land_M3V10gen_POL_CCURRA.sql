CREATE TABLE [tsa].[ics_land_M3V10gen_POL_CCURRA]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_gen_CCURRA_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_gen_CCURRA_IsDuplicate] DEFAULT ((0)),
[CUARAT] [numeric] (11, 6) NULL,
[CUCHID] [nchar] (10) NULL,
[CUCHNO] [numeric] (3, 0) NULL,
[CUCONO] [numeric] (3, 0) NULL,
[CUCRTP] [numeric] (2, 0) NULL,
[CUCUCD] [nchar] (3) NULL,
[CUCUTD] [numeric] (8, 0) NULL,
[CUDIVI] [nchar] (3) NULL,
[CUDMCU] [numeric] (1, 0) NULL,
[CUGLOC] [nchar] (3) NULL,
[CULMDT] [numeric] (8, 0) NULL,
[CULMTS] [numeric] (18, 0) NULL,
[CULOCD] [nchar] (3) NULL,
[CURAFA] [numeric] (1, 0) NULL,
[CURGDT] [numeric] (8, 0) NULL,
[CURGTM] [numeric] (6, 0) NULL,
[CUTXID] [numeric] (13, 0) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_CCURRA_1] ON [tsa].[ics_land_M3V10gen_POL_CCURRA] ([CUCONO], [CUCRTP], [CUCUCD], [CUCUTD], [CUDIVI])
GO
