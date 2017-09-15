CREATE TABLE [psa].[ics_stg_movex_CSYTAB]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_movex_CSYTAB_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_movex_CSYTAB_IsIncomplete] DEFAULT ('N'),
[CTCONO] [decimal] (18, 0) NOT NULL,
[CTDIVI] [nvarchar] (255) NOT NULL,
[CTSTCO] [nvarchar] (255) NOT NULL,
[CTSTKY] [nvarchar] (255) NOT NULL,
[CTLNCD] [nvarchar] (255) NOT NULL,
[CTTX40] [nvarchar] (255) NULL,
[CTTX15] [nvarchar] (255) NULL,
[CTPARM] [nvarchar] (255) NULL,
[CTTXID] [decimal] (13, 0) NULL,
[CTRGDT] [decimal] (8, 0) NULL,
[CTRGTM] [decimal] (6, 0) NULL,
[CTLMDT] [decimal] (8, 0) NULL,
[CTCHNO] [decimal] (3, 0) NULL,
[CTCHID] [nvarchar] (255) NULL,
[CTLMTS] [decimal] (18, 0) NULL
)
GO
ALTER TABLE [psa].[ics_stg_movex_CSYTAB] ADD CONSTRAINT [PK_stg_movex_CSYTAB] PRIMARY KEY CLUSTERED  ([CTCONO], [CTDIVI], [CTLNCD], [CTSTCO], [CTSTKY])
GO
