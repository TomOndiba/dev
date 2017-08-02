CREATE TABLE [tsa].[ICS_LAND_m3_ESP_CSYTAB]
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
[EtlSourceTable] [varchar] (200) NOT NULL
)
GO
