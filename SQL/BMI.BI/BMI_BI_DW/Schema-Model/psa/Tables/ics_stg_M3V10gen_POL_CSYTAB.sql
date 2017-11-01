CREATE TABLE [psa].[ics_stg_M3V10gen_POL_CSYTAB]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_gen_CSYTAB_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_gen_CSYTAB_IsIncomplete] DEFAULT ('N'),
[CTCHID] [nchar] (10) NULL,
[CTCHNO] [numeric] (3, 0) NULL,
[CTCONO] [numeric] (18, 0) NOT NULL,
[CTDIVI] [nchar] (3) NOT NULL,
[CTLMDT] [numeric] (8, 0) NULL,
[CTLMTS] [numeric] (18, 0) NULL,
[CTLNCD] [nchar] (2) NOT NULL,
[CTPARM] [nvarchar] (200) NULL,
[CTRGDT] [numeric] (8, 0) NULL,
[CTRGTM] [numeric] (6, 0) NULL,
[CTSTCO] [nchar] (10) NOT NULL,
[CTSTKY] [nchar] (10) NOT NULL,
[CTTX15] [nchar] (15) NULL,
[CTTX40] [nvarchar] (40) NULL,
[CTTXID] [numeric] (13, 0) NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_CSYTAB] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_CSYTAB] PRIMARY KEY CLUSTERED  ([CTCONO], [CTDIVI], [CTLNCD], [CTSTCO], [CTSTKY])
GO
