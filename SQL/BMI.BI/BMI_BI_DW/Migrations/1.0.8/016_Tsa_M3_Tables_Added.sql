-- <Migration ID="0a4ae7f3-9144-4cb3-bbce-9a7f7b0bc6ec" />
go
if object_id('tsa.ics_land_m3_CIDADR', 'U') is not null
	drop table [tsa].[ics_land_m3_CIDADR] ;
go
if object_id('tsa.ics_land_m3_CIDMAS', 'U') is not null
	drop table [tsa].[ics_land_m3_CIDMAS] ;
go
if object_id('tsa.ics_land_m3_MITWHL', 'U') is not null
	drop table [tsa].[ics_land_m3_MITWHL] ;
go
if object_id('tsa.ics_land_m3_CMNDIV', 'U') is not null
	drop table [tsa].[ics_land_m3_CMNDIV] ;
go
print N'Creating [tsa].[ics_land_m3_CIDADR]' ;
go
create table [tsa].[ics_land_m3_CIDADR]
(
	[EtlBatchRunId]	   [int]			not null
  , [EtlStepRunId]	   [int]			not null
  , [EtlThreadRunId]   [int]			not null
  , [DataSourceKey]	   [int]			not null
  , [EtlSourceTable]   [varchar](200)	not null
  , [EtlCreatedOn]	   [datetime]		not null
  , [EtlCreatedBy]	   [varchar](200)	not null
  , [ExcludeFromMerge] [bit]			not null
  , [IsDuplicate]	   [bit]			not null
  , [SACONO]		   [decimal](3, 0)	null
  , [SASUNO]		   [nvarchar](255)	null
  , [SAADTE]		   [decimal](2, 0)	null
  , [SAADID]		   [nvarchar](255)	null
  , [SASTDT]		   [decimal](8, 0)	null
  , [SASUNM]		   [nvarchar](255)	null
  , [SAPRIA]		   [decimal](1, 0)	null
  , [SAADR1]		   [nvarchar](255)	null
  , [SAADR2]		   [nvarchar](255)	null
  , [SAADR3]		   [nvarchar](255)	null
  , [SAADR4]		   [nvarchar](255)	null
  , [SACSCD]		   [nvarchar](255)	null
  , [SAPONO]		   [nvarchar](255)	null
  , [SAADVI]		   [nvarchar](255)	null
  , [SAEDES]		   [nvarchar](255)	null
  , [SAGEOC]		   [decimal](9, 0)	null
  , [SATAXC]		   [nvarchar](255)	null
  , [SAECAR]		   [nvarchar](255)	null
  , [SATOWN]		   [nvarchar](255)	null
  , [SAPNOD]		   [nvarchar](255)	null
  , [SATXID]		   [decimal](13, 0) null
  , [SARGDT]		   [decimal](8, 0)	null
  , [SARGTM]		   [decimal](6, 0)	null
  , [SALMDT]		   [decimal](8, 0)	null
  , [SACHNO]		   [decimal](3, 0)	null
  , [SACHID]		   [nvarchar](255)	null
  , [SALMTS]		   [decimal](18, 0) null
) ;
go
print N'Creating index [tsa_ics_land_m3_CIDADR_1] on [tsa].[ics_land_m3_CIDADR]' ;
go
create clustered index [tsa_ics_land_m3_CIDADR_1]
on [tsa].[ics_land_m3_CIDADR] ([SASUNO], [SAADTE], [SAADID], [SASTDT]) ;
go
print N'Creating [tsa].[ics_land_m3_CIDMAS]' ;
go
create table [tsa].[ics_land_m3_CIDMAS]
(
	[EtlBatchRunId]	   [int]			not null
  , [EtlStepRunId]	   [int]			not null
  , [EtlThreadRunId]   [int]			not null
  , [DataSourceKey]	   [int]			not null
  , [EtlSourceTable]   [varchar](200)	not null
  , [EtlCreatedOn]	   [datetime]		not null
  , [EtlCreatedBy]	   [varchar](200)	not null
  , [ExcludeFromMerge] [bit]			not null
  , [IsDuplicate]	   [bit]			not null
  , [IDCONO]		   [decimal](3, 0)	null
  , [IDSUNO]		   [nvarchar](255)	null
  , [IDSUTY]		   [decimal](1, 0)	null
  , [IDSUNM]		   [nvarchar](255)	null
  , [IDALSU]		   [nvarchar](255)	null
  , [IDSTAT]		   [nvarchar](255)	null
  , [IDCORG]		   [nvarchar](255)	null
  , [IDCOR2]		   [nvarchar](255)	null
  , [IDLNCD]		   [nvarchar](255)	null
  , [IDPHNO]		   [nvarchar](255)	null
  , [IDPHN2]		   [nvarchar](255)	null
  , [IDTLNO]		   [nvarchar](255)	null
  , [IDTFNO]		   [nvarchar](255)	null
  , [IDCSCD]		   [nvarchar](255)	null
  , [IDECAR]		   [nvarchar](255)	null
  , [IDDTFM]		   [nvarchar](255)	null
  , [IDEDIT]		   [nvarchar](255)	null
  , [IDVRNO]		   [nvarchar](255)	null
  , [IDSUCO]		   [nvarchar](255)	null
  , [IDSUAL]		   [nvarchar](255)	null
  , [IDSUCM]		   [nvarchar](255)	null
  , [IDMEPF]		   [nvarchar](255)	null
  , [IDPODA]		   [decimal](3, 0)	null
  , [IDCFI1]		   [nvarchar](255)	null
  , [IDCFI2]		   [decimal](15, 2) null
  , [IDCFI3]		   [nvarchar](255)	null
  , [IDCFI4]		   [nvarchar](255)	null
  , [IDCFI5]		   [nvarchar](255)	null
  , [IDHAFE]		   [nvarchar](255)	null
  , [IDDESV]		   [nvarchar](255)	null
  , [IDTIZO]		   [nvarchar](255)	null
  , [IDFWSC]		   [nvarchar](255)	null
  , [IDTXID]		   [decimal](13, 0) null
  , [IDRGDT]		   [decimal](8, 0)	null
  , [IDRGTM]		   [decimal](6, 0)	null
  , [IDLMDT]		   [decimal](8, 0)	null
  , [IDCHNO]		   [decimal](3, 0)	null
  , [IDCHID]		   [nvarchar](255)	null
  , [IDLMTS]		   [decimal](18, 0) null
) ;
go
print N'Creating index [tsa_ics_land_m3_CIDMAS_1] on [tsa].[ics_land_m3_CIDMAS]' ;
go
create clustered index [tsa_ics_land_m3_CIDMAS_1]
on [tsa].[ics_land_m3_CIDMAS] ([IDSUNO]) ;
go
print N'Creating [tsa].[ics_land_m3_CMNDIV]' ;
go
create table [tsa].[ics_land_m3_CMNDIV]
(
	[EtlBatchRunId]	   [int]			not null
  , [EtlStepRunId]	   [int]			not null
  , [EtlThreadRunId]   [int]			not null
  , [DataSourceKey]	   [int]			not null
  , [EtlSourceTable]   [varchar](200)	not null
  , [EtlCreatedOn]	   [datetime]		not null
  , [EtlCreatedBy]	   [varchar](200)	not null
  , [ExcludeFromMerge] [bit]			not null
  , [IsDuplicate]	   [bit]			not null
  , [CCCONO]		   [decimal](3, 0)	null
  , [CCDIVI]		   [nvarchar](255)	null
  , [CCCONM]		   [nvarchar](255)	null
  , [CCTX15]		   [nvarchar](255)	null
  , [CCROW2]		   [nvarchar](255)	null
  , [CCROW3]		   [nvarchar](255)	null
  , [CCFACI]		   [nvarchar](255)	null
  , [CCWHLO]		   [nvarchar](255)	null
  , [CCDTFM]		   [nvarchar](255)	null
  , [CCACGR]		   [nvarchar](255)	null
  , [CCLOCD]		   [nvarchar](255)	null
  , [CCTATM]		   [decimal](1, 0)	null
  , [CCISTA]		   [decimal](1, 0)	null
  , [CCRAEM]		   [decimal](1, 0)	null
  , [CCNPT1]		   [decimal](2, 0)	null
  , [CCNPT2]		   [decimal](2, 0)	null
  , [CCNPT3]		   [decimal](2, 0)	null
  , [CCNPT4]		   [decimal](2, 0)	null
  , [CCNPT5]		   [decimal](2, 0)	null
  , [CCDMCU]		   [decimal](1, 0)	null
  , [CCPTMP]		   [decimal](1, 0)	null
  , [CCPTOI]		   [decimal](1, 0)	null
  , [CCPTFA]		   [decimal](1, 0)	null
  , [CCPTPA]		   [decimal](1, 0)	null
  , [CCPTEI]		   [decimal](1, 0)	null
  , [CCVDME]		   [decimal](1, 0)	null
  , [CCVRNO]		   [nvarchar](255)	null
  , [CCCOA1]		   [nvarchar](255)	null
  , [CCCOA2]		   [nvarchar](255)	null
  , [CCCOA3]		   [nvarchar](255)	null
  , [CCCOA4]		   [nvarchar](255)	null
  , [CCPHNO]		   [nvarchar](255)	null
  , [CCPHN2]		   [nvarchar](255)	null
  , [CCTLNO]		   [nvarchar](255)	null
  , [CCTFNO]		   [nvarchar](255)	null
  , [CCOREF]		   [nvarchar](255)	null
  , [CCCSCD]		   [nvarchar](255)	null
  , [CCLL01]		   [nvarchar](255)	null
  , [CCLL02]		   [nvarchar](255)	null
  , [CCLL03]		   [nvarchar](255)	null
  , [CCLL04]		   [nvarchar](255)	null
  , [CCLL05]		   [nvarchar](255)	null
  , [CCLL06]		   [nvarchar](255)	null
  , [CCLL07]		   [nvarchar](255)	null
  , [CCLL08]		   [nvarchar](255)	null
  , [CCLL09]		   [nvarchar](255)	null
  , [CCLL10]		   [nvarchar](255)	null
  , [CCCDCD]		   [decimal](1, 0)	null
  , [CCFIRM]		   [nvarchar](255)	null
  , [CCPSND]		   [nvarchar](255)	null
  , [CCVRNL]		   [nvarchar](255)	null
  , [CCRROF]		   [nvarchar](255)	null
  , [CCUNST]		   [nvarchar](255)	null
  , [CCGEOC]		   [decimal](9, 0)	null
  , [CCCONL]		   [decimal](3, 0)	null
  , [CCMXAP]		   [decimal](1, 0)	null
  , [CCMXAR]		   [decimal](1, 0)	null
  , [CCMXAT]		   [decimal](1, 0)	null
  , [CCMXBU]		   [decimal](1, 0)	null
  , [CCMXCA]		   [decimal](1, 0)	null
  , [CCMXCF]		   [decimal](1, 0)	null
  , [CCMXCP]		   [decimal](1, 0)	null
  , [CCMXCR]		   [decimal](1, 0)	null
  , [CCMXDC]		   [decimal](1, 0)	null
  , [CCMXDO]		   [decimal](1, 0)	null
  , [CCMXDP]		   [decimal](1, 0)	null
  , [CCMXDR]		   [decimal](1, 0)	null
  , [CCMXDT]		   [decimal](1, 0)	null
  , [CCMXDS]		   [decimal](1, 0)	null
  , [CCMXEC]		   [decimal](1, 0)	null
  , [CCMXED]		   [decimal](1, 0)	null
  , [CCMXEM]		   [decimal](1, 0)	null
  , [CCMXEP]		   [decimal](1, 0)	null
  , [CCMXET]		   [decimal](1, 0)	null
  , [CCMXEV]		   [decimal](1, 0)	null
  , [CCMXFA]		   [decimal](1, 0)	null
  , [CCMXFC]		   [decimal](1, 0)	null
  , [CCMXGL]		   [decimal](1, 0)	null
  , [CCMXGM]		   [decimal](1, 0)	null
  , [CCMXIC]		   [decimal](1, 0)	null
  , [CCMXIP]		   [decimal](1, 0)	null
  , [CCMXJO]		   [decimal](1, 0)	null
  , [CCMXJQ]		   [decimal](1, 0)	null
  , [CCMXLI]		   [decimal](1, 0)	null
  , [CCMXMA]		   [decimal](1, 0)	null
  , [CCMXMC]		   [decimal](1, 0)	null
  , [CCMXMD]		   [decimal](1, 0)	null
  , [CCMXMF]		   [decimal](1, 0)	null
  , [CCMXMI]		   [decimal](1, 0)	null
  , [CCMXMM]		   [decimal](1, 0)	null
  , [CCMXMN]		   [decimal](1, 0)	null
  , [CCMXMO]		   [decimal](1, 0)	null
  , [CCMXMP]		   [decimal](1, 0)	null
  , [CCMXMQ]		   [decimal](1, 0)	null
  , [CCMXMS]		   [decimal](1, 0)	null
  , [CCMXOC]		   [decimal](1, 0)	null
  , [CCMXOD]		   [decimal](1, 0)	null
  , [CCMXOI]		   [decimal](1, 0)	null
  , [CCMXOQ]		   [decimal](1, 0)	null
  , [CCMXOS]		   [decimal](1, 0)	null
  , [CCMXPA]		   [decimal](1, 0)	null
  , [CCMXPC]		   [decimal](1, 0)	null
  , [CCMXPD]		   [decimal](1, 0)	null
  , [CCMXPM]		   [decimal](1, 0)	null
  , [CCMXPO]		   [decimal](1, 0)	null
  , [CCMXPP]		   [decimal](1, 0)	null
  , [CCMXPQ]		   [decimal](1, 0)	null
  , [CCMXPR]		   [decimal](1, 0)	null
  , [CCMXPS]		   [decimal](1, 0)	null
  , [CCMXQP]		   [decimal](1, 0)	null
  , [CCMXRC]		   [decimal](1, 0)	null
  , [CCMXRG]		   [decimal](1, 0)	null
  , [CCMXRM]		   [decimal](1, 0)	null
  , [CCMXRP]		   [decimal](1, 0)	null
  , [CCMXRR]		   [decimal](1, 0)	null
  , [CCMXRS]		   [decimal](1, 0)	null
  , [CCMXSA]		   [decimal](1, 0)	null
  , [CCMXSB]		   [decimal](1, 0)	null
  , [CCMXSE]		   [decimal](1, 0)	null
  , [CCMXSO]		   [decimal](1, 0)	null
  , [CCMXSP]		   [decimal](1, 0)	null
  , [CCMXTA]		   [decimal](1, 0)	null
  , [CCMXTE]		   [decimal](1, 0)	null
  , [CCMXTM]		   [decimal](1, 0)	null
  , [CCMXTP]		   [decimal](1, 0)	null
  , [CCMXWO]		   [decimal](1, 0)	null
  , [CCMXWP]		   [decimal](1, 0)	null
  , [CCMXWT]		   [decimal](1, 0)	null
  , [CCMXST]		   [decimal](1, 0)	null
  , [CCMXLT]		   [decimal](1, 0)	null
  , [CCMXV1]		   [nvarchar](255)	null
  , [CCMXV2]		   [nvarchar](255)	null
  , [CCLLID]		   [nvarchar](255)	null
  , [CCTIZO]		   [nvarchar](255)	null
  , [CCECAR]		   [nvarchar](255)	null
  , [CCTOWN]		   [nvarchar](255)	null
  , [CCPONO]		   [nvarchar](255)	null
  , [CCTXID]		   [decimal](13, 0) null
  , [CCRGDT]		   [decimal](8, 0)	null
  , [CCRGTM]		   [decimal](6, 0)	null
  , [CCLMDT]		   [decimal](8, 0)	null
  , [CCCHNO]		   [decimal](3, 0)	null
  , [CCCHID]		   [nvarchar](255)	null
  , [CCDCFM]		   [nvarchar](255)	null
  , [CCHCMA]		   [decimal](1, 0)	null
  , [CCSYRE]		   [decimal](1, 0)	null
  , [CCCCD1]		   [nvarchar](255)	null
  , [CCCCD2]		   [decimal](15, 2) null
  , [CCCCD3]		   [nvarchar](255)	null
  , [CCCCD4]		   [nvarchar](255)	null
  , [CCCCD5]		   [nvarchar](255)	null
  , [CCCCD6]		   [nvarchar](255)	null
  , [CCCCD7]		   [decimal](15, 2) null
  , [CCCCD8]		   [nvarchar](255)	null
  , [CCCCD9]		   [nvarchar](255)	null
  , [CCCCD0]		   [nvarchar](255)	null
  , [CCMXAH]		   [decimal](1, 0)	null
  , [CCMXAM]		   [decimal](1, 0)	null
  , [CCLMTS]		   [decimal](18, 0) null
  , [CCCUEX]		   [nvarchar](255)	null
  , [CCFRCO]		   [nvarchar](255)	null
  , [CCMXQM]		   [decimal](1, 0)	null
  , [CCRMAN]		   [decimal](1, 0)	null
  , [CCIAAT]		   [decimal](1, 0)	null
  , [CCCSVN]		   [nvarchar](255)	null
  , [CCMXGC]		   [decimal](1, 0)	null
  , [CCCORG]		   [nvarchar](255)	null
  , [CCCOR2]		   [nvarchar](255)	null
  , [CCEALO]		   [decimal](13, 0) null
  , [CCSPLE]		   [nvarchar](255)	null
  , [CCECOE]		   [decimal](1, 0)	null
) ;
go
print N'Creating index [tsa_ics_land_m3_CMNDIV_1] on [tsa].[ics_land_m3_CMNDIV]' ;
go
create clustered index [tsa_ics_land_m3_CMNDIV_1]
on [tsa].[ics_land_m3_CMNDIV] ([CCCONO], [CCDIVI]) ;
go
print N'Creating [tsa].[ics_land_m3_MITWHL]' ;
go
create table [tsa].[ics_land_m3_MITWHL]
(
	[EtlBatchRunId]	   [int]			not null
  , [EtlStepRunId]	   [int]			not null
  , [EtlThreadRunId]   [int]			not null
  , [DataSourceKey]	   [int]			not null
  , [EtlSourceTable]   [varchar](200)	not null
  , [EtlCreatedOn]	   [datetime]		not null
  , [EtlCreatedBy]	   [varchar](200)	not null
  , [ExcludeFromMerge] [bit]			not null
  , [IsDuplicate]	   [bit]			not null
  , [MWCONO]		   [decimal](3, 0)	null
  , [MWWHLO]		   [nvarchar](255)	null
  , [MWWHNM]		   [nvarchar](255)	null
  , [MWDIVI]		   [nvarchar](255)	null
  , [MWFACI]		   [nvarchar](255)	null
  , [MWWHTY]		   [nvarchar](255)	null
  , [MWWHSY]		   [nvarchar](255)	null
  , [MWWHPL]		   [nvarchar](255)	null
  , [MWOREF]		   [nvarchar](255)	null
  , [MWPHNO]		   [nvarchar](255)	null
  , [MWCOMA]		   [nvarchar](255)	null
  , [MWCUNO]		   [nvarchar](255)	null
  , [MWSUNO]		   [nvarchar](255)	null
  , [MWSDES]		   [nvarchar](255)	null
  , [MWSHNM]		   [nvarchar](255)	null
  , [MWPLIS]		   [nvarchar](255)	null
  , [MWCSCD]		   [nvarchar](255)	null
  , [MWECAR]		   [nvarchar](255)	null
  , [MWVRNO]		   [nvarchar](255)	null
  , [MWLNCD]		   [nvarchar](255)	null
  , [MWCPWH]		   [nvarchar](255)	null
  , [MWAUAD]		   [decimal](1, 0)	null
  , [MWALWH]		   [nvarchar](255)	null
  , [MWALAC]		   [decimal](1, 0)	null
  , [MWRESP]		   [nvarchar](255)	null
  , [MWTWSL]		   [nvarchar](255)	null
  , [MWGEOC]		   [decimal](9, 0)	null
  , [MWTAXC]		   [nvarchar](255)	null
  , [MWUNST]		   [nvarchar](255)	null
  , [MWTXID]		   [decimal](13, 0) null
  , [MWDTID]		   [decimal](13, 0) null
  , [MWAASQ]		   [decimal](1, 0)	null
  , [MWDMF0]		   [decimal](3, 0)	null
  , [MWDMF1]		   [decimal](3, 0)	null
  , [MWDMF2]		   [decimal](3, 0)	null
  , [MWDMF3]		   [decimal](3, 0)	null
  , [MWDMF4]		   [decimal](3, 0)	null
  , [MWDMF5]		   [decimal](3, 0)	null
  , [MWDMF6]		   [decimal](3, 0)	null
  , [MWDMF7]		   [decimal](3, 0)	null
  , [MWDMF8]		   [decimal](3, 0)	null
  , [MWDMF9]		   [decimal](3, 0)	null
  , [MWINUL]		   [decimal](1, 0)	null
  , [MWEPUL]		   [decimal](1, 0)	null
  , [MWEXDL]		   [decimal](1, 0)	null
  , [MWPIDL]		   [decimal](1, 0)	null
  , [MWALWQ]		   [nvarchar](255)	null
  , [MWITDL]		   [decimal](1, 0)	null
  , [MWCDYN]		   [decimal](1, 0)	null
  , [MWPATF]		   [decimal](3, 0)	null
  , [MWPAHF]		   [decimal](4, 0)	null
  , [MWPMTF]		   [decimal](3, 0)	null
  , [MWPMHF]		   [decimal](4, 0)	null
  , [MWDDLO]		   [nvarchar](255)	null
  , [MWCDPD]		   [decimal](1, 0)	null
  , [MWCDPM]		   [decimal](1, 0)	null
  , [MWCALV]		   [nvarchar](255)	null
  , [MWACGR]		   [nvarchar](255)	null
  , [MWNBID]		   [nvarchar](255)	null
  , [MWSTOF]		   [decimal](1, 0)	null
  , [MWASOT]		   [decimal](1, 0)	null
  , [MWDAAS]		   [decimal](2, 0)	null
  , [MWLEAM]		   [decimal](3, 0)	null
  , [MWDMFC]		   [decimal](1, 0)	null
  , [MWLSPM]		   [decimal](1, 0)	null
  , [MWRSTN]		   [nvarchar](255)	null
  , [MWRGDT]		   [decimal](8, 0)	null
  , [MWRGTM]		   [decimal](6, 0)	null
  , [MWLMDT]		   [decimal](8, 0)	null
  , [MWCHNO]		   [decimal](3, 0)	null
  , [MWCHID]		   [nvarchar](255)	null
  , [MWLMTS]		   [decimal](18, 0) null
) ;
go
print N'Creating index [tsa_ics_land_m3_MITWHL_1] on [tsa].[ics_land_m3_MITWHL]' ;
go
create clustered index [tsa_ics_land_m3_MITWHL_1]
on [tsa].[ics_land_m3_MITWHL] ([MWCONO], [MWWHLO]) ;
go
