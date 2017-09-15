CREATE TABLE [psa].[ics_stg_M3V10ved_POL_MPDEPR]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MPDEPR_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MPDEPR_IsDuplicate] DEFAULT ((0)),
[ILCMCO] [nchar] (2) NULL,
[ILCONO] [numeric] (18, 0) NOT NULL,
[ILDSPN] [numeric] (18, 0) NOT NULL,
[ILFDAT] [numeric] (18, 0) NULL,
[ILFPLP] [numeric] (18, 0) NULL,
[ILITNO] [nchar] (15) NULL,
[ILLEDT] [numeric] (18, 0) NOT NULL,
[ILMEDC] [nchar] (10) NULL,
[ILORQA] [numeric] (18, 0) NULL,
[ILPLPN] [numeric] (18, 0) NOT NULL,
[ILPLPS] [numeric] (18, 0) NOT NULL,
[ILPNLI] [numeric] (18, 0) NOT NULL,
[ILPNLS] [numeric] (18, 0) NOT NULL,
[ILPRQA] [numeric] (18, 0) NULL,
[ILPUNO] [nchar] (7) NOT NULL,
[ILRGTM] [numeric] (18, 0) NOT NULL,
[ILRSIN] [numeric] (18, 0) NULL,
[ILVDDT] [numeric] (18, 0) NULL,
[ILWHLO] [nchar] (3) NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPDEPR] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_MPDEPR] PRIMARY KEY CLUSTERED  ([ILCONO], [ILDSPN], [ILLEDT], [ILPLPN], [ILPLPS], [ILPNLI], [ILPNLS], [ILPUNO], [ILRGTM])
GO
