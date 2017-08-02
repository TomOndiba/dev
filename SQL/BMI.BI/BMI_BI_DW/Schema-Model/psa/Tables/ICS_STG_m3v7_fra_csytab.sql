CREATE TABLE [psa].[ICS_STG_m3v7_fra_csytab]
(
[EtlBatchRunId] [int] NULL,
[EtlStepRunId] [int] NULL,
[EtlThreadRunId] [int] NULL,
[DataSourceKey] [int] NULL,
[EtlCreatedOn] [datetime2] NULL,
[EtlCreatedBy] [varchar] (200) NULL,
[CTCONO] [decimal] (3, 0) NULL,
[CTDIVI] [nvarchar] (255) NULL,
[CTSTCO] [nvarchar] (255) NULL,
[CTSTKY] [nvarchar] (255) NULL,
[CTLNCD] [nvarchar] (255) NULL,
[CTTX40] [nvarchar] (255) NULL,
[CTTX15] [nvarchar] (255) NULL,
[CTPARM] [nvarchar] (255) NULL,
[CTTXID] [decimal] (13, 0) NULL,
[CTRGDT] [decimal] (8, 0) NULL,
[CTRGTM] [decimal] (6, 0) NULL,
[CTLMDT] [decimal] (8, 0) NULL,
[CTCHNO] [decimal] (3, 0) NULL,
[CTCHID] [nvarchar] (255) NULL,
[CTLMTS] [decimal] (18, 0) NULL,
[EtlRecordId] [bigint] NOT NULL,
[IsIncomplete] [char] (1) NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NOT NULL,
[EtlDeletedBy] [varchar] (200) NOT NULL,
[IsDeleted] [char] (1) NOT NULL
)
GO
