CREATE TABLE [tsa].[ics_land_M3V10gen_POL_MPOEXP]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF__ics_land___Exclu__5E20C076] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF__ics_land___IsDup__5F14E4AF] DEFAULT ((0)),
[IVACIN] [numeric] (18, 0) NULL,
[IVBANO] [nvarchar] (20) NULL,
[IVCDSE] [numeric] (18, 0) NULL,
[IVCEID] [nchar] (6) NULL,
[IVCEVA] [numeric] (18, 0) NULL,
[IVCEVJ] [numeric] (18, 0) NULL,
[IVCHID] [nchar] (10) NULL,
[IVCHNO] [numeric] (18, 0) NULL,
[IVCONO] [numeric] (18, 0) NULL,
[IVCUCD] [nchar] (3) NULL,
[IVEXIC] [numeric] (18, 0) NULL,
[IVEXTY] [numeric] (18, 0) NULL,
[IVIVCQ] [numeric] (18, 0) NULL,
[IVLMDT] [numeric] (18, 0) NULL,
[IVOVHE] [numeric] (18, 0) NULL,
[IVPNLI] [numeric] (18, 0) NULL,
[IVPNLS] [numeric] (18, 0) NULL,
[IVPOOV] [numeric] (18, 0) NULL,
[IVPUNO] [nchar] (7) NULL,
[IVREPN] [numeric] (18, 0) NULL,
[IVRGDT] [numeric] (18, 0) NULL,
[IVRGTM] [numeric] (18, 0) NULL,
[IVTHPR] [numeric] (18, 0) NULL,
[IVWSOP] [nchar] (2) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_MPOEXP_1] ON [tsa].[ics_land_M3V10gen_POL_MPOEXP] ([IVBANO], [IVCDSE], [IVCEID], [IVCONO], [IVEXTY], [IVPNLI], [IVPNLS], [IVPUNO], [IVREPN])
GO