CREATE TABLE [tsa].[ics_land_M3V10vil_POL_MPPOEX]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_vil_MPPOEX_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_vil_MPPOEX_IsDuplicate] DEFAULT ((0)),
[PECHID] [nchar] (10) NULL,
[PECHNO] [numeric] (3, 0) NULL,
[PECONO] [numeric] (3, 0) NULL,
[PEDTCD] [numeric] (1, 0) NULL,
[PEEALI] [numeric] (1, 0) NULL,
[PEFACI] [nchar] (3) NULL,
[PEFDAY] [numeric] (3, 0) NULL,
[PEFUDX] [numeric] (8, 0) NULL,
[PEFUPF] [numeric] (1, 0) NULL,
[PEFUSC] [nchar] (3) NULL,
[PELMDT] [numeric] (8, 0) NULL,
[PEPNLI] [numeric] (3, 0) NULL,
[PEPNLS] [numeric] (3, 0) NULL,
[PEPUNO] [nchar] (7) NULL,
[PEREMK] [nvarchar] (30) NULL,
[PERESP] [nchar] (10) NULL,
[PERGDT] [numeric] (8, 0) NULL,
[PERGTM] [numeric] (6, 0) NULL,
[PESTAT] [nchar] (2) NULL,
[PESUNO] [nchar] (10) NULL,
[PETXID] [numeric] (13, 0) NULL,
[PEWHLO] [nchar] (3) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_MPPOEX_1] ON [tsa].[ics_land_M3V10vil_POL_MPPOEX] ([PECONO], [PEFUDX], [PEPNLI], [PEPNLS], [PEPUNO])
GO
