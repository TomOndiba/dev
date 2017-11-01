CREATE TABLE [tsa].[ics_land_M3V10vil_POL_OPAYMD]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_vil_OPAYMD_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_vil_OPAYMD_IsDuplicate] DEFAULT ((0)),
[ULCHID] [nchar] (10) NULL,
[ULCHNO] [numeric] (3, 0) NULL,
[ULCONO] [numeric] (3, 0) NULL,
[ULCSHD] [nchar] (5) NULL,
[ULCUIN] [nchar] (3) NULL,
[ULDIVI] [nchar] (3) NULL,
[ULDUDT] [numeric] (8, 0) NULL,
[ULEXIN] [nchar] (14) NULL,
[ULIDAT] [numeric] (8, 0) NULL,
[ULINPX] [nchar] (6) NULL,
[ULIVNO] [numeric] (9, 0) NULL,
[ULLMDT] [numeric] (8, 0) NULL,
[ULPLNB] [numeric] (2, 0) NULL,
[ULPMAM] [numeric] (15, 2) NULL,
[ULPMIA] [numeric] (15, 2) NULL,
[ULPMLA] [numeric] (15, 2) NULL,
[ULPMNB] [numeric] (9, 0) NULL,
[ULRAIN] [numeric] (11, 6) NULL,
[ULRGDT] [numeric] (8, 0) NULL,
[ULRGTM] [numeric] (6, 0) NULL,
[ULYEA4] [numeric] (4, 0) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_OPAYMD_1] ON [tsa].[ics_land_M3V10vil_POL_OPAYMD] ([ULCONO], [ULINPX], [ULIVNO], [ULPLNB], [ULPMNB], [ULYEA4])
GO
