-- <Migration ID="97ee7231-5f05-48ee-b8c1-5f69f712946c" />
go
if object_id('tsa.ics_land_SAP_GBR_TCURR', 'U') is not null
	drop table tsa.ics_land_SAP_GBR_TCURR ;
go


if object_id('tsa.ics_land_SAP_GBR_T052U', 'U') is not null
	drop table tsa.ics_land_SAP_GBR_T052U ;
go

if object_id('tsa.ics_land_SAP_GBR_MARM', 'U') is not null
	drop table tsa.ics_land_SAP_GBR_MARM ;
go

if object_id('tsa.ics_land_SAP_GBR_LFM1', 'U') is not null
	drop table tsa.ics_land_SAP_GBR_LFM1 ;
go

if object_id('tsa.ics_land_SAP_GBR_EKBE', 'U') is not null
	drop table tsa.ics_land_SAP_GBR_EKBE ;
go

if object_id('tsa.ics_land_SAP_GBR_EKET', 'U') is not null
	drop table tsa.ics_land_SAP_GBR_EKET ;
go

if object_id('tsa.ics_land_SAP_GBR_EKKO', 'U') is not null
	drop table tsa.ics_land_SAP_GBR_EKKO ;
go

if object_id('tsa.ics_land_SAP_GBR_LFA1', 'U') is not null
	drop table tsa.ics_land_SAP_GBR_LFA1 ;
go

if object_id('tsa.ics_land_SAP_GBR_LFB1', 'U') is not null
	drop table tsa.ics_land_SAP_GBR_LFB1 ;
go

if object_id('tsa.ics_land_SAP_GBR_ADRC', 'U') is not null
	drop table tsa.ics_land_SAP_GBR_ADRC ;
go

if object_id('tsa.ics_land_SAP_GBR_EKPO', 'U') is not null
	drop table tsa.ics_land_SAP_GBR_EKPO ;
go

if object_id('tsa.ics_land_SAP_GBR_LIKP', 'U') is not null
	drop table tsa.ics_land_SAP_GBR_LIKP ;
go


print N'Creating [tsa].[ics_land_SAP_GBR_TCURR]' ;
go
create table [tsa].[ics_land_SAP_GBR_TCURR]
(
	[EtlBatchRunId]	   [int]		   not null
  , [EtlStepRunId]	   [int]		   not null
  , [EtlThreadRunId]   [int]		   not null
  , [DataSourceKey]	   [int]		   not null
  , [EtlSourceTable]   [varchar](200)  not null
  , [EtlCreatedOn]	   [datetime]	   not null
  , [EtlCreatedBy]	   [varchar](200)  not null
  , [ExcludeFromMerge] [bit]		   not null constraint [DF_tsa_ics_land_SAP_GBR_TCURR_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		   not null constraint [DF_tsa_ics_land_SAP_GBR_TCURR_IsDuplicate] default ((0))
  , [MANDT]			   [nvarchar](3)   null
  , [KURST]			   [nvarchar](4)   null
  , [FCURR]			   [nvarchar](5)   null
  , [TCURR]			   [nvarchar](5)   null
  , [GDATU]			   [nvarchar](8)   null
  , [UKURS]			   [decimal](9, 5) null
  , [FFACT]			   [decimal](9, 0) null
  , [TFACT]			   [decimal](9, 0) null
) ;
go
print N'Creating index [tsa_ics_land_SAP_GBR_TCURR_1] on [tsa].[ics_land_SAP_GBR_TCURR]' ;
go
create clustered index [tsa_ics_land_SAP_GBR_TCURR_1]
on [tsa].[ics_land_SAP_GBR_TCURR] ([MANDT], [KURST], [FCURR], [TCURR], [GDATU]) ;
go
print N'Creating [tsa].[ics_land_SAP_GBR_T052U]' ;
go
create table [tsa].[ics_land_SAP_GBR_T052U]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_SAP_GBR_T052U_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_SAP_GBR_T052U_IsDuplicate] default ((0))
  , [MANDT]			   [nvarchar](3)  null
  , [SPRAS]			   [nvarchar](1)  null
  , [ZTERM]			   [nvarchar](4)  null
  , [ZTAGG]			   [nvarchar](2)  null
  , [TEXT1]			   [nvarchar](50) null
) ;
go
print N'Creating index [tsa_ics_land_SAP_GBR_T052U_1] on [tsa].[ics_land_SAP_GBR_T052U]' ;
go
create clustered index [tsa_ics_land_SAP_GBR_T052U_1]
on [tsa].[ics_land_SAP_GBR_T052U] ([MANDT], [SPRAS], [ZTERM], [ZTAGG]) ;
go
print N'Creating [tsa].[ics_land_SAP_GBR_LFM1]' ;
go
create table [tsa].[ics_land_SAP_GBR_LFM1]
(
	[EtlBatchRunId]	   [int]			not null
  , [EtlStepRunId]	   [int]			not null
  , [EtlThreadRunId]   [int]			not null
  , [DataSourceKey]	   [int]			not null
  , [EtlSourceTable]   [varchar](200)	not null
  , [EtlCreatedOn]	   [datetime]		not null
  , [EtlCreatedBy]	   [varchar](200)	not null
  , [ExcludeFromMerge] [bit]			not null constraint [DF_tsa_ics_land_SAP_GBR_LFM1_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]			not null constraint [DF_tsa_ics_land_SAP_GBR_LFM1_IsDuplicate] default ((0))
  , [MANDT]			   [nvarchar](3)	null
  , [LIFNR]			   [nvarchar](10)	null
  , [EKORG]			   [nvarchar](4)	null
  , [ERDAT]			   [datetime]		null
  , [ERNAM]			   [nvarchar](12)	null
  , [SPERM]			   [nvarchar](1)	null
  , [LOEVM]			   [nvarchar](1)	null
  , [LFABC]			   [nvarchar](1)	null
  , [WAERS]			   [nvarchar](5)	null
  , [VERKF]			   [nvarchar](30)	null
  , [TELF1]			   [nvarchar](16)	null
  , [MINBW]			   [decimal](13, 2) null
  , [ZTERM]			   [nvarchar](4)	null
  , [INCO1]			   [nvarchar](3)	null
  , [INCO2]			   [nvarchar](28)	null
  , [WEBRE]			   [nvarchar](1)	null
  , [KZABS]			   [nvarchar](1)	null
  , [KALSK]			   [nvarchar](2)	null
  , [KZAUT]			   [nvarchar](1)	null
  , [EXPVZ]			   [nvarchar](1)	null
  , [ZOLLA]			   [nvarchar](6)	null
  , [MEPRF]			   [nvarchar](1)	null
  , [EKGRP]			   [nvarchar](3)	null
  , [XERSY]			   [nvarchar](1)	null
  , [PLIFZ]			   [decimal](3, 0)	null
  , [MRPPP]			   [nvarchar](3)	null
  , [LFRHY]			   [nvarchar](3)	null
  , [LIBES]			   [nvarchar](1)	null
  , [LIPRE]			   [nvarchar](2)	null
  , [LISER]			   [nvarchar](1)	null
  , [PRFRE]			   [nvarchar](1)	null
  , [NRGEW]			   [nvarchar](1)	null
  , [BOIND]			   [nvarchar](1)	null
  , [BLIND]			   [nvarchar](1)	null
  , [KZRET]			   [nvarchar](1)	null
  , [SKRIT]			   [nvarchar](1)	null
  , [BSTAE]			   [nvarchar](4)	null
  , [RDPRF]			   [nvarchar](4)	null
  , [MEGRU]			   [nvarchar](4)	null
  , [VENSL]			   [decimal](4, 1)	null
  , [BOPNR]			   [nvarchar](4)	null
  , [XERSR]			   [nvarchar](1)	null
  , [EIKTO]			   [nvarchar](12)	null
  , [ABUEB]			   [nvarchar](4)	null
  , [PAPRF]			   [nvarchar](4)	null
  , [AGREL]			   [nvarchar](1)	null
  , [XNBWY]			   [nvarchar](1)	null
  , [VSBED]			   [nvarchar](2)	null
  , [LEBRE]			   [nvarchar](1)	null
  , [BOLRE]			   [nvarchar](1)	null
  , [UMSAE]			   [nvarchar](1)	null
  , [VENDOR_RMA_REQ]   [nvarchar](1)	null
  , [ACTIVITY_PROFIL]  [nvarchar](4)	null
  , [TRANSPORT_CHAIN]  [nvarchar](10)	null
  , [STAGING_TIME]	   [decimal](3, 0)	null
) ;
go
print N'Creating index [tsa_ics_land_SAP_GBR_LFM1_1] on [tsa].[ics_land_SAP_GBR_LFM1]' ;
go
create clustered index [tsa_ics_land_SAP_GBR_LFM1_1]
on [tsa].[ics_land_SAP_GBR_LFM1] ([MANDT], [LIFNR], [EKORG]) ;
go
print N'Creating [tsa].[ics_land_SAP_GBR_EKBE]' ;
go
create table [tsa].[ics_land_SAP_GBR_EKBE]
(
	[EtlBatchRunId]	   [int]			not null
  , [EtlStepRunId]	   [int]			not null
  , [EtlThreadRunId]   [int]			not null
  , [DataSourceKey]	   [int]			not null
  , [EtlSourceTable]   [varchar](200)	not null
  , [EtlCreatedOn]	   [datetime]		not null
  , [EtlCreatedBy]	   [varchar](200)	not null
  , [ExcludeFromMerge] [bit]			not null constraint [DF_tsa_ics_land_SAP_GBR_EKBE_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]			not null constraint [DF_tsa_ics_land_SAP_GBR_EKBE_IsDuplicate] default ((0))
  , [MANDT]			   [nvarchar](3)	null
  , [EBELN]			   [nvarchar](10)	null
  , [EBELP]			   [nvarchar](5)	null
  , [ZEKKN]			   [nvarchar](2)	null
  , [VGABE]			   [nvarchar](1)	null
  , [GJAHR]			   [nvarchar](4)	null
  , [BELNR]			   [nvarchar](10)	null
  , [BUZEI]			   [nvarchar](4)	null
  , [BEWTP]			   [nvarchar](1)	null
  , [BWART]			   [nvarchar](3)	null
  , [BUDAT]			   [datetime]		null
  , [MENGE]			   [decimal](13, 3) null
  , [BPMNG]			   [decimal](13, 3) null
  , [DMBTR]			   [decimal](13, 2) null
  , [WRBTR]			   [decimal](13, 2) null
  , [WAERS]			   [nvarchar](5)	null
  , [AREWR]			   [decimal](13, 2) null
  , [WESBS]			   [decimal](13, 3) null
  , [BPWES]			   [decimal](13, 3) null
  , [SHKZG]			   [nvarchar](1)	null
  , [BWTAR]			   [nvarchar](10)	null
  , [ELIKZ]			   [nvarchar](1)	null
  , [XBLNR]			   [nvarchar](16)	null
  , [LFGJA]			   [nvarchar](4)	null
  , [LFBNR]			   [nvarchar](10)	null
  , [LFPOS]			   [nvarchar](4)	null
  , [GRUND]			   [nvarchar](4)	null
  , [CPUDT]			   [datetime]		null
  , [CPUTM]			   [datetime]		null
  , [REEWR]			   [decimal](13, 2) null
  , [EVERE]			   [nvarchar](2)	null
  , [REFWR]			   [decimal](13, 2) null
  , [MATNR]			   [nvarchar](18)	null
  , [WERKS]			   [nvarchar](4)	null
  , [XWSBR]			   [nvarchar](1)	null
  , [ETENS]			   [nvarchar](4)	null
  , [KNUMV]			   [nvarchar](10)	null
  , [MWSKZ]			   [nvarchar](2)	null
  , [LSMNG]			   [decimal](13, 3) null
  , [LSMEH]			   [nvarchar](3)	null
  , [EMATN]			   [nvarchar](18)	null
  , [AREWW]			   [decimal](13, 2) null
  , [HSWAE]			   [nvarchar](5)	null
  , [BAMNG]			   [decimal](13, 3) null
  , [CHARG]			   [nvarchar](10)	null
  , [BLDAT]			   [datetime]		null
  , [XWOFF]			   [nvarchar](1)	null
  , [XUNPL]			   [nvarchar](1)	null
  , [ERNAM]			   [nvarchar](12)	null
  , [SRVPOS]		   [nvarchar](18)	null
  , [PACKNO]		   [nvarchar](10)	null
  , [INTROW]		   [nvarchar](10)	null
  , [BEKKN]			   [nvarchar](2)	null
  , [LEMIN]			   [nvarchar](1)	null
  , [AREWB]			   [decimal](13, 2) null
  , [REWRB]			   [decimal](13, 2) null
  , [SAPRL]			   [nvarchar](4)	null
  , [MENGE_POP]		   [decimal](13, 3) null
  , [BPMNG_POP]		   [decimal](13, 3) null
  , [DMBTR_POP]		   [decimal](13, 2) null
  , [WRBTR_POP]		   [decimal](13, 2) null
  , [WESBB]			   [decimal](13, 3) null
  , [BPWEB]			   [decimal](13, 3) null
  , [WEORA]			   [nvarchar](1)	null
  , [AREWR_POP]		   [decimal](13, 2) null
  , [KUDIF]			   [decimal](13, 2) null
  , [RETAMT_FC]		   [decimal](13, 2) null
  , [RETAMT_LC]		   [decimal](13, 2) null
  , [RETAMTP_FC]	   [decimal](13, 2) null
  , [RETAMTP_LC]	   [decimal](13, 2) null
  , [XMACC]			   [nvarchar](1)	null
  , [WKURS]			   [decimal](9, 5)	null
  , [VBELN_ST]		   [nvarchar](10)	null
  , [VBELP_ST]		   [nvarchar](6)	null
  , [ET_UPD]		   [nvarchar](1)	null
  , [J_SC_DIE_COMP_F]  [nvarchar](1)	null
) ;
go
print N'Creating index [tsa_ics_land_SAP_GBR_EKBE_1] on [tsa].[ics_land_SAP_GBR_EKBE]' ;
go
create clustered index [tsa_ics_land_SAP_GBR_EKBE_1]
on [tsa].[ics_land_SAP_GBR_EKBE] ([BELNR], [EBELN], [MANDT], [EBELP], [BUZEI], [GJAHR], [VGABE], [ZEKKN]) ;
go
print N'Creating [tsa].[ics_land_SAP_GBR_MARM]' ;
go
create table [tsa].[ics_land_SAP_GBR_MARM]
(
	[EtlBatchRunId]	   [int]			not null
  , [EtlStepRunId]	   [int]			not null
  , [EtlThreadRunId]   [int]			not null
  , [DataSourceKey]	   [int]			not null
  , [EtlSourceTable]   [varchar](200)	not null
  , [EtlCreatedOn]	   [datetime]		not null
  , [EtlCreatedBy]	   [varchar](200)	not null
  , [ExcludeFromMerge] [bit]			not null constraint [DF_tsa_ics_land_SAP_GBR_MARM_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]			not null constraint [DF_tsa_ics_land_SAP_GBR_MARM_IsDuplicate] default ((0))
  , [ATINN]			   [nvarchar](10)	null
  , [BFLME_MARM]	   [nvarchar](1)	null
  , [BREIT]			   [decimal](18, 0) null
  , [BRGEW]			   [decimal](18, 0) null
  , [CAPAUSE]		   [decimal](18, 0) null
  , [EAN11]			   [nvarchar](18)	null
  , [EANNR]			   [nvarchar](13)	null
  , [GEWEI]			   [nvarchar](3)	null
  , [GTIN_VARIANT]	   [nvarchar](2)	null
  , [HOEHE]			   [decimal](18, 0) null
  , [KZWSO]			   [nvarchar](1)	null
  , [LAENG]			   [decimal](18, 0) null
  , [MANDT]			   [nvarchar](3)	null
  , [MATNR]			   [nvarchar](18)	null
  , [MAX_STACK]		   [smallint]		null
  , [MEABM]			   [nvarchar](3)	null
  , [MEINH]			   [nvarchar](3)	null
  , [MESRT]			   [nvarchar](2)	null
  , [MESUB]			   [nvarchar](3)	null
  , [MSEHI]			   [nvarchar](3)	null
  , [NEST_FTR]		   [decimal](18, 0) null
  , [NUMTP]			   [nvarchar](2)	null
  , [TY2TQ]			   [nvarchar](1)	null
  , [UMREN]			   [decimal](18, 0) null
  , [UMREZ]			   [decimal](18, 0) null
  , [VOLEH]			   [nvarchar](3)	null
  , [VOLUM]			   [decimal](18, 0) null
  , [XBEWW]			   [nvarchar](1)	null
  , [XFHDW]			   [nvarchar](1)	null
) ;
go
print N'Creating index [tsa_ics_land_SAP_GBR_MARM_1] on [tsa].[ics_land_SAP_GBR_MARM]' ;
go
create clustered index [tsa_ics_land_SAP_GBR_MARM_1]
on [tsa].[ics_land_SAP_GBR_MARM] ([MATNR], [MEINH]) ;
go
print N'Creating [tsa].[ics_land_SAP_GBR_LIKP]' ;
go
create table [tsa].[ics_land_SAP_GBR_LIKP]
(
	[EtlBatchRunId]	   [int]			not null
  , [EtlStepRunId]	   [int]			not null
  , [EtlThreadRunId]   [int]			not null
  , [DataSourceKey]	   [int]			not null
  , [EtlSourceTable]   [varchar](200)	not null
  , [EtlCreatedOn]	   [datetime]		not null
  , [EtlCreatedBy]	   [varchar](200)	not null
  , [ExcludeFromMerge] [bit]			not null constraint [DF_tsa_ics_land_SAP_GBR_LIKP_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]			not null constraint [DF_tsa_ics_land_SAP_GBR_LIKP_IsDuplicate] default ((0))
  , [_BEV1_LULEINH]	   [nvarchar](8)	null
  , [_BEV1_RPCONT]	   [decimal](18, 0) null
  , [_BEV1_RPFAESS]	   [decimal](18, 0) null
  , [_BEV1_RPFLGNR]	   [nvarchar](5)	null
  , [_BEV1_RPKIST]	   [decimal](18, 0) null
  , [_BEV1_RPSONST]	   [decimal](18, 0) null
  , [ABLAD]			   [nvarchar](25)	null
  , [ABSSC]			   [nvarchar](6)	null
  , [AEDAT]			   [datetime]		null
  , [AENAM]			   [nvarchar](12)	null
  , [AKKUR]			   [decimal](18, 0) null
  , [AKPRZ]			   [decimal](18, 0) null
  , [AKWAE]			   [nvarchar](5)	null
  , [AMTBL]			   [decimal](18, 0) null
  , [ANZPK]			   [nvarchar](5)	null
  , [AULWE]			   [nvarchar](10)	null
  , [AUTLF]			   [nvarchar](1)	null
  , [BEROT]			   [nvarchar](20)	null
  , [BLDAT]			   [datetime]		null
  , [BOLNR]			   [nvarchar](35)	null
  , [BORGR_GRP]		   [nvarchar](35)	null
  , [BTGEW]			   [decimal](18, 0) null
  , [BZIRK]			   [nvarchar](6)	null
  , [CMFRE]			   [datetime]		null
  , [CMNGV]			   [datetime]		null
  , [CMWAE]			   [nvarchar](5)	null
  , [COMMN]			   [nvarchar](5)	null
  , [CONT_DG]		   [nvarchar](1)	null
  , [CTLPC]			   [nvarchar](3)	null
  , [DIRTA]			   [nvarchar](1)	null
  , [DLV_SPLIT_INITIA] [nvarchar](1)	null
  , [DLV_VERSION]	   [nvarchar](4)	null
  , [ERDAT]			   [datetime]		null
  , [ERNAM]			   [nvarchar](12)	null
  , [ERZET]			   [datetime]		null
  , [EXNUM]			   [nvarchar](10)	null
  , [EXPKZ]			   [nvarchar](1)	null
  , [FAKSK]			   [nvarchar](2)	null
  , [FKAIV]			   [nvarchar](4)	null
  , [FKARV]			   [nvarchar](4)	null
  , [FKDAT]			   [datetime]		null
  , [FKDIV]			   [datetime]		null
  , [FOLAR]			   [nvarchar](4)	null
  , [GEWEI]			   [nvarchar](3)	null
  , [GRULG]			   [nvarchar](4)	null
  , [GRUPP]			   [nvarchar](4)	null
  , [HANDLE]		   [nvarchar](22)	null
  , [IMWRK]			   [nvarchar](1)	null
  , [INCO1]			   [nvarchar](3)	null
  , [INCO2]			   [nvarchar](28)	null
  , [KALSM]			   [nvarchar](6)	null
  , [KALSM_CH]		   [nvarchar](6)	null
  , [KALSP]			   [nvarchar](6)	null
  , [KDGRP]			   [nvarchar](2)	null
  , [KKBER]			   [nvarchar](4)	null
  , [KLIEF]			   [nvarchar](1)	null
  , [KNFAK]			   [nvarchar](2)	null
  , [KNKLI]			   [nvarchar](10)	null
  , [KNUMP]			   [nvarchar](10)	null
  , [KNUMV]			   [nvarchar](10)	null
  , [KODAT]			   [datetime]		null
  , [KOUHR]			   [datetime]		null
  , [KUNAG]			   [nvarchar](10)	null
  , [KUNIV]			   [nvarchar](10)	null
  , [KUNNR]			   [nvarchar](10)	null
  , [KZAZU]			   [nvarchar](1)	null
  , [KZWAB]			   [nvarchar](1)	null
  , [LCNUM]			   [nvarchar](10)	null
  , [LDDAT]			   [datetime]		null
  , [LDUHR]			   [datetime]		null
  , [LFART]			   [nvarchar](4)	null
  , [LFDAT]			   [datetime]		null
  , [LFUHR]			   [datetime]		null
  , [LGBZO]			   [nvarchar](10)	null
  , [LGNUM]			   [nvarchar](3)	null
  , [LGTOR]			   [nvarchar](3)	null
  , [LIFEX]			   [nvarchar](35)	null
  , [LIFNR]			   [nvarchar](10)	null
  , [LIFSK]			   [nvarchar](2)	null
  , [LISPL]			   [nvarchar](1)	null
  , [LOC_GUID]		   [binary](16)		null
  , [LPRIO]			   [nvarchar](2)	null
  , [LSTEL]			   [nvarchar](2)	null
  , [MANDT]			   [nvarchar](3)	null
  , [MSR_ACTIVE]	   [nvarchar](1)	null
  , [NETWR]			   [decimal](18, 0) null
  , [NTGEW]			   [decimal](18, 0) null
  , [PERFK]			   [nvarchar](2)	null
  , [PIOIV]			   [nvarchar](2)	null
  , [PODAT]			   [datetime]		null
  , [POTIM]			   [datetime]		null
  , [PRINTER_PROFILE]  [nvarchar](10)	null
  , [PROLI]			   [nvarchar](3)	null
  , [PRTNR]			   [nvarchar](10)	null
  , [PRVBE]			   [nvarchar](10)	null
  , [ROUTA]			   [nvarchar](6)	null
  , [ROUTE]			   [nvarchar](6)	null
  , [SAKES]			   [nvarchar](1)	null
  , [SBGRP]			   [nvarchar](3)	null
  , [SDABW]			   [nvarchar](4)	null
  , [SPAIV]			   [nvarchar](2)	null
  , [SPE_ACC_APP_STS]  [nvarchar](1)	null
  , [SPE_BILLING_IND]  [nvarchar](1)	null
  , [SPE_CARRIER_IND]  [nvarchar](1)	null
  , [SPE_CHNG_SYS]	   [nvarchar](1)	null
  , [SPE_GEOROUTE]	   [nvarchar](10)	null
  , [SPE_GEOROUTEIND]  [nvarchar](1)	null
  , [SPE_GTS_REL]	   [nvarchar](2)	null
  , [SPE_GTS_RT_CDE]   [nvarchar](10)	null
  , [SPE_INV_BFR_GI]   [nvarchar](1)	null
  , [SPE_LE_SCENARIO]  [nvarchar](1)	null
  , [SPE_LIFEX_TYPE]   [nvarchar](1)	null
  , [SPE_LOC_SEQ]	   [nvarchar](3)	null
  , [SPE_LOEKZ]		   [nvarchar](1)	null
  , [SPE_ORIG_SYS]	   [nvarchar](1)	null
  , [SPE_PRO_NUMBER]   [nvarchar](35)	null
  , [SPE_QI_STATUS]	   [nvarchar](1)	null
  , [SPE_RED_IND]	   [nvarchar](1)	null
  , [SPE_REL_TMSTMP]   [decimal](18, 0) null
  , [SPE_RET_CANC]	   [nvarchar](1)	null
  , [SPE_REV_VLSTK]	   [nvarchar](1)	null
  , [SPE_SHP_INF_STS]  [nvarchar](1)	null
  , [SPE_TTYPE]		   [nvarchar](10)	null
  , [SPE_UNIT_SYSTEM]  [nvarchar](10)	null
  , [SPE_WAUHR_IST]	   [datetime]		null
  , [SPE_WAZONE_IST]   [nvarchar](6)	null
  , [STAFO]			   [nvarchar](6)	null
  , [STCUR]			   [decimal](18, 0) null
  , [STGE_LOC_CHANGE]  [nvarchar](1)	null
  , [STWAE]			   [nvarchar](5)	null
  , [STZKL]			   [decimal](18, 0) null
  , [STZZU]			   [decimal](18, 0) null
  , [TCODE]			   [nvarchar](20)	null
  , [TDDAT]			   [datetime]		null
  , [TDUHR]			   [datetime]		null
  , [TERNR]			   [nvarchar](12)	null
  , [TM_CTRL_KEY]	   [nvarchar](4)	null
  , [TPGRP]			   [nvarchar](2)	null
  , [TPQUA]			   [nvarchar](1)	null
  , [TPSID]			   [nvarchar](5)	null
  , [TRAGR]			   [nvarchar](4)	null
  , [TRAID]			   [nvarchar](20)	null
  , [TRATY]			   [nvarchar](4)	null
  , [TRMTYP]		   [nvarchar](18)	null
  , [TRSPG]			   [nvarchar](2)	null
  , [TSEGFL]		   [nvarchar](1)	null
  , [TSEGTP]		   [nvarchar](10)	null
  , [TZONIS]		   [nvarchar](6)	null
  , [TZONRC]		   [nvarchar](6)	null
  , [VBEAK]			   [decimal](18, 0) null
  , [VBELN]			   [nvarchar](10)	null
  , [VBTYP]			   [nvarchar](1)	null
  , [VBUND]			   [nvarchar](6)	null
  , [VERUR]			   [nvarchar](35)	null
  , [VERURSYS]		   [nvarchar](10)	null
  , [VGANZ]			   [bigint]			null
  , [VKBUR]			   [nvarchar](4)	null
  , [VKOIV]			   [nvarchar](4)	null
  , [VKORG]			   [nvarchar](4)	null
  , [VLSTK]			   [nvarchar](1)	null
  , [VOLEH]			   [nvarchar](3)	null
  , [VOLUM]			   [decimal](18, 0) null
  , [VSART]			   [nvarchar](2)	null
  , [VSBED]			   [nvarchar](2)	null
  , [VSTEL]			   [nvarchar](4)	null
  , [VTWIV]			   [nvarchar](2)	null
  , [WADAT]			   [datetime]		null
  , [WADAT_IST]		   [datetime]		null
  , [WAERK]			   [nvarchar](5)	null
  , [WAUHR]			   [datetime]		null
  , [WERKS]			   [nvarchar](4)	null
  , [XABLN]			   [nvarchar](10)	null
  , [XBLNR]			   [nvarchar](25)	null
  , [XWOFF]			   [nvarchar](1)	null
  , [ZUKRL]			   [nvarchar](40)	null
) ;
go
print N'Creating index [tsa_ics_land_SAP_GBR_LIKP_1] on [tsa].[ics_land_SAP_GBR_LIKP]' ;
go
create clustered index [tsa_ics_land_SAP_GBR_LIKP_1]
on [tsa].[ics_land_SAP_GBR_LIKP] ([VBELN]) ;
go
print N'Creating [tsa].[ics_land_SAP_GBR_LFB1]' ;
go
create table [tsa].[ics_land_SAP_GBR_LFB1]
(
	[EtlBatchRunId]	   [int]			not null
  , [EtlStepRunId]	   [int]			not null
  , [EtlThreadRunId]   [int]			not null
  , [DataSourceKey]	   [int]			not null
  , [EtlSourceTable]   [varchar](200)	not null
  , [EtlCreatedOn]	   [datetime]		not null
  , [EtlCreatedBy]	   [varchar](200)	not null
  , [ExcludeFromMerge] [bit]			not null constraint [DF_tsa_ics_land_SAP_GBR_LFB1_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]			not null constraint [DF_tsa_ics_land_SAP_GBR_LFB1_IsDuplicate] default ((0))
  , [AD_HASH]		   [nvarchar](10)	null
  , [AKONT]			   [nvarchar](10)	null
  , [ALTKN]			   [nvarchar](10)	null
  , [ASSIGN_TEST]	   [nvarchar](4)	null
  , [AVSND]			   [nvarchar](1)	null
  , [BASIS_PNT]		   [decimal](18, 0) null
  , [BEGRU]			   [nvarchar](4)	null
  , [BLNKZ]			   [nvarchar](2)	null
  , [BUKRS]			   [nvarchar](4)	null
  , [BUSAB]			   [nvarchar](2)	null
  , [CERDT]			   [datetime]		null
  , [CIIUCODE]		   [nvarchar](4)	null
  , [CONFS]			   [nvarchar](1)	null
  , [DATLZ]			   [datetime]		null
  , [EIKTO]			   [nvarchar](12)	null
  , [ERDAT]			   [datetime]		null
  , [ERNAM]			   [nvarchar](12)	null
  , [FDGRV]			   [nvarchar](10)	null
  , [FRGRP]			   [nvarchar](4)	null
  , [GMVKZK]		   [nvarchar](1)	null
  , [GRICD]			   [nvarchar](2)	null
  , [GRIDT]			   [nvarchar](2)	null
  , [GUZTE]			   [nvarchar](4)	null
  , [HBKID]			   [nvarchar](5)	null
  , [INTAD]			   [nvarchar](130)	null
  , [J_SC_COMPDATE]	   [nvarchar](3)	null
  , [J_SC_OFFSM]	   [nvarchar](1)	null
  , [J_SC_OFFSR]	   [nvarchar](3)	null
  , [J_SC_SUBCONTYPE]  [nvarchar](1)	null
  , [KULTG]			   [decimal](18, 0) null
  , [KVERM]			   [nvarchar](30)	null
  , [LIFNR]			   [nvarchar](10)	null
  , [LNRZB]			   [nvarchar](10)	null
  , [LNRZE]			   [nvarchar](10)	null
  , [LOEVM]			   [nvarchar](1)	null
  , [MANDT]			   [nvarchar](3)	null
  , [MGRUP]			   [nvarchar](2)	null
  , [MINDK]			   [nvarchar](3)	null
  , [NODEL]			   [nvarchar](1)	null
  , [PERNR]			   [nvarchar](8)	null
  , [PREPAY_RELEVANT]  [nvarchar](1)	null
  , [QLAND]			   [nvarchar](3)	null
  , [QSBGR]			   [nvarchar](1)	null
  , [QSREC]			   [nvarchar](2)	null
  , [QSSKZ]			   [nvarchar](2)	null
  , [QSZDT]			   [datetime]		null
  , [QSZNR]			   [nvarchar](10)	null
  , [REPRF]			   [nvarchar](1)	null
  , [SPERR]			   [nvarchar](1)	null
  , [TLFNS]			   [nvarchar](30)	null
  , [TLFXS]			   [nvarchar](31)	null
  , [TOGRR]			   [nvarchar](4)	null
  , [TOGRU]			   [nvarchar](4)	null
  , [UPDAT]			   [datetime]		null
  , [UPTIM]			   [datetime]		null
  , [UZAWE]			   [nvarchar](2)	null
  , [VZSKZ]			   [nvarchar](2)	null
  , [WEBTR]			   [decimal](18, 0) null
  , [XAUSZ]			   [nvarchar](1)	null
  , [XDEZV]			   [nvarchar](1)	null
  , [XEDIP]			   [nvarchar](1)	null
  , [XLFZB]			   [nvarchar](1)	null
  , [XPORE]			   [nvarchar](1)	null
  , [XVERR]			   [nvarchar](1)	null
  , [ZAHLS]			   [nvarchar](1)	null
  , [ZGRUP]			   [nvarchar](2)	null
  , [ZINDT]			   [datetime]		null
  , [ZINRT]			   [nvarchar](2)	null
  , [ZSABE]			   [nvarchar](15)	null
  , [ZTERM]			   [nvarchar](4)	null
  , [ZUAWA]			   [nvarchar](3)	null
  , [ZWELS]			   [nvarchar](10)	null
) ;
go
print N'Creating index [tsa_ics_land_SAP_GBR_LFB1_1] on [tsa].[ics_land_SAP_GBR_LFB1]' ;
go
create clustered index [tsa_ics_land_SAP_GBR_LFB1_1]
on [tsa].[ics_land_SAP_GBR_LFB1] ([LIFNR], [BUKRS]) ;
go
print N'Creating [tsa].[ics_land_SAP_GBR_LFA1]' ;
go
create table [tsa].[ics_land_SAP_GBR_LFA1]
(
	[EtlBatchRunId]	   [int]			not null
  , [EtlStepRunId]	   [int]			not null
  , [EtlThreadRunId]   [int]			not null
  , [DataSourceKey]	   [int]			not null
  , [EtlSourceTable]   [varchar](200)	not null
  , [EtlCreatedOn]	   [datetime]		not null
  , [EtlCreatedBy]	   [varchar](200)	not null
  , [ExcludeFromMerge] [bit]			not null constraint [DF_tsa_ics_land_SAP_GBR_LFA1_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]			not null constraint [DF_tsa_ics_land_SAP_GBR_LFA1_IsDuplicate] default ((0))
  , [ACTSS]			   [nvarchar](3)	null
  , [ADRNR]			   [nvarchar](10)	null
  , [ALC]			   [nvarchar](8)	null
  , [ANRED]			   [nvarchar](15)	null
  , [BAHNS]			   [nvarchar](25)	null
  , [BBBNR]			   [nvarchar](7)	null
  , [BBSNR]			   [nvarchar](5)	null
  , [BEGRU]			   [nvarchar](4)	null
  , [BRSCH]			   [nvarchar](4)	null
  , [BUBKZ]			   [nvarchar](1)	null
  , [CARRIER_CONF]	   [nvarchar](1)	null
  , [CNAE]			   [nvarchar](7)	null
  , [COMSIZE]		   [nvarchar](2)	null
  , [CONFS]			   [nvarchar](1)	null
  , [CRC_NUM]		   [nvarchar](25)	null
  , [CRTN]			   [nvarchar](1)	null
  , [DATLT]			   [nvarchar](14)	null
  , [DECREGPC]		   [nvarchar](2)	null
  , [DLGRP]			   [nvarchar](4)	null
  , [DTAMS]			   [nvarchar](1)	null
  , [DTAWS]			   [nvarchar](2)	null
  , [DUEFL]			   [nvarchar](1)	null
  , [EMNFR]			   [nvarchar](10)	null
  , [ERDAT]			   [datetime]		null
  , [ERNAM]			   [nvarchar](12)	null
  , [ESRNR]			   [nvarchar](11)	null
  , [EXP]			   [nvarchar](3)	null
  , [FISKN]			   [nvarchar](10)	null
  , [FISKU]			   [nvarchar](10)	null
  , [FITYP]			   [nvarchar](2)	null
  , [GBDAT]			   [datetime]		null
  , [GBORT]			   [nvarchar](25)	null
  , [ICMSTAXPAY]	   [nvarchar](2)	null
  , [INDTYP]		   [nvarchar](2)	null
  , [IPISP]			   [nvarchar](1)	null
  , [J_1KFREPRE]	   [nvarchar](10)	null
  , [J_1KFTBUS]		   [nvarchar](30)	null
  , [J_1KFTIND]		   [nvarchar](30)	null
  , [J_SC_CAPITAL]	   [decimal](18, 0) null
  , [J_SC_CURRENCY]	   [nvarchar](5)	null
  , [KONZS]			   [nvarchar](10)	null
  , [KRAUS]			   [nvarchar](11)	null
  , [KTOCK]			   [nvarchar](4)	null
  , [KTOKK]			   [nvarchar](4)	null
  , [KUNNR]			   [nvarchar](10)	null
  , [LAND1]			   [nvarchar](3)	null
  , [LEGALNAT]		   [nvarchar](4)	null
  , [LFURL]			   [nvarchar](132)	null
  , [LIFNR]			   [nvarchar](10)	null
  , [LNRZA]			   [nvarchar](10)	null
  , [LOEVM]			   [nvarchar](1)	null
  , [LTSNA]			   [nvarchar](1)	null
  , [LZONE]			   [nvarchar](10)	null
  , [MANDT]			   [nvarchar](3)	null
  , [MCOD1]			   [nvarchar](25)	null
  , [MCOD2]			   [nvarchar](25)	null
  , [MCOD3]			   [nvarchar](25)	null
  , [MIN_COMP]		   [nvarchar](1)	null
  , [NAME1]			   [nvarchar](35)	null
  , [NAME2]			   [nvarchar](35)	null
  , [NAME3]			   [nvarchar](35)	null
  , [NAME4]			   [nvarchar](35)	null
  , [NODEL]			   [nvarchar](1)	null
  , [ORT01]			   [nvarchar](35)	null
  , [ORT02]			   [nvarchar](35)	null
  , [PFACH]			   [nvarchar](10)	null
  , [PFORT]			   [nvarchar](35)	null
  , [PLKAL]			   [nvarchar](2)	null
  , [PMT_OFFICE]	   [nvarchar](5)	null
  , [PODKZB]		   [nvarchar](1)	null
  , [PROFS]			   [nvarchar](30)	null
  , [PSOFG]			   [nvarchar](10)	null
  , [PSOHS]			   [nvarchar](6)	null
  , [PSOIS]			   [nvarchar](20)	null
  , [PSON1]			   [nvarchar](35)	null
  , [PSON2]			   [nvarchar](35)	null
  , [PSON3]			   [nvarchar](35)	null
  , [PSOST]			   [nvarchar](28)	null
  , [PSOTL]			   [nvarchar](20)	null
  , [PSOVN]			   [nvarchar](35)	null
  , [PSTL2]			   [nvarchar](10)	null
  , [PSTLZ]			   [nvarchar](10)	null
  , [QSSYS]			   [nvarchar](4)	null
  , [QSSYSDAT]		   [datetime]		null
  , [REGIO]			   [nvarchar](3)	null
  , [REGSS]			   [nvarchar](1)	null
  , [REVDB]			   [datetime]		null
  , [RG]			   [nvarchar](11)	null
  , [RGDATE]		   [datetime]		null
  , [RIC]			   [nvarchar](11)	null
  , [RNE]			   [nvarchar](10)	null
  , [RNEDATE]		   [datetime]		null
  , [SCACD]			   [nvarchar](4)	null
  , [SCHEDULING_TYPE]  [nvarchar](1)	null
  , [SEXKZ]			   [nvarchar](1)	null
  , [SFRGR]			   [nvarchar](4)	null
  , [SORTL]			   [nvarchar](10)	null
  , [SPERM]			   [nvarchar](1)	null
  , [SPERQ]			   [nvarchar](2)	null
  , [SPERR]			   [nvarchar](1)	null
  , [SPERZ]			   [nvarchar](1)	null
  , [SPRAS]			   [nvarchar](1)	null
  , [STAGING_TIME]	   [decimal](18, 0) null
  , [STCD1]			   [nvarchar](16)	null
  , [STCD2]			   [nvarchar](11)	null
  , [STCD3]			   [nvarchar](18)	null
  , [STCD4]			   [nvarchar](18)	null
  , [STCD5]			   [nvarchar](60)	null
  , [STCDT]			   [nvarchar](2)	null
  , [STCEG]			   [nvarchar](20)	null
  , [STENR]			   [nvarchar](18)	null
  , [STGDL]			   [nvarchar](2)	null
  , [STKZA]			   [nvarchar](1)	null
  , [STKZN]			   [nvarchar](1)	null
  , [STKZU]			   [nvarchar](1)	null
  , [STRAS]			   [nvarchar](35)	null
  , [SUBMI_RELEVANT]   [nvarchar](1)	null
  , [TAXBS]			   [nvarchar](1)	null
  , [TDT]			   [nvarchar](2)	null
  , [TELBX]			   [nvarchar](15)	null
  , [TELF1]			   [nvarchar](16)	null
  , [TELF2]			   [nvarchar](16)	null
  , [TELFX]			   [nvarchar](31)	null
  , [TELTX]			   [nvarchar](30)	null
  , [TELX1]			   [nvarchar](30)	null
  , [TERM_LI]		   [nvarchar](1)	null
  , [TRANSPORT_CHAIN]  [nvarchar](10)	null
  , [TXJCD]			   [nvarchar](15)	null
  , [UF]			   [nvarchar](2)	null
  , [UPDAT]			   [datetime]		null
  , [UPTIM]			   [datetime]		null
  , [VBUND]			   [nvarchar](6)	null
  , [WERKR]			   [nvarchar](1)	null
  , [WERKS]			   [nvarchar](4)	null
  , [XCPDK]			   [nvarchar](1)	null
  , [XLFZA]			   [nvarchar](1)	null
  , [XZEMP]			   [nvarchar](1)	null
) ;
go
print N'Creating index [tsa_ics_land_SAP_GBR_LFA1_1] on [tsa].[ics_land_SAP_GBR_LFA1]' ;
go
create clustered index [tsa_ics_land_SAP_GBR_LFA1_1]
on [tsa].[ics_land_SAP_GBR_LFA1] ([LIFNR]) ;
go
print N'Creating [tsa].[ics_land_SAP_GBR_EKET]' ;
go
create table [tsa].[ics_land_SAP_GBR_EKET]
(
	[EtlBatchRunId]	   [int]			not null
  , [EtlStepRunId]	   [int]			not null
  , [EtlThreadRunId]   [int]			not null
  , [DataSourceKey]	   [int]			not null
  , [EtlSourceTable]   [varchar](200)	not null
  , [EtlCreatedOn]	   [datetime]		not null
  , [EtlCreatedBy]	   [varchar](200)	not null
  , [ExcludeFromMerge] [bit]			not null constraint [DF_tsa_ics_land_SAP_GBR_EKET_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]			not null constraint [DF_tsa_ics_land_SAP_GBR_EKET_IsDuplicate] default ((0))
  , [ABART]			   [nvarchar](1)	null
  , [ALTDT]			   [datetime]		null
  , [AMENG]			   [decimal](18, 0) null
  , [ANZSN]			   [bigint]			null
  , [AULWE]			   [nvarchar](10)	null
  , [BANFN]			   [nvarchar](10)	null
  , [BEDAT]			   [datetime]		null
  , [BNFPO]			   [nvarchar](5)	null
  , [BUDG_TYPE]		   [nvarchar](2)	null
  , [CD_LOCNO]		   [nvarchar](20)	null
  , [CD_LOCTYPE]	   [nvarchar](4)	null
  , [CHARG]			   [nvarchar](10)	null
  , [CHECK_TYPE]	   [nvarchar](1)	null
  , [CHKOM]			   [nvarchar](1)	null
  , [CNCL_ANCMNT_DONE] [nvarchar](1)	null
  , [DABMG]			   [decimal](18, 0) null
  , [DAT01]			   [datetime]		null
  , [DATESHIFT_NUMBER] [decimal](18, 0) null
  , [DL_ID]			   [nvarchar](22)	null
  , [DNG_DATE]		   [datetime]		null
  , [DNG_TIME]		   [datetime]		null
  , [EBELN]			   [nvarchar](10)	null
  , [EBELP]			   [nvarchar](5)	null
  , [EINDT]			   [datetime]		null
  , [ELDAT]			   [datetime]		null
  , [ELUHR]			   [datetime]		null
  , [ESTKZ]			   [nvarchar](1)	null
  , [ETENR]			   [nvarchar](4)	null
  , [FIXKZ]			   [nvarchar](1)	null
  , [GEO_ROUTE]		   [nvarchar](10)	null
  , [GLMNG]			   [decimal](18, 0) null
  , [GTS_IND]		   [nvarchar](2)	null
  , [HANDOVER_DATE]	   [datetime]		null
  , [KEY_ID]		   [nvarchar](16)	null
  , [LDDAT]			   [datetime]		null
  , [LDUHR]			   [datetime]		null
  , [LICHA]			   [nvarchar](15)	null
  , [LPEIN]			   [nvarchar](1)	null
  , [MAHNZ]			   [decimal](18, 0) null
  , [MANDT]			   [nvarchar](3)	null
  , [MBDAT]			   [datetime]		null
  , [MBUHR]			   [datetime]		null
  , [MENGE]			   [decimal](18, 0) null
  , [MNG02]			   [decimal](18, 0) null
  , [NO_SCEM]		   [nvarchar](1)	null
  , [NODISP]		   [nvarchar](1)	null
  , [OTB_CURR]		   [nvarchar](5)	null
  , [OTB_REASON]	   [nvarchar](3)	null
  , [OTB_RES_VALUE]	   [decimal](18, 0) null
  , [OTB_SPEC_VALUE]   [decimal](18, 0) null
  , [OTB_STATUS]	   [nvarchar](1)	null
  , [OTB_VALUE]		   [decimal](18, 0) null
  , [QUNUM]			   [nvarchar](10)	null
  , [QUPOS]			   [nvarchar](3)	null
  , [ROUTE_GTS]		   [nvarchar](10)	null
  , [RSNUM]			   [nvarchar](10)	null
  , [SERNR]			   [nvarchar](8)	null
  , [SLFDT]			   [datetime]		null
  , [SPR_RSN_PROFILE]  [nvarchar](4)	null
  , [TDDAT]			   [datetime]		null
  , [TDUHR]			   [datetime]		null
  , [TSP]			   [nvarchar](10)	null
  , [UZEIT]			   [datetime]		null
  , [VERID]			   [nvarchar](4)	null
  , [WADAT]			   [datetime]		null
  , [WAMNG]			   [decimal](18, 0) null
  , [WAUHR]			   [datetime]		null
  , [WEMNG]			   [decimal](18, 0) null
) ;
go
print N'Creating index [tsa_ics_land_SAP_GBR_EKET_1] on [tsa].[ics_land_SAP_GBR_EKET]' ;
go
create clustered index [tsa_ics_land_SAP_GBR_EKET_1]
on [tsa].[ics_land_SAP_GBR_EKET] ([EBELN], [EBELP], [ETENR]) ;
go
print N'Creating [tsa].[ics_land_SAP_GBR_EKKO]' ;
go
create table [tsa].[ics_land_SAP_GBR_EKKO]
(
	[EtlBatchRunId]	   [int]			not null
  , [EtlStepRunId]	   [int]			not null
  , [EtlThreadRunId]   [int]			not null
  , [DataSourceKey]	   [int]			not null
  , [EtlSourceTable]   [varchar](200)	not null
  , [EtlCreatedOn]	   [datetime]		not null
  , [EtlCreatedBy]	   [varchar](200)	not null
  , [ExcludeFromMerge] [bit]			not null constraint [DF_tsa_ics_land_SAP_GBR_EKKO_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]			not null constraint [DF_tsa_ics_land_SAP_GBR_EKKO_IsDuplicate] default ((0))
  , [ABGRU]			   [nvarchar](2)	null
  , [ABSGR]			   [nvarchar](2)	null
  , [ADDNR]			   [nvarchar](10)	null
  , [ADRNR]			   [nvarchar](10)	null
  , [AEDAT]			   [datetime]		null
  , [ANGDT]			   [datetime]		null
  , [ANGNR]			   [nvarchar](10)	null
  , [AUREL_ALLOW]	   [nvarchar](1)	null
  , [AUSNR]			   [nvarchar](10)	null
  , [AUTLF]			   [nvarchar](1)	null
  , [BEDAT]			   [datetime]		null
  , [BNDDT]			   [datetime]		null
  , [BSAKZ]			   [nvarchar](1)	null
  , [BSART]			   [nvarchar](4)	null
  , [BSTYP]			   [nvarchar](1)	null
  , [BUDG_TYPE]		   [nvarchar](2)	null
  , [BUKRS]			   [nvarchar](4)	null
  , [BWBDT]			   [datetime]		null
  , [CHECK_TYPE]	   [nvarchar](1)	null
  , [CON_DISTR_LEV]	   [nvarchar](1)	null
  , [CON_OTB_REQ]	   [nvarchar](1)	null
  , [CON_PREBOOK_LEV]  [nvarchar](1)	null
  , [CONTRACT_ALLOW]   [nvarchar](1)	null
  , [DELPER_ALLOW]	   [nvarchar](1)	null
  , [DESCRIPTION]	   [nvarchar](40)	null
  , [DPAMT]			   [decimal](18, 0) null
  , [DPDAT]			   [datetime]		null
  , [DPPCT]			   [decimal](18, 0) null
  , [DPTYP]			   [nvarchar](4)	null
  , [EBELN]			   [nvarchar](10)	null
  , [EINDT_ALLOW]	   [nvarchar](1)	null
  , [EKGRP]			   [nvarchar](3)	null
  , [EKGRP_ALLOW]	   [nvarchar](1)	null
  , [EKORG]			   [nvarchar](4)	null
  , [EQ_EINDT]		   [datetime]		null
  , [EQ_WERKS]		   [nvarchar](4)	null
  , [ERNAM]			   [nvarchar](12)	null
  , [EXNUM]			   [nvarchar](10)	null
  , [FIXPO]			   [nvarchar](1)	null
  , [FIXPO_ALLOW]	   [nvarchar](1)	null
  , [FORCE_CNT]		   [nvarchar](6)	null
  , [FORCE_ID]		   [nvarchar](32)	null
  , [FRGGR]			   [nvarchar](2)	null
  , [FRGKE]			   [nvarchar](1)	null
  , [FRGRL]			   [nvarchar](1)	null
  , [FRGSX]			   [nvarchar](2)	null
  , [FRGZU]			   [nvarchar](8)	null
  , [GWLDT]			   [datetime]		null
  , [HIERARCHY_EXISTS] [nvarchar](1)	null
  , [IHRAN]			   [datetime]		null
  , [IHREZ]			   [nvarchar](12)	null
  , [INCO1]			   [nvarchar](3)	null
  , [INCO2]			   [nvarchar](28)	null
  , [KALSM]			   [nvarchar](6)	null
  , [KDATB]			   [datetime]		null
  , [KDATE]			   [datetime]		null
  , [KEY_ID]		   [nvarchar](16)	null
  , [KEY_ID_ALLOW]	   [nvarchar](1)	null
  , [KNUMV]			   [nvarchar](10)	null
  , [KONNR]			   [nvarchar](10)	null
  , [KORNR]			   [nvarchar](1)	null
  , [KTWRT]			   [decimal](18, 0) null
  , [KUFIX]			   [nvarchar](1)	null
  , [KUNNR]			   [nvarchar](10)	null
  , [LANDS]			   [nvarchar](3)	null
  , [LBLIF]			   [nvarchar](10)	null
  , [LEGAL_CONTRACT]   [nvarchar](40)	null
  , [LIFNR]			   [nvarchar](10)	null
  , [LIFRE]			   [nvarchar](10)	null
  , [LLIEF]			   [nvarchar](10)	null
  , [LOEKZ]			   [nvarchar](1)	null
  , [LOGSY]			   [nvarchar](10)	null
  , [LPHIS]			   [nvarchar](1)	null
  , [LPONR]			   [nvarchar](5)	null
  , [MANDT]			   [nvarchar](3)	null
  , [MEMORY]		   [nvarchar](1)	null
  , [MEMORYTYPE]	   [nvarchar](1)	null
  , [MSR_ID]		   [nvarchar](10)	null
  , [OTB_COND_TYPE]	   [nvarchar](4)	null
  , [OTB_CURR]		   [nvarchar](5)	null
  , [OTB_LEVEL]		   [nvarchar](1)	null
  , [OTB_REASON]	   [nvarchar](3)	null
  , [OTB_RES_VALUE]	   [decimal](18, 0) null
  , [OTB_SPEC_VALUE]   [decimal](18, 0) null
  , [OTB_STATUS]	   [nvarchar](1)	null
  , [OTB_VALUE]		   [decimal](18, 0) null
  , [PINCR]			   [nvarchar](5)	null
  , [POHF_TYPE]		   [nvarchar](1)	null
  , [PROCSTAT]		   [nvarchar](2)	null
  , [PSTYP_ALLOW]	   [nvarchar](1)	null
  , [REASON_CODE]	   [nvarchar](4)	null
  , [RELEASE_DATE]	   [datetime]		null
  , [RELOC_ID]		   [nvarchar](10)	null
  , [RELOC_SEQ_ID]	   [nvarchar](4)	null
  , [RESWK]			   [nvarchar](4)	null
  , [RETPC]			   [decimal](18, 0) null
  , [RETTP]			   [nvarchar](1)	null
  , [REVNO]			   [nvarchar](8)	null
  , [RLWRT]			   [decimal](18, 0) null
  , [SCMPROC]		   [nvarchar](1)	null
  , [SPR_RSN_PROFILE]  [nvarchar](4)	null
  , [SPRAS]			   [nvarchar](1)	null
  , [STAFO]			   [nvarchar](6)	null
  , [STAKO]			   [nvarchar](1)	null
  , [STATU]			   [nvarchar](1)	null
  , [STCEG]			   [nvarchar](20)	null
  , [STCEG_L]		   [nvarchar](3)	null
  , [SUBMI]			   [nvarchar](10)	null
  , [TELF1]			   [nvarchar](16)	null
  , [THRESHOLD_EXISTS] [nvarchar](1)	null
  , [UNSEZ]			   [nvarchar](12)	null
  , [UPINC]			   [nvarchar](5)	null
  , [VERKF]			   [nvarchar](30)	null
  , [WAERS]			   [nvarchar](5)	null
  , [WEAKT]			   [nvarchar](1)	null
  , [WERKS_ALLOW]	   [nvarchar](1)	null
  , [WKURS]			   [decimal](18, 0) null
  , [ZBD1P]			   [decimal](18, 0) null
  , [ZBD1T]			   [decimal](18, 0) null
  , [ZBD2P]			   [decimal](18, 0) null
  , [ZBD2T]			   [decimal](18, 0) null
  , [ZBD3T]			   [decimal](18, 0) null
  , [ZTERM]			   [nvarchar](4)	null
) ;
go
print N'Creating index [tsa_ics_land_SAP_GBR_EKKO_1] on [tsa].[ics_land_SAP_GBR_EKKO]' ;
go
create clustered index [tsa_ics_land_SAP_GBR_EKKO_1]
on [tsa].[ics_land_SAP_GBR_EKKO] ([EBELN]) ;
go
print N'Creating [tsa].[ics_land_SAP_GBR_EKPO]' ;
go
create table [tsa].[ics_land_SAP_GBR_EKPO]
(
	[EtlBatchRunId]		  [int]			   not null
  , [EtlStepRunId]		  [int]			   not null
  , [EtlThreadRunId]	  [int]			   not null
  , [DataSourceKey]		  [int]			   not null
  , [EtlSourceTable]	  [varchar](200)   not null
  , [EtlCreatedOn]		  [datetime]	   not null
  , [EtlCreatedBy]		  [varchar](200)   not null
  , [ExcludeFromMerge]	  [bit]			   not null constraint [DF_tsa_ics_land_SAP_GBR_EKPO_ExcludeFromMerge] default ((0))
  , [IsDuplicate]		  [bit]			   not null constraint [DF_tsa_ics_land_SAP_GBR_EKPO_IsDuplicate] default ((0))
  , [_BEV1_NEDEPFREE]	  [nvarchar](1)	   null
  , [_BEV1_NEGEN_ITEM]	  [nvarchar](1)	   null
  , [_BEV1_NESTRUCCAT]	  [nvarchar](1)	   null
  , [ABDAT]				  [datetime]	   null
  , [ABELN]				  [nvarchar](10)   null
  , [ABELP]				  [nvarchar](5)	   null
  , [ABFTZ]				  [decimal](18, 0) null
  , [ABMNG]				  [decimal](18, 0) null
  , [ABSKZ]				  [nvarchar](1)	   null
  , [ABUEB]				  [nvarchar](4)	   null
  , [ADRN2]				  [nvarchar](10)   null
  , [ADRNR]				  [nvarchar](10)   null
  , [ADVCODE]			  [nvarchar](2)	   null
  , [AEDAT]				  [datetime]	   null
  , [AFNAM]				  [nvarchar](12)   null
  , [AGDAT]				  [datetime]	   null
  , [AGMEM]				  [nvarchar](3)	   null
  , [AKTNR]				  [nvarchar](10)   null
  , [ANFNR]				  [nvarchar](10)   null
  , [ANFPS]				  [nvarchar](5)	   null
  , [ANZPU]				  [decimal](18, 0) null
  , [ANZSN]				  [bigint]		   null
  , [APOMS]				  [nvarchar](1)	   null
  , [ARSNR]				  [nvarchar](10)   null
  , [ARSPS]				  [nvarchar](4)	   null
  , [ATTYP]				  [nvarchar](2)	   null
  , [AUREL]				  [nvarchar](1)	   null
  , [BANFN]				  [nvarchar](10)   null
  , [BEDNR]				  [nvarchar](10)   null
  , [BERID]				  [nvarchar](10)   null
  , [BLK_REASON_ID]		  [nvarchar](4)	   null
  , [BLK_REASON_TXT]	  [nvarchar](40)   null
  , [BNFPO]				  [nvarchar](5)	   null
  , [BONBA]				  [decimal](18, 0) null
  , [BONUS]				  [nvarchar](2)	   null
  , [BPRME]				  [nvarchar](3)	   null
  , [BPUMN]				  [decimal](18, 0) null
  , [BPUMZ]				  [decimal](18, 0) null
  , [BRGEW]				  [decimal](18, 0) null
  , [BRTWR]				  [decimal](18, 0) null
  , [BSGRU]				  [nvarchar](3)	   null
  , [BSTAE]				  [nvarchar](4)	   null
  , [BSTYP]				  [nvarchar](1)	   null
  , [BUDGET_PD]			  [nvarchar](10)   null
  , [BUKRS]				  [nvarchar](4)	   null
  , [BWTAR]				  [nvarchar](10)   null
  , [BWTTY]				  [nvarchar](1)	   null
  , [CCOMP]				  [nvarchar](1)	   null
  , [CHG_FPLNR]			  [nvarchar](1)	   null
  , [CHG_SRV]			  [nvarchar](1)	   null
  , [CONS_ORDER]		  [nvarchar](1)	   null
  , [CQU_SAR]			  [decimal](18, 0) null
  , [CUOBJ]				  [nvarchar](18)   null
  , [DPAMT]				  [decimal](18, 0) null
  , [DPDAT]				  [datetime]	   null
  , [DPPCT]				  [decimal](18, 0) null
  , [DPTYP]				  [nvarchar](4)	   null
  , [DRDAT]				  [datetime]	   null
  , [DRUHR]				  [datetime]	   null
  , [DRUNR]				  [nvarchar](4)	   null
  , [EAN11]				  [nvarchar](18)   null
  , [EBELN]				  [nvarchar](10)   null
  , [EBELP]				  [nvarchar](5)	   null
  , [EBON2]				  [nvarchar](2)	   null
  , [EBON3]				  [nvarchar](2)	   null
  , [EBONF]				  [nvarchar](1)	   null
  , [EFFWR]				  [decimal](18, 0) null
  , [EGLKZ]				  [nvarchar](1)	   null
  , [EHTYP]				  [nvarchar](4)	   null
  , [EILDT]				  [datetime]	   null
  , [EKKOL]				  [nvarchar](4)	   null
  , [ELIKZ]				  [nvarchar](1)	   null
  , [EMATN]				  [nvarchar](18)   null
  , [EMLIF]				  [nvarchar](10)   null
  , [EMNFR]				  [nvarchar](10)   null
  , [EMPST]				  [nvarchar](25)   null
  , [EREKZ]				  [nvarchar](1)	   null
  , [ETDRK]				  [nvarchar](1)	   null
  , [ETFZ1]				  [decimal](18, 0) null
  , [ETFZ2]				  [decimal](18, 0) null
  , [EVERS]				  [nvarchar](2)	   null
  , [EXCPE]				  [nvarchar](2)	   null
  , [EXLIN]				  [nvarchar](40)   null
  , [EXSNR]				  [nvarchar](5)	   null
  , [EXT_RFX_ITEM]		  [nvarchar](10)   null
  , [EXT_RFX_NUMBER]	  [nvarchar](35)   null
  , [EXT_RFX_SYSTEM]	  [nvarchar](10)   null
  , [FABKZ]				  [nvarchar](1)	   null
  , [FFZHI]				  [decimal](18, 0) null
  , [FIPOS]				  [nvarchar](14)   null
  , [FISCAL_INCENTIVE]	  [nvarchar](4)	   null
  , [FISCAL_INCENTIVE_ID] [nvarchar](4)	   null
  , [FISTL]				  [nvarchar](16)   null
  , [FIXMG]				  [nvarchar](1)	   null
  , [FKBER]				  [nvarchar](16)   null
  , [FLS_RSTO]			  [nvarchar](1)	   null
  , [FMFGUS_KEY]		  [nvarchar](22)   null
  , [FPLNR]				  [nvarchar](10)   null
  , [GEBER]				  [nvarchar](10)   null
  , [GEWEI]				  [nvarchar](3)	   null
  , [GNETWR]			  [decimal](18, 0) null
  , [GRANT_NBR]			  [nvarchar](20)   null
  , [IDNLF]				  [nvarchar](35)   null
  , [INCO1]				  [nvarchar](3)	   null
  , [INCO2]				  [nvarchar](28)   null
  , [INFNR]				  [nvarchar](10)   null
  , [INSMK]				  [nvarchar](1)	   null
  , [INSNC]				  [nvarchar](1)	   null
  , [IPRKZ]				  [nvarchar](1)	   null
  , [ITCONS]			  [nvarchar](1)	   null
  , [IUID_RELEVANT]		  [nvarchar](1)	   null
  , [J_1AIDATEP]		  [datetime]	   null
  , [J_1AINDXP]			  [nvarchar](5)	   null
  , [J_1BINDUST]		  [nvarchar](2)	   null
  , [J_1BMATORG]		  [nvarchar](1)	   null
  , [J_1BMATUSE]		  [nvarchar](1)	   null
  , [J_1BNBM]			  [nvarchar](16)   null
  , [J_1BOWNPRO]		  [nvarchar](1)	   null
  , [KANBA]				  [nvarchar](1)	   null
  , [KBLNR]				  [nvarchar](10)   null
  , [KBLPOS]			  [nvarchar](3)	   null
  , [KNTTP]				  [nvarchar](1)	   null
  , [KO_GSBER]			  [nvarchar](4)	   null
  , [KO_PARGB]			  [nvarchar](4)	   null
  , [KO_PPRCTR]			  [nvarchar](10)   null
  , [KO_PRCTR]			  [nvarchar](10)   null
  , [KOLIF]				  [nvarchar](10)   null
  , [KONNR]				  [nvarchar](10)   null
  , [KTMNG]				  [decimal](18, 0) null
  , [KTPNR]				  [nvarchar](5)	   null
  , [KUNNR]				  [nvarchar](10)   null
  , [KZABS]				  [nvarchar](1)	   null
  , [KZBWS]				  [nvarchar](1)	   null
  , [KZFME]				  [nvarchar](1)	   null
  , [KZKFG]				  [nvarchar](1)	   null
  , [KZSTU]				  [nvarchar](1)	   null
  , [KZTLF]				  [nvarchar](1)	   null
  , [KZVBR]				  [nvarchar](1)	   null
  , [KZWI1]				  [decimal](18, 0) null
  , [KZWI2]				  [decimal](18, 0) null
  , [KZWI3]				  [decimal](18, 0) null
  , [KZWI4]				  [decimal](18, 0) null
  , [KZWI5]				  [decimal](18, 0) null
  , [KZWI6]				  [decimal](18, 0) null
  , [LABNR]				  [nvarchar](20)   null
  , [LBLKZ]				  [nvarchar](1)	   null
  , [LEBRE]				  [nvarchar](1)	   null
  , [LEWED]				  [datetime]	   null
  , [LFRET]				  [nvarchar](4)	   null
  , [LGORT]				  [nvarchar](4)	   null
  , [LMEIN]				  [nvarchar](3)	   null
  , [LOEKZ]				  [nvarchar](1)	   null
  , [LTSNR]				  [nvarchar](6)	   null
  , [MAHN1]				  [decimal](18, 0) null
  , [MAHN2]				  [decimal](18, 0) null
  , [MAHN3]				  [decimal](18, 0) null
  , [MAHNZ]				  [decimal](18, 0) null
  , [MANDT]				  [nvarchar](3)	   null
  , [MANUAL_TC_REASON]	  [nvarchar](2)	   null
  , [MATKL]				  [nvarchar](9)	   null
  , [MATNR]				  [nvarchar](18)   null
  , [MEINS]				  [nvarchar](3)	   null
  , [MENGE]				  [decimal](18, 0) null
  , [MEPRF]				  [nvarchar](1)	   null
  , [MFRGR]				  [nvarchar](8)	   null
  , [MFRNR]				  [nvarchar](10)   null
  , [MFRPN]				  [nvarchar](40)   null
  , [MFZHI]				  [decimal](18, 0) null
  , [MHDRZ]				  [decimal](18, 0) null
  , [MLMAA]				  [nvarchar](1)	   null
  , [MPROF]				  [nvarchar](4)	   null
  , [MRPIND]			  [nvarchar](1)	   null
  , [MTART]				  [nvarchar](4)	   null
  , [MWSKZ]				  [nvarchar](2)	   null
  , [NAVNW]				  [decimal](18, 0) null
  , [NETPR]				  [decimal](18, 0) null
  , [NETWR]				  [decimal](18, 0) null
  , [NFABD]				  [datetime]	   null
  , [NLABD]				  [datetime]	   null
  , [NOTKZ]				  [nvarchar](1)	   null
  , [NOVET]				  [nvarchar](1)	   null
  , [NRFHG]				  [nvarchar](1)	   null
  , [NTGEW]				  [decimal](18, 0) null
  , [PACKNO]			  [nvarchar](10)   null
  , [PEINH]				  [decimal](18, 0) null
  , [PLIFZ]				  [decimal](18, 0) null
  , [POL_ID]			  [nvarchar](10)   null
  , [PRDAT]				  [datetime]	   null
  , [PRIO_REQ]			  [nvarchar](3)	   null
  , [PRIO_URG]			  [nvarchar](2)	   null
  , [PRSDR]				  [nvarchar](1)	   null
  , [PSTYP]				  [nvarchar](1)	   null
  , [PUNEI]				  [nvarchar](3)	   null
  , [PUT_BACK]			  [nvarchar](1)	   null
  , [RDPRF]				  [nvarchar](4)	   null
  , [REASON_CODE]		  [nvarchar](4)	   null
  , [REF_ITEM]			  [nvarchar](5)	   null
  , [REFSITE]			  [nvarchar](4)	   null
  , [REPOS]				  [nvarchar](1)	   null
  , [RESLO]				  [nvarchar](4)	   null
  , [RETPC]				  [decimal](18, 0) null
  , [RETPO]				  [nvarchar](1)	   null
  , [REVLV]				  [nvarchar](2)	   null
  , [SAISJ]				  [nvarchar](4)	   null
  , [SAISO]				  [nvarchar](4)	   null
  , [SATNR]				  [nvarchar](18)   null
  , [SCHPR]				  [nvarchar](1)	   null
  , [SIKGR]				  [nvarchar](3)	   null
  , [SKTOF]				  [nvarchar](1)	   null
  , [SOBKZ]				  [nvarchar](1)	   null
  , [SOURCE_ID]			  [nvarchar](3)	   null
  , [SOURCE_KEY]		  [nvarchar](32)   null
  , [SPE_ABGRU]			  [nvarchar](2)	   null
  , [SPE_CHNG_SYS]		  [nvarchar](1)	   null
  , [SPE_CQ_CTRLTYPE]	  [nvarchar](1)	   null
  , [SPE_CQ_NOCQ]		  [nvarchar](1)	   null
  , [SPE_CRM_FKREL]		  [nvarchar](1)	   null
  , [SPE_CRM_REF_ITEM]	  [nvarchar](6)	   null
  , [SPE_CRM_REF_SO]	  [nvarchar](35)   null
  , [SPE_CRM_SO]		  [nvarchar](10)   null
  , [SPE_CRM_SO_ITEM]	  [nvarchar](6)	   null
  , [SPE_EWM_DTC]		  [nvarchar](1)	   null
  , [SPE_INSMK_SRC]		  [nvarchar](1)	   null
  , [SPINF]				  [nvarchar](1)	   null
  , [SRM_CONTRACT_ID]	  [nvarchar](10)   null
  , [SRM_CONTRACT_ITM]	  [nvarchar](10)   null
  , [SRV_BAS_COM]		  [nvarchar](1)	   null
  , [SSQSS]				  [nvarchar](8)	   null
  , [STAFO]				  [nvarchar](6)	   null
  , [STAPO]				  [nvarchar](1)	   null
  , [STATU]				  [nvarchar](1)	   null
  , [STATUS]			  [nvarchar](1)	   null
  , [TAX_SUBJECT_ST]	  [nvarchar](1)	   null
  , [TC_AUT_DET]		  [nvarchar](2)	   null
  , [TECHS]				  [nvarchar](12)   null
  , [TWRKZ]				  [nvarchar](1)	   null
  , [TXJCD]				  [nvarchar](15)   null
  , [TXZ01]				  [nvarchar](40)   null
  , [TZONRC]			  [nvarchar](6)	   null
  , [UEBPO]				  [nvarchar](5)	   null
  , [UEBTK]				  [nvarchar](1)	   null
  , [UEBTO]				  [decimal](18, 0) null
  , [UMREN]				  [decimal](18, 0) null
  , [UMREZ]				  [decimal](18, 0) null
  , [UMSOK]				  [nvarchar](1)	   null
  , [UNTTO]				  [decimal](18, 0) null
  , [UPTYP]				  [nvarchar](1)	   null
  , [UPVOR]				  [nvarchar](1)	   null
  , [USEQU]				  [nvarchar](1)	   null
  , [VOLEH]				  [nvarchar](3)	   null
  , [VOLUM]				  [decimal](18, 0) null
  , [VORAB]				  [nvarchar](1)	   null
  , [VRTKZ]				  [nvarchar](1)	   null
  , [WABWE]				  [nvarchar](1)	   null
  , [WEBAZ]				  [decimal](18, 0) null
  , [WEBRE]				  [nvarchar](1)	   null
  , [WEORA]				  [nvarchar](1)	   null
  , [WEPOS]				  [nvarchar](1)	   null
  , [WERKS]				  [nvarchar](4)	   null
  , [WEUNB]				  [nvarchar](1)	   null
  , [XCONDITIONS]		  [nvarchar](1)	   null
  , [XERSY]				  [nvarchar](1)	   null
  , [XOBLR]				  [nvarchar](1)	   null
  , [ZGTYP]				  [nvarchar](4)	   null
  , [ZWERT]				  [decimal](18, 0) null
) ;
go
print N'Creating index [tsa_ics_land_SAP_GBR_EKPO_1] on [tsa].[ics_land_SAP_GBR_EKPO]' ;
go
create clustered index [tsa_ics_land_SAP_GBR_EKPO_1]
on [tsa].[ics_land_SAP_GBR_EKPO] ([EBELN], [EBELP]) ;
go
print N'Creating [tsa].[ics_land_SAP_GBR_ADRC]' ;
go
create table [tsa].[ics_land_SAP_GBR_ADRC]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_SAP_GBR_ADRC_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_SAP_GBR_ADRC_IsDuplicate] default ((0))
  , [ADDR_GROUP]	   [nvarchar](4)  null
  , [ADDRESS_ID]	   [nvarchar](10) null
  , [ADDRNUMBER]	   [nvarchar](10) null
  , [ADDRORIGIN]	   [nvarchar](4)  null
  , [BUILDING]		   [nvarchar](20) null
  , [CHCKSTATUS]	   [nvarchar](1)  null
  , [CITY_CODE]		   [nvarchar](12) null
  , [CITY_CODE2]	   [nvarchar](12) null
  , [CITY1]			   [nvarchar](40) null
  , [CITY2]			   [nvarchar](40) null
  , [CITYH_CODE]	   [nvarchar](12) null
  , [CITYP_CODE]	   [nvarchar](8)  null
  , [CLIENT]		   [nvarchar](3)  null
  , [COUNTRY]		   [nvarchar](3)  null
  , [DATE_FROM]		   [datetime2]	  null
  , [DATE_TO]		   [datetime2]	  null
  , [DEFLT_COMM]	   [nvarchar](3)  null
  , [DELI_SERV_NUMBER] [nvarchar](10) null
  , [DELI_SERV_TYPE]   [nvarchar](4)  null
  , [DONT_USE_P]	   [nvarchar](4)  null
  , [DONT_USE_S]	   [nvarchar](4)  null
  , [EXTENSION1]	   [nvarchar](40) null
  , [EXTENSION2]	   [nvarchar](40) null
  , [FAX_EXTENS]	   [nvarchar](10) null
  , [FAX_NUMBER]	   [nvarchar](30) null
  , [FLAGCOMM10]	   [nvarchar](1)  null
  , [FLAGCOMM11]	   [nvarchar](1)  null
  , [FLAGCOMM12]	   [nvarchar](1)  null
  , [FLAGCOMM13]	   [nvarchar](1)  null
  , [FLAGCOMM2]		   [nvarchar](1)  null
  , [FLAGCOMM3]		   [nvarchar](1)  null
  , [FLAGCOMM4]		   [nvarchar](1)  null
  , [FLAGCOMM5]		   [nvarchar](1)  null
  , [FLAGCOMM6]		   [nvarchar](1)  null
  , [FLAGCOMM7]		   [nvarchar](1)  null
  , [FLAGCOMM8]		   [nvarchar](1)  null
  , [FLAGCOMM9]		   [nvarchar](1)  null
  , [FLAGGROUPS]	   [nvarchar](1)  null
  , [FLOOR]			   [nvarchar](10) null
  , [HOME_CITY]		   [nvarchar](40) null
  , [HOUSE_NUM1]	   [nvarchar](10) null
  , [HOUSE_NUM2]	   [nvarchar](10) null
  , [HOUSE_NUM3]	   [nvarchar](10) null
  , [LANGU]			   [nvarchar](1)  null
  , [LANGU_CREA]	   [nvarchar](1)  null
  , [LOCATION]		   [nvarchar](40) null
  , [MC_CITY1]		   [nvarchar](25) null
  , [MC_NAME1]		   [nvarchar](25) null
  , [MC_STREET]		   [nvarchar](25) null
  , [NAME_CO]		   [nvarchar](40) null
  , [NAME_TEXT]		   [nvarchar](50) null
  , [NAME1]			   [nvarchar](40) null
  , [NAME2]			   [nvarchar](40) null
  , [NAME3]			   [nvarchar](40) null
  , [NAME4]			   [nvarchar](40) null
  , [NATION]		   [nvarchar](1)  null
  , [PCODE1_EXT]	   [nvarchar](10) null
  , [PCODE2_EXT]	   [nvarchar](10) null
  , [PCODE3_EXT]	   [nvarchar](10) null
  , [PERS_ADDR]		   [nvarchar](1)  null
  , [PO_BOX]		   [nvarchar](10) null
  , [PO_BOX_CTY]	   [nvarchar](3)  null
  , [PO_BOX_LOBBY]	   [nvarchar](40) null
  , [PO_BOX_LOC]	   [nvarchar](40) null
  , [PO_BOX_NUM]	   [nvarchar](1)  null
  , [PO_BOX_REG]	   [nvarchar](3)  null
  , [POST_CODE1]	   [nvarchar](10) null
  , [POST_CODE2]	   [nvarchar](10) null
  , [POST_CODE3]	   [nvarchar](10) null
  , [POSTALAREA]	   [nvarchar](15) null
  , [REGIOGROUP]	   [nvarchar](8)  null
  , [REGION]		   [nvarchar](3)  null
  , [ROOMNUMBER]	   [nvarchar](10) null
  , [SORT_PHN]		   [nvarchar](20) null
  , [SORT1]			   [nvarchar](20) null
  , [SORT2]			   [nvarchar](20) null
  , [STR_SUPPL1]	   [nvarchar](40) null
  , [STR_SUPPL2]	   [nvarchar](40) null
  , [STR_SUPPL3]	   [nvarchar](40) null
  , [STREET]		   [nvarchar](60) null
  , [STREETABBR]	   [nvarchar](2)  null
  , [STREETCODE]	   [nvarchar](12) null
  , [TAXJURCODE]	   [nvarchar](15) null
  , [TEL_EXTENS]	   [nvarchar](10) null
  , [TEL_NUMBER]	   [nvarchar](30) null
  , [TIME_ZONE]		   [nvarchar](6)  null
  , [TITLE]			   [nvarchar](4)  null
  , [TRANSPZONE]	   [nvarchar](10) null
) ;
go
print N'Creating index [tsa_ics_land_SAP_GBR_ADRC_1] on [tsa].[ics_land_SAP_GBR_ADRC]' ;
go
create clustered index [tsa_ics_land_SAP_GBR_ADRC_1]
on [tsa].[ics_land_SAP_GBR_ADRC] ([ADDRNUMBER], [DATE_FROM]) ;
go
