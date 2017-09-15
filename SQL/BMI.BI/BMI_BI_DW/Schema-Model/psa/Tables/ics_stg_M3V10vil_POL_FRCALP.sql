CREATE TABLE [psa].[ics_stg_M3V10vil_POL_FRCALP]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_FRCALP_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_FRCALP_IsDuplicate] DEFAULT ((0)),
[HEANBR] [numeric] (18, 0) NULL,
[HEBANO] [nvarchar] (20) NULL,
[HEBJNO] [nvarchar] (18) NOT NULL,
[HEBSOB] [numeric] (18, 0) NULL,
[HECANB] [numeric] (18, 0) NULL,
[HECHID] [nchar] (10) NULL,
[HECHNO] [numeric] (18, 0) NULL,
[HECONO] [numeric] (18, 0) NOT NULL,
[HEFACI] [nchar] (3) NULL,
[HEFSRC] [nchar] (1) NULL,
[HEGTYP] [nchar] (2) NULL,
[HEHACP] [numeric] (18, 0) NULL,
[HEITNO] [nchar] (15) NOT NULL,
[HELMDT] [numeric] (18, 0) NULL,
[HELMTS] [numeric] (18, 0) NULL,
[HEMFCO] [numeric] (18, 0) NULL,
[HEMRGD] [numeric] (18, 0) NOT NULL,
[HEMRGT] [numeric] (18, 0) NOT NULL,
[HERGDT] [numeric] (18, 0) NULL,
[HERGTM] [numeric] (18, 0) NULL,
[HETMSX] [numeric] (18, 0) NOT NULL,
[HETRDT] [numeric] (18, 0) NOT NULL,
[HETRQT] [numeric] (18, 0) NULL,
[HETRTM] [numeric] (18, 0) NOT NULL,
[HETRTP] [nchar] (3) NULL,
[HETTID] [nchar] (3) NULL,
[HETTYP] [numeric] (18, 0) NULL,
[HEWHLO] [nchar] (3) NOT NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_FRCALP] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_FRCALP] PRIMARY KEY CLUSTERED  ([HEBJNO], [HECONO], [HEITNO], [HEMRGD], [HEMRGT], [HETMSX], [HETRDT], [HETRTM], [HEWHLO])
GO
