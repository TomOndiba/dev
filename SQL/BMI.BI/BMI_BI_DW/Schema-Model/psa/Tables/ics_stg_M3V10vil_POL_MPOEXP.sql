CREATE TABLE [psa].[ics_stg_M3V10vil_POL_MPOEXP]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MPOEXP_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MPOEXP_IsDuplicate] DEFAULT ((0)),
[IVACIN] [numeric] (18, 0) NULL,
[IVBANO] [nvarchar] (20) NOT NULL,
[IVCDSE] [numeric] (18, 0) NOT NULL,
[IVCEID] [nchar] (6) NOT NULL,
[IVCEVA] [numeric] (18, 0) NULL,
[IVCEVJ] [numeric] (18, 0) NULL,
[IVCHID] [nchar] (10) NULL,
[IVCHNO] [numeric] (18, 0) NULL,
[IVCONO] [numeric] (18, 0) NOT NULL,
[IVCUCD] [nchar] (3) NULL,
[IVEXIC] [numeric] (18, 0) NULL,
[IVEXTY] [numeric] (18, 0) NOT NULL,
[IVIVCQ] [numeric] (18, 0) NULL,
[IVLMDT] [numeric] (18, 0) NULL,
[IVOVHE] [numeric] (18, 0) NULL,
[IVPNLI] [numeric] (18, 0) NOT NULL,
[IVPNLS] [numeric] (18, 0) NOT NULL,
[IVPOOV] [numeric] (18, 0) NULL,
[IVPUNO] [nchar] (7) NOT NULL,
[IVREPN] [numeric] (18, 0) NOT NULL,
[IVRGDT] [numeric] (18, 0) NULL,
[IVRGTM] [numeric] (18, 0) NULL,
[IVTHPR] [numeric] (18, 0) NULL,
[IVWSOP] [nchar] (2) NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPOEXP] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_MPOEXP] PRIMARY KEY CLUSTERED  ([IVBANO], [IVCDSE], [IVCEID], [IVCONO], [IVEXTY], [IVPNLI], [IVPNLS], [IVPUNO], [IVREPN])
GO
