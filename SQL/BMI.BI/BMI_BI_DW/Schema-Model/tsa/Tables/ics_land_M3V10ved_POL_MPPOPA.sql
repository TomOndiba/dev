CREATE TABLE [tsa].[ics_land_M3V10ved_POL_MPPOPA]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_land_ved_MPPOPA_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_land_ved_MPPOPA_IsDuplicate] DEFAULT ((0)),
[PTCHID] [nchar] (10) NULL,
[PTCHNO] [numeric] (3, 0) NULL,
[PTCONO] [numeric] (3, 0) NULL,
[PTLMDT] [numeric] (8, 0) NULL,
[PTPUNO] [nchar] (7) NULL,
[PTPYAM] [numeric] (15, 2) NULL,
[PTPYDT] [numeric] (8, 0) NULL,
[PTPYPR] [numeric] (3, 0) NULL,
[PTRGDT] [numeric] (8, 0) NULL,
[PTRGTM] [numeric] (6, 0) NULL,
[PTWHLO] [nchar] (3) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_MPPOPA_1] ON [tsa].[ics_land_M3V10ved_POL_MPPOPA] ([PTCONO], [PTPUNO], [PTPYDT])
GO
