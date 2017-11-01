CREATE TABLE [tsa].[ics_land_M3V10vil_POL_MPDEPR]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_vil_MPDEPR_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_vil_MPDEPR_IsDuplicate] DEFAULT ((0)),
[ILCMCO] [nchar] (2) NULL,
[ILCONO] [numeric] (3, 0) NULL,
[ILDSPN] [numeric] (11, 0) NULL,
[ILFDAT] [numeric] (8, 0) NULL,
[ILFPLP] [numeric] (1, 0) NULL,
[ILITNO] [nchar] (15) NULL,
[ILLEDT] [numeric] (8, 0) NULL,
[ILMEDC] [nchar] (10) NULL,
[ILORQA] [numeric] (15, 6) NULL,
[ILPLPN] [numeric] (7, 0) NULL,
[ILPLPS] [numeric] (3, 0) NULL,
[ILPNLI] [numeric] (3, 0) NULL,
[ILPNLS] [numeric] (3, 0) NULL,
[ILPRQA] [numeric] (15, 6) NULL,
[ILPUNO] [nchar] (7) NULL,
[ILRGTM] [numeric] (6, 0) NULL,
[ILRSIN] [numeric] (1, 0) NULL,
[ILVDDT] [numeric] (8, 0) NULL,
[ILWHLO] [nchar] (3) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_MPDEPR_1] ON [tsa].[ics_land_M3V10vil_POL_MPDEPR] ([ILCONO], [ILDSPN], [ILLEDT], [ILPLPN], [ILPLPS], [ILPNLI], [ILPNLS], [ILPUNO], [ILRGTM])
GO
