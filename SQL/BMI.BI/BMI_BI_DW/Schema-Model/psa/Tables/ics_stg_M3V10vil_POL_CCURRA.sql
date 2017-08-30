CREATE TABLE [psa].[ics_stg_M3V10vil_POL_CCURRA]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_CCURRA_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_CCURRA_IsDuplicate] DEFAULT ((0)),
[CUARAT] [numeric] (18, 0) NULL,
[CUCHID] [nchar] (10) NULL,
[CUCHNO] [numeric] (18, 0) NULL,
[CUCONO] [numeric] (18, 0) NOT NULL,
[CUCRTP] [numeric] (18, 0) NOT NULL,
[CUCUCD] [nchar] (3) NOT NULL,
[CUCUTD] [numeric] (18, 0) NOT NULL,
[CUDIVI] [nchar] (3) NOT NULL,
[CUDMCU] [numeric] (18, 0) NULL,
[CUGLOC] [nchar] (3) NULL,
[CULMDT] [numeric] (18, 0) NULL,
[CULMTS] [numeric] (18, 0) NULL,
[CULOCD] [nchar] (3) NULL,
[CURAFA] [numeric] (18, 0) NULL,
[CURGDT] [numeric] (18, 0) NULL,
[CURGTM] [numeric] (18, 0) NULL,
[CUTXID] [numeric] (18, 0) NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CCURRA] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_CCURRA] PRIMARY KEY CLUSTERED  ([CUCONO], [CUCRTP], [CUCUCD], [CUCUTD], [CUDIVI])
GO
