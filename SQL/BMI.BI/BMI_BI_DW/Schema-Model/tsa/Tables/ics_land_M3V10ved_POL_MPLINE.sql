CREATE TABLE [tsa].[ics_land_M3V10ved_POL_MPLINE]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF__ics_land___Exclu__01D41107] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF__ics_land___IsDup__02C83540] DEFAULT ((0)),
[IBACLI] [numeric] (18, 0) NULL,
[IBACRF] [nchar] (8) NULL,
[IBADQA] [numeric] (18, 0) NULL,
[IBAGNB] [nchar] (7) NULL,
[IBATDT] [numeric] (18, 0) NULL,
[IBATNR] [numeric] (18, 0) NULL,
[IBATPR] [nchar] (1) NULL,
[IBBAOR] [nchar] (10) NULL,
[IBBUYE] [nchar] (10) NULL,
[IBCAQA] [numeric] (18, 0) NULL,
[IBCFD1] [numeric] (18, 0) NULL,
[IBCFD2] [numeric] (18, 0) NULL,
[IBCFD3] [numeric] (18, 0) NULL,
[IBCFIN] [numeric] (18, 0) NULL,
[IBCFMB] [numeric] (18, 0) NULL,
[IBCFPB] [numeric] (18, 0) NULL,
[IBCFQA] [numeric] (18, 0) NULL,
[IBCHID] [nchar] (10) NULL,
[IBCHNO] [numeric] (18, 0) NULL,
[IBCLAN] [nchar] (7) NULL,
[IBCLLI] [numeric] (18, 0) NULL,
[IBCLLN] [numeric] (18, 0) NULL,
[IBCOCE] [nchar] (8) NULL,
[IBCODT] [numeric] (18, 0) NULL,
[IBCONO] [numeric] (18, 0) NULL,
[IBCPPR] [numeric] (18, 0) NULL,
[IBCPRI] [nchar] (5) NULL,
[IBCPUC] [numeric] (18, 0) NULL,
[IBCSNO] [nchar] (16) NULL,
[IBDT4T] [numeric] (18, 0) NULL,
[IBDTID] [numeric] (18, 0) NULL,
[IBDWCP] [numeric] (18, 0) NULL,
[IBDWDT] [numeric] (18, 0) NULL,
[IBECDD] [numeric] (18, 0) NULL,
[IBECF1] [nchar] (5) NULL,
[IBECF2] [nchar] (5) NULL,
[IBECF3] [nchar] (5) NULL,
[IBECF4] [nchar] (5) NULL,
[IBECF5] [nchar] (5) NULL,
[IBECLC] [nchar] (2) NULL,
[IBECVE] [nchar] (4) NULL,
[IBECVS] [numeric] (18, 0) NULL,
[IBELNO] [nchar] (8) NULL,
[IBETRF] [nchar] (3) NULL,
[IBEXAT] [numeric] (18, 0) NULL,
[IBEXAV] [numeric] (18, 0) NULL,
[IBEXEP] [numeric] (18, 0) NULL,
[IBFACI] [nchar] (3) NULL,
[IBFATP] [nchar] (5) NULL,
[IBFUSC] [nchar] (3) NULL,
[IBGRMT] [nchar] (3) NULL,
[IBHAFE] [nchar] (6) NULL,
[IBHDPR] [nchar] (15) NULL,
[IBIDAG] [numeric] (18, 0) NULL,
[IBIDAT] [numeric] (18, 0) NULL,
[IBINEP] [numeric] (18, 0) NULL,
[IBIRCV] [nvarchar] (20) NULL,
[IBITNO] [nchar] (15) NULL,
[IBIVQA] [numeric] (18, 0) NULL,
[IBLICC] [nchar] (1) NULL,
[IBLMDT] [numeric] (18, 0) NULL,
[IBLMTS] [numeric] (18, 0) NULL,
[IBLNAM] [numeric] (18, 0) NULL,
[IBLPUD] [numeric] (18, 0) NULL,
[IBLTPP] [nchar] (1) NULL,
[IBMODL] [nchar] (3) NULL,
[IBMSTN] [numeric] (18, 0) NULL,
[IBNOED] [numeric] (18, 0) NULL,
[IBNPDE] [numeric] (18, 0) NULL,
[IBODI1] [numeric] (18, 0) NULL,
[IBODI2] [numeric] (18, 0) NULL,
[IBODI3] [numeric] (18, 0) NULL,
[IBOEND] [numeric] (18, 0) NULL,
[IBOPTX] [nchar] (15) NULL,
[IBOPTY] [nchar] (15) NULL,
[IBOPTZ] [nchar] (15) NULL,
[IBORCO] [nchar] (3) NULL,
[IBORQA] [numeric] (18, 0) NULL,
[IBORTY] [nchar] (3) NULL,
[IBOTOD] [numeric] (18, 0) NULL,
[IBOURR] [nchar] (10) NULL,
[IBOURT] [nchar] (1) NULL,
[IBPACT] [nchar] (6) NULL,
[IBPDDT] [numeric] (18, 0) NULL,
[IBPGRN] [numeric] (18, 0) NULL,
[IBPITD] [nvarchar] (30) NULL,
[IBPITT] [nvarchar] (60) NULL,
[IBPLDT] [numeric] (18, 0) NULL,
[IBPLPN] [numeric] (18, 0) NULL,
[IBPLPS] [numeric] (18, 0) NULL,
[IBPNLI] [numeric] (18, 0) NULL,
[IBPNLS] [numeric] (18, 0) NULL,
[IBPOTC] [nchar] (2) NULL,
[IBPPUN] [nchar] (3) NULL,
[IBPRCS] [nchar] (3) NULL,
[IBPRIP] [nchar] (1) NULL,
[IBPROD] [nchar] (10) NULL,
[IBPROJ] [nchar] (7) NULL,
[IBPTCD] [numeric] (18, 0) NULL,
[IBPUCD] [numeric] (18, 0) NULL,
[IBPUNO] [nchar] (7) NULL,
[IBPUPR] [numeric] (18, 0) NULL,
[IBPURC] [nchar] (10) NULL,
[IBPUSL] [nchar] (2) NULL,
[IBPUST] [nchar] (2) NULL,
[IBPUUN] [nchar] (3) NULL,
[IBRCDT] [numeric] (18, 0) NULL,
[IBRE20] [nvarchar] (20) NULL,
[IBREPP] [numeric] (18, 0) NULL,
[IBRESF] [nchar] (10) NULL,
[IBREVN] [nchar] (2) NULL,
[IBRGDT] [numeric] (18, 0) NULL,
[IBRGTM] [numeric] (18, 0) NULL,
[IBRJQA] [numeric] (18, 0) NULL,
[IBRORC] [numeric] (18, 0) NULL,
[IBRORL] [numeric] (18, 0) NULL,
[IBRORN] [nchar] (10) NULL,
[IBRORX] [numeric] (18, 0) NULL,
[IBRRQA] [numeric] (18, 0) NULL,
[IBRVQA] [numeric] (18, 0) NULL,
[IBSDQA] [numeric] (18, 0) NULL,
[IBSEBI] [nchar] (1) NULL,
[IBSEQN] [numeric] (18, 0) NULL,
[IBSITE] [nvarchar] (30) NULL,
[IBSORN] [nvarchar] (20) NULL,
[IBSUAG] [nchar] (10) NULL,
[IBSUDO] [nvarchar] (20) NULL,
[IBSUFI] [nvarchar] (20) NULL,
[IBSUNO] [nchar] (10) NULL,
[IBTAXC] [nchar] (3) NULL,
[IBTEDL] [nchar] (3) NULL,
[IBTEL1] [nvarchar] (36) NULL,
[IBTERE] [nchar] (10) NULL,
[IBTIHM] [numeric] (18, 0) NULL,
[IBTNQA] [numeric] (18, 0) NULL,
[IBTXID] [numeric] (18, 0) NULL,
[IBULEX] [numeric] (18, 0) NULL,
[IBUPAV] [numeric] (18, 0) NULL,
[IBUPCK] [numeric] (18, 0) NULL,
[IBUPIV] [numeric] (18, 0) NULL,
[IBVDDT] [numeric] (18, 0) NULL,
[IBVRCD] [nchar] (2) NULL,
[IBVTCD] [numeric] (18, 0) NULL,
[IBWHLO] [nchar] (3) NULL
)
GO
