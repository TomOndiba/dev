CREATE TABLE [psa].[ics_stg_M3V10ved_POL_CSYTXH]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_CSYTXH_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_CSYTXH_IsDuplicate] DEFAULT ((0)),
[THCHID] [nchar] (10) NULL,
[THCHNO] [numeric] (18, 0) NULL,
[THCONO] [numeric] (18, 0) NOT NULL,
[THDIVI] [nchar] (3) NOT NULL,
[THFILE] [nchar] (10) NULL,
[THKFLD] [nvarchar] (30) NULL,
[THLMDT] [numeric] (18, 0) NULL,
[THLMTS] [numeric] (18, 0) NULL,
[THLNCD] [nchar] (2) NOT NULL,
[THRGDT] [numeric] (18, 0) NULL,
[THRGTM] [numeric] (18, 0) NULL,
[THTX40] [nvarchar] (40) NULL,
[THTXCC] [nchar] (2) NULL,
[THTXEI] [numeric] (18, 0) NULL,
[THTXID] [numeric] (18, 0) NOT NULL,
[THTXVR] [nchar] (10) NOT NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CSYTXH] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_CSYTXH] PRIMARY KEY CLUSTERED  ([THCONO], [THDIVI], [THLNCD], [THTXID], [THTXVR])
GO
