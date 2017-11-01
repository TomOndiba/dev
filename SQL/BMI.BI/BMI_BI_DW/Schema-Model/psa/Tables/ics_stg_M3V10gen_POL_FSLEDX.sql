CREATE TABLE [psa].[ics_stg_M3V10gen_POL_FSLEDX]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_gen_FSLEDX_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_gen_FSLEDX_IsIncomplete] DEFAULT ('N'),
[ESCHID] [nchar] (10) NULL,
[ESCHNO] [numeric] (3, 0) NULL,
[ESCONO] [numeric] (18, 0) NOT NULL,
[ESDIVI] [nchar] (3) NOT NULL,
[ESJRNO] [numeric] (18, 0) NOT NULL,
[ESJSNO] [numeric] (18, 0) NOT NULL,
[ESLMDT] [numeric] (8, 0) NULL,
[ESLMTS] [numeric] (18, 0) NULL,
[ESRGDT] [numeric] (8, 0) NULL,
[ESRGTM] [numeric] (6, 0) NULL,
[ESSEXI] [nvarchar] (45) NOT NULL,
[ESSEXN] [numeric] (18, 0) NOT NULL,
[ESSEXS] [numeric] (18, 0) NOT NULL,
[ESTXID] [numeric] (13, 0) NULL,
[ESYEA4] [numeric] (18, 0) NOT NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_FSLEDX] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_FSLEDX] PRIMARY KEY CLUSTERED  ([ESCONO], [ESDIVI], [ESJRNO], [ESJSNO], [ESSEXI], [ESSEXN], [ESSEXS], [ESYEA4])
GO
