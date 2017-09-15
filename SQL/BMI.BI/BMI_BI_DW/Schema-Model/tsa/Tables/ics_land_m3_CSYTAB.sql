CREATE TABLE [tsa].[ics_land_m3_CSYTAB]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_m3_CSYTAB_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_m3_CSYTAB_IsDuplicate] DEFAULT ((0)),
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
[CTLMTS] [decimal] (18, 0) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3_CSYTAB_1] ON [tsa].[ics_land_m3_CSYTAB] ([CTCONO], [CTDIVI], [CTLNCD], [CTSTCO], [CTSTKY])
GO
