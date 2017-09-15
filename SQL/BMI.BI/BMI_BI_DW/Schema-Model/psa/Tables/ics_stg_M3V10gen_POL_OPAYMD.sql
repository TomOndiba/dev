CREATE TABLE [psa].[ics_stg_M3V10gen_POL_OPAYMD]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_OPAYMD_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_OPAYMD_IsDuplicate] DEFAULT ((0)),
[ULCHID] [nchar] (10) NULL,
[ULCHNO] [numeric] (18, 0) NULL,
[ULCONO] [numeric] (18, 0) NOT NULL,
[ULCSHD] [nchar] (5) NULL,
[ULCUIN] [nchar] (3) NULL,
[ULDIVI] [nchar] (3) NULL,
[ULDUDT] [numeric] (18, 0) NULL,
[ULEXIN] [nchar] (14) NULL,
[ULIDAT] [numeric] (18, 0) NULL,
[ULINPX] [nchar] (6) NOT NULL,
[ULIVNO] [numeric] (18, 0) NOT NULL,
[ULLMDT] [numeric] (18, 0) NULL,
[ULPLNB] [numeric] (18, 0) NOT NULL,
[ULPMAM] [numeric] (18, 0) NULL,
[ULPMIA] [numeric] (18, 0) NULL,
[ULPMLA] [numeric] (18, 0) NULL,
[ULPMNB] [numeric] (18, 0) NOT NULL,
[ULRAIN] [numeric] (18, 0) NULL,
[ULRGDT] [numeric] (18, 0) NULL,
[ULRGTM] [numeric] (18, 0) NULL,
[ULYEA4] [numeric] (18, 0) NOT NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OPAYMD] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_OPAYMD] PRIMARY KEY CLUSTERED  ([ULCONO], [ULINPX], [ULIVNO], [ULPLNB], [ULPMNB], [ULYEA4])
GO
