-- <Migration ID="61b444df-43cf-4bf6-8c54-b682bf0358c1" />


if object_id('tsa.[ics_land_Symfonia__KonwersjaIdToCore]', 'U') is not null
	drop table tsa.[ics_land_Symfonia__KonwersjaIdToCore] ;
go
if object_id('tsa.[ics_land_Symfonia__MigracjaDodatkowePolaKh]', 'U') is not null
	drop table tsa.[ics_land_Symfonia__MigracjaDodatkowePolaKh] ;
go
if object_id('tsa.[ics_land_Symfonia__MigracjaDodatkowePolaTw]', 'U') is not null
	drop table tsa.[ics_land_Symfonia__MigracjaDodatkowePolaTw] ;
go
if object_id('tsa.[ics_land_Symfonia_AcInfo]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_AcInfo] ;
go
if object_id('tsa.[ics_land_Symfonia_AD]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_AD] ;
go
if object_id('tsa.[ics_land_Symfonia_amsys_objects]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_amsys_objects] ;
go

if object_id('tsa.[ics_land_Symfonia_ARM_BackLog]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_ARM_BackLog] ;
go
if object_id('tsa.[ics_land_Symfonia_ARM_Customerfile]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_ARM_Customerfile] ;
go
if object_id('tsa.[ics_land_Symfonia_ARM_Items]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_ARM_Items] ;
go
if object_id('tsa.[ics_land_Symfonia_AU]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_AU] ;
go
if object_id('tsa.[ics_land_Symfonia_ARM_SalesInvoiceTrans]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_ARM_SalesInvoiceTrans] ;
go
if object_id('tsa.[ics_land_Symfonia_ARM_ShipNotInvoiced]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_ARM_ShipNotInvoiced] ;
go
if object_id('tsa.[ics_land_Symfonia_CK]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_CK] ;
go
if object_id('tsa.[ics_land_Symfonia_CN]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_CN] ;
go
if object_id('tsa.[ics_land_Symfonia_CP]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_CP] ;
go
if object_id('tsa.[ics_land_Symfonia_CT]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_CT] ;
go
if object_id('tsa.[ics_land_Symfonia_DK]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_DK] ;
go
if object_id('tsa.[ics_land_Symfonia_DP]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_DP] ;
go
if object_id('tsa.[ics_land_Symfonia_DT]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_DT] ;
go
if object_id('tsa.[ics_land_Symfonia_DW]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_DW] ;
go
if object_id('tsa.[ics_land_Symfonia_EP]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_EP] ;
go
if object_id('tsa.[ics_land_Symfonia_ErrorLog]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_ErrorLog] ;
go
if object_id('tsa.[ics_land_Symfonia_EK]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_EK] ;
go
if object_id('tsa.[ics_land_Symfonia_FP]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_FP] ;
go
if object_id('tsa.[ics_land_Symfonia_HW]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_HW] ;
go
if object_id('tsa.[ics_land_Symfonia_IL]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_IL] ;
go
if object_id('tsa.[ics_land_Symfonia_INIFILE]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_INIFILE] ;
go
if object_id('tsa.[ics_land_Symfonia_IP]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_IP] ;
go
if object_id('tsa.[ics_land_Symfonia_IT]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_IT] ;
go
if object_id('tsa.[ics_land_Symfonia_KH]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_KH] ;
go
if object_id('tsa.[ics_land_Symfonia_KP]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_KP] ;
go
if object_id('tsa.[ics_land_Symfonia_KR]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_KR] ;
go
if object_id('tsa.[ics_land_Symfonia_LOCAL_LOG]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_LOCAL_LOG] ;
go
if object_id('tsa.[ics_land_Symfonia_LOG_BASE]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_LOG_BASE] ;
go
if object_id('tsa.[ics_land_Symfonia_LogKonwersji]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_LogKonwersji] ;
go
if object_id('tsa.[ics_land_Symfonia_MG]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_MG] ;
go
if object_id('tsa.[ics_land_Symfonia_NT]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_NT] ;
go
if object_id('tsa.[ics_land_Symfonia_OP]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_OP] ;
go
if object_id('tsa.[ics_land_Symfonia_MZ]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_MZ] ;
go
if object_id('tsa.[ics_land_Symfonia_PN]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_PN] ;
go
if object_id('tsa.[ics_land_Symfonia_PO]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_PO] ;
go
if object_id('tsa.[ics_land_Symfonia_PR]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_PR] ;
go
if object_id('tsa.[ics_land_Symfonia_PW]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_PW] ;
go
if object_id('tsa.[ics_land_Symfonia_RE]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_RE] ;
go
if object_id('tsa.[ics_land_Symfonia_RLKS]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_RLKS] ;
go
if object_id('tsa.[ics_land_Symfonia_RN]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_RN] ;
go
if object_id('tsa.[ics_land_Symfonia_RO]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_RO] ;
go
if object_id('tsa.[ics_land_Symfonia_ROPN]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_ROPN] ;
go
if object_id('tsa.[ics_land_Symfonia_RP]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_RP] ;
go
if object_id('tsa.[ics_land_Symfonia_RV]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_RV] ;
go
if object_id('tsa.[ics_land_Symfonia_RZ]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_RZ] ;
go
if object_id('tsa.[ics_land_Symfonia_SD]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_SD] ;
go
if object_id('tsa.[ics_land_Symfonia_SK]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_SK] ;
go
if object_id('tsa.[ics_land_Symfonia_SM]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_SM] ;
go
if object_id('tsa.[ics_land_Symfonia_SR]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_SR] ;
go
if object_id('tsa.[ics_land_Symfonia_StanyMinMax]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_StanyMinMax] ;
go
if object_id('tsa.[ics_land_Symfonia_TC]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_TC] ;
go
if object_id('tsa.[ics_land_Symfonia_TR]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_TR] ;
go
if object_id('tsa.[ics_land_Symfonia_TD]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_TD] ;
go
if object_id('tsa.[ics_land_Symfonia_TW]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_TW] ;
go
if object_id('tsa.[ics_land_Symfonia_TX]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_TX] ;
go
if object_id('tsa.[ics_land_Symfonia_UZ]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_UZ] ;
go
if object_id('tsa.[ics_land_Symfonia_UR]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_UR] ;
go
if object_id('tsa.[ics_land_Symfonia_WD]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_WD] ;
go
if object_id('tsa.[ics_land_Symfonia_XT]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_XT] ;
go
if object_id('tsa.[ics_land_Symfonia_ZE]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_ZE] ;
go
if object_id('tsa.[ics_land_Symfonia_WR]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_WR] ;
go
if object_id('tsa.[ics_land_Symfonia_ZL]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_ZL] ;
go
if object_id('tsa.[ics_land_Symfonia_ZN]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_ZN] ;
go
if object_id('tsa.[ics_land_Symfonia_ZR]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_ZR] ;
go
if object_id('tsa.[ics_land_Symfonia_ZO]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_ZO] ;
go
if object_id('tsa.[ics_land_Symfonia_ZP]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_ZP] ;
go
if object_id('tsa.[ics_land_Symfonia_ZZ]', 'U') is not null
	drop table tsa.[ics_land_Symfonia_ZZ] ;
go


go

print N'Creating [tsa].[ics_land_Symfonia_OP]' ;
go
create table [tsa].[ics_land_Symfonia_OP]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_OP_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_OP_IsDuplicate] default ((0))
  , [datarozl]		   [datetime]	  null
  , [flag]			   [smallint]	  null
  , [id]			   [int]		  null
  , [id_co]			   [int]		  null
  , [id_transakcji]	   [int]		  null
  , [ilosc]			   [float]		  null
  , [ilosc_rozl]	   [float]		  null
  , [kod]			   [varchar](40)  null
  , [ok]			   [smallint]	  null
  , [owner_base]	   [int]		  null
  , [owner_id]		   [int]		  null
  , [subtyp]		   [smallint]	  null
  , [wartosc]		   [float]		  null
  , [wartosc_rozl]	   [float]		  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_MZ]' ;
go
create table [tsa].[ics_land_Symfonia_MZ]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_MZ_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_MZ_IsDuplicate] default ((0))
  , [bufor]			   [smallint]	  null
  , [cena]			   [float]		  null
  , [data]			   [datetime]	  null
  , [flag]			   [smallint]	  null
  , [grupacen]		   [smallint]	  null
  , [id]			   [int]		  null
  , [idkh]			   [int]		  null
  , [idlongname]	   [int]		  null
  , [idpozkoryg]	   [int]		  null
  , [idtw]			   [int]		  null
  , [ilosc]			   [float]		  null
  , [iloscjedn]		   [float]		  null
  , [iloscRLKS]		   [float]		  null
  , [iloscwp]		   [float]		  null
  , [jm]			   [varchar](8)	  null
  , [jmwp]			   [varchar](8)	  null
  , [kod]			   [varchar](40)  null
  , [kompensata]	   [smallint]	  null
  , [lp]			   [smallint]	  null
  , [lwartk]		   [smallint]	  null
  , [magazyn]		   [int]		  null
  , [opis]			   [varchar](40)  null
  , [opisdod]		   [varchar](20)  null
  , [przychod]		   [float]		  null
  , [rejestr]		   [int]		  null
  , [rozchod]		   [float]		  null
  , [schemat]		   [varchar](4)	  null
  , [subtyp]		   [smallint]	  null
  , [super]			   [int]		  null
  , [superkoryg]	   [int]		  null
  , [typ]			   [smallint]	  null
  , [wartk]			   [float]		  null
  , [wartNetto]		   [float]		  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_PN]' ;
go
create table [tsa].[ics_land_Symfonia_PN]
(
	[EtlBatchRunId]	   [int]			  not null
  , [EtlStepRunId]	   [int]			  not null
  , [EtlThreadRunId]   [int]			  not null
  , [DataSourceKey]	   [int]			  not null
  , [EtlSourceTable]   [varchar](200)	  not null
  , [EtlCreatedOn]	   [datetime]		  not null
  , [EtlCreatedBy]	   [varchar](200)	  not null
  , [ExcludeFromMerge] [bit]			  not null constraint [DF_tsa_ics_land_Symfonia_PN_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]			  not null constraint [DF_tsa_ics_land_Symfonia_PN_IsDuplicate] default ((0))
  , [aktywny]		   [bit]			  null
  , [anulowany]		   [smallint]		  null
  , [bufor]			   [smallint]		  null
  , [createdBy]		   [int]			  null
  , [createdDate]	   [datetime]		  null
  , [data]			   [datetime]		  null
  , [datarozl]		   [datetime]		  null
  , [dkid]			   [int]			  null
  , [e_status]		   [smallint]		  null
  , [exp_fk]		   [smallint]		  null
  , [flag]			   [smallint]		  null
  , [guid]			   [uniqueidentifier] null
  , [id]			   [int]			  null
  , [khadid]		   [int]			  null
  , [khdzial]		   [int]			  null
  , [khid]			   [int]			  null
  , [kod]			   [varchar](40)	  null
  , [kurs]			   [float]			  null
  , [kwota]			   [float]			  null
  , [kwotarozl]		   [float]			  null
  , [kwotarozlpln]	   [float]			  null
  , [modifiedBy]	   [int]			  null
  , [modifiedDate]	   [datetime]		  null
  , [ok]			   [smallint]		  null
  , [okres]			   [smallint]		  null
  , [opis]			   [varchar](80)	  null
  , [plattyp]		   [int]			  null
  , [rejestr]		   [int]			  null
  , [related_fk]	   [smallint]		  null
  , [schemat]		   [varchar](4)		  null
  , [seria]			   [varchar](5)		  null
  , [seriadzial]	   [int]			  null
  , [serianr]		   [int]			  null
  , [stan]			   [float]			  null
  , [status]		   [smallint]		  null
  , [strona]		   [int]			  null
  , [subtyp]		   [smallint]		  null
  , [termin]		   [datetime]		  null
  , [typ]			   [smallint]		  null
  , [typdk]			   [varchar](4)		  null
  , [typkh]			   [smallint]		  null
  , [waluta]		   [varchar](3)		  null
  , [wartosc]		   [float]			  null
  , [wartoscWal]	   [float]			  null
  , [wyplata]		   [smallint]		  null
  , [wystawil]		   [int]			  null
  , [znacznik]		   [smallint]		  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_PO]' ;
go
create table [tsa].[ics_land_Symfonia_PO]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_PO_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_PO_IsDuplicate] default ((0))
  , [flag]			   [smallint]	  null
  , [id]			   [int]		  null
  , [id1]			   [int]		  null
  , [id2]			   [int]		  null
  , [typ]			   [smallint]	  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_PR]' ;
go
create table [tsa].[ics_land_Symfonia_PR]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_PR_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_PR_IsDuplicate] default ((0))
  , [aktywny]		   [bit]		  null
  , [czas]			   [datetime]	  null
  , [dane]			   [text]		  null
  , [dscname]		   [varchar](14)  null
  , [flag]			   [smallint]	  null
  , [id]			   [int]		  null
  , [idComp]		   [int]		  null
  , [is_text]		   [smallint]	  null
  , [katalog]		   [int]		  null
  , [nazwa]			   [varchar](68)  null
  , [rap_flag]		   [smallint]	  null
  , [skrot]			   [varchar](50)  null
  , [subtyp]		   [smallint]	  null
  , [typ]			   [smallint]	  null
  , [znacznik]		   [smallint]	  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_PW]' ;
go
create table [tsa].[ics_land_Symfonia_PW]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_PW_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_PW_IsDuplicate] default ((0))
  , [data]			   [datetime]	  null
  , [flag]			   [smallint]	  null
  , [id]			   [int]		  null
  , [iddkmg]		   [int]		  null
  , [iddw]			   [int]		  null
  , [idkoryg]		   [int]		  null
  , [idmg]			   [int]		  null
  , [idtw]			   [int]		  null
  , [ilosc]			   [float]		  null
  , [ilosczreal]	   [float]		  null
  , [subtyp]		   [smallint]	  null
  , [typ]			   [smallint]	  null
  , [wartosc]		   [float]		  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_RE]' ;
go
create table [tsa].[ics_land_Symfonia_RE]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_RE_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_RE_IsDuplicate] default ((0))
  , [id]			   [int]		  null
  , [idtw]			   [int]		  null
  , [ilosc]			   [float]		  null
  , [super]			   [int]		  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_RLKS]' ;
go
create table [tsa].[ics_land_Symfonia_RLKS]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_RLKS_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_RLKS_IsDuplicate] default ((0))
  , [id]			   [int]		  null
  , [iddp]			   [int]		  null
  , [idmz]			   [int]		  null
  , [ilosc]			   [float]		  null
  , [wartosc]		   [float]		  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia__KonwersjaIdToCore]' ;
go
create table [tsa].[ics_land_Symfonia__KonwersjaIdToCore]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia__KonwersjaIdToCore_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia__KonwersjaIdToCore_IsDuplicate] default ((0))
  , [coreId]		   [int]		  null
  , [hmfID]			   [int]		  null
  , [objId]			   [int]		  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_RN]' ;
go
create table [tsa].[ics_land_Symfonia_RN]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_RN_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_RN_IsDuplicate] default ((0))
  , [aktywny]		   [bit]		  null
  , [createdBy]		   [int]		  null
  , [createdDate]	   [datetime]	  null
  , [id]			   [int]		  null
  , [idtw]			   [int]		  null
  , [kod]			   [varchar](40)  null
  , [modifiedBy]	   [int]		  null
  , [modifiedDate]	   [datetime]	  null
  , [nazwa]			   [varchar](100) null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia__MigracjaDodatkowePolaKh]' ;
go
create table [tsa].[ics_land_Symfonia__MigracjaDodatkowePolaKh]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia__MigracjaDodatkowePolaKh_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia__MigracjaDodatkowePolaKh_IsDuplicate] default ((0))
  , [id]			   [int]		  null
  , [idkh]			   [int]		  null
  , [nrpola]		   [smallint]	  null
  , [opis]			   [varchar](60)  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_RO]' ;
go
create table [tsa].[ics_land_Symfonia_RO]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_RO_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_RO_IsDuplicate] default ((0))
  , [data]			   [datetime]	  null
  , [flag]			   [smallint]	  null
  , [id]			   [int]		  null
  , [id1]			   [int]		  null
  , [id2]			   [int]		  null
  , [ilosc]			   [float]		  null
  , [typ]			   [smallint]	  null
  , [wartosc]		   [float]		  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia__MigracjaDodatkowePolaTw]' ;
go
create table [tsa].[ics_land_Symfonia__MigracjaDodatkowePolaTw]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia__MigracjaDodatkowePolaTw_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia__MigracjaDodatkowePolaTw_IsDuplicate] default ((0))
  , [id]			   [int]		  null
  , [idtw]			   [int]		  null
  , [nrpola]		   [smallint]	  null
  , [opis]			   [varchar](60)  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_ROPN]' ;
go
create table [tsa].[ics_land_Symfonia_ROPN]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_ROPN_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_ROPN_IsDuplicate] default ((0))
  , [data]			   [datetime]	  null
  , [id]			   [int]		  null
  , [id1]			   [int]		  null
  , [id2]			   [int]		  null
  , [kurs1]			   [float]		  null
  , [kurs2]			   [float]		  null
  , [wartosc]		   [float]		  null
  , [wartoscW1]		   [float]		  null
  , [wartoscW2]		   [float]		  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_AcInfo]' ;
go
create table [tsa].[ics_land_Symfonia_AcInfo]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_AcInfo_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_AcInfo_IsDuplicate] default ((0))
  , [Ac_Name]		   [varchar](15)  null
  , [Ac_Value]		   [image]		  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_RP]' ;
go
create table [tsa].[ics_land_Symfonia_RP]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_RP_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_RP_IsDuplicate] default ((0))
  , [data]			   [datetime]	  null
  , [exp_fk]		   [smallint]	  null
  , [id]			   [int]		  null
  , [idrj]			   [int]		  null
  , [kod]			   [varchar](40)  null
  , [okres]			   [smallint]	  null
  , [opis]			   [varchar](80)  null
  , [seria]			   [varchar](5)	  null
  , [seriadzial]	   [int]		  null
  , [serianr]		   [int]		  null
  , [stan]			   [float]		  null
  , [stanwal]		   [float]		  null
  , [statusFK]		   [smallint]	  null
  , [typdk]			   [varchar](4)	  null
  , [waluta]		   [varchar](3)	  null
  , [wplaty]		   [float]		  null
  , [wplatywal]		   [float]		  null
  , [wyplaty]		   [float]		  null
  , [wyplatywal]	   [float]		  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_AD]' ;
go
create table [tsa].[ics_land_Symfonia_AD]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_AD_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_AD_IsDuplicate] default ((0))
  , [dom]			   [varchar](15)  null
  , [flag]			   [smallint]	  null
  , [id]			   [int]		  null
  , [idkh]			   [int]		  null
  , [idKraju]		   [int]		  null
  , [kodpocz]		   [varchar](10)  null
  , [lokal]			   [varchar](15)  null
  , [miejscowosc]	   [varchar](50)  null
  , [nazwa]			   [varchar](150) null
  , [nazwaAdr]		   [varchar](64)  null
  , [nip]			   [varchar](20)  null
  , [typkh]			   [smallint]	  null
  , [ulica]			   [varchar](50)  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_RV]' ;
go
create table [tsa].[ics_land_Symfonia_RV]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_RV_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_RV_IsDuplicate] default ((0))
  , [datarej]		   [datetime]	  null
  , [datawyst]		   [datetime]	  null
  , [dkid]			   [int]		  null
  , [id]			   [int]		  null
  , [netto]			   [float]		  null
  , [rejestr]		   [int]		  null
  , [stvat]			   [int]		  null
  , [vat]			   [float]		  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_amsys_objects]' ;
go
create table [tsa].[ics_land_Symfonia_amsys_objects]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_amsys_objects_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_amsys_objects_IsDuplicate] default ((0))
  , [init]			   [smallint]	  null
  , [lp]			   [int]		  null
  , [name]			   [varchar](100) null
  , [obtype]		   [varchar](2)	  null
  , [type]			   [char](1)	  null
  , [ver]			   [smallint]	  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_RZ]' ;
go
create table [tsa].[ics_land_Symfonia_RZ]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_RZ_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_RZ_IsDuplicate] default ((0))
  , [bazadokrz]		   [smallint]	  null
  , [bazapozrz]		   [smallint]	  null
  , [data]			   [datetime]	  null
  , [flag]			   [smallint]	  null
  , [id]			   [int]		  null
  , [iddokrz]		   [int]		  null
  , [idkh]			   [int]		  null
  , [idpozrz]		   [int]		  null
  , [idtw]			   [int]		  null
  , [iloscrl]		   [float]		  null
  , [iloscrz]		   [float]		  null
  , [magazyn]		   [int]		  null
  , [subtyp]		   [smallint]	  null
  , [termin]		   [datetime]	  null
  , [typ]			   [smallint]	  null
  , [wartosc]		   [float]		  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_ARM_BackLog]' ;
go
create table [tsa].[ics_land_Symfonia_ARM_BackLog]
(
	[EtlBatchRunId]	   [int]		   not null
  , [EtlStepRunId]	   [int]		   not null
  , [EtlThreadRunId]   [int]		   not null
  , [DataSourceKey]	   [int]		   not null
  , [EtlSourceTable]   [varchar](200)  not null
  , [EtlCreatedOn]	   [datetime]	   not null
  , [EtlCreatedBy]	   [varchar](200)  not null
  , [ExcludeFromMerge] [bit]		   not null constraint [DF_tsa_ics_land_Symfonia_ARM_BackLog_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		   not null constraint [DF_tsa_ics_land_Symfonia_ARM_BackLog_IsDuplicate] default ((0))
  , [AmountLocal]	   [float]		   null
  , [Bonus]			   [varchar](1)	   null
  , [ExpectedInvDate]  [datetime]	   null
  , [id]			   [int]		   null
  , [InternalOrderNr]  [varchar](40)   null
  , [InvoiceShipTo]	   [varchar](4)	   null
  , [InvoiceSoldTo]	   [varchar](4)	   null
  , [ItemNo]		   [varchar](40)   null
  , [ItemQty]		   [float]		   null
  , [ItemUOM]		   [varchar](8)	   null
  , [LineBonus]		   [varchar](1)	   null
  , [lineid]		   [int]		   null
  , [LineNr]		   [smallint]	   null
  , [LocalCurrency]	   [varchar](3)	   null
  , [OrderCurrency]	   [varchar](3)	   null
  , [OrderLineAmount]  [float]		   null
  , [OrderLineType]	   [varchar](1)	   null
  , [OrderNr]		   [varchar](80)   null
  , [OrginalQty]	   [float]		   null
  , [SalesCompanyId]   [int]		   null
  , [SalesPersonId]	   [int]		   null
  , [SalesPersonName]  [nvarchar](128) null
  , [StatItemQty]	   [float]		   null
  , [StatItemUOM]	   [varchar](8)	   null
  , [SysId]			   [int]		   null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_SD]' ;
go
create table [tsa].[ics_land_Symfonia_SD]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_SD_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_SD_IsDuplicate] default ((0))
  , [aktywny]		   [bit]		  null
  , [dzial]			   [bit]		  null
  , [id]			   [int]		  null
  , [idTypDok]		   [int]		  null
  , [kod]			   [varchar](40)  null
  , [numeracja]		   [smallint]	  null
  , [szablon]		   [varchar](100) null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_ARM_Customerfile]' ;
go
create table [tsa].[ics_land_Symfonia_ARM_Customerfile]
(
	[EtlBatchRunId]	   [int]		   not null
  , [EtlStepRunId]	   [int]		   not null
  , [EtlThreadRunId]   [int]		   not null
  , [DataSourceKey]	   [int]		   not null
  , [EtlSourceTable]   [varchar](200)  not null
  , [EtlCreatedOn]	   [datetime]	   not null
  , [EtlCreatedBy]	   [varchar](200)  not null
  , [ExcludeFromMerge] [bit]		   not null constraint [DF_tsa_ics_land_Symfonia_ARM_Customerfile_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		   not null constraint [DF_tsa_ics_land_Symfonia_ARM_Customerfile_IsDuplicate] default ((0))
  , [Address_1]		   [nvarchar](82)  null
  , [Address_2]		   [varchar](1)	   null
  , [Address_3]		   [varchar](1)	   null
  , [City]			   [nvarchar](50)  null
  , [Code]			   [varchar](4)	   null
  , [Country]		   [nvarchar](50)  null
  , [Customer_Type]	   [varchar](1)	   null
  , [CustomerGroup1]   [varchar](1)	   null
  , [CustomerGroup2]   [varchar](1)	   null
  , [CustomerGroup3]   [varchar](1)	   null
  , [CustomerGroup4]   [varchar](1)	   null
  , [CustomerGroup5]   [varchar](1)	   null
  , [CustomerTypeText] [varchar](1)	   null
  , [khid]			   [int]		   null
  , [Name]			   [nvarchar](150) null
  , [SysID]			   [int]		   null
  , [VATID]			   [nvarchar](20)  null
  , [Zip_Code]		   [nvarchar](10)  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_SK]' ;
go
create table [tsa].[ics_land_Symfonia_SK]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_SK_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_SK_IsDuplicate] default ((0))
  , [flag]			   [smallint]	  null
  , [id]			   [int]		  null
  , [kod]			   [varchar](40)  null
  , [kodKor]		   [varchar](4)	  null
  , [nazwa]			   [varchar](100) null
  , [super]			   [int]		  null
  , [trescFK]		   [varchar](60)  null
  , [typ]			   [smallint]	  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_ARM_Items]' ;
go
create table [tsa].[ics_land_Symfonia_ARM_Items]
(
	[EtlBatchRunId]		  [int]			 not null
  , [EtlStepRunId]		  [int]			 not null
  , [EtlThreadRunId]	  [int]			 not null
  , [DataSourceKey]		  [int]			 not null
  , [EtlSourceTable]	  [varchar](200) not null
  , [EtlCreatedOn]		  [datetime]	 not null
  , [EtlCreatedBy]		  [varchar](200) not null
  , [ExcludeFromMerge]	  [bit]			 not null constraint [DF_tsa_ics_land_Symfonia_ARM_Items_ExcludeFromMerge] default ((0))
  , [IsDuplicate]		  [bit]			 not null constraint [DF_tsa_ics_land_Symfonia_ARM_Items_IsDuplicate] default ((0))
  , [Code]				  [varchar](40)	 null
  , [Custom1]			  [varchar](1)	 null
  , [Custom2]			  [varchar](1)	 null
  , [GTIN]				  [varchar](1)	 null
  , [id]				  [int]			 null
  , [Item_Type_Text]	  [varchar](1)	 null
  , [LocalDescription1]	  [varchar](1)	 null
  , [LocalDescription2]	  [varchar](1)	 null
  , [LocalMaterialGroup1] [varchar](1)	 null
  , [LocalMaterialGroup2] [varchar](1)	 null
  , [LocalMaterialGroup3] [varchar](1)	 null
  , [LocalMaterialGroup4] [varchar](1)	 null
  , [LocalMaterialGroup5] [varchar](1)	 null
  , [Name]				  [varchar](100) null
  , [SysID]				  [int]			 null
  , [type1]				  [varchar](1)	 null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_SM]' ;
go
create table [tsa].[ics_land_Symfonia_SM]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_SM_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_SM_IsDuplicate] default ((0))
  , [flag]			   [smallint]	  null
  , [id]			   [int]		  null
  , [idtw]			   [int]		  null
  , [magazyn]		   [int]		  null
  , [stan]			   [float]		  null
  , [stanHandl]		   [float]		  null
  , [subtyp]		   [smallint]	  null
  , [typ]			   [smallint]	  null
  , [wartosc]		   [float]		  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_AU]' ;
go
create table [tsa].[ics_land_Symfonia_AU]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_AU_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_AU_IsDuplicate] default ((0))
  , [id]			   [int]		  null
  , [o_id]			   [int]		  null
  , [o_oper]		   [smallint]	  null
  , [o_parent]		   [int]		  null
  , [o_seed]		   [int]		  null
  , [o_type]		   [int]		  null
  , [o_unit]		   [int]		  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_SR]' ;
go
create table [tsa].[ics_land_Symfonia_SR]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_SR_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_SR_IsDuplicate] default ((0))
  , [id]			   [int]		  null
  , [idrj]			   [int]		  null
  , [stannl]		   [float]		  null
  , [stannlwal]		   [float]		  null
  , [stanpl]		   [float]		  null
  , [stanplwal]		   [float]		  null
  , [waluta]		   [varchar](3)	  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_ARM_SalesInvoiceTrans]' ;
go
create table [tsa].[ics_land_Symfonia_ARM_SalesInvoiceTrans]
(
	[EtlBatchRunId]		[int]			not null
  , [EtlStepRunId]		[int]			not null
  , [EtlThreadRunId]	[int]			not null
  , [DataSourceKey]		[int]			not null
  , [EtlSourceTable]	[varchar](200)	not null
  , [EtlCreatedOn]		[datetime]		not null
  , [EtlCreatedBy]		[varchar](200)	not null
  , [ExcludeFromMerge]	[bit]			not null constraint [DF_tsa_ics_land_Symfonia_ARM_SalesInvoiceTrans_ExcludeFromMerge] default ((0))
  , [IsDuplicate]		[bit]			not null constraint [DF_tsa_ics_land_Symfonia_ARM_SalesInvoiceTrans_IsDuplicate] default ((0))
  , [Bonus]				[varchar](1)	null
  , [Custom1]			[varchar](1)	null
  , [Custom2]			[varchar](1)	null
  , [DeliveryTermID]	[varchar](1)	null
  , [DeliveryTermText]	[varchar](1)	null
  , [Discount]			[varchar](1)	null
  , [FreightCost]		[varchar](1)	null
  , [id]				[int]			null
  , [Idline]			[int]			null
  , [InvAmount]			[float]			null
  , [InvCurrAmount]		[float]			null
  , [InvCurrency]		[varchar](3)	null
  , [InvDate]			[datetime]		null
  , [InvLineAmountLoc]	[float]			null
  , [invlinenr]			[smallint]		null
  , [InvNum]			[varchar](40)	null
  , [InvoiceLineType]	[varchar](1)	null
  , [InvoiceShipTo]		[varchar](4)	null
  , [InvoiceSoldTo]		[varchar](4)	null
  , [InvUOM]			[varchar](8)	null
  , [ItemNo]			[varchar](40)	null
  , [ItemQty]			[float]			null
  , [LocalCurrencyCode] [varchar](3)	null
  , [MatCharName1]		[varchar](1)	null
  , [MatCharName2]		[varchar](1)	null
  , [MatCharName3]		[varchar](1)	null
  , [MatCharName4]		[varchar](1)	null
  , [MatCharName5]		[varchar](1)	null
  , [MatCharValue1]		[varchar](1)	null
  , [MatCharValue2]		[varchar](1)	null
  , [MatCharValue3]		[varchar](1)	null
  , [MatCharValue4]		[varchar](1)	null
  , [MatCharValue5]		[varchar](1)	null
  , [OrderLineNr]		[smallint]		null
  , [OrderNr]			[varchar](80)	null
  , [PaymentTermText]	[varchar](7)	null
  , [SalesPersonId]		[int]			null
  , [SalesPersonName]	[nvarchar](128) null
  , [StatisicalQty]		[float]			null
  , [StatisticalUOM]	[varchar](8)	null
  , [StdCost]			[float]			null
  , [SysID]				[int]			null
  , [TermOfPaymentID]	[int]			null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_StanyMinMax]' ;
go
create table [tsa].[ics_land_Symfonia_StanyMinMax]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_StanyMinMax_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_StanyMinMax_IsDuplicate] default ((0))
  , [id]			   [int]		  null
  , [MagazynId]		   [int]		  null
  , [StanMax]		   [float]		  null
  , [StanMin]		   [float]		  null
  , [TowarId]		   [int]		  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_ARM_ShipNotInvoiced]' ;
go
create table [tsa].[ics_land_Symfonia_ARM_ShipNotInvoiced]
(
	[EtlBatchRunId]	   [int]		   not null
  , [EtlStepRunId]	   [int]		   not null
  , [EtlThreadRunId]   [int]		   not null
  , [DataSourceKey]	   [int]		   not null
  , [EtlSourceTable]   [varchar](200)  not null
  , [EtlCreatedOn]	   [datetime]	   not null
  , [EtlCreatedBy]	   [varchar](200)  not null
  , [ExcludeFromMerge] [bit]		   not null constraint [DF_tsa_ics_land_Symfonia_ARM_ShipNotInvoiced_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		   not null constraint [DF_tsa_ics_land_Symfonia_ARM_ShipNotInvoiced_IsDuplicate] default ((0))
  , [AmountLocal]	   [float]		   null
  , [Bonus]			   [varchar](1)	   null
  , [ExpectedInvDate]  [datetime]	   null
  , [id]			   [int]		   null
  , [InvoiceLineType]  [varchar](1)	   null
  , [InvoiceShipTo]	   [varchar](4)	   null
  , [InvoiceSoldTo]	   [varchar](4)	   null
  , [ItemNo]		   [varchar](40)   null
  , [ItemQty]		   [float]		   null
  , [ItemUOM]		   [varchar](8)	   null
  , [LineBonus]		   [varchar](1)	   null
  , [lineid]		   [int]		   null
  , [LocalCurrency]	   [varchar](3)	   null
  , [OrderCurrency]	   [varchar](3)	   null
  , [OrderLineAmount]  [float]		   null
  , [OrderLineNr]	   [smallint]	   null
  , [OrderNr]		   [varchar](80)   null
  , [SalesCompanyId]   [int]		   null
  , [SalesPersonId]	   [int]		   null
  , [SalesPersonName]  [nvarchar](128) null
  , [ShippingDokNr]	   [varchar](40)   null
  , [StatItemQty]	   [float]		   null
  , [StatItemUOM]	   [varchar](8)	   null
  , [SysId]			   [int]		   null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_TC]' ;
go
create table [tsa].[ics_land_Symfonia_TC]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_TC_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_TC_IsDuplicate] default ((0))
  , [aktywny]		   [bit]		  null
  , [icon]			   [int]		  null
  , [id]			   [int]		  null
  , [kod]			   [varchar](40)  null
  , [nazwa]			   [varchar](100) null
  , [powiazanie]	   [int]		  null
  , [rodzaj]		   [int]		  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_CK]' ;
go
create table [tsa].[ics_land_Symfonia_CK]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_CK_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_CK_IsDuplicate] default ((0))
  , [aktywny]		   [bit]		  null
  , [cenowy]		   [smallint]	  null
  , [cykliczny]		   [smallint]	  null
  , [czw]			   [bit]		  null
  , [datado]		   [datetime]	  null
  , [dataod]		   [datetime]	  null
  , [dzial]			   [int]		  null
  , [id]			   [int]		  null
  , [kod]			   [varchar](40)  null
  , [kontrah]		   [smallint]	  null
  , [laczony]		   [smallint]	  null
  , [nd]			   [bit]		  null
  , [numer]			   [smallint]	  null
  , [numerlacz]		   [smallint]	  null
  , [opis]			   [varchar](80)  null
  , [pon]			   [bit]		  null
  , [pt]			   [bit]		  null
  , [sb]			   [bit]		  null
  , [sr]			   [bit]		  null
  , [wt]			   [bit]		  null
  , [znacznik]		   [smallint]	  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_TR]' ;
go
create table [tsa].[ics_land_Symfonia_TR]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_TR_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_TR_IsDuplicate] default ((0))
  , [data]			   [datetime]	  null
  , [datarozl]		   [datetime]	  null
  , [dzial]			   [int]		  null
  , [flag]			   [smallint]	  null
  , [id]			   [int]		  null
  , [id_komu]		   [int]		  null
  , [id_kto]		   [int]		  null
  , [kod]			   [varchar](40)  null
  , [nrozl_oper]	   [int]		  null
  , [nrozlilosc]	   [int]		  null
  , [ok]			   [smallint]	  null
  , [owner_base]	   [int]		  null
  , [owner_id]		   [int]		  null
  , [status]		   [smallint]	  null
  , [subtyp]		   [smallint]	  null
  , [termin]		   [datetime]	  null
  , [typ]			   [smallint]	  null
  , [wartosc]		   [float]		  null
  , [wartosc_rozl]	   [float]		  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_CN]' ;
go
create table [tsa].[ics_land_Symfonia_CN]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_CN_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_CN_IsDuplicate] default ((0))
  , [aktywna]		   [smallint]	  null
  , [cena]			   [float]		  null
  , [createdBy]		   [int]		  null
  , [dataend]		   [datetime]	  null
  , [datastart]		   [datetime]	  null
  , [flag]			   [smallint]	  null
  , [flagcen]		   [smallint]	  null
  , [id]			   [int]		  null
  , [idck]			   [int]		  null
  , [idpd]			   [int]		  null
  , [idpm]			   [int]		  null
  , [parametr]		   [float]		  null
  , [subtyp]		   [smallint]	  null
  , [typ]			   [smallint]	  null
  , [typceny]		   [smallint]	  null
  , [typpar]		   [smallint]	  null
  , [typpd]			   [smallint]	  null
  , [waluta]		   [varchar](3)	  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_TD]' ;
go
create table [tsa].[ics_land_Symfonia_TD]
(
	[EtlBatchRunId]		 [int]			not null
  , [EtlStepRunId]		 [int]			not null
  , [EtlThreadRunId]	 [int]			not null
  , [DataSourceKey]		 [int]			not null
  , [EtlSourceTable]	 [varchar](200) not null
  , [EtlCreatedOn]		 [datetime]		not null
  , [EtlCreatedBy]		 [varchar](200) not null
  , [ExcludeFromMerge]	 [bit]			not null constraint [DF_tsa_ics_land_Symfonia_TD_ExcludeFromMerge] default ((0))
  , [IsDuplicate]		 [bit]			not null constraint [DF_tsa_ics_land_Symfonia_TD_IsDuplicate] default ((0))
  , [aktywny]			 [bit]			null
  , [charakter]			 [smallint]		null
  , [datarej]			 [smallint]		null
  , [flag]				 [smallint]		null
  , [id]				 [int]			null
  , [idDokKoryg]		 [int]			null
  , [idDokSkojarz]		 [int]			null
  , [idDokZal]			 [int]			null
  , [idDokZalKon]		 [int]			null
  , [idRejestr]			 [int]			null
  , [idRejestrNaliczony] [int]			null
  , [idRejestrNP]		 [int]			null
  , [idRejestrOO]		 [int]			null
  , [idSchematKs]		 [int]			null
  , [idSeriaKoryg]		 [int]			null
  , [idSeriaSkojarz]	 [int]			null
  , [idSeriaZal]		 [int]			null
  , [idSeriaZalKon]		 [int]			null
  , [jednostka]			 [smallint]		null
  , [jpkRodzaj]			 [smallint]		null
  , [kod]				 [varchar](40)	null
  , [nazwa]				 [varchar](100) null
  , [opis]				 [varchar](100) null
  , [symbolFK]			 [varchar](4)	null
  , [terminRozl]		 [smallint]		null
  , [typ]				 [smallint]		null
  , [typFK]				 [varchar](4)	null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_CP]' ;
go
create table [tsa].[ics_land_Symfonia_CP]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_CP_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_CP_IsDuplicate] default ((0))
  , [bazapoz]		   [smallint]	  null
  , [cena]			   [float]		  null
  , [cenowy]		   [smallint]	  null
  , [flag]			   [smallint]	  null
  , [id]			   [int]		  null
  , [idck]			   [int]		  null
  , [idpoz]			   [int]		  null
  , [kod]			   [varchar](40)  null
  , [typ]			   [smallint]	  null
  , [waluta]		   [varchar](3)	  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_TW]' ;
go
create table [tsa].[ics_land_Symfonia_TW]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_TW_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_TW_IsDuplicate] default ((0))
  , [aktywny]		   [bit]		  null
  , [createdBy]		   [int]		  null
  , [createdDate]	   [datetime]	  null
  , [flag]			   [smallint]	  null
  , [fundusz]		   [int]		  null
  , [id]			   [int]		  null
  , [idlongname]	   [int]		  null
  , [info]			   [smallint]	  null
  , [jm]			   [varchar](8)	  null
  , [jmdef]			   [smallint]	  null
  , [jmdod1]		   [varchar](8)	  null
  , [jmdod2]		   [varchar](8)	  null
  , [jmdom]			   [varchar](8)	  null
  , [jmuzup]		   [varchar](8)	  null
  , [katalog]		   [int]		  null
  , [kod]			   [varchar](40)  null
  , [kodpaskowy]	   [varchar](150) null
  , [kontofk]		   [varchar](24)  null
  , [metoda]		   [smallint]	  null
  , [modifiedBy]	   [int]		  null
  , [modifiedDate]	   [datetime]	  null
  , [nazwa]			   [varchar](100) null
  , [nazwaFiskal]	   [varchar](40)  null
  , [negoc]			   [smallint]	  null
  , [odwrotneObc]	   [smallint]	  null
  , [pcn]			   [varchar](10)  null
  , [przelicz]		   [smallint]	  null
  , [przelit]		   [smallint]	  null
  , [przeljmdod1]	   [float]		  null
  , [przeljmdod2]	   [float]		  null
  , [przeljmdom]	   [float]		  null
  , [przelkg]		   [float]		  null
  , [przeluz]		   [float]		  null
  , [rodzaj]		   [int]		  null
  , [stanmax]		   [float]		  null
  , [stanmin]		   [float]		  null
  , [subtyp]		   [smallint]	  null
  , [super]			   [int]		  null
  , [sww]			   [varchar](20)  null
  , [szablon]		   [varchar](40)  null
  , [typ]			   [smallint]	  null
  , [typks]			   [varchar](40)  null
  , [vat50]			   [smallint]	  null
  , [vatsp]			   [int]		  null
  , [zaokrag]		   [smallint]	  null
  , [znacznik]		   [smallint]	  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_CT]' ;
go
create table [tsa].[ics_land_Symfonia_CT]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_CT_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_CT_IsDuplicate] default ((0))
  , [id]			   [int]		  null
  , [idck]			   [int]		  null
  , [idpm]			   [int]		  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_TX]' ;
go
create table [tsa].[ics_land_Symfonia_TX]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_TX_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_TX_IsDuplicate] default ((0))
  , [flag]			   [smallint]	  null
  , [id]			   [int]		  null
  , [opis]			   [text]		  null
  , [subtyp]		   [smallint]	  null
  , [typ]			   [smallint]	  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_DK]' ;
go
create table [tsa].[ics_land_Symfonia_DK]
(
	[EtlBatchRunId]		 [int]				not null
  , [EtlStepRunId]		 [int]				not null
  , [EtlThreadRunId]	 [int]				not null
  , [DataSourceKey]		 [int]				not null
  , [EtlSourceTable]	 [varchar](200)		not null
  , [EtlCreatedOn]		 [datetime]			not null
  , [EtlCreatedBy]		 [varchar](200)		not null
  , [ExcludeFromMerge]	 [bit]				not null constraint [DF_tsa_ics_land_Symfonia_DK_ExcludeFromMerge] default ((0))
  , [IsDuplicate]		 [bit]				not null constraint [DF_tsa_ics_land_Symfonia_DK_IsDuplicate] default ((0))
  , [aktywny]			 [bit]				null
  , [anulowany]			 [smallint]			null
  , [bufor]				 [smallint]			null
  , [createdBy]			 [int]				null
  , [createdDate]		 [datetime]			null
  , [data]				 [datetime]			null
  , [data_obcy]			 [datetime]			null
  , [datarej]			 [datetime]			null
  , [datarej2]			 [datetime]			null
  , [datasp]			 [datetime]			null
  , [datawplywu]		 [datetime]			null
  , [dataZest1]			 [datetime]			null
  , [eFaktura]			 [smallint]			null
  , [exp_fk]			 [smallint]			null
  , [flag]				 [smallint]			null
  , [formaplatn]		 [int]				null
  , [grupacen]			 [smallint]			null
  , [guid]				 [uniqueidentifier] null
  , [id]				 [int]				null
  , [iddokkoryg]		 [int]				null
  , [info]				 [smallint]			null
  , [jpk]				 [smallint]			null
  , [katalog]			 [int]				null
  , [khadid]			 [int]				null
  , [khid]				 [int]				null
  , [kod]				 [varchar](40)		null
  , [kod_obcy]			 [varchar](40)		null
  , [koszt]				 [float]			null
  , [kosztAproksymowany] [float]			null
  , [kurs]				 [float]			null
  , [kursDoch]			 [float]			null
  , [magazyn]			 [int]				null
  , [modifiedBy]		 [int]				null
  , [modifiedDate]		 [datetime]			null
  , [nazwa]				 [varchar](40)		null
  , [netto]				 [float]			null
  , [odadid]			 [int]				null
  , [odebrane]			 [varchar](40)		null
  , [odid]				 [int]				null
  , [ok]				 [smallint]			null
  , [okres]				 [smallint]			null
  , [opis]				 [varchar](80)		null
  , [paragon]			 [int]				null
  , [plattermin]		 [datetime]			null
  , [plattyp]			 [int]				null
  , [rabat]				 [float]			null
  , [rejestrVat]		 [int]				null
  , [rejestrVat2]		 [int]				null
  , [rodzaj]			 [int]				null
  , [rozlmg]			 [smallint]			null
  , [rr]				 [smallint]			null
  , [schemat]			 [varchar](4)		null
  , [seria]				 [varchar](5)		null
  , [seriadzial]		 [int]				null
  , [serianr]			 [int]				null
  , [statusFK]			 [smallint]			null
  , [statusRDF]			 [smallint]			null
  , [subtyp]			 [smallint]			null
  , [super]				 [int]				null
  , [typ]				 [smallint]			null
  , [typ_dk]			 [varchar](4)		null
  , [typceny]			 [int]				null
  , [vat]				 [float]			null
  , [walBrutto]			 [float]			null
  , [walNetto]			 [float]			null
  , [waluta]			 [varchar](3)		null
  , [wartoscSp]			 [float]			null
  , [wartPrzychod]		 [float]			null
  , [wplaty]			 [float]			null
  , [wystawil]			 [int]				null
  , [znacznik]			 [smallint]			null
  , [zyskdod]			 [float]			null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_UZ]' ;
go
create table [tsa].[ics_land_Symfonia_UZ]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_UZ_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_UZ_IsDuplicate] default ((0))
  , [bazauz]		   [smallint]	  null
  , [cena]			   [float]		  null
  , [flag]			   [smallint]	  null
  , [id]			   [int]		  null
  , [idkh]			   [int]		  null
  , [idobcy]		   [int]		  null
  , [iduz]			   [int]		  null
  , [kodobcy]		   [varchar](40)  null
  , [subtyp]		   [smallint]	  null
  , [typ]			   [smallint]	  null
  , [waluta]		   [varchar](3)	  null
  , [wart]			   [float]		  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_DP]' ;
go
create table [tsa].[ics_land_Symfonia_DP]
(
	[EtlBatchRunId]		 [int]			not null
  , [EtlStepRunId]		 [int]			not null
  , [EtlThreadRunId]	 [int]			not null
  , [DataSourceKey]		 [int]			not null
  , [EtlSourceTable]	 [varchar](200) not null
  , [EtlCreatedOn]		 [datetime]		not null
  , [EtlCreatedBy]		 [varchar](200) not null
  , [ExcludeFromMerge]	 [bit]			not null constraint [DF_tsa_ics_land_Symfonia_DP_ExcludeFromMerge] default ((0))
  , [IsDuplicate]		 [bit]			not null constraint [DF_tsa_ics_land_Symfonia_DP_IsDuplicate] default ((0))
  , [bufor]				 [smallint]		null
  , [cena]				 [float]		null
  , [cenaBaza]			 [float]		null
  , [cenaBazaPl]		 [float]		null
  , [cenabaztow]		 [float]		null
  , [cenawal]			 [float]		null
  , [data]				 [datetime]		null
  , [flag]				 [smallint]		null
  , [grupacen]			 [smallint]		null
  , [id]				 [int]			null
  , [idkh]				 [int]			null
  , [idlongname]		 [int]			null
  , [idpozkoryg]		 [int]			null
  , [idtw]				 [int]			null
  , [ilosc]				 [float]		null
  , [iloscjedn]			 [float]		null
  , [iloscRLKS]			 [float]		null
  , [iloscwp]			 [float]		null
  , [jm]				 [varchar](8)	null
  , [jmwp]				 [varchar](8)	null
  , [kod]				 [varchar](40)	null
  , [kompensata]		 [smallint]		null
  , [koszt]				 [float]		null
  , [kosztAproksymowany] [float]		null
  , [lp]				 [smallint]		null
  , [magazyn]			 [int]			null
  , [odwrotneObc]		 [smallint]		null
  , [opis]				 [varchar](40)	null
  , [opisdod]			 [varchar](20)	null
  , [rejestrVAT]		 [int]			null
  , [rejestrVAT2]		 [int]			null
  , [schemat]			 [varchar](4)	null
  , [stvat]				 [int]			null
  , [subtyp]			 [smallint]		null
  , [super]				 [int]			null
  , [superkoryg]		 [int]			null
  , [typ]				 [smallint]		null
  , [typceny]			 [int]			null
  , [vat50]				 [smallint]		null
  , [walBrutto]			 [float]		null
  , [walcenybaz]		 [varchar](3)	null
  , [walNetto]			 [float]		null
  , [waluta]			 [varchar](3)	null
  , [wartNetto]			 [float]		null
  , [wartPrzychod]		 [float]		null
  , [wartstvat]			 [smallint]		null
  , [wartTowaru]		 [float]		null
  , [wartVat]			 [float]		null
  , [zyskdod]			 [float]		null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_UR]' ;
go
create table [tsa].[ics_land_Symfonia_UR]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_UR_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_UR_IsDuplicate] default ((0))
  , [aktywny]		   [bit]		  null
  , [bkonto]		   [varchar](50)  null
  , [bnazwa]		   [varchar](100) null
  , [createdBy]		   [int]		  null
  , [createdDate]	   [datetime]	  null
  , [dom]			   [varchar](15)  null
  , [email]			   [varchar](50)  null
  , [fax]			   [varchar](25)  null
  , [flag]			   [smallint]	  null
  , [formaplatn]	   [int]		  null
  , [grupacen]		   [smallint]	  null
  , [id]			   [int]		  null
  , [idfk]			   [int]		  null
  , [idfk2]			   [int]		  null
  , [idKraju]		   [int]		  null
  , [idTX]			   [int]		  null
  , [imie]			   [varchar](14)  null
  , [info]			   [smallint]	  null
  , [katalog]		   [int]		  null
  , [khfk]			   [varchar](24)  null
  , [kod]			   [varchar](40)  null
  , [kodpocz]		   [varchar](10)  null
  , [limit]			   [smallint]	  null
  , [limitkwota]	   [float]		  null
  , [limitwaluta]	   [varchar](3)	  null
  , [lokal]			   [varchar](15)  null
  , [miejscowosc]	   [varchar](50)  null
  , [modifiedBy]	   [int]		  null
  , [modifiedDate]	   [datetime]	  null
  , [naglowek]		   [varchar](19)  null
  , [nazwa]			   [varchar](150) null
  , [nazwisko]		   [varchar](24)  null
  , [negoc]			   [smallint]	  null
  , [nip]			   [varchar](20)  null
  , [plattermin]	   [smallint]	  null
  , [plattyp]		   [int]		  null
  , [regon]			   [varchar](20)  null
  , [rejon]			   [varchar](25)  null
  , [rodzaj]		   [int]		  null
  , [subtyp]		   [smallint]	  null
  , [super]			   [int]		  null
  , [tel1]			   [varchar](25)  null
  , [tel2]			   [varchar](25)  null
  , [typ]			   [smallint]	  null
  , [typks]			   [varchar](40)  null
  , [ulica]			   [varchar](50)  null
  , [upust]			   [float]		  null
  , [www]			   [varchar](100) null
  , [znacznik]		   [smallint]	  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_DT]' ;
go
create table [tsa].[ics_land_Symfonia_DT]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_DT_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_DT_IsDuplicate] default ((0))
  , [id]			   [int]		  null
  , [idkh]			   [int]		  null
  , [idtw]			   [int]		  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_WD]' ;
go
create table [tsa].[ics_land_Symfonia_WD]
(
	[EtlBatchRunId]	   [int]			  not null
  , [EtlStepRunId]	   [int]			  not null
  , [EtlThreadRunId]   [int]			  not null
  , [DataSourceKey]	   [int]			  not null
  , [EtlSourceTable]   [varchar](200)	  not null
  , [EtlCreatedOn]	   [datetime]		  not null
  , [EtlCreatedBy]	   [varchar](200)	  not null
  , [ExcludeFromMerge] [bit]			  not null constraint [DF_tsa_ics_land_Symfonia_WD_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]			  not null constraint [DF_tsa_ics_land_Symfonia_WD_IsDuplicate] default ((0))
  , [cena]			   [float]			  null
  , [dzial]			   [varchar](40)	  null
  , [flag]			   [smallint]		  null
  , [guid_obcy]		   [uniqueidentifier] null
  , [id]			   [int]			  null
  , [id_obcy]		   [int]			  null
  , [id_wlasny]		   [int]			  null
  , [idkh]			   [int]			  null
  , [idkhfk]		   [int]			  null
  , [ilosc]			   [float]			  null
  , [kodkh]			   [varchar](40)	  null
  , [kodtw]			   [varchar](40)	  null
  , [opis]			   [varchar](100)	  null
  , [typ]			   [smallint]		  null
  , [wartosc]		   [float]			  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_DW]' ;
go
create table [tsa].[ics_land_Symfonia_DW]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_DW_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_DW_IsDuplicate] default ((0))
  , [bufor]			   [int]		  null
  , [cena]			   [float]		  null
  , [data]			   [datetime]	  null
  , [flag]			   [smallint]	  null
  , [id]			   [int]		  null
  , [iddkpz]		   [int]		  null
  , [iddkzk]		   [int]		  null
  , [iddw]			   [int]		  null
  , [idkh]			   [int]		  null
  , [idtw]			   [int]		  null
  , [ilosc]			   [float]		  null
  , [iloscdosp]		   [float]		  null
  , [iloscPz]		   [float]		  null
  , [kod]			   [varchar](40)  null
  , [magazyn]		   [int]		  null
  , [numer]			   [int]		  null
  , [stan]			   [float]		  null
  , [subtyp]		   [smallint]	  null
  , [typ]			   [smallint]	  null
  , [wartoscdosp]	   [float]		  null
  , [wartoscst]		   [float]		  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_XT]' ;
go
create table [tsa].[ics_land_Symfonia_XT]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_XT_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_XT_IsDuplicate] default ((0))
  , [baza]			   [smallint]	  null
  , [data1]			   [datetime]	  null
  , [data2]			   [datetime]	  null
  , [flag]			   [smallint]	  null
  , [id]			   [int]		  null
  , [klient]		   [int]		  null
  , [kod]			   [varchar](40)  null
  , [long]			   [int]		  null
  , [long2]			   [int]		  null
  , [nazwa]			   [varchar](100) null
  , [podkatalog]	   [smallint]	  null
  , [root]			   [int]		  null
  , [subtyp]		   [smallint]	  null
  , [super]			   [int]		  null
  , [typ]			   [smallint]	  null
  , [wartosc]		   [float]		  null
  , [zawartosc]		   [int]		  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_EP]' ;
go
create table [tsa].[ics_land_Symfonia_EP]
(
	[EtlBatchRunId]	   [int]			  not null
  , [EtlStepRunId]	   [int]			  not null
  , [EtlThreadRunId]   [int]			  not null
  , [DataSourceKey]	   [int]			  not null
  , [EtlSourceTable]   [varchar](200)	  not null
  , [EtlCreatedOn]	   [datetime]		  not null
  , [EtlCreatedBy]	   [varchar](200)	  not null
  , [ExcludeFromMerge] [bit]			  not null constraint [DF_tsa_ics_land_Symfonia_EP_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]			  not null constraint [DF_tsa_ics_land_Symfonia_EP_IsDuplicate] default ((0))
  , [guid]			   [uniqueidentifier] null
  , [id]			   [int]			  null
  , [kurs]			   [float]			  null
  , [podmiot]		   [int]			  null
  , [typ]			   [smallint]		  null
  , [zobowiazanie]	   [int]			  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_ZE]' ;
go
create table [tsa].[ics_land_Symfonia_ZE]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_ZE_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_ZE_IsDuplicate] default ((0))
  , [id]			   [int]		  null
  , [idKh]			   [int]		  null
  , [idTw]			   [int]		  null
  , [idZn]			   [int]		  null
  , [ilosc]			   [float]		  null
  , [lp]			   [int]		  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_ErrorLog]' ;
go
create table [tsa].[ics_land_Symfonia_ErrorLog]
(
	[EtlBatchRunId]	   [int]		   not null
  , [EtlStepRunId]	   [int]		   not null
  , [EtlThreadRunId]   [int]		   not null
  , [DataSourceKey]	   [int]		   not null
  , [EtlSourceTable]   [varchar](200)  not null
  , [EtlCreatedOn]	   [datetime]	   not null
  , [EtlCreatedBy]	   [varchar](200)  not null
  , [ExcludeFromMerge] [bit]		   not null constraint [DF_tsa_ics_land_Symfonia_ErrorLog_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		   not null constraint [DF_tsa_ics_land_Symfonia_ErrorLog_IsDuplicate] default ((0))
  , [data]			   [datetime]	   null
  , [errno]			   [int]		   null
  , [id]			   [int]		   null
  , [opis]			   [varchar](2000) null
  , [super]			   [int]		   null
  , [typ]			   [smallint]	   null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_WR]' ;
go
create table [tsa].[ics_land_Symfonia_WR]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_WR_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_WR_IsDuplicate] default ((0))
  , [aktywny]		   [bit]		  null
  , [bkonto]		   [varchar](50)  null
  , [bnazwa]		   [varchar](100) null
  , [createdBy]		   [int]		  null
  , [createdDate]	   [datetime]	  null
  , [dom]			   [varchar](15)  null
  , [email]			   [varchar](50)  null
  , [fax]			   [varchar](25)  null
  , [flag]			   [smallint]	  null
  , [formaplatn]	   [int]		  null
  , [grupacen]		   [smallint]	  null
  , [id]			   [int]		  null
  , [idfk]			   [int]		  null
  , [idfk2]			   [int]		  null
  , [idKraju]		   [int]		  null
  , [idTX]			   [int]		  null
  , [imie]			   [varchar](14)  null
  , [info]			   [smallint]	  null
  , [katalog]		   [int]		  null
  , [khfk]			   [varchar](24)  null
  , [kod]			   [varchar](40)  null
  , [kodpocz]		   [varchar](10)  null
  , [limit]			   [smallint]	  null
  , [limitkwota]	   [float]		  null
  , [limitwaluta]	   [varchar](3)	  null
  , [lokal]			   [varchar](15)  null
  , [miejscowosc]	   [varchar](50)  null
  , [modifiedBy]	   [int]		  null
  , [modifiedDate]	   [datetime]	  null
  , [naglowek]		   [varchar](19)  null
  , [nazwa]			   [varchar](150) null
  , [nazwisko]		   [varchar](24)  null
  , [negoc]			   [smallint]	  null
  , [nip]			   [varchar](20)  null
  , [plattermin]	   [smallint]	  null
  , [plattyp]		   [int]		  null
  , [regon]			   [varchar](20)  null
  , [rejon]			   [varchar](25)  null
  , [rodzaj]		   [int]		  null
  , [subtyp]		   [smallint]	  null
  , [super]			   [int]		  null
  , [tel1]			   [varchar](25)  null
  , [tel2]			   [varchar](25)  null
  , [typ]			   [smallint]	  null
  , [typks]			   [varchar](40)  null
  , [ulica]			   [varchar](50)  null
  , [upust]			   [float]		  null
  , [www]			   [varchar](100) null
  , [znacznik]		   [smallint]	  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_EK]' ;
go
create table [tsa].[ics_land_Symfonia_EK]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_EK_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_EK_IsDuplicate] default ((0))
  , [flag]			   [smallint]	  null
  , [id]			   [int]		  null
  , [idEKwzor]		   [int]		  null
  , [idSK]			   [int]		  null
  , [kod]			   [varchar](40)  null
  , [kwota]			   [smallint]	  null
  , [mnoznik]		   [float]		  null
  , [nazwa]			   [varchar](100) null
  , [nr_poz]		   [smallint]	  null
  , [szablon]		   [varchar](40)  null
  , [wymiar01]		   [varchar](40)  null
  , [wymiar02]		   [varchar](40)  null
  , [wymiar03]		   [varchar](40)  null
  , [wymiar04]		   [varchar](40)  null
  , [wymiar05]		   [varchar](40)  null
  , [wymiar06]		   [varchar](40)  null
  , [wymiar07]		   [varchar](40)  null
  , [wymiar08]		   [varchar](40)  null
  , [wymiar09]		   [varchar](40)  null
  , [wymiar10]		   [varchar](40)  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_ZL]' ;
go
create table [tsa].[ics_land_Symfonia_ZL]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_ZL_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_ZL_IsDuplicate] default ((0))
  , [aktywny]		   [bit]		  null
  , [anulowany]		   [smallint]	  null
  , [cena]			   [float]		  null
  , [createdBy]		   [int]		  null
  , [createdDate]	   [datetime]	  null
  , [data]			   [datetime]	  null
  , [data_real]		   [datetime]	  null
  , [data_status]	   [datetime]	  null
  , [dzial]			   [int]		  null
  , [flag]			   [smallint]	  null
  , [id]			   [int]		  null
  , [idkh]			   [int]		  null
  , [idrn]			   [int]		  null
  , [idtw]			   [int]		  null
  , [ilosc]			   [float]		  null
  , [iloscGotowa]	   [float]		  null
  , [katalog]		   [int]		  null
  , [kod]			   [varchar](40)  null
  , [modifiedBy]	   [int]		  null
  , [modifiedDate]	   [datetime]	  null
  , [nazwa]			   [varchar](40)  null
  , [okres]			   [smallint]	  null
  , [opis]			   [varchar](100) null
  , [rodzaj]		   [int]		  null
  , [seria]			   [varchar](5)	  null
  , [seriadzial]	   [int]		  null
  , [serianr]		   [int]		  null
  , [status]		   [smallint]	  null
  , [subtyp]		   [smallint]	  null
  , [super]			   [int]		  null
  , [typ]			   [smallint]	  null
  , [typ_dk]		   [varchar](4)	  null
  , [znacznik]		   [smallint]	  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_FP]' ;
go
create table [tsa].[ics_land_Symfonia_FP]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_FP_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_FP_IsDuplicate] default ((0))
  , [fundusz]		   [int]		  null
  , [id]			   [int]		  null
  , [idDk]			   [int]		  null
  , [wartNetto]		   [float]		  null
  , [wplata]		   [float]		  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_ZN]' ;
go
create table [tsa].[ics_land_Symfonia_ZN]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_ZN_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_ZN_IsDuplicate] default ((0))
  , [data]			   [datetime]	  null
  , [dzial]			   [int]		  null
  , [id]			   [int]		  null
  , [idUser]		   [int]		  null
  , [opcje]			   [smallint]	  null
  , [opis]			   [varchar](100) null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_HW]' ;
go
create table [tsa].[ics_land_Symfonia_HW]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_HW_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_HW_IsDuplicate] default ((0))
  , [id]			   [int]		  null
  , [iddk]			   [int]		  null
  , [typdk]			   [smallint]	  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_ZR]' ;
go
create table [tsa].[ics_land_Symfonia_ZR]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_ZR_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_ZR_IsDuplicate] default ((0))
  , [id]			   [int]		  null
  , [idtw]			   [int]		  null
  , [idzl]			   [int]		  null
  , [ilosc]			   [float]		  null
  , [wartosc]		   [float]		  null
  , [wspolczynnik]	   [float]		  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_IL]' ;
go
create table [tsa].[ics_land_Symfonia_IL]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_IL_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_IL_IsDuplicate] default ((0))
  , [data]			   [datetime]	  null
  , [data_stan0]	   [datetime]	  null
  , [flag]			   [smallint]	  null
  , [id]			   [int]		  null
  , [magazyn]		   [int]		  null
  , [nazwa]			   [varchar](40)  null
  , [typ]			   [smallint]	  null
  , [wlasciwosci]	   [smallint]	  null
  , [wystawil]		   [int]		  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_ZO]' ;
go
create table [tsa].[ics_land_Symfonia_ZO]
(
	[EtlBatchRunId]	   [int]			  not null
  , [EtlStepRunId]	   [int]			  not null
  , [EtlThreadRunId]   [int]			  not null
  , [DataSourceKey]	   [int]			  not null
  , [EtlSourceTable]   [varchar](200)	  not null
  , [EtlCreatedOn]	   [datetime]		  not null
  , [EtlCreatedBy]	   [varchar](200)	  not null
  , [ExcludeFromMerge] [bit]			  not null constraint [DF_tsa_ics_land_Symfonia_ZO_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]			  not null constraint [DF_tsa_ics_land_Symfonia_ZO_IsDuplicate] default ((0))
  , [aktywny]		   [bit]			  null
  , [anulowany]		   [smallint]		  null
  , [bufor]			   [smallint]		  null
  , [createdBy]		   [int]			  null
  , [createdDate]	   [datetime]		  null
  , [data]			   [datetime]		  null
  , [datarej]		   [datetime]		  null
  , [datasp]		   [datetime]		  null
  , [datawplywu]	   [datetime]		  null
  , [exp_fk]		   [smallint]		  null
  , [flag]			   [smallint]		  null
  , [formaplatn]	   [int]			  null
  , [grupacen]		   [smallint]		  null
  , [guid]			   [uniqueidentifier] null
  , [id]			   [int]			  null
  , [iddokkoryg]	   [int]			  null
  , [info]			   [smallint]		  null
  , [katalog]		   [int]			  null
  , [khadid]		   [int]			  null
  , [khid]			   [int]			  null
  , [kod]			   [varchar](40)	  null
  , [kod_obcy]		   [varchar](40)	  null
  , [kurs]			   [float]			  null
  , [magazyn]		   [int]			  null
  , [modifiedBy]	   [int]			  null
  , [modifiedDate]	   [datetime]		  null
  , [nazwa]			   [varchar](40)	  null
  , [netto]			   [float]			  null
  , [odadid]		   [int]			  null
  , [odebrane]		   [varchar](40)	  null
  , [odid]			   [int]			  null
  , [ok]			   [smallint]		  null
  , [okres]			   [smallint]		  null
  , [opis]			   [varchar](80)	  null
  , [paragon]		   [int]			  null
  , [plattermin]	   [datetime]		  null
  , [plattyp]		   [int]			  null
  , [rabat]			   [float]			  null
  , [rodzaj]		   [int]			  null
  , [rozlmg]		   [smallint]		  null
  , [rr]			   [smallint]		  null
  , [schemat]		   [varchar](4)		  null
  , [seria]			   [varchar](5)		  null
  , [seriadzial]	   [int]			  null
  , [serianr]		   [int]			  null
  , [statusRDF]		   [smallint]		  null
  , [subtyp]		   [smallint]		  null
  , [super]			   [int]			  null
  , [typ]			   [smallint]		  null
  , [typ_dk]		   [varchar](4)		  null
  , [typceny]		   [int]			  null
  , [vat]			   [float]			  null
  , [walBrutto]		   [float]			  null
  , [walNetto]		   [float]			  null
  , [waluta]		   [varchar](3)		  null
  , [wartoscSp]		   [float]			  null
  , [wplaty]		   [float]			  null
  , [wystawil]		   [int]			  null
  , [znacznik]		   [smallint]		  null
  , [zyskdod]		   [float]			  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_INIFILE]' ;
go
create table [tsa].[ics_land_Symfonia_INIFILE]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_INIFILE_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_INIFILE_IsDuplicate] default ((0))
  , [klucz]			   [varchar](100) null
  , [napis]			   [varchar](256) null
  , [plik]			   [varchar](100) null
  , [sekcja]		   [varchar](100) null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_ZP]' ;
go
create table [tsa].[ics_land_Symfonia_ZP]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_ZP_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_ZP_IsDuplicate] default ((0))
  , [bufor]			   [smallint]	  null
  , [cena]			   [float]		  null
  , [cenaBaza]		   [float]		  null
  , [cenaBazaPl]	   [float]		  null
  , [cenabaztow]	   [float]		  null
  , [cenawal]		   [float]		  null
  , [data]			   [datetime]	  null
  , [flag]			   [smallint]	  null
  , [grupacen]		   [smallint]	  null
  , [id]			   [int]		  null
  , [idkh]			   [int]		  null
  , [idlongname]	   [int]		  null
  , [idpozkoryg]	   [int]		  null
  , [idtw]			   [int]		  null
  , [ilosc]			   [float]		  null
  , [iloscjedn]		   [float]		  null
  , [iloscwp]		   [float]		  null
  , [jm]			   [varchar](8)	  null
  , [jmwp]			   [varchar](8)	  null
  , [kod]			   [varchar](40)  null
  , [kompensata]	   [smallint]	  null
  , [lp]			   [smallint]	  null
  , [magazyn]		   [int]		  null
  , [odwrotneObc]	   [smallint]	  null
  , [opis]			   [varchar](40)  null
  , [opisdod]		   [varchar](20)  null
  , [schemat]		   [varchar](4)	  null
  , [stvat]			   [int]		  null
  , [subtyp]		   [smallint]	  null
  , [super]			   [int]		  null
  , [superkoryg]	   [int]		  null
  , [typ]			   [smallint]	  null
  , [typceny]		   [int]		  null
  , [walBrutto]		   [float]		  null
  , [walcenybaz]	   [varchar](3)	  null
  , [walNetto]		   [float]		  null
  , [waluta]		   [varchar](3)	  null
  , [wartNetto]		   [float]		  null
  , [wartstvat]		   [smallint]	  null
  , [wartTowaru]	   [float]		  null
  , [wartVat]		   [float]		  null
  , [zyskdod]		   [float]		  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_IP]' ;
go
create table [tsa].[ics_land_Symfonia_IP]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_IP_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_IP_IsDuplicate] default ((0))
  , [cena]			   [float]		  null
  , [dataDw]		   [datetime]	  null
  , [flag]			   [smallint]	  null
  , [id]			   [int]		  null
  , [iddw]			   [int]		  null
  , [idil]			   [int]		  null
  , [idtw]			   [int]		  null
  , [iloscjest]		   [float]		  null
  , [iloscma]		   [float]		  null
  , [kod_obcy]		   [varchar](40)  null
  , [nazwaDw]		   [varchar](40)  null
  , [typ]			   [smallint]	  null
  , [wartosc]		   [float]		  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_ZZ]' ;
go
create table [tsa].[ics_land_Symfonia_ZZ]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_ZZ_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_ZZ_IsDuplicate] default ((0))
  , [baza1]			   [smallint]	  null
  , [baza2]			   [smallint]	  null
  , [baza3]			   [smallint]	  null
  , [cena]			   [float]		  null
  , [data]			   [datetime]	  null
  , [flag]			   [smallint]	  null
  , [id]			   [int]		  null
  , [id1]			   [int]		  null
  , [id2]			   [int]		  null
  , [id3]			   [int]		  null
  , [id3pos]		   [int]		  null
  , [iddkreal]		   [int]		  null
  , [ilosc]			   [float]		  null
  , [ilosc2]		   [float]		  null
  , [kod1]			   [varchar](40)  null
  , [kod2]			   [varchar](40)  null
  , [magazyn]		   [int]		  null
  , [opis]			   [varchar](100) null
  , [subtyp]		   [smallint]	  null
  , [termin]		   [datetime]	  null
  , [typ]			   [smallint]	  null
  , [waluta]		   [varchar](3)	  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_IT]' ;
go
create table [tsa].[ics_land_Symfonia_IT]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_IT_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_IT_IsDuplicate] default ((0))
  , [dostawa]		   [varchar](3)	  null
  , [id]			   [int]		  null
  , [idKrajuPo]		   [int]		  null
  , [idKrajuWy]		   [int]		  null
  , [idmg]			   [int]		  null
  , [transakcja]	   [smallint]	  null
  , [transport]		   [smallint]	  null
  , [wartStat]		   [float]		  null
  , [zmieniony]		   [smallint]	  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_KH]' ;
go
create table [tsa].[ics_land_Symfonia_KH]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_KH_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_KH_IsDuplicate] default ((0))
  , [aktywny]		   [bit]		  null
  , [bkonto]		   [varchar](50)  null
  , [bnazwa]		   [varchar](100) null
  , [createdBy]		   [int]		  null
  , [createdDate]	   [datetime]	  null
  , [dom]			   [varchar](15)  null
  , [email]			   [varchar](50)  null
  , [fax]			   [varchar](25)  null
  , [flag]			   [smallint]	  null
  , [formaplatn]	   [int]		  null
  , [grupacen]		   [smallint]	  null
  , [id]			   [int]		  null
  , [idfk]			   [int]		  null
  , [idfk2]			   [int]		  null
  , [idKraju]		   [int]		  null
  , [idMpk]			   [int]		  null
  , [idTX]			   [int]		  null
  , [imie]			   [varchar](14)  null
  , [info]			   [smallint]	  null
  , [katalog]		   [int]		  null
  , [khfk]			   [varchar](24)  null
  , [kod]			   [varchar](40)  null
  , [kodpocz]		   [varchar](10)  null
  , [limit]			   [smallint]	  null
  , [limitkwota]	   [float]		  null
  , [limitwaluta]	   [varchar](3)	  null
  , [lokal]			   [varchar](15)  null
  , [miejscowosc]	   [varchar](50)  null
  , [modifiedBy]	   [int]		  null
  , [modifiedDate]	   [datetime]	  null
  , [naglowek]		   [varchar](19)  null
  , [nazwa]			   [varchar](150) null
  , [nazwisko]		   [varchar](24)  null
  , [negoc]			   [smallint]	  null
  , [nip]			   [varchar](20)  null
  , [pesel]			   [varchar](15)  null
  , [plattermin]	   [smallint]	  null
  , [plattyp]		   [int]		  null
  , [regon]			   [varchar](20)  null
  , [rejon]			   [varchar](25)  null
  , [rodzaj]		   [int]		  null
  , [statusUE]		   [bit]		  null
  , [subtyp]		   [smallint]	  null
  , [super]			   [int]		  null
  , [tel1]			   [varchar](25)  null
  , [tel2]			   [varchar](25)  null
  , [typ]			   [smallint]	  null
  , [typceny]		   [int]		  null
  , [typks]			   [varchar](40)  null
  , [ulica]			   [varchar](50)  null
  , [upust]			   [float]		  null
  , [www]			   [varchar](100) null
  , [znacznik]		   [smallint]	  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_KP]' ;
go
create table [tsa].[ics_land_Symfonia_KP]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_KP_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_KP_IsDuplicate] default ((0))
  , [flag]			   [smallint]	  null
  , [id]			   [int]		  null
  , [idck]			   [int]		  null
  , [idpd]			   [int]		  null
  , [typpd]			   [smallint]	  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_KR]' ;
go
create table [tsa].[ics_land_Symfonia_KR]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_KR_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_KR_IsDuplicate] default ((0))
  , [aktywny]		   [bit]		  null
  , [flag]			   [smallint]	  null
  , [formatNIP]		   [varchar](100) null
  , [formatVAT]		   [varchar](100) null
  , [id]			   [int]		  null
  , [kod]			   [varchar](40)  null
  , [nazwa]			   [varchar](100) null
  , [typ]			   [smallint]	  null
  , [ue]			   [bit]		  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_LOCAL_LOG]' ;
go
create table [tsa].[ics_land_Symfonia_LOCAL_LOG]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_LOCAL_LOG_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_LOCAL_LOG_IsDuplicate] default ((0))
  , [baseName]		   [varchar](19)  null
  , [id]			   [int]		  null
  , [operation]		   [smallint]	  null
  , [rec_id]		   [int]		  null
  , [term]			   [int]		  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_LOG_BASE]' ;
go
create table [tsa].[ics_land_Symfonia_LOG_BASE]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_LOG_BASE_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_LOG_BASE_IsDuplicate] default ((0))
  , [baseName]		   [varchar](19)  null
  , [id]			   [int]		  null
  , [operation]		   [smallint]	  null
  , [rec_id]		   [int]		  null
  , [term]			   [int]		  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_LogKonwersji]' ;
go
create table [tsa].[ics_land_Symfonia_LogKonwersji]
(
	[EtlBatchRunId]	   [int]		   not null
  , [EtlStepRunId]	   [int]		   not null
  , [EtlThreadRunId]   [int]		   not null
  , [DataSourceKey]	   [int]		   not null
  , [EtlSourceTable]   [varchar](200)  not null
  , [EtlCreatedOn]	   [datetime]	   not null
  , [EtlCreatedBy]	   [varchar](200)  not null
  , [ExcludeFromMerge] [bit]		   not null constraint [DF_tsa_ics_land_Symfonia_LogKonwersji_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		   not null constraint [DF_tsa_ics_land_Symfonia_LogKonwersji_IsDuplicate] default ((0))
  , [czas]			   [datetime]	   null
  , [id]			   [int]		   null
  , [opis]			   [varchar](1024) null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_MG]' ;
go
create table [tsa].[ics_land_Symfonia_MG]
(
	[EtlBatchRunId]	   [int]			  not null
  , [EtlStepRunId]	   [int]			  not null
  , [EtlThreadRunId]   [int]			  not null
  , [DataSourceKey]	   [int]			  not null
  , [EtlSourceTable]   [varchar](200)	  not null
  , [EtlCreatedOn]	   [datetime]		  not null
  , [EtlCreatedBy]	   [varchar](200)	  not null
  , [ExcludeFromMerge] [bit]			  not null constraint [DF_tsa_ics_land_Symfonia_MG_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]			  not null constraint [DF_tsa_ics_land_Symfonia_MG_IsDuplicate] default ((0))
  , [aktywny]		   [bit]			  null
  , [anulowany]		   [smallint]		  null
  , [bufor]			   [smallint]		  null
  , [createdBy]		   [int]			  null
  , [createdDate]	   [datetime]		  null
  , [data]			   [datetime]		  null
  , [datasp]		   [datetime]		  null
  , [exp_fk]		   [smallint]		  null
  , [flag]			   [smallint]		  null
  , [grupacen]		   [smallint]		  null
  , [guid]			   [uniqueidentifier] null
  , [id]			   [int]			  null
  , [iddokkoryg]	   [int]			  null
  , [info]			   [smallint]		  null
  , [jpk]			   [smallint]		  null
  , [katalog]		   [int]			  null
  , [khadid]		   [int]			  null
  , [khdzial]		   [int]			  null
  , [khid]			   [int]			  null
  , [kod]			   [varchar](40)	  null
  , [magazyn]		   [int]			  null
  , [modifiedBy]	   [int]			  null
  , [modifiedDate]	   [datetime]		  null
  , [nazwa]			   [varchar](40)	  null
  , [netto]			   [float]			  null
  , [odebrane]		   [varchar](40)	  null
  , [ok]			   [smallint]		  null
  , [okres]			   [smallint]		  null
  , [opis]			   [varchar](80)	  null
  , [przychod]		   [float]			  null
  , [rejestrVat]	   [int]			  null
  , [rodzaj]		   [int]			  null
  , [rozchod]		   [float]			  null
  , [rozlmg]		   [smallint]		  null
  , [rr]			   [smallint]		  null
  , [schemat]		   [varchar](4)		  null
  , [seria]			   [varchar](5)		  null
  , [seriadzial]	   [int]			  null
  , [serianr]		   [int]			  null
  , [statusFK]		   [smallint]		  null
  , [statusRDF]		   [smallint]		  null
  , [subtyp]		   [smallint]		  null
  , [super]			   [int]			  null
  , [termin]		   [datetime]		  null
  , [typ]			   [smallint]		  null
  , [typ_dk]		   [varchar](4)		  null
  , [wartk]			   [float]			  null
  , [wartoscWz]		   [float]			  null
  , [wystawil]		   [int]			  null
  , [znacznik]		   [smallint]		  null
) ;
go
print N'Creating [tsa].[ics_land_Symfonia_NT]' ;
go
create table [tsa].[ics_land_Symfonia_NT]
(
	[EtlBatchRunId]	   [int]		  not null
  , [EtlStepRunId]	   [int]		  not null
  , [EtlThreadRunId]   [int]		  not null
  , [DataSourceKey]	   [int]		  not null
  , [EtlSourceTable]   [varchar](200) not null
  , [EtlCreatedOn]	   [datetime]	  not null
  , [EtlCreatedBy]	   [varchar](200) not null
  , [ExcludeFromMerge] [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_NT_ExcludeFromMerge] default ((0))
  , [IsDuplicate]	   [bit]		  not null constraint [DF_tsa_ics_land_Symfonia_NT_IsDuplicate] default ((0))
  , [baza]			   [smallint]	  null
  , [flag]			   [smallint]	  null
  , [id]			   [int]		  null
  , [opis]			   [text]		  null
  , [subtyp]		   [smallint]	  null
  , [super]			   [int]		  null
  , [typ]			   [smallint]	  null
) ;
go
