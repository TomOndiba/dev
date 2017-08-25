CREATE TABLE [tsa].[ics_land_M3V10vil_POL_MWOPOL]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF__ics_land___Exclu__6498B3DB] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF__ics_land___IsDup__658CD814] DEFAULT ((0)),
[BHCHID] [nchar] (10) NULL,
[BHCHNO] [numeric] (18, 0) NULL,
[BHCOFA] [numeric] (18, 0) NULL,
[BHCONO] [numeric] (18, 0) NULL,
[BHDMCF] [numeric] (18, 0) NULL,
[BHEMNO] [nchar] (10) NULL,
[BHFACI] [nchar] (3) NULL,
[BHLMDT] [numeric] (18, 0) NULL,
[BHLMTS] [numeric] (18, 0) NULL,
[BHMAQA] [numeric] (18, 0) NULL,
[BHMAQT] [numeric] (18, 0) NULL,
[BHMAUN] [nchar] (3) NULL,
[BHMCPL] [numeric] (18, 0) NULL,
[BHMFNO] [numeric] (18, 0) NULL,
[BHOADS] [numeric] (18, 0) NULL,
[BHOPNO] [numeric] (18, 0) NULL,
[BHPLCF] [numeric] (18, 0) NULL,
[BHPLNO] [numeric] (18, 0) NULL,
[BHPLOA] [numeric] (18, 0) NULL,
[BHPLOB] [numeric] (18, 0) NULL,
[BHPRNO] [nchar] (15) NULL,
[BHREFD] [numeric] (18, 0) NULL,
[BHRGDT] [numeric] (18, 0) NULL,
[BHRGTM] [numeric] (18, 0) NULL,
[BHRSDT] [numeric] (18, 0) NULL,
[BHSCQA] [numeric] (18, 0) NULL,
[BHSCQT] [numeric] (18, 0) NULL,
[BHUMAS] [numeric] (18, 0) NULL,
[BHUMAT] [numeric] (18, 0) NULL,
[BHUPIT] [numeric] (18, 0) NULL,
[BHUSET] [numeric] (18, 0) NULL,
[BHWOSQ] [numeric] (18, 0) NULL
)
GO
