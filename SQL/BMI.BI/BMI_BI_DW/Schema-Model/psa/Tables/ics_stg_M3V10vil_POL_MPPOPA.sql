CREATE TABLE [psa].[ics_stg_M3V10vil_POL_MPPOPA]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_vil_MPPOPA_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_vil_MPPOPA_IsIncomplete] DEFAULT ('N'),
[PTCHID] [nchar] (10) NULL,
[PTCHNO] [numeric] (3, 0) NULL,
[PTCONO] [numeric] (18, 0) NOT NULL,
[PTLMDT] [numeric] (8, 0) NULL,
[PTPUNO] [nchar] (7) NOT NULL,
[PTPYAM] [numeric] (15, 2) NULL,
[PTPYDT] [numeric] (18, 0) NOT NULL,
[PTPYPR] [numeric] (3, 0) NULL,
[PTRGDT] [numeric] (8, 0) NULL,
[PTRGTM] [numeric] (6, 0) NULL,
[PTWHLO] [nchar] (3) NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_MPPOPA] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_MPPOPA] PRIMARY KEY CLUSTERED  ([PTCONO], [PTPUNO], [PTPYDT])
GO
