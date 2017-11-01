CREATE TABLE [psa].[ics_stg_M3V10vil_POL_CCURRA]
(
[EtlRecordId] [bigint] NOT NULL IDENTITY(1, 1),
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NULL,
[EtlDeletedBy] [varchar] (200) NULL,
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_vil_CCURRA_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_vil_CCURRA_IsIncomplete] DEFAULT ('N'),
[CUARAT] [numeric] (11, 6) NULL,
[CUCHID] [nchar] (10) NULL,
[CUCHNO] [numeric] (3, 0) NULL,
[CUCONO] [numeric] (18, 0) NOT NULL,
[CUCRTP] [numeric] (18, 0) NOT NULL,
[CUCUCD] [nchar] (3) NOT NULL,
[CUCUTD] [numeric] (18, 0) NOT NULL,
[CUDIVI] [nchar] (3) NOT NULL,
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
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_CCURRA] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_CCURRA] PRIMARY KEY CLUSTERED  ([CUCONO], [CUCRTP], [CUCUCD], [CUCUTD], [CUDIVI])
GO
