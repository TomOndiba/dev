CREATE TABLE [psa].[ics_stg_M3V10vil_POL_FSLEDX]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_FSLEDX_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_FSLEDX_IsDuplicate] DEFAULT ((0)),
[ESCHID] [nchar] (10) NULL,
[ESCHNO] [numeric] (18, 0) NULL,
[ESCONO] [numeric] (18, 0) NOT NULL,
[ESDIVI] [nchar] (3) NOT NULL,
[ESJRNO] [numeric] (18, 0) NOT NULL,
[ESJSNO] [numeric] (18, 0) NOT NULL,
[ESLMDT] [numeric] (18, 0) NULL,
[ESLMTS] [numeric] (18, 0) NULL,
[ESRGDT] [numeric] (18, 0) NULL,
[ESRGTM] [numeric] (18, 0) NULL,
[ESSEXI] [nvarchar] (45) NOT NULL,
[ESSEXN] [numeric] (18, 0) NOT NULL,
[ESSEXS] [numeric] (18, 0) NOT NULL,
[ESTXID] [numeric] (18, 0) NULL,
[ESYEA4] [numeric] (18, 0) NOT NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FSLEDX] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_FSLEDX] PRIMARY KEY CLUSTERED  ([ESCONO], [ESDIVI], [ESJRNO], [ESJSNO], [ESSEXI], [ESSEXN], [ESSEXS], [ESYEA4])
GO
