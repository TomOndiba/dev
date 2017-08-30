CREATE TABLE [psa].[ics_stg_M3V10vil_POL_MSYTXL]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MSYTXL_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_MSYTXL_IsDuplicate] DEFAULT ((0)),
[TLCONO] [numeric] (18, 0) NOT NULL,
[TLDIVI] [nchar] (3) NOT NULL,
[TLLINO] [numeric] (18, 0) NOT NULL,
[TLLMTS] [numeric] (18, 0) NULL,
[TLLNCD] [nchar] (2) NOT NULL,
[TLTX60] [nvarchar] (60) NULL,
[TLTXID] [numeric] (18, 0) NOT NULL,
[TLTXVR] [nchar] (10) NOT NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MSYTXL] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_MSYTXL] PRIMARY KEY CLUSTERED  ([TLCONO], [TLDIVI], [TLLINO], [TLLNCD], [TLTXID], [TLTXVR])
GO
