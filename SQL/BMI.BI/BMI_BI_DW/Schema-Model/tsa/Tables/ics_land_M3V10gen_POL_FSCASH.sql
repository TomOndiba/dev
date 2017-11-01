CREATE TABLE [tsa].[ics_land_M3V10gen_POL_FSCASH]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_gen_FSCASH_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_gen_FSCASH_IsDuplicate] DEFAULT ((0)),
[ESBCHN] [numeric] (5, 0) NULL,
[ESCDAM] [numeric] (15, 2) NULL,
[ESCDP1] [numeric] (4, 2) NULL,
[ESCDP2] [numeric] (4, 2) NULL,
[ESCDP3] [numeric] (4, 2) NULL,
[ESCDT1] [numeric] (8, 0) NULL,
[ESCDT2] [numeric] (8, 0) NULL,
[ESCDT3] [numeric] (8, 0) NULL,
[ESCINO] [nchar] (15) NULL,
[ESCONO] [numeric] (3, 0) NULL,
[ESDIVI] [nchar] (3) NULL,
[ESJBDT] [numeric] (6, 0) NULL,
[ESJBNO] [numeric] (6, 0) NULL,
[ESJBTM] [numeric] (6, 0) NULL,
[ESJRNO] [numeric] (7, 0) NULL,
[ESJSNO] [numeric] (7, 0) NULL,
[ESSPLT] [numeric] (1, 0) NULL,
[ESTECD] [nchar] (3) NULL,
[ESTRNO] [numeric] (7, 0) NULL,
[ESTSTM] [varchar] (26) NULL,
[ESVONO] [numeric] (8, 0) NULL,
[ESVSER] [nchar] (3) NULL,
[ESYEA4] [numeric] (4, 0) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_FSCASH_1] ON [tsa].[ics_land_M3V10gen_POL_FSCASH] ([ESCONO], [ESDIVI], [ESTSTM])
GO
