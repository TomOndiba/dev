CREATE TABLE [tsa].[ics_land_M3V10ved_POL_MPLIRE]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_land_ved_MPLIRE_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_land_ved_MPLIRE_IsDuplicate] DEFAULT ((0)),
[IRBANO] [nvarchar] (20) NULL,
[IRBOLN] [nchar] (14) NULL,
[IRCHID] [nchar] (10) NULL,
[IRCHNO] [numeric] (3, 0) NULL,
[IRCONO] [numeric] (3, 0) NULL,
[IRFACI] [nchar] (3) NULL,
[IRITNO] [nchar] (15) NULL,
[IRLMDT] [numeric] (8, 0) NULL,
[IRMOEM] [numeric] (1, 0) NULL,
[IRNBAN] [nvarchar] (20) NULL,
[IRNHAI] [nchar] (15) NULL,
[IRNHSN] [nvarchar] (20) NULL,
[IRNITN] [nchar] (15) NULL,
[IRPNLI] [numeric] (3, 0) NULL,
[IRPNLS] [numeric] (3, 0) NULL,
[IRPUNO] [nchar] (7) NULL,
[IRRGDT] [numeric] (8, 0) NULL,
[IRRGTM] [numeric] (6, 0) NULL,
[IRRSCD] [nchar] (3) NULL,
[IRWHLO] [nchar] (3) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_MPLIRE_1] ON [tsa].[ics_land_M3V10ved_POL_MPLIRE] ([IRCONO], [IRPNLI], [IRPNLS], [IRPUNO])
GO
