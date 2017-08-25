CREATE TABLE [tsa].[ics_land_M3V10gen_POL_MITLOC]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF__ics_land___Exclu__4A19C7C9] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF__ics_land___IsDup__4B0DEC02] DEFAULT ((0)),
[MLACUQ] [numeric] (18, 0) NULL,
[MLACUW] [numeric] (18, 0) NULL,
[MLADJW] [numeric] (18, 0) NULL,
[MLALOC] [numeric] (18, 0) NULL,
[MLALQT] [numeric] (18, 0) NULL,
[MLATNR] [numeric] (18, 0) NULL,
[MLATV1] [nchar] (15) NULL,
[MLATV2] [nchar] (15) NULL,
[MLATV3] [nchar] (15) NULL,
[MLATV4] [nchar] (15) NULL,
[MLATV5] [nchar] (15) NULL,
[MLAUDD] [numeric] (18, 0) NULL,
[MLAUDE] [numeric] (18, 0) NULL,
[MLBANO] [nvarchar] (20) NULL,
[MLBRE2] [nvarchar] (20) NULL,
[MLBREF] [nvarchar] (20) NULL,
[MLBREM] [nvarchar] (20) NULL,
[MLCAMU] [nvarchar] (20) NULL,
[MLCANB] [numeric] (18, 0) NULL,
[MLCAWE] [numeric] (18, 0) NULL,
[MLCHID] [nchar] (10) NULL,
[MLCHNO] [numeric] (18, 0) NULL,
[MLCNDT] [numeric] (18, 0) NULL,
[MLCONO] [numeric] (18, 0) NULL,
[MLDTID] [numeric] (18, 0) NULL,
[MLFACI] [nchar] (3) NULL,
[MLFIFL] [numeric] (18, 0) NULL,
[MLIDDT] [numeric] (18, 0) NULL,
[MLINCW] [numeric] (18, 0) NULL,
[MLINDT] [numeric] (18, 0) NULL,
[MLINON] [numeric] (18, 0) NULL,
[MLINVC] [numeric] (18, 0) NULL,
[MLIQTY] [numeric] (18, 0) NULL,
[MLITNO] [nchar] (15) NULL,
[MLLMDT] [numeric] (18, 0) NULL,
[MLLMTS] [numeric] (18, 0) NULL,
[MLODDT] [numeric] (18, 0) NULL,
[MLOPAN] [nvarchar] (20) NULL,
[MLPACT] [nchar] (6) NULL,
[MLPLQT] [numeric] (18, 0) NULL,
[MLPOCY] [numeric] (18, 0) NULL,
[MLPPRI] [nchar] (1) NULL,
[MLPRDT] [numeric] (18, 0) NULL,
[MLPUAB] [numeric] (18, 0) NULL,
[MLRCLN] [numeric] (18, 0) NULL,
[MLRCLS] [numeric] (18, 0) NULL,
[MLREPN] [numeric] (18, 0) NULL,
[MLRGDT] [numeric] (18, 0) NULL,
[MLRGTM] [numeric] (18, 0) NULL,
[MLSEDT] [numeric] (18, 0) NULL,
[MLSLTP] [nchar] (2) NULL,
[MLSTAS] [nchar] (1) NULL,
[MLSTES] [numeric] (18, 0) NULL,
[MLSTNB] [numeric] (18, 0) NULL,
[MLSTQM] [numeric] (18, 0) NULL,
[MLSTQT] [numeric] (18, 0) NULL,
[MLTXID] [numeric] (18, 0) NULL,
[MLWHLO] [nchar] (3) NULL,
[MLWHLT] [nchar] (2) NULL,
[MLWHSL] [nchar] (10) NULL
)
GO
