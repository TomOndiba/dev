CREATE TABLE [tsa].[ics_land_M3V10vil_POL_OINVOL]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF__ics_land___Exclu__700A6687] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF__ics_land___IsDup__70FE8AC0] DEFAULT ((0)),
[ONBSCD] [nchar] (3) NULL,
[ONCHID] [nchar] (10) NULL,
[ONCHNO] [numeric] (18, 0) NULL,
[ONCONO] [numeric] (18, 0) NULL,
[ONCVT1] [numeric] (18, 0) NULL,
[ONCVT2] [numeric] (18, 0) NULL,
[ONDIVI] [nchar] (3) NULL,
[ONDLIX] [numeric] (18, 0) NULL,
[ONECAR] [nchar] (2) NULL,
[ONEXIN] [nchar] (14) NULL,
[ONFTCO] [nchar] (3) NULL,
[ONINPX] [nchar] (6) NULL,
[ONIVAM] [numeric] (18, 0) NULL,
[ONIVAV] [numeric] (18, 0) NULL,
[ONIVBA] [numeric] (18, 0) NULL,
[ONIVFR] [nvarchar] (30) NULL,
[ONIVLA] [numeric] (18, 0) NULL,
[ONIVNO] [numeric] (18, 0) NULL,
[ONIVRF] [nvarchar] (20) NULL,
[ONIVSQ] [numeric] (18, 0) NULL,
[ONIVTP] [nchar] (2) NULL,
[ONLMDT] [numeric] (18, 0) NULL,
[ONORNO] [nchar] (10) NULL,
[ONPYNO] [nchar] (10) NULL,
[ONRGDT] [numeric] (18, 0) NULL,
[ONRGTM] [numeric] (18, 0) NULL,
[ONVRIN] [nchar] (16) NULL,
[ONVRNO] [nchar] (16) NULL,
[ONVTAM] [numeric] (18, 0) NULL,
[ONVTCD] [numeric] (18, 0) NULL,
[ONVTP1] [numeric] (18, 0) NULL,
[ONVTP2] [numeric] (18, 0) NULL,
[ONWHLO] [nchar] (3) NULL,
[ONYEA4] [numeric] (18, 0) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_OINVOL_1] ON [tsa].[ics_land_M3V10vil_POL_OINVOL] ([ONCONO], [ONDIVI], [ONDLIX], [ONINPX], [ONIVNO], [ONIVRF], [ONIVTP], [ONORNO], [ONWHLO], [ONYEA4])
GO
