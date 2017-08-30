CREATE TABLE [psa].[ics_stg_M3V10gen_POL_MPLIRE]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MPLIRE_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_MPLIRE_IsDuplicate] DEFAULT ((0)),
[IRBANO] [nvarchar] (20) NULL,
[IRBOLN] [nchar] (14) NULL,
[IRCHID] [nchar] (10) NULL,
[IRCHNO] [numeric] (18, 0) NULL,
[IRCONO] [numeric] (18, 0) NOT NULL,
[IRFACI] [nchar] (3) NULL,
[IRITNO] [nchar] (15) NULL,
[IRLMDT] [numeric] (18, 0) NULL,
[IRMOEM] [numeric] (18, 0) NULL,
[IRNBAN] [nvarchar] (20) NULL,
[IRNHAI] [nchar] (15) NULL,
[IRNHSN] [nvarchar] (20) NULL,
[IRNITN] [nchar] (15) NULL,
[IRPNLI] [numeric] (18, 0) NOT NULL,
[IRPNLS] [numeric] (18, 0) NOT NULL,
[IRPUNO] [nchar] (7) NOT NULL,
[IRRGDT] [numeric] (18, 0) NULL,
[IRRGTM] [numeric] (18, 0) NULL,
[IRRSCD] [nchar] (3) NULL,
[IRWHLO] [nchar] (3) NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_MPLIRE] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_MPLIRE] PRIMARY KEY CLUSTERED  ([IRCONO], [IRPNLI], [IRPNLS], [IRPUNO])
GO
