-- <Migration ID="cee3c4bc-442f-46f9-8eea-d9b4cb2d8af6" />
go

if object_id('tsa.ics_land_m3v7_FGINLI', 'U') is not null
	drop table [tsa].[ics_land_m3v7_FGINLI] ;

go


if object_id('tsa.ics_land_m3v7_MPLIND', 'U') is not null
	drop table [tsa].[ics_land_m3v7_MPLIND] ;

go

if object_id('tsa.ics_land_m3v7_MPLINE', 'U') is not null
	drop table [tsa].[ics_land_m3v7_MPLINE] ;
go


if object_id('tsa.ics_land_m3v7_FPLEDG', 'U') is not null
	drop table [tsa].[ics_land_m3v7_FPLEDG] ;
go



go

if object_id('tsa.ics_land_m3_FGINLI', 'U') is not null
	drop table [tsa].[ics_land_m3_FGINLI] ;

go


if object_id('tsa.ics_land_m3_MPLIND', 'U') is not null
	drop table [tsa].[ics_land_m3_MPLIND] ;

go

if object_id('tsa.ics_land_m3_MPLINE', 'U') is not null
	drop table [tsa].[ics_land_m3_MPLINE] ;
go


if object_id('tsa.ics_land_m3_FPLEDG', 'U') is not null
	drop table [tsa].[ics_land_m3_FPLEDG] ;
go






if object_id('tsa.ics_land_movex_FGINLI', 'U') is not null
	drop table [tsa].[ics_land_movex_FGINLI] ;

go


if object_id('tsa.ics_land_movex_MPLIND', 'U') is not null
	drop table [tsa].[ics_land_movex_MPLIND] ;

go

if object_id('tsa.ics_land_movex_MPLINE', 'U') is not null
	drop table [tsa].[ics_land_movex_MPLINE] ;
go


if object_id('tsa.ics_land_movex_FPLEDG', 'U') is not null
	drop table [tsa].[ics_land_movex_FPLEDG] ;
go















print N'Creating [tsa].[ics_land_movex_FGINLI]' ;
go
create table [tsa].[ics_land_movex_FGINLI]
(
	[EtlBatchRunId]	   [int]			not null
  , [EtlStepRunId]	   [int]			not null
  , [EtlThreadRunId]   [int]			not null
  , [DataSourceKey]	   [int]			not null
  , [EtlSourceTable]   [varchar](200)	not null
  , [EtlCreatedOn]	   [datetime]		not null
  , [EtlCreatedBy]	   [varchar](200)	not null
  , [ExcludeFromMerge] [bit]			not null constraint [DF_tsa_ics_land_movex_FGINLI_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]			not null constraint [DF_tsa_ics_land_movex_FGINLI_IsDuplicate] default ((0))
  , [F5CONO]		   [decimal](3, 0)	null
  , [F5DIVI]		   [nvarchar](3)	null
  , [F5SUNO]		   [nvarchar](10)	null
  , [F5SINO]		   [nvarchar](24)	null
  , [F5INYR]		   [decimal](4, 0)	null
  , [F5PUNO]		   [nvarchar](7)	null
  , [F5PNLI]		   [decimal](3, 0)	null
  , [F5PNLS]		   [decimal](3, 0)	null
  , [F5REPN]		   [decimal](10, 0) null
  , [F5RELP]		   [decimal](1, 0)	null
  , [F5INLP]		   [decimal](1, 0)	null
  , [F5INS1]		   [nvarchar](1)	null
  , [F5INS2]		   [nvarchar](1)	null
  , [F5INS3]		   [nvarchar](1)	null
  , [F5INS4]		   [nvarchar](1)	null
  , [F5INS5]		   [nvarchar](1)	null
  , [F5IVQT]		   [decimal](15, 6) null
  , [F5IVQA]		   [decimal](15, 6) null
  , [F5IVOC]		   [decimal](17, 6) null
  , [F5IVNA]		   [decimal](15, 2) null
  , [F5IVDI]		   [decimal](5, 2)	null
  , [F5PUUN]		   [nvarchar](3)	null
  , [F5PPUN]		   [nvarchar](3)	null
  , [F5PUCD]		   [decimal](5, 0)	null
  , [F5IVCW]		   [decimal](15, 6) null
  , [F5ADDG]		   [decimal](15, 2) null
  , [F5IVLC]		   [decimal](15, 2) null
  , [F5SERA]		   [decimal](11, 6) null
  , [F5ECLC]		   [nvarchar](2)	null
  , [F5VRCD]		   [nvarchar](2)	null
  , [F5VTCD]		   [decimal](2, 0)	null
  , [F5ACDT]		   [decimal](8, 0)	null
  , [F5DNNR]		   [nvarchar](24)	null
  , [F5DNQT]		   [decimal](15, 6) null
  , [F5DNQA]		   [decimal](15, 6) null
  , [F5DNPR]		   [decimal](17, 6) null
  , [F5DNCM]		   [decimal](15, 2) null
  , [F5DNRQ]		   [nvarchar](3)	null
  , [F5DNRP]		   [nvarchar](3)	null
  , [F5IMST]		   [decimal](1, 0)	null
  , [F5IMDT]		   [decimal](8, 0)	null
  , [F5RPQT]		   [decimal](15, 6) null
  , [F5RPQA]		   [decimal](15, 6) null
  , [F5RCAC]		   [decimal](15, 2) null
  , [F5ICAC]		   [decimal](15, 2) null
  , [F5RGDT]		   [decimal](8, 0)	null
  , [F5RGTM]		   [decimal](6, 0)	null
  , [F5LMDT]		   [decimal](8, 0)	null
  , [F5CHNO]		   [decimal](3, 0)	null
  , [F5CHID]		   [nvarchar](10)	null
) ;
go
print N'Creating [tsa].[ics_land_movex_MPLIND]' ;
go
create table [tsa].[ics_land_movex_MPLIND]
(
	[EtlBatchRunId]	   [int]			not null
  , [EtlStepRunId]	   [int]			not null
  , [EtlThreadRunId]   [int]			not null
  , [DataSourceKey]	   [int]			not null
  , [EtlSourceTable]   [varchar](200)	not null
  , [EtlCreatedOn]	   [datetime]		not null
  , [EtlCreatedBy]	   [varchar](200)	not null
  , [ExcludeFromMerge] [bit]			not null constraint [DF_tsa_ics_land_movex_MPLIND_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]			not null constraint [DF_tsa_ics_land_movex_MPLIND_IsDuplicate] default ((0))
  , [ICCONO]		   [decimal](3, 0)	null
  , [ICFACI]		   [nvarchar](3)	null
  , [ICWHLO]		   [nvarchar](3)	null
  , [ICWHSL]		   [nvarchar](10)	null
  , [ICBANO]		   [nvarchar](12)	null
  , [ICCAMU]		   [nvarchar](12)	null
  , [ICPUNO]		   [nvarchar](7)	null
  , [ICPNLI]		   [decimal](3, 0)	null
  , [ICPNLS]		   [decimal](3, 0)	null
  , [ICPNLX]		   [decimal](3, 0)	null
  , [ICSUDO]		   [nvarchar](20)	null
  , [ICREPN]		   [decimal](10, 0) null
  , [ICPUOS]		   [nvarchar](2)	null
  , [ICUGCD]		   [decimal](1, 0)	null
  , [ICNEAC]		   [decimal](1, 0)	null
  , [ICREOR]		   [decimal](1, 0)	null
  , [ICCHPO]		   [decimal](1, 0)	null
  , [ICRPQA]		   [decimal](15, 6) null
  , [ICRPQT]		   [decimal](15, 6) null
  , [ICTRDT]		   [decimal](8, 0)	null
  , [ICPLDT]		   [decimal](8, 0)	null
  , [ICRENE]		   [nvarchar](10)	null
  , [ICRESP]		   [nvarchar](10)	null
  , [ICBOLN]		   [nvarchar](14)	null
  , [ICCARN]		   [nvarchar](30)	null
  , [ICSMDT]		   [decimal](8, 0)	null
  , [ICARDT]		   [decimal](8, 0)	null
  , [ICNOPK]		   [decimal](5, 0)	null
  , [ICFWRF]		   [nvarchar](10)	null
  , [ICOEND]		   [decimal](1, 0)	null
  , [ICSCOP]		   [decimal](17, 6) null
  , [ICSERA]		   [decimal](11, 6) null
  , [ICDTID]		   [decimal](13, 0) null
  , [ICTIHM]		   [decimal](4, 0)	null
  , [ICDLIX]		   [decimal](11, 0) null
  , [ICAGNB]		   [nvarchar](7)	null
  , [ICRGDT]		   [decimal](8, 0)	null
  , [ICRGTM]		   [decimal](6, 0)	null
  , [ICTXID]		   [decimal](13, 0) null
) ;
go
print N'Creating [tsa].[ics_land_movex_MPLINE]' ;
go
create table [tsa].[ics_land_movex_MPLINE]
(
	[EtlBatchRunId]	   [int]			not null
  , [EtlStepRunId]	   [int]			not null
  , [EtlThreadRunId]   [int]			not null
  , [DataSourceKey]	   [int]			not null
  , [EtlSourceTable]   [varchar](200)	not null
  , [EtlCreatedOn]	   [datetime]		not null
  , [EtlCreatedBy]	   [varchar](200)	not null
  , [ExcludeFromMerge] [bit]			not null constraint [DF_tsa_ics_land_movex_MPLINE_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]			not null constraint [DF_tsa_ics_land_movex_MPLINE_IsDuplicate] default ((0))
  , [IBCONO]		   [decimal](3, 0)	null
  , [IBFACI]		   [nvarchar](3)	null
  , [IBWHLO]		   [nvarchar](3)	null
  , [IBPUNO]		   [nvarchar](7)	null
  , [IBPNLI]		   [decimal](3, 0)	null
  , [IBPNLS]		   [decimal](3, 0)	null
  , [IBORTY]		   [nvarchar](3)	null
  , [IBPOTC]		   [nvarchar](2)	null
  , [IBLTPP]		   [nvarchar](1)	null
  , [IBPUST]		   [nvarchar](2)	null
  , [IBPUSL]		   [nvarchar](2)	null
  , [IBIDAG]		   [decimal](1, 0)	null
  , [IBSUNO]		   [nvarchar](10)	null
  , [IBSUAG]		   [nvarchar](10)	null
  , [IBITNO]		   [nvarchar](15)	null
  , [IBPRCS]		   [nvarchar](3)	null
  , [IBSUFI]		   [nvarchar](20)	null
  , [IBSITE]		   [nvarchar](30)	null
  , [IBPITD]		   [nvarchar](30)	null
  , [IBPITT]		   [nvarchar](60)	null
  , [IBSORN]		   [nvarchar](20)	null
  , [IBPROD]		   [nvarchar](10)	null
  , [IBECVE]		   [nvarchar](4)	null
  , [IBNOED]		   [decimal](1, 0)	null
  , [IBREVN]		   [nvarchar](2)	null
  , [IBETRF]		   [nvarchar](3)	null
  , [IBPUPR]		   [decimal](17, 6) null
  , [IBODI1]		   [decimal](5, 2)	null
  , [IBODI2]		   [decimal](5, 2)	null
  , [IBODI3]		   [decimal](5, 2)	null
  , [IBCPPR]		   [decimal](17, 6) null
  , [IBCFD1]		   [decimal](5, 2)	null
  , [IBCFD2]		   [decimal](5, 2)	null
  , [IBCFD3]		   [decimal](5, 2)	null
  , [IBPUUN]		   [nvarchar](3)	null
  , [IBPPUN]		   [nvarchar](3)	null
  , [IBPUCD]		   [decimal](5, 0)	null
  , [IBCPUC]		   [decimal](5, 0)	null
  , [IBPTCD]		   [decimal](1, 0)	null
  , [IBOTOD]		   [decimal](1, 0)	null
  , [IBLNAM]		   [decimal](15, 2) null
  , [IBDWDT]		   [decimal](8, 0)	null
  , [IBCODT]		   [decimal](8, 0)	null
  , [IBECDD]		   [decimal](8, 0)	null
  , [IBPDDT]		   [decimal](8, 0)	null
  , [IBVDDT]		   [decimal](8, 0)	null
  , [IBORQA]		   [decimal](15, 6) null
  , [IBCFQA]		   [decimal](15, 6) null
  , [IBADQA]		   [decimal](15, 6) null
  , [IBTNQA]		   [decimal](15, 6) null
  , [IBRVQA]		   [decimal](15, 6) null
  , [IBRCDT]		   [decimal](8, 0)	null
  , [IBDT4T]		   [decimal](1, 0)	null
  , [IBCAQA]		   [decimal](15, 6) null
  , [IBRJQA]		   [decimal](15, 6) null
  , [IBSDQA]		   [decimal](15, 6) null
  , [IBRRQA]		   [decimal](15, 6) null
  , [IBLPUD]		   [decimal](8, 0)	null
  , [IBIVQA]		   [decimal](15, 6) null
  , [IBIDAT]		   [decimal](8, 0)	null
  , [IBRORC]		   [decimal](1, 0)	null
  , [IBRORN]		   [nvarchar](10)	null
  , [IBRORL]		   [decimal](6, 0)	null
  , [IBOURR]		   [nvarchar](10)	null
  , [IBOURT]		   [nvarchar](1)	null
  , [IBUPAV]		   [decimal](1, 0)	null
  , [IBREPP]		   [decimal](1, 0)	null
  , [IBPRIP]		   [nvarchar](1)	null
  , [IBFUSC]		   [nvarchar](3)	null
  , [IBEXAT]		   [decimal](1, 0)	null
  , [IBEXAV]		   [decimal](1, 0)	null
  , [IBPLPN]		   [decimal](7, 0)	null
  , [IBPLPS]		   [decimal](3, 0)	null
  , [IBPURC]		   [nvarchar](10)	null
  , [IBBUYE]		   [nvarchar](10)	null
  , [IBRESF]		   [nvarchar](10)	null
  , [IBTERE]		   [nvarchar](10)	null
  , [IBGRMT]		   [nvarchar](3)	null
  , [IBIRCV]		   [nvarchar](20)	null
  , [IBUPIV]		   [decimal](1, 0)	null
  , [IBATDT]		   [decimal](8, 0)	null
  , [IBPACT]		   [nvarchar](6)	null
  , [IBCLLI]		   [decimal](1, 0)	null
  , [IBNPDE]		   [decimal](3, 0)	null
  , [IBVTCD]		   [decimal](2, 0)	null
  , [IBLICC]		   [nvarchar](1)	null
  , [IBACLI]		   [decimal](1, 0)	null
  , [IBULEX]		   [decimal](1, 0)	null
  , [IBEXEP]		   [decimal](15, 2) null
  , [IBINEP]		   [decimal](15, 2) null
  , [IBOEND]		   [decimal](1, 0)	null
  , [IBPLDT]		   [decimal](8, 0)	null
  , [IBACRF]		   [nvarchar](8)	null
  , [IBCOCE]		   [nvarchar](8)	null
  , [IBCSNO]		   [nvarchar](16)	null
  , [IBECLC]		   [nvarchar](2)	null
  , [IBVRCD]		   [nvarchar](2)	null
  , [IBECF1]		   [nvarchar](5)	null
  , [IBECF2]		   [nvarchar](5)	null
  , [IBECF3]		   [nvarchar](5)	null
  , [IBECF4]		   [nvarchar](5)	null
  , [IBECF5]		   [nvarchar](5)	null
  , [IBTXID]		   [decimal](13, 0) null
  , [IBDTID]		   [decimal](13, 0) null
  , [IBPROJ]		   [nvarchar](7)	null
  , [IBELNO]		   [nvarchar](8)	null
  , [IBDWCP]		   [decimal](1, 0)	null
  , [IBCPRI]		   [nvarchar](5)	null
  , [IBHAFE]		   [nvarchar](6)	null
  , [IBTAXC]		   [nvarchar](3)	null
  , [IBTIHM]		   [decimal](4, 0)	null
  , [IBCFIN]		   [decimal](7, 0)	null
  , [IBHDPR]		   [nvarchar](15)	null
  , [IBECVS]		   [decimal](3, 0)	null
  , [IBATNR]		   [decimal](17, 0) null
  , [IBSEQN]		   [decimal](7, 0)	null
  , [IBATPR]		   [nvarchar](1)	null
  , [IBPGRN]		   [decimal](7, 0)	null
  , [IBCFMB]		   [decimal](15, 9) null
  , [IBCFPB]		   [decimal](15, 9) null
  , [IBMSTN]		   [decimal](10, 0) null
  , [IBCLAN]		   [nvarchar](7)	null
  , [IBCLLN]		   [decimal](3, 0)	null
  , [IBSEBI]		   [nvarchar](1)	null
  , [IBAGNB]		   [nvarchar](7)	null
  , [IBRGDT]		   [decimal](8, 0)	null
  , [IBRGTM]		   [decimal](6, 0)	null
  , [IBLMDT]		   [decimal](8, 0)	null
  , [IBCHNO]		   [decimal](3, 0)	null
  , [IBCHID]		   [nvarchar](10)	null
) ;
go
print N'Creating [tsa].[ics_land_m3_FGINLI]' ;
go
create table [tsa].[ics_land_m3_FGINLI]
(
	[EtlBatchRunId]	   [int]			not null
  , [EtlStepRunId]	   [int]			not null
  , [EtlThreadRunId]   [int]			not null
  , [DataSourceKey]	   [int]			not null
  , [EtlSourceTable]   [varchar](200)	not null
  , [EtlCreatedOn]	   [datetime]		not null
  , [EtlCreatedBy]	   [varchar](200)	not null
  , [ExcludeFromMerge] [bit]			not null constraint [DF_tsa_ics_land_m3_FGINLI_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]			not null constraint [DF_tsa_ics_land_m3_FGINLI_IsDuplicate] default ((0))
  , [F5CONO]		   [decimal](3, 0)	null
  , [F5DIVI]		   [nvarchar](255)	null
  , [F5SUNO]		   [nvarchar](255)	null
  , [F5SINO]		   [nvarchar](255)	null
  , [F5INYR]		   [decimal](4, 0)	null
  , [F5PUNO]		   [nvarchar](255)	null
  , [F5PNLI]		   [decimal](3, 0)	null
  , [F5PNLS]		   [decimal](3, 0)	null
  , [F5REPN]		   [decimal](10, 0) null
  , [F5RELP]		   [decimal](1, 0)	null
  , [F5INLP]		   [decimal](1, 0)	null
  , [F5INS1]		   [nvarchar](255)	null
  , [F5INS2]		   [nvarchar](255)	null
  , [F5INS3]		   [nvarchar](255)	null
  , [F5INS4]		   [nvarchar](255)	null
  , [F5INS5]		   [nvarchar](255)	null
  , [F5IVQT]		   [decimal](15, 6) null
  , [F5IVQA]		   [decimal](15, 6) null
  , [F5IVOC]		   [decimal](17, 6) null
  , [F5IVNA]		   [decimal](15, 2) null
  , [F5IVDI]		   [decimal](5, 2)	null
  , [F5PUUN]		   [nvarchar](255)	null
  , [F5PPUN]		   [nvarchar](255)	null
  , [F5PUCD]		   [decimal](5, 0)	null
  , [F5IVCW]		   [decimal](15, 6) null
  , [F5ADDG]		   [decimal](15, 2) null
  , [F5IVLC]		   [decimal](15, 2) null
  , [F5SERA]		   [decimal](11, 6) null
  , [F5ECLC]		   [nvarchar](255)	null
  , [F5VRCD]		   [nvarchar](255)	null
  , [F5VTCD]		   [decimal](2, 0)	null
  , [F5SERS]		   [decimal](2, 0)	null
  , [F5ACDT]		   [decimal](8, 0)	null
  , [F5DNNR]		   [nvarchar](255)	null
  , [F5DNQT]		   [decimal](15, 6) null
  , [F5DNQA]		   [decimal](15, 6) null
  , [F5DNPR]		   [decimal](17, 6) null
  , [F5DNCM]		   [decimal](15, 2) null
  , [F5DNRQ]		   [nvarchar](255)	null
  , [F5DNRP]		   [nvarchar](255)	null
  , [F5IMST]		   [decimal](1, 0)	null
  , [F5IMDT]		   [decimal](8, 0)	null
  , [F5RPQT]		   [decimal](15, 6) null
  , [F5RPQA]		   [decimal](15, 6) null
  , [F5RCAC]		   [decimal](15, 2) null
  , [F5ICAC]		   [decimal](15, 2) null
  , [F5TXID]		   [decimal](13, 0) null
  , [F5RGDT]		   [decimal](8, 0)	null
  , [F5RGTM]		   [decimal](6, 0)	null
  , [F5LMDT]		   [decimal](8, 0)	null
  , [F5CHNO]		   [decimal](3, 0)	null
  , [F5CHID]		   [nvarchar](255)	null
  , [F5ATNR]		   [decimal](17, 0) null
  , [F5ATNB]		   [decimal](17, 0) null
  , [F5FIAS]		   [decimal](1, 0)	null
  , [F5HDPR]		   [nvarchar](255)	null
  , [F5OPTX]		   [nvarchar](255)	null
  , [F5OPTY]		   [nvarchar](255)	null
  , [F5OPTZ]		   [nvarchar](255)	null
) ;
go
print N'Creating [tsa].[ics_land_m3_FPLEDG]' ;
go
create table [tsa].[ics_land_m3_FPLEDG]
(
	[EtlBatchRunId]	   [int]			not null
  , [EtlStepRunId]	   [int]			not null
  , [EtlThreadRunId]   [int]			not null
  , [DataSourceKey]	   [int]			not null
  , [EtlSourceTable]   [varchar](200)	not null
  , [EtlCreatedOn]	   [datetime]		not null
  , [EtlCreatedBy]	   [varchar](200)	not null
  , [ExcludeFromMerge] [bit]			not null constraint [DF_tsa_ics_land_m3_FPLEDG_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]			not null constraint [DF_tsa_ics_land_m3_FPLEDG_IsDuplicate] default ((0))
  , [EPCONO]		   [decimal](3, 0)	null
  , [EPDIVI]		   [nvarchar](255)	null
  , [EPYEA4]		   [decimal](4, 0)	null
  , [EPJRNO]		   [decimal](7, 0)	null
  , [EPJSNO]		   [decimal](7, 0)	null
  , [EPTRCD]		   [decimal](2, 0)	null
  , [EPSPYN]		   [nvarchar](255)	null
  , [EPSUNO]		   [nvarchar](255)	null
  , [EPSINO]		   [nvarchar](255)	null
  , [EPINYR]		   [decimal](4, 0)	null
  , [EPVSER]		   [nvarchar](255)	null
  , [EPVONO]		   [decimal](8, 0)	null
  , [EPIVTP]		   [nvarchar](255)	null
  , [EPTDSC]		   [nvarchar](255)	null
  , [EPAPCD]		   [nvarchar](255)	null
  , [EPIVBL]		   [decimal](1, 0)	null
  , [EPBLBY]		   [nvarchar](255)	null
  , [EPBLDT]		   [decimal](8, 0)	null
  , [EPAPRV]		   [decimal](1, 0)	null
  , [EPSUCL]		   [nvarchar](255)	null
  , [EPBKID]		   [nvarchar](255)	null
  , [EPCUCD]		   [nvarchar](255)	null
  , [EPCRTP]		   [decimal](2, 0)	null
  , [EPARAT]		   [decimal](11, 6) null
  , [EPCUAM]		   [decimal](15, 2) null
  , [EPDCAM]		   [decimal](1, 0)	null
  , [EPVTAM]		   [decimal](15, 2) null
  , [EPIVDT]		   [decimal](8, 0)	null
  , [EPDUDT]		   [decimal](8, 0)	null
  , [EPACDT]		   [decimal](8, 0)	null
  , [EPTECD]		   [nvarchar](255)	null
  , [EPPYTP]		   [nvarchar](255)	null
  , [EPPYME]		   [nvarchar](255)	null
  , [EPTEPY]		   [nvarchar](255)	null
  , [EPRECO]		   [decimal](1, 0)	null
  , [EPREDE]		   [decimal](8, 0)	null
  , [EPSLOP]		   [decimal](2, 0)	null
  , [EPPYST]		   [decimal](1, 0)	null
  , [EPPYRS]		   [nvarchar](255)	null
  , [EPARCD]		   [decimal](1, 0)	null
  , [EPENME]		   [decimal](1, 0)	null
  , [EPTXID]		   [decimal](13, 0) null
  , [EPTDCD]		   [nvarchar](255)	null
  , [EPRGDT]		   [decimal](8, 0)	null
  , [EPRGTM]		   [decimal](6, 0)	null
  , [EPLMDT]		   [decimal](8, 0)	null
  , [EPCHNO]		   [decimal](3, 0)	null
  , [EPCHID]		   [nvarchar](255)	null
  , [EPDEDA]		   [decimal](8, 0)	null
  , [EPLMTS]		   [decimal](18, 0) null
  , [EPIVCL]		   [nvarchar](255)	null
  , [EPTXIN]		   [decimal](1, 0)	null
  , [EPGEOC]		   [decimal](9, 0)	null
) ;
go
print N'Creating [tsa].[ics_land_m3_MPLIND]' ;
go
create table [tsa].[ics_land_m3_MPLIND]
(
	[EtlBatchRunId]	   [int]			not null
  , [EtlStepRunId]	   [int]			not null
  , [EtlThreadRunId]   [int]			not null
  , [DataSourceKey]	   [int]			not null
  , [EtlSourceTable]   [varchar](200)	not null
  , [EtlCreatedOn]	   [datetime]		not null
  , [EtlCreatedBy]	   [varchar](200)	not null
  , [ExcludeFromMerge] [bit]			not null constraint [DF_tsa_ics_land_m3_MPLIND_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]			not null constraint [DF_tsa_ics_land_m3_MPLIND_IsDuplicate] default ((0))
  , [ICCONO]		   [decimal](3, 0)	null
  , [ICFACI]		   [nvarchar](255)	null
  , [ICWHLO]		   [nvarchar](255)	null
  , [ICWHSL]		   [nvarchar](255)	null
  , [ICBANO]		   [nvarchar](255)	null
  , [ICCAMU]		   [nvarchar](255)	null
  , [ICPUNO]		   [nvarchar](255)	null
  , [ICPNLI]		   [decimal](3, 0)	null
  , [ICPNLS]		   [decimal](3, 0)	null
  , [ICPNLX]		   [decimal](5, 0)	null
  , [ICSUDO]		   [nvarchar](255)	null
  , [ICREPN]		   [decimal](10, 0) null
  , [ICPUOS]		   [nvarchar](255)	null
  , [ICUGCD]		   [decimal](1, 0)	null
  , [ICNEAC]		   [decimal](1, 0)	null
  , [ICREOR]		   [decimal](1, 0)	null
  , [ICCHPO]		   [decimal](1, 0)	null
  , [ICRPQA]		   [decimal](15, 6) null
  , [ICRPQT]		   [decimal](15, 6) null
  , [ICTRDT]		   [decimal](8, 0)	null
  , [ICPLDT]		   [decimal](8, 0)	null
  , [ICRENE]		   [nvarchar](255)	null
  , [ICRESP]		   [nvarchar](255)	null
  , [ICBOLN]		   [nvarchar](255)	null
  , [ICCARN]		   [nvarchar](255)	null
  , [ICSMDT]		   [decimal](8, 0)	null
  , [ICARDT]		   [decimal](8, 0)	null
  , [ICNOPK]		   [decimal](5, 0)	null
  , [ICFWRF]		   [nvarchar](255)	null
  , [ICOEND]		   [decimal](1, 0)	null
  , [ICSCOP]		   [decimal](19, 8) null
  , [ICSERA]		   [decimal](11, 6) null
  , [ICDTID]		   [decimal](13, 0) null
  , [ICTIHM]		   [decimal](4, 0)	null
  , [ICDLIX]		   [decimal](11, 0) null
  , [ICAGNB]		   [nvarchar](255)	null
  , [ICPACN]		   [nvarchar](255)	null
  , [ICPACC]		   [nvarchar](255)	null
  , [ICRGDT]		   [decimal](8, 0)	null
  , [ICRGTM]		   [decimal](6, 0)	null
  , [ICTXID]		   [decimal](13, 0) null
  , [ICLMTS]		   [decimal](18, 0) null
  , [ICSUNO]		   [nvarchar](255)	null
  , [ICDNDT]		   [decimal](8, 0)	null
  , [ICSDDT]		   [decimal](8, 0)	null
  , [ICNDDT]		   [decimal](8, 0)	null
  , [ICSTWH]		   [nvarchar](255)	null
) ;
go
print N'Creating [tsa].[ics_land_m3_MPLINE]' ;
go
create table [tsa].[ics_land_m3_MPLINE]
(
	[EtlBatchRunId]	   [int]			not null
  , [EtlStepRunId]	   [int]			not null
  , [EtlThreadRunId]   [int]			not null
  , [DataSourceKey]	   [int]			not null
  , [EtlSourceTable]   [varchar](200)	not null
  , [EtlCreatedOn]	   [datetime]		not null
  , [EtlCreatedBy]	   [varchar](200)	not null
  , [ExcludeFromMerge] [bit]			not null constraint [DF_tsa_ics_land_m3_MPLINE_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]			not null constraint [DF_tsa_ics_land_m3_MPLINE_IsDuplicate] default ((0))
  , [IBCONO]		   [decimal](3, 0)	null
  , [IBFACI]		   [nvarchar](255)	null
  , [IBWHLO]		   [nvarchar](255)	null
  , [IBPUNO]		   [nvarchar](255)	null
  , [IBPNLI]		   [decimal](3, 0)	null
  , [IBPNLS]		   [decimal](3, 0)	null
  , [IBORTY]		   [nvarchar](255)	null
  , [IBPOTC]		   [nvarchar](255)	null
  , [IBLTPP]		   [nvarchar](255)	null
  , [IBPUST]		   [nvarchar](255)	null
  , [IBPUSL]		   [nvarchar](255)	null
  , [IBIDAG]		   [decimal](1, 0)	null
  , [IBSUNO]		   [nvarchar](255)	null
  , [IBSUAG]		   [nvarchar](255)	null
  , [IBITNO]		   [nvarchar](255)	null
  , [IBPRCS]		   [nvarchar](255)	null
  , [IBSUFI]		   [nvarchar](255)	null
  , [IBSITE]		   [nvarchar](255)	null
  , [IBPITD]		   [nvarchar](255)	null
  , [IBPITT]		   [nvarchar](255)	null
  , [IBSORN]		   [nvarchar](255)	null
  , [IBPROD]		   [nvarchar](255)	null
  , [IBECVE]		   [nvarchar](255)	null
  , [IBNOED]		   [decimal](1, 0)	null
  , [IBREVN]		   [nvarchar](255)	null
  , [IBETRF]		   [nvarchar](255)	null
  , [IBPUPR]		   [decimal](17, 6) null
  , [IBODI1]		   [decimal](5, 2)	null
  , [IBODI2]		   [decimal](5, 2)	null
  , [IBODI3]		   [decimal](5, 2)	null
  , [IBCPPR]		   [decimal](17, 6) null
  , [IBCFD1]		   [decimal](5, 2)	null
  , [IBCFD2]		   [decimal](5, 2)	null
  , [IBCFD3]		   [decimal](5, 2)	null
  , [IBPUUN]		   [nvarchar](255)	null
  , [IBPPUN]		   [nvarchar](255)	null
  , [IBPUCD]		   [decimal](5, 0)	null
  , [IBCPUC]		   [decimal](5, 0)	null
  , [IBPTCD]		   [decimal](1, 0)	null
  , [IBOTOD]		   [decimal](1, 0)	null
  , [IBLNAM]		   [decimal](15, 2) null
  , [IBDWDT]		   [decimal](8, 0)	null
  , [IBCODT]		   [decimal](8, 0)	null
  , [IBECDD]		   [decimal](8, 0)	null
  , [IBPDDT]		   [decimal](8, 0)	null
  , [IBVDDT]		   [decimal](8, 0)	null
  , [IBORQA]		   [decimal](15, 6) null
  , [IBCFQA]		   [decimal](15, 6) null
  , [IBADQA]		   [decimal](15, 6) null
  , [IBTNQA]		   [decimal](15, 6) null
  , [IBRVQA]		   [decimal](15, 6) null
  , [IBRCDT]		   [decimal](8, 0)	null
  , [IBDT4T]		   [decimal](1, 0)	null
  , [IBCAQA]		   [decimal](15, 6) null
  , [IBRJQA]		   [decimal](15, 6) null
  , [IBSDQA]		   [decimal](15, 6) null
  , [IBRRQA]		   [decimal](15, 6) null
  , [IBLPUD]		   [decimal](8, 0)	null
  , [IBIVQA]		   [decimal](15, 6) null
  , [IBIDAT]		   [decimal](8, 0)	null
  , [IBRORC]		   [decimal](1, 0)	null
  , [IBRORN]		   [nvarchar](255)	null
  , [IBRORL]		   [decimal](6, 0)	null
  , [IBOURR]		   [nvarchar](255)	null
  , [IBOURT]		   [nvarchar](255)	null
  , [IBUPAV]		   [decimal](1, 0)	null
  , [IBREPP]		   [decimal](1, 0)	null
  , [IBPRIP]		   [nvarchar](255)	null
  , [IBFUSC]		   [nvarchar](255)	null
  , [IBEXAT]		   [decimal](1, 0)	null
  , [IBEXAV]		   [decimal](1, 0)	null
  , [IBPLPN]		   [decimal](7, 0)	null
  , [IBPLPS]		   [decimal](3, 0)	null
  , [IBPURC]		   [nvarchar](255)	null
  , [IBBUYE]		   [nvarchar](255)	null
  , [IBRESF]		   [nvarchar](255)	null
  , [IBTERE]		   [nvarchar](255)	null
  , [IBGRMT]		   [nvarchar](255)	null
  , [IBIRCV]		   [nvarchar](255)	null
  , [IBUPIV]		   [decimal](1, 0)	null
  , [IBATDT]		   [decimal](8, 0)	null
  , [IBSUDO]		   [nvarchar](255)	null
  , [IBPACT]		   [nvarchar](255)	null
  , [IBCLLI]		   [decimal](1, 0)	null
  , [IBNPDE]		   [decimal](3, 0)	null
  , [IBVTCD]		   [decimal](2, 0)	null
  , [IBLICC]		   [nvarchar](255)	null
  , [IBACLI]		   [decimal](1, 0)	null
  , [IBULEX]		   [decimal](1, 0)	null
  , [IBEXEP]		   [decimal](15, 2) null
  , [IBINEP]		   [decimal](15, 2) null
  , [IBOEND]		   [decimal](1, 0)	null
  , [IBPLDT]		   [decimal](8, 0)	null
  , [IBACRF]		   [nvarchar](255)	null
  , [IBCOCE]		   [nvarchar](255)	null
  , [IBCSNO]		   [nvarchar](255)	null
  , [IBECLC]		   [nvarchar](255)	null
  , [IBVRCD]		   [nvarchar](255)	null
  , [IBECF1]		   [nvarchar](255)	null
  , [IBECF2]		   [nvarchar](255)	null
  , [IBECF3]		   [nvarchar](255)	null
  , [IBECF4]		   [nvarchar](255)	null
  , [IBECF5]		   [nvarchar](255)	null
  , [IBTXID]		   [decimal](13, 0) null
  , [IBDTID]		   [decimal](13, 0) null
  , [IBPROJ]		   [nvarchar](255)	null
  , [IBELNO]		   [nvarchar](255)	null
  , [IBDWCP]		   [decimal](1, 0)	null
  , [IBCPRI]		   [nvarchar](255)	null
  , [IBHAFE]		   [nvarchar](255)	null
  , [IBTAXC]		   [nvarchar](255)	null
  , [IBTIHM]		   [decimal](4, 0)	null
  , [IBCFIN]		   [decimal](10, 0) null
  , [IBHDPR]		   [nvarchar](255)	null
  , [IBECVS]		   [decimal](3, 0)	null
  , [IBATNR]		   [decimal](17, 0) null
  , [IBSEQN]		   [decimal](7, 0)	null
  , [IBATPR]		   [nvarchar](255)	null
  , [IBPGRN]		   [decimal](7, 0)	null
  , [IBCFMB]		   [decimal](15, 9) null
  , [IBCFPB]		   [decimal](15, 9) null
  , [IBMSTN]		   [decimal](10, 0) null
  , [IBCLAN]		   [nvarchar](255)	null
  , [IBCLLN]		   [decimal](3, 0)	null
  , [IBSEBI]		   [nvarchar](255)	null
  , [IBAGNB]		   [nvarchar](255)	null
  , [IBRGDT]		   [decimal](8, 0)	null
  , [IBRGTM]		   [decimal](6, 0)	null
  , [IBLMDT]		   [decimal](8, 0)	null
  , [IBCHNO]		   [decimal](3, 0)	null
  , [IBCHID]		   [nvarchar](255)	null
  , [IBRORX]		   [decimal](3, 0)	null
  , [IBUPCK]		   [decimal](1, 0)	null
  , [IBOPTX]		   [nvarchar](255)	null
  , [IBOPTY]		   [nvarchar](255)	null
  , [IBOPTZ]		   [nvarchar](255)	null
  , [IBBAOR]		   [nvarchar](255)	null
  , [IBFATP]		   [nvarchar](255)	null
  , [IBRE20]		   [nvarchar](255)	null
  , [IBLMTS]		   [decimal](18, 0) null
  , [IBORCO]		   [nvarchar](255)	null
  , [IBMODL]		   [nvarchar](255)	null
  , [IBTEDL]		   [nvarchar](255)	null
  , [IBTEL1]		   [nvarchar](255)	null
  , [IBGETY]		   [nvarchar](255)	null
  , [IBFSCD]		   [decimal](1, 0)	null
  , [IBPSET]		   [decimal](1, 0)	null
  , [IBSRCD]		   [decimal](1, 0)	null
  , [IBSFLI]		   [decimal](3, 0)	null
  , [IBSFLS]		   [decimal](3, 0)	null
  , [IBDUPL]		   [decimal](1, 0)	null
  , [IBDUPO]		   [nvarchar](255)	null
  , [IBGEOC]		   [decimal](9, 0)	null
  , [IBBANO]		   [nvarchar](255)	null
  , [IBTRRC]		   [decimal](1, 0)	null
  , [IBTRRN]		   [nvarchar](255)	null
  , [IBTRRL]		   [decimal](6, 0)	null
  , [IBTRRX]		   [decimal](3, 0)	null
  , [IBRASN]		   [nvarchar](255)	null
  , [IBDNDT]		   [decimal](8, 0)	null
  , [IBFRRC]		   [decimal](1, 0)	null
  , [IBFRRE]		   [decimal](12, 0) null
  , [IBSDES]		   [nvarchar](255)	null
  , [IBCDES]		   [nvarchar](255)	null
  , [IBPIAD]		   [nvarchar](255)	null
  , [IBCIAD]		   [nvarchar](255)	null
  , [IBORAD]		   [nvarchar](255)	null
  , [IBCOLO]		   [nvarchar](255)	null
  , [IBSIZE]		   [nvarchar](255)	null
  , [IBCHCS]		   [nvarchar](255)	null
  , [IBWSCA]		   [nvarchar](255)	null
  , [IBOWHL]		   [nvarchar](255)	null
  , [IBOFCI]		   [nvarchar](255)	null
) ;
go
print N'Creating [tsa].[ics_land_m3v7_FGINLI]' ;
go
create table [tsa].[ics_land_m3v7_FGINLI]
(
	[EtlBatchRunId]	   [int]			not null
  , [EtlStepRunId]	   [int]			not null
  , [EtlThreadRunId]   [int]			not null
  , [DataSourceKey]	   [int]			not null
  , [EtlSourceTable]   [varchar](200)	not null
  , [EtlCreatedOn]	   [datetime]		not null
  , [EtlCreatedBy]	   [varchar](200)	not null
  , [ExcludeFromMerge] [bit]			not null constraint [DF_tsa_ics_land_m3v7_FGINLI_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]			not null constraint [DF_tsa_ics_land_m3v7_FGINLI_IsDuplicate] default ((0))
  , [F5CONO]		   [decimal](3, 0)	null
  , [F5DIVI]		   [nvarchar](255)	null
  , [F5SUNO]		   [nvarchar](255)	null
  , [F5SINO]		   [nvarchar](255)	null
  , [F5INYR]		   [decimal](4, 0)	null
  , [F5PUNO]		   [nvarchar](255)	null
  , [F5PNLI]		   [decimal](3, 0)	null
  , [F5PNLS]		   [decimal](3, 0)	null
  , [F5REPN]		   [decimal](10, 0) null
  , [F5RELP]		   [decimal](1, 0)	null
  , [F5INLP]		   [decimal](1, 0)	null
  , [F5INS1]		   [nvarchar](255)	null
  , [F5INS2]		   [nvarchar](255)	null
  , [F5INS3]		   [nvarchar](255)	null
  , [F5INS4]		   [nvarchar](255)	null
  , [F5INS5]		   [nvarchar](255)	null
  , [F5IVQT]		   [decimal](15, 6) null
  , [F5IVQA]		   [decimal](15, 6) null
  , [F5IVOC]		   [decimal](17, 6) null
  , [F5IVNA]		   [decimal](15, 2) null
  , [F5IVDI]		   [decimal](5, 2)	null
  , [F5PUUN]		   [nvarchar](255)	null
  , [F5PPUN]		   [nvarchar](255)	null
  , [F5PUCD]		   [decimal](5, 0)	null
  , [F5IVCW]		   [decimal](15, 6) null
  , [F5ADDG]		   [decimal](15, 2) null
  , [F5IVLC]		   [decimal](15, 2) null
  , [F5SERA]		   [decimal](11, 6) null
  , [F5ECLC]		   [nvarchar](255)	null
  , [F5VRCD]		   [nvarchar](255)	null
  , [F5VTCD]		   [decimal](2, 0)	null
  , [F5SERS]		   [decimal](2, 0)	null
  , [F5ACDT]		   [decimal](8, 0)	null
  , [F5DNNR]		   [nvarchar](255)	null
  , [F5DNQT]		   [decimal](15, 6) null
  , [F5DNQA]		   [decimal](15, 6) null
  , [F5DNPR]		   [decimal](17, 6) null
  , [F5DNCM]		   [decimal](15, 2) null
  , [F5DNRQ]		   [nvarchar](255)	null
  , [F5DNRP]		   [nvarchar](255)	null
  , [F5IMST]		   [decimal](1, 0)	null
  , [F5IMDT]		   [decimal](8, 0)	null
  , [F5RPQT]		   [decimal](15, 6) null
  , [F5RPQA]		   [decimal](15, 6) null
  , [F5RCAC]		   [decimal](15, 2) null
  , [F5ICAC]		   [decimal](15, 2) null
  , [F5TXID]		   [decimal](13, 0) null
  , [F5RGDT]		   [decimal](8, 0)	null
  , [F5RGTM]		   [decimal](6, 0)	null
  , [F5LMDT]		   [decimal](8, 0)	null
  , [F5CHNO]		   [decimal](3, 0)	null
  , [F5CHID]		   [nvarchar](255)	null
) ;
go
print N'Creating [tsa].[ics_land_m3v7_FPLEDG]' ;
go
create table [tsa].[ics_land_m3v7_FPLEDG]
(
	[EtlBatchRunId]	   [int]			not null
  , [EtlStepRunId]	   [int]			not null
  , [EtlThreadRunId]   [int]			not null
  , [DataSourceKey]	   [int]			not null
  , [EtlSourceTable]   [varchar](200)	not null
  , [EtlCreatedOn]	   [datetime]		not null
  , [EtlCreatedBy]	   [varchar](200)	not null
  , [ExcludeFromMerge] [bit]			not null constraint [DF_tsa_ics_land_m3v7_FPLEDG_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]			not null constraint [DF_tsa_ics_land_m3v7_FPLEDG_IsDuplicate] default ((0))
  , [EPCONO]		   [decimal](3, 0)	null
  , [EPDIVI]		   [nvarchar](255)	null
  , [EPYEA4]		   [decimal](4, 0)	null
  , [EPJRNO]		   [decimal](7, 0)	null
  , [EPJSNO]		   [decimal](7, 0)	null
  , [EPTRCD]		   [decimal](2, 0)	null
  , [EPSPYN]		   [nvarchar](255)	null
  , [EPSUNO]		   [nvarchar](255)	null
  , [EPSINO]		   [nvarchar](255)	null
  , [EPINYR]		   [decimal](4, 0)	null
  , [EPVSER]		   [nvarchar](255)	null
  , [EPVONO]		   [decimal](8, 0)	null
  , [EPIVTP]		   [nvarchar](255)	null
  , [EPTDSC]		   [nvarchar](255)	null
  , [EPAPCD]		   [nvarchar](255)	null
  , [EPIVBL]		   [decimal](1, 0)	null
  , [EPBLBY]		   [nvarchar](255)	null
  , [EPBLDT]		   [decimal](8, 0)	null
  , [EPAPRV]		   [decimal](1, 0)	null
  , [EPSUCL]		   [nvarchar](255)	null
  , [EPBKID]		   [nvarchar](255)	null
  , [EPCUCD]		   [nvarchar](255)	null
  , [EPCRTP]		   [decimal](2, 0)	null
  , [EPARAT]		   [decimal](11, 6) null
  , [EPCUAM]		   [decimal](15, 2) null
  , [EPDCAM]		   [decimal](1, 0)	null
  , [EPVTAM]		   [decimal](15, 2) null
  , [EPIVDT]		   [decimal](8, 0)	null
  , [EPDUDT]		   [decimal](8, 0)	null
  , [EPACDT]		   [decimal](8, 0)	null
  , [EPTECD]		   [nvarchar](255)	null
  , [EPPYTP]		   [nvarchar](255)	null
  , [EPPYME]		   [nvarchar](255)	null
  , [EPTEPY]		   [nvarchar](255)	null
  , [EPRECO]		   [decimal](1, 0)	null
  , [EPREDE]		   [decimal](8, 0)	null
  , [EPSLOP]		   [decimal](2, 0)	null
  , [EPPYST]		   [decimal](1, 0)	null
  , [EPPYRS]		   [nvarchar](255)	null
  , [EPARCD]		   [decimal](1, 0)	null
  , [EPENME]		   [decimal](1, 0)	null
  , [EPTXID]		   [decimal](13, 0) null
  , [EPTDCD]		   [nvarchar](255)	null
  , [EPRGDT]		   [decimal](8, 0)	null
  , [EPRGTM]		   [decimal](6, 0)	null
  , [EPLMDT]		   [decimal](8, 0)	null
  , [EPCHNO]		   [decimal](3, 0)	null
  , [EPCHID]		   [nvarchar](255)	null
  , [EPDEDA]		   [decimal](8, 0)	null
) ;
go
print N'Creating [tsa].[ics_land_m3v7_MPLIND]' ;
go
create table [tsa].[ics_land_m3v7_MPLIND]
(
	[EtlBatchRunId]	   [int]			not null
  , [EtlStepRunId]	   [int]			not null
  , [EtlThreadRunId]   [int]			not null
  , [DataSourceKey]	   [int]			not null
  , [EtlSourceTable]   [varchar](200)	not null
  , [EtlCreatedOn]	   [datetime]		not null
  , [EtlCreatedBy]	   [varchar](200)	not null
  , [ExcludeFromMerge] [bit]			not null constraint [DF_tsa_ics_land_m3v7_MPLIND_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]			not null constraint [DF_tsa_ics_land_m3v7_MPLIND_IsDuplicate] default ((0))
  , [ICCONO]		   [decimal](3, 0)	null
  , [ICFACI]		   [nvarchar](255)	null
  , [ICWHLO]		   [nvarchar](255)	null
  , [ICWHSL]		   [nvarchar](255)	null
  , [ICBANO]		   [nvarchar](255)	null
  , [ICCAMU]		   [nvarchar](255)	null
  , [ICPUNO]		   [nvarchar](255)	null
  , [ICPNLI]		   [decimal](3, 0)	null
  , [ICPNLS]		   [decimal](3, 0)	null
  , [ICPNLX]		   [decimal](5, 0)	null
  , [ICSUDO]		   [nvarchar](255)	null
  , [ICREPN]		   [decimal](10, 0) null
  , [ICPUOS]		   [nvarchar](255)	null
  , [ICUGCD]		   [decimal](1, 0)	null
  , [ICNEAC]		   [decimal](1, 0)	null
  , [ICREOR]		   [decimal](1, 0)	null
  , [ICCHPO]		   [decimal](1, 0)	null
  , [ICRPQA]		   [decimal](15, 6) null
  , [ICRPQT]		   [decimal](15, 6) null
  , [ICTRDT]		   [decimal](8, 0)	null
  , [ICPLDT]		   [decimal](8, 0)	null
  , [ICRENE]		   [nvarchar](255)	null
  , [ICRESP]		   [nvarchar](255)	null
  , [ICBOLN]		   [nvarchar](255)	null
  , [ICCARN]		   [nvarchar](255)	null
  , [ICSMDT]		   [decimal](8, 0)	null
  , [ICARDT]		   [decimal](8, 0)	null
  , [ICNOPK]		   [decimal](5, 0)	null
  , [ICFWRF]		   [nvarchar](255)	null
  , [ICOEND]		   [decimal](1, 0)	null
  , [ICSCOP]		   [decimal](17, 6) null
  , [ICSERA]		   [decimal](11, 6) null
  , [ICDTID]		   [decimal](13, 0) null
  , [ICTIHM]		   [decimal](4, 0)	null
  , [ICDLIX]		   [decimal](11, 0) null
  , [ICAGNB]		   [nvarchar](255)	null
  , [ICPACN]		   [nvarchar](255)	null
  , [ICPACC]		   [nvarchar](255)	null
  , [ICRGDT]		   [decimal](8, 0)	null
  , [ICRGTM]		   [decimal](6, 0)	null
  , [ICTXID]		   [decimal](13, 0) null
) ;
go
print N'Creating [tsa].[ics_land_m3v7_MPLINE]' ;
go
create table [tsa].[ics_land_m3v7_MPLINE]
(
	[EtlBatchRunId]	   [int]			not null
  , [EtlStepRunId]	   [int]			not null
  , [EtlThreadRunId]   [int]			not null
  , [DataSourceKey]	   [int]			not null
  , [EtlSourceTable]   [varchar](200)	not null
  , [EtlCreatedOn]	   [datetime]		not null
  , [EtlCreatedBy]	   [varchar](200)	not null
  , [ExcludeFromMerge] [bit]			not null constraint [DF_tsa_ics_land_m3v7_MPLINE_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]			not null constraint [DF_tsa_ics_land_m3v7_MPLINE_IsDuplicate] default ((0))
  , [IBCONO]		   [decimal](3, 0)	null
  , [IBFACI]		   [nvarchar](255)	null
  , [IBWHLO]		   [nvarchar](255)	null
  , [IBPUNO]		   [nvarchar](255)	null
  , [IBPNLI]		   [decimal](3, 0)	null
  , [IBPNLS]		   [decimal](3, 0)	null
  , [IBORTY]		   [nvarchar](255)	null
  , [IBPOTC]		   [nvarchar](255)	null
  , [IBLTPP]		   [nvarchar](255)	null
  , [IBPUST]		   [nvarchar](255)	null
  , [IBPUSL]		   [nvarchar](255)	null
  , [IBIDAG]		   [decimal](1, 0)	null
  , [IBSUNO]		   [nvarchar](255)	null
  , [IBSUAG]		   [nvarchar](255)	null
  , [IBITNO]		   [nvarchar](255)	null
  , [IBPRCS]		   [nvarchar](255)	null
  , [IBSUFI]		   [nvarchar](255)	null
  , [IBSITE]		   [nvarchar](255)	null
  , [IBPITD]		   [nvarchar](255)	null
  , [IBPITT]		   [nvarchar](255)	null
  , [IBSORN]		   [nvarchar](255)	null
  , [IBPROD]		   [nvarchar](255)	null
  , [IBECVE]		   [nvarchar](255)	null
  , [IBNOED]		   [decimal](1, 0)	null
  , [IBREVN]		   [nvarchar](255)	null
  , [IBETRF]		   [nvarchar](255)	null
  , [IBPUPR]		   [decimal](17, 6) null
  , [IBODI1]		   [decimal](5, 2)	null
  , [IBODI2]		   [decimal](5, 2)	null
  , [IBODI3]		   [decimal](5, 2)	null
  , [IBCPPR]		   [decimal](17, 6) null
  , [IBCFD1]		   [decimal](5, 2)	null
  , [IBCFD2]		   [decimal](5, 2)	null
  , [IBCFD3]		   [decimal](5, 2)	null
  , [IBPUUN]		   [nvarchar](255)	null
  , [IBPPUN]		   [nvarchar](255)	null
  , [IBPUCD]		   [decimal](5, 0)	null
  , [IBCPUC]		   [decimal](5, 0)	null
  , [IBPTCD]		   [decimal](1, 0)	null
  , [IBOTOD]		   [decimal](1, 0)	null
  , [IBLNAM]		   [decimal](15, 2) null
  , [IBDWDT]		   [decimal](8, 0)	null
  , [IBCODT]		   [decimal](8, 0)	null
  , [IBECDD]		   [decimal](8, 0)	null
  , [IBPDDT]		   [decimal](8, 0)	null
  , [IBVDDT]		   [decimal](8, 0)	null
  , [IBORQA]		   [decimal](15, 6) null
  , [IBCFQA]		   [decimal](15, 6) null
  , [IBADQA]		   [decimal](15, 6) null
  , [IBTNQA]		   [decimal](15, 6) null
  , [IBRVQA]		   [decimal](15, 6) null
  , [IBRCDT]		   [decimal](8, 0)	null
  , [IBDT4T]		   [decimal](1, 0)	null
  , [IBCAQA]		   [decimal](15, 6) null
  , [IBRJQA]		   [decimal](15, 6) null
  , [IBSDQA]		   [decimal](15, 6) null
  , [IBRRQA]		   [decimal](15, 6) null
  , [IBLPUD]		   [decimal](8, 0)	null
  , [IBIVQA]		   [decimal](15, 6) null
  , [IBIDAT]		   [decimal](8, 0)	null
  , [IBRORC]		   [decimal](1, 0)	null
  , [IBRORN]		   [nvarchar](255)	null
  , [IBRORL]		   [decimal](6, 0)	null
  , [IBOURR]		   [nvarchar](255)	null
  , [IBOURT]		   [nvarchar](255)	null
  , [IBUPAV]		   [decimal](1, 0)	null
  , [IBREPP]		   [decimal](1, 0)	null
  , [IBPRIP]		   [nvarchar](255)	null
  , [IBFUSC]		   [nvarchar](255)	null
  , [IBEXAT]		   [decimal](1, 0)	null
  , [IBEXAV]		   [decimal](1, 0)	null
  , [IBPLPN]		   [decimal](7, 0)	null
  , [IBPLPS]		   [decimal](3, 0)	null
  , [IBPURC]		   [nvarchar](255)	null
  , [IBBUYE]		   [nvarchar](255)	null
  , [IBRESF]		   [nvarchar](255)	null
  , [IBTERE]		   [nvarchar](255)	null
  , [IBGRMT]		   [nvarchar](255)	null
  , [IBIRCV]		   [nvarchar](255)	null
  , [IBUPIV]		   [decimal](1, 0)	null
  , [IBATDT]		   [decimal](8, 0)	null
  , [IBSUDO]		   [nvarchar](255)	null
  , [IBPACT]		   [nvarchar](255)	null
  , [IBCLLI]		   [decimal](1, 0)	null
  , [IBNPDE]		   [decimal](3, 0)	null
  , [IBVTCD]		   [decimal](2, 0)	null
  , [IBLICC]		   [nvarchar](255)	null
  , [IBACLI]		   [decimal](1, 0)	null
  , [IBULEX]		   [decimal](1, 0)	null
  , [IBEXEP]		   [decimal](15, 2) null
  , [IBINEP]		   [decimal](15, 2) null
  , [IBOEND]		   [decimal](1, 0)	null
  , [IBPLDT]		   [decimal](8, 0)	null
  , [IBACRF]		   [nvarchar](255)	null
  , [IBCOCE]		   [nvarchar](255)	null
  , [IBCSNO]		   [nvarchar](255)	null
  , [IBECLC]		   [nvarchar](255)	null
  , [IBVRCD]		   [nvarchar](255)	null
  , [IBECF1]		   [nvarchar](255)	null
  , [IBECF2]		   [nvarchar](255)	null
  , [IBECF3]		   [nvarchar](255)	null
  , [IBECF4]		   [nvarchar](255)	null
  , [IBECF5]		   [nvarchar](255)	null
  , [IBTXID]		   [decimal](13, 0) null
  , [IBDTID]		   [decimal](13, 0) null
  , [IBPROJ]		   [nvarchar](255)	null
  , [IBELNO]		   [nvarchar](255)	null
  , [IBDWCP]		   [decimal](1, 0)	null
  , [IBCPRI]		   [nvarchar](255)	null
  , [IBHAFE]		   [nvarchar](255)	null
  , [IBTAXC]		   [nvarchar](255)	null
  , [IBTIHM]		   [decimal](4, 0)	null
  , [IBCFIN]		   [decimal](10, 0) null
  , [IBHDPR]		   [nvarchar](255)	null
  , [IBECVS]		   [decimal](3, 0)	null
  , [IBATNR]		   [decimal](17, 0) null
  , [IBSEQN]		   [decimal](7, 0)	null
  , [IBATPR]		   [nvarchar](255)	null
  , [IBPGRN]		   [decimal](7, 0)	null
  , [IBCFMB]		   [decimal](15, 9) null
  , [IBCFPB]		   [decimal](15, 9) null
  , [IBMSTN]		   [decimal](10, 0) null
  , [IBCLAN]		   [nvarchar](255)	null
  , [IBCLLN]		   [decimal](3, 0)	null
  , [IBSEBI]		   [nvarchar](255)	null
  , [IBAGNB]		   [nvarchar](255)	null
  , [IBRGDT]		   [decimal](8, 0)	null
  , [IBRGTM]		   [decimal](6, 0)	null
  , [IBLMDT]		   [decimal](8, 0)	null
  , [IBCHNO]		   [decimal](3, 0)	null
  , [IBCHID]		   [nvarchar](255)	null
  , [IBRORX]		   [decimal](3, 0)	null
  , [IBUPCK]		   [decimal](1, 0)	null
  , [IBOPTX]		   [nvarchar](255)	null
  , [IBOPTY]		   [nvarchar](255)	null
  , [IBOPTZ]		   [nvarchar](255)	null
  , [IBBAOR]		   [nvarchar](255)	null
  , [IBLMTS]		   [decimal](18, 0) null
) ;
go
print N'Creating [tsa].[ics_land_movex_FPLEDG]' ;
go
create table [tsa].[ics_land_movex_FPLEDG]
(
	[EtlBatchRunId]	   [int]			not null
  , [EtlStepRunId]	   [int]			not null
  , [EtlThreadRunId]   [int]			not null
  , [DataSourceKey]	   [int]			not null
  , [EtlSourceTable]   [varchar](200)	not null
  , [EtlCreatedOn]	   [datetime]		not null
  , [EtlCreatedBy]	   [varchar](200)	not null
  , [ExcludeFromMerge] [bit]			not null constraint [DF_tsa_ics_land_movex_FPLEDG_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]			not null constraint [DF_tsa_ics_land_movex_FPLEDG_IsDuplicate] default ((0))
  , [EPCONO]		   [decimal](3, 0)	null
  , [EPDIVI]		   [nvarchar](3)	null
  , [EPYEA4]		   [decimal](4, 0)	null
  , [EPJRNO]		   [decimal](7, 0)	null
  , [EPJSNO]		   [decimal](7, 0)	null
  , [EPTRCD]		   [decimal](2, 0)	null
  , [EPSPYN]		   [nvarchar](10)	null
  , [EPSUNO]		   [nvarchar](10)	null
  , [EPSINO]		   [nvarchar](24)	null
  , [EPINYR]		   [decimal](4, 0)	null
  , [EPVSER]		   [nvarchar](3)	null
  , [EPVONO]		   [decimal](8, 0)	null
  , [EPIVTP]		   [nvarchar](2)	null
  , [EPTDSC]		   [nvarchar](10)	null
  , [EPAPCD]		   [nvarchar](10)	null
  , [EPIVBL]		   [decimal](1, 0)	null
  , [EPBLBY]		   [nvarchar](10)	null
  , [EPBLDT]		   [decimal](8, 0)	null
  , [EPAPRV]		   [decimal](1, 0)	null
  , [EPSUCL]		   [nvarchar](3)	null
  , [EPBKID]		   [nvarchar](5)	null
  , [EPCUCD]		   [nvarchar](3)	null
  , [EPCRTP]		   [decimal](2, 0)	null
  , [EPARAT]		   [decimal](11, 6) null
  , [EPCUAM]		   [decimal](15, 2) null
  , [EPDCAM]		   [decimal](1, 0)	null
  , [EPVTAM]		   [decimal](15, 2) null
  , [EPIVDT]		   [decimal](8, 0)	null
  , [EPDUDT]		   [decimal](8, 0)	null
  , [EPACDT]		   [decimal](8, 0)	null
  , [EPTECD]		   [nvarchar](3)	null
  , [EPPYTP]		   [nvarchar](2)	null
  , [EPPYME]		   [nvarchar](3)	null
  , [EPTEPY]		   [nvarchar](3)	null
  , [EPRECO]		   [decimal](1, 0)	null
  , [EPREDE]		   [decimal](8, 0)	null
  , [EPSLOP]		   [decimal](2, 0)	null
  , [EPPYST]		   [decimal](1, 0)	null
  , [EPPYRS]		   [nvarchar](2)	null
  , [EPARCD]		   [decimal](1, 0)	null
  , [EPENME]		   [decimal](1, 0)	null
  , [EPTXID]		   [decimal](13, 0) null
  , [EPTDCD]		   [nvarchar](4)	null
  , [EPRGDT]		   [decimal](8, 0)	null
  , [EPRGTM]		   [decimal](6, 0)	null
  , [EPLMDT]		   [decimal](8, 0)	null
  , [EPCHNO]		   [decimal](3, 0)	null
  , [EPCHID]		   [nvarchar](10)	null
) ;
go
