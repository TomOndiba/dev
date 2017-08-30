CREATE TABLE [psa].[ics_stg_M3V10ved_POL_CSYTAB]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_CSYTAB_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_CSYTAB_IsDuplicate] DEFAULT ((0)),
[CTCHID] [nchar] (10) NULL,
[CTCHNO] [numeric] (18, 0) NULL,
[CTCONO] [numeric] (18, 0) NOT NULL,
[CTDIVI] [nchar] (3) NOT NULL,
[CTLMDT] [numeric] (18, 0) NULL,
[CTLMTS] [numeric] (18, 0) NULL,
[CTLNCD] [nchar] (2) NOT NULL,
[CTPARM] [nvarchar] (200) NULL,
[CTRGDT] [numeric] (18, 0) NULL,
[CTRGTM] [numeric] (18, 0) NULL,
[CTSTCO] [nchar] (10) NOT NULL,
[CTSTKY] [nchar] (10) NOT NULL,
[CTTX15] [nchar] (15) NULL,
[CTTX40] [nvarchar] (40) NULL,
[CTTXID] [numeric] (18, 0) NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CSYTAB] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_CSYTAB] PRIMARY KEY CLUSTERED  ([CTCONO], [CTDIVI], [CTLNCD], [CTSTCO], [CTSTKY])
GO
