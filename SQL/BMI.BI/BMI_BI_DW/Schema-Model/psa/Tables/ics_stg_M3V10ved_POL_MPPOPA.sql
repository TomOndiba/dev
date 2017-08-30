CREATE TABLE [psa].[ics_stg_M3V10ved_POL_MPPOPA]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MPPOPA_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_MPPOPA_IsDuplicate] DEFAULT ((0)),
[PTCHID] [nchar] (10) NULL,
[PTCHNO] [numeric] (18, 0) NULL,
[PTCONO] [numeric] (18, 0) NOT NULL,
[PTLMDT] [numeric] (18, 0) NULL,
[PTPUNO] [nchar] (7) NOT NULL,
[PTPYAM] [numeric] (18, 0) NULL,
[PTPYDT] [numeric] (18, 0) NOT NULL,
[PTPYPR] [numeric] (18, 0) NULL,
[PTRGDT] [numeric] (18, 0) NULL,
[PTRGTM] [numeric] (18, 0) NULL,
[PTWHLO] [nchar] (3) NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MPPOPA] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_MPPOPA] PRIMARY KEY CLUSTERED  ([PTCONO], [PTPUNO], [PTPYDT])
GO
