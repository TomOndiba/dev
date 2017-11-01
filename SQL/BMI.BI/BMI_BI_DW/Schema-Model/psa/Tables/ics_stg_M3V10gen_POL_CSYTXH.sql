CREATE TABLE [psa].[ics_stg_M3V10gen_POL_CSYTXH]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_gen_CSYTXH_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_gen_CSYTXH_IsIncomplete] DEFAULT ('N'),
[THCHID] [nchar] (10) NULL,
[THCHNO] [numeric] (3, 0) NULL,
[THCONO] [numeric] (18, 0) NOT NULL,
[THDIVI] [nchar] (3) NOT NULL,
[THFILE] [nchar] (10) NULL,
[THKFLD] [nvarchar] (30) NULL,
[THLMDT] [numeric] (8, 0) NULL,
[THLMTS] [numeric] (18, 0) NULL,
[THLNCD] [nchar] (2) NOT NULL,
[THRGDT] [numeric] (8, 0) NULL,
[THRGTM] [numeric] (6, 0) NULL,
[THTX40] [nvarchar] (40) NULL,
[THTXCC] [nchar] (2) NULL,
[THTXEI] [numeric] (1, 0) NULL,
[THTXID] [numeric] (18, 0) NOT NULL,
[THTXVR] [nchar] (10) NOT NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CSYTXH] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_CSYTXH] PRIMARY KEY CLUSTERED  ([THCONO], [THDIVI], [THLNCD], [THTXID], [THTXVR])
GO
