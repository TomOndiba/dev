CREATE TABLE [psa].[ics_stg_M3V10ved_POL_MPDEPR]
(
[EtlRecordId] [bigint] NOT NULL IDENTITY(1, 1),
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NULL,
[EtlDeletedBy] [varchar] (200) NULL,
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_ved_MPDEPR_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_ved_MPDEPR_IsIncomplete] DEFAULT ('N'),
[ILCMCO] [nchar] (2) NULL,
[ILCONO] [numeric] (18, 0) NOT NULL,
[ILDSPN] [numeric] (18, 0) NOT NULL,
[ILFDAT] [numeric] (8, 0) NULL,
[ILFPLP] [numeric] (1, 0) NULL,
[ILITNO] [nchar] (15) NULL,
[ILLEDT] [numeric] (18, 0) NOT NULL,
[ILMEDC] [nchar] (10) NULL,
[ILORQA] [numeric] (15, 6) NULL,
[ILPLPN] [numeric] (18, 0) NOT NULL,
[ILPLPS] [numeric] (18, 0) NOT NULL,
[ILPNLI] [numeric] (18, 0) NOT NULL,
[ILPNLS] [numeric] (18, 0) NOT NULL,
[ILPRQA] [numeric] (15, 6) NULL,
[ILPUNO] [nchar] (7) NOT NULL,
[ILRGTM] [numeric] (18, 0) NOT NULL,
[ILRSIN] [numeric] (1, 0) NULL,
[ILVDDT] [numeric] (8, 0) NULL,
[ILWHLO] [nchar] (3) NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPDEPR] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_MPDEPR] PRIMARY KEY CLUSTERED  ([ILCONO], [ILDSPN], [ILLEDT], [ILPLPN], [ILPLPS], [ILPNLI], [ILPNLS], [ILPUNO], [ILRGTM])
GO
