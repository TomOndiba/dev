CREATE TABLE [tsa].[ics_land_M3V10vil_POL_MPOEXP]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_vil_MPOEXP_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_vil_MPOEXP_IsDuplicate] DEFAULT ((0)),
[IVACIN] [numeric] (15, 2) NULL,
[IVBANO] [nvarchar] (20) NULL,
[IVCDSE] [numeric] (4, 0) NULL,
[IVCEID] [nchar] (6) NULL,
[IVCEVA] [numeric] (15, 2) NULL,
[IVCEVJ] [numeric] (15, 2) NULL,
[IVCHID] [nchar] (10) NULL,
[IVCHNO] [numeric] (3, 0) NULL,
[IVCONO] [numeric] (3, 0) NULL,
[IVCUCD] [nchar] (3) NULL,
[IVEXIC] [numeric] (1, 0) NULL,
[IVEXTY] [numeric] (1, 0) NULL,
[IVIVCQ] [numeric] (1, 0) NULL,
[IVLMDT] [numeric] (8, 0) NULL,
[IVOVHE] [numeric] (15, 2) NULL,
[IVPNLI] [numeric] (3, 0) NULL,
[IVPNLS] [numeric] (3, 0) NULL,
[IVPOOV] [numeric] (1, 0) NULL,
[IVPUNO] [nchar] (7) NULL,
[IVREPN] [numeric] (10, 0) NULL,
[IVRGDT] [numeric] (8, 0) NULL,
[IVRGTM] [numeric] (6, 0) NULL,
[IVTHPR] [numeric] (1, 0) NULL,
[IVWSOP] [nchar] (2) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_MPOEXP_1] ON [tsa].[ics_land_M3V10vil_POL_MPOEXP] ([IVBANO], [IVCDSE], [IVCEID], [IVCONO], [IVEXTY], [IVPNLI], [IVPNLS], [IVPUNO], [IVREPN])
GO
