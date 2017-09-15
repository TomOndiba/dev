CREATE TABLE [tsa].[ics_land_M3V10vil_POL_MPLIND]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF__ics_land___Exclu__4DB54E83] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF__ics_land___IsDup__4EA972BC] DEFAULT ((0)),
[ICAGNB] [nchar] (7) NULL,
[ICARDT] [numeric] (18, 0) NULL,
[ICBANO] [nvarchar] (20) NULL,
[ICBOLN] [nchar] (14) NULL,
[ICCAMU] [nvarchar] (20) NULL,
[ICCARN] [nvarchar] (30) NULL,
[ICCHPO] [numeric] (18, 0) NULL,
[ICCONO] [numeric] (18, 0) NULL,
[ICDLIX] [numeric] (18, 0) NULL,
[ICDTID] [numeric] (18, 0) NULL,
[ICFACI] [nchar] (3) NULL,
[ICFWRF] [nchar] (10) NULL,
[ICLMTS] [numeric] (18, 0) NULL,
[ICNEAC] [numeric] (18, 0) NULL,
[ICNOPK] [numeric] (18, 0) NULL,
[ICOEND] [numeric] (18, 0) NULL,
[ICPACC] [nvarchar] (20) NULL,
[ICPACN] [nvarchar] (20) NULL,
[ICPLDT] [numeric] (18, 0) NULL,
[ICPNLI] [numeric] (18, 0) NULL,
[ICPNLS] [numeric] (18, 0) NULL,
[ICPNLX] [numeric] (18, 0) NULL,
[ICPUNO] [nchar] (7) NULL,
[ICPUOS] [nchar] (2) NULL,
[ICRENE] [nchar] (10) NULL,
[ICREOR] [numeric] (18, 0) NULL,
[ICREPN] [numeric] (18, 0) NULL,
[ICRESP] [nchar] (10) NULL,
[ICRGDT] [numeric] (18, 0) NULL,
[ICRGTM] [numeric] (18, 0) NULL,
[ICRPQA] [numeric] (18, 0) NULL,
[ICRPQT] [numeric] (18, 0) NULL,
[ICSCOP] [numeric] (18, 0) NULL,
[ICSERA] [numeric] (18, 0) NULL,
[ICSMDT] [numeric] (18, 0) NULL,
[ICSUDO] [nvarchar] (20) NULL,
[ICTIHM] [numeric] (18, 0) NULL,
[ICTRDT] [numeric] (18, 0) NULL,
[ICTXID] [numeric] (18, 0) NULL,
[ICUGCD] [numeric] (18, 0) NULL,
[ICWHLO] [nchar] (3) NULL,
[ICWHSL] [nchar] (10) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10vil_POL_MPLIND_1] ON [tsa].[ics_land_M3V10vil_POL_MPLIND] ([ICCONO], [ICPNLI], [ICPNLS], [ICPNLX], [ICPUNO])
GO
