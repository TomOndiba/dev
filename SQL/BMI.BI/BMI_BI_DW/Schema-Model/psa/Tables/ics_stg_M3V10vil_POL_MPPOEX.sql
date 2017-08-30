CREATE TABLE [psa].[ics_stg_M3V10vil_POL_MPPOEX]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MPPOEX_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MPPOEX_IsDuplicate] DEFAULT ((0)),
[PECHID] [nchar] (10) NULL,
[PECHNO] [numeric] (18, 0) NULL,
[PECONO] [numeric] (18, 0) NOT NULL,
[PEDTCD] [numeric] (18, 0) NULL,
[PEEALI] [numeric] (18, 0) NULL,
[PEFACI] [nchar] (3) NULL,
[PEFDAY] [numeric] (18, 0) NULL,
[PEFUDX] [numeric] (18, 0) NOT NULL,
[PEFUPF] [numeric] (18, 0) NULL,
[PEFUSC] [nchar] (3) NULL,
[PELMDT] [numeric] (18, 0) NULL,
[PEPNLI] [numeric] (18, 0) NOT NULL,
[PEPNLS] [numeric] (18, 0) NOT NULL,
[PEPUNO] [nchar] (7) NOT NULL,
[PEREMK] [nvarchar] (30) NULL,
[PERESP] [nchar] (10) NULL,
[PERGDT] [numeric] (18, 0) NULL,
[PERGTM] [numeric] (18, 0) NULL,
[PESTAT] [nchar] (2) NULL,
[PESUNO] [nchar] (10) NULL,
[PETXID] [numeric] (18, 0) NULL,
[PEWHLO] [nchar] (3) NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPPOEX] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_MPPOEX] PRIMARY KEY CLUSTERED  ([PECONO], [PEFUDX], [PEPNLI], [PEPNLS], [PEPUNO])
GO
