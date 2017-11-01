-- <Migration ID="93ca1429-c29a-430f-b5f8-66a8b1d6d613" />
GO
if object_id('tsa.ics_land_M3V10vil_POL_MITWHL','U') is not null 
drop table tsa.ics_land_M3V10vil_POL_MITWHL
go

if object_id('tsa.ics_land_M3V10ved_POL_MITWHL', 'U') is not null
	drop table tsa.ics_land_M3V10ved_POL_MITWHL ;
go
if object_id('tsa.ics_land_M3V10gen_POL_MITWHL', 'U') is not null
	drop table tsa.ics_land_M3V10gen_POL_MITWHL ;
go


PRINT N'Creating [tsa].[ics_land_M3V10gen_POL_MITWHL]'
GO
CREATE TABLE [tsa].[ics_land_M3V10gen_POL_MITWHL]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_gen_MITWHL_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_gen_MITWHL_IsDuplicate] DEFAULT ((0)),
[MWAASQ] [numeric] (1, 0) NULL,
[MWACGR] [nchar] (10) NULL,
[MWALAC] [numeric] (1, 0) NULL,
[MWALWH] [nchar] (3) NULL,
[MWALWQ] [nchar] (4) NULL,
[MWASOT] [numeric] (1, 0) NULL,
[MWAUAD] [numeric] (1, 0) NULL,
[MWCALV] [nchar] (6) NULL,
[MWCDPD] [numeric] (1, 0) NULL,
[MWCDPM] [numeric] (1, 0) NULL,
[MWCDYN] [numeric] (1, 0) NULL,
[MWCHID] [nchar] (10) NULL,
[MWCHNO] [numeric] (3, 0) NULL,
[MWCOMA] [nchar] (8) NULL,
[MWCONO] [numeric] (3, 0) NULL,
[MWCPTE] [numeric] (1, 0) NULL,
[MWCPWH] [nchar] (3) NULL,
[MWCSCD] [nchar] (3) NULL,
[MWCUNO] [nchar] (10) NULL,
[MWDAAS] [numeric] (2, 0) NULL,
[MWDDLO] [nchar] (10) NULL,
[MWDIVI] [nchar] (3) NULL,
[MWDMF0] [numeric] (3, 0) NULL,
[MWDMF1] [numeric] (3, 0) NULL,
[MWDMF2] [numeric] (3, 0) NULL,
[MWDMF3] [numeric] (3, 0) NULL,
[MWDMF4] [numeric] (3, 0) NULL,
[MWDMF5] [numeric] (3, 0) NULL,
[MWDMF6] [numeric] (3, 0) NULL,
[MWDMF7] [numeric] (3, 0) NULL,
[MWDMF8] [numeric] (3, 0) NULL,
[MWDMF9] [numeric] (3, 0) NULL,
[MWDMFC] [numeric] (1, 0) NULL,
[MWDTID] [numeric] (13, 0) NULL,
[MWECAR] [nchar] (2) NULL,
[MWEPUL] [numeric] (1, 0) NULL,
[MWEXDL] [numeric] (1, 0) NULL,
[MWFACI] [nchar] (3) NULL,
[MWGEOC] [numeric] (9, 0) NULL,
[MWGEOX] [numeric] (15, 6) NULL,
[MWGEOY] [numeric] (15, 6) NULL,
[MWGEOZ] [numeric] (15, 6) NULL,
[MWINUL] [numeric] (1, 0) NULL,
[MWITDL] [numeric] (1, 0) NULL,
[MWLEAM] [numeric] (3, 0) NULL,
[MWLMDT] [numeric] (8, 0) NULL,
[MWLMTS] [numeric] (18, 0) NULL,
[MWLNCD] [nchar] (2) NULL,
[MWLSPM] [numeric] (1, 0) NULL,
[MWNBID] [nchar] (1) NULL,
[MWOREF] [nvarchar] (30) NULL,
[MWPAHF] [numeric] (4, 0) NULL,
[MWPATF] [numeric] (3, 0) NULL,
[MWPHNO] [nchar] (16) NULL,
[MWPIDL] [numeric] (1, 0) NULL,
[MWPLIS] [nchar] (16) NULL,
[MWPMHF] [numeric] (4, 0) NULL,
[MWPMTF] [numeric] (3, 0) NULL,
[MWRESP] [nchar] (10) NULL,
[MWRGDT] [numeric] (8, 0) NULL,
[MWRGTM] [numeric] (6, 0) NULL,
[MWRSTN] [nchar] (10) NULL,
[MWSCED] [numeric] (1, 0) NULL,
[MWSDES] [nchar] (10) NULL,
[MWSHNM] [nvarchar] (25) NULL,
[MWSTOF] [numeric] (1, 0) NULL,
[MWSUNO] [nchar] (10) NULL,
[MWTAXC] [nchar] (3) NULL,
[MWTWSL] [nchar] (10) NULL,
[MWTXID] [numeric] (13, 0) NULL,
[MWUNST] [nchar] (3) NULL,
[MWVRNO] [nchar] (16) NULL,
[MWWHLO] [nchar] (3) NULL,
[MWWHNM] [nvarchar] (36) NULL,
[MWWHPL] [nchar] (3) NULL,
[MWWHSY] [nchar] (1) NULL,
[MWWHTY] [nchar] (2) NULL
)
GO
PRINT N'Creating [tsa].[ics_land_M3V10ved_POL_MITWHL]'
GO
CREATE TABLE [tsa].[ics_land_M3V10ved_POL_MITWHL]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_land_ved_MITWHL_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_land_ved_MITWHL_IsDuplicate] DEFAULT ((0)),
[MWAASQ] [numeric] (1, 0) NULL,
[MWACGR] [nchar] (10) NULL,
[MWALAC] [numeric] (1, 0) NULL,
[MWALWH] [nchar] (3) NULL,
[MWALWQ] [nchar] (4) NULL,
[MWASOT] [numeric] (1, 0) NULL,
[MWAUAD] [numeric] (1, 0) NULL,
[MWCALV] [nchar] (6) NULL,
[MWCDPD] [numeric] (1, 0) NULL,
[MWCDPM] [numeric] (1, 0) NULL,
[MWCDYN] [numeric] (1, 0) NULL,
[MWCHID] [nchar] (10) NULL,
[MWCHNO] [numeric] (3, 0) NULL,
[MWCOMA] [nchar] (8) NULL,
[MWCONO] [numeric] (3, 0) NULL,
[MWCPTE] [numeric] (1, 0) NULL,
[MWCPWH] [nchar] (3) NULL,
[MWCSCD] [nchar] (3) NULL,
[MWCUNO] [nchar] (10) NULL,
[MWDAAS] [numeric] (2, 0) NULL,
[MWDDLO] [nchar] (10) NULL,
[MWDIVI] [nchar] (3) NULL,
[MWDMF0] [numeric] (3, 0) NULL,
[MWDMF1] [numeric] (3, 0) NULL,
[MWDMF2] [numeric] (3, 0) NULL,
[MWDMF3] [numeric] (3, 0) NULL,
[MWDMF4] [numeric] (3, 0) NULL,
[MWDMF5] [numeric] (3, 0) NULL,
[MWDMF6] [numeric] (3, 0) NULL,
[MWDMF7] [numeric] (3, 0) NULL,
[MWDMF8] [numeric] (3, 0) NULL,
[MWDMF9] [numeric] (3, 0) NULL,
[MWDMFC] [numeric] (1, 0) NULL,
[MWDTID] [numeric] (13, 0) NULL,
[MWECAR] [nchar] (2) NULL,
[MWEPUL] [numeric] (1, 0) NULL,
[MWEXDL] [numeric] (1, 0) NULL,
[MWFACI] [nchar] (3) NULL,
[MWGEOC] [numeric] (9, 0) NULL,
[MWGEOX] [numeric] (15, 6) NULL,
[MWGEOY] [numeric] (15, 6) NULL,
[MWGEOZ] [numeric] (15, 6) NULL,
[MWINUL] [numeric] (1, 0) NULL,
[MWITDL] [numeric] (1, 0) NULL,
[MWLEAM] [numeric] (3, 0) NULL,
[MWLMDT] [numeric] (8, 0) NULL,
[MWLMTS] [numeric] (18, 0) NULL,
[MWLNCD] [nchar] (2) NULL,
[MWLSPM] [numeric] (1, 0) NULL,
[MWNBID] [nchar] (1) NULL,
[MWOREF] [nvarchar] (30) NULL,
[MWPAHF] [numeric] (4, 0) NULL,
[MWPATF] [numeric] (3, 0) NULL,
[MWPHNO] [nchar] (16) NULL,
[MWPIDL] [numeric] (1, 0) NULL,
[MWPLIS] [nchar] (16) NULL,
[MWPMHF] [numeric] (4, 0) NULL,
[MWPMTF] [numeric] (3, 0) NULL,
[MWRESP] [nchar] (10) NULL,
[MWRGDT] [numeric] (8, 0) NULL,
[MWRGTM] [numeric] (6, 0) NULL,
[MWRSTN] [nchar] (10) NULL,
[MWSCED] [numeric] (1, 0) NULL,
[MWSDES] [nchar] (10) NULL,
[MWSHNM] [nvarchar] (25) NULL,
[MWSTOF] [numeric] (1, 0) NULL,
[MWSUNO] [nchar] (10) NULL,
[MWTAXC] [nchar] (3) NULL,
[MWTWSL] [nchar] (10) NULL,
[MWTXID] [numeric] (13, 0) NULL,
[MWUNST] [nchar] (3) NULL,
[MWVRNO] [nchar] (16) NULL,
[MWWHLO] [nchar] (3) NULL,
[MWWHNM] [nvarchar] (36) NULL,
[MWWHPL] [nchar] (3) NULL,
[MWWHSY] [nchar] (1) NULL,
[MWWHTY] [nchar] (2) NULL
)
go
PRINT N'Creating [tsa].[ics_land_M3V10vil_POL_MITWHL]'
GO
create table [tsa].[ics_land_M3V10vil_POL_MITWHL]
(
	EtlBatchRunId	 int		  not null
  , EtlStepRunId	 int		  not null
  , EtlThreadRunId	 int		  not null
  , DataSourceKey	 int		  not null
  , EtlSourceTable	 varchar(200) not null
  , EtlCreatedOn	 datetime	  not null
  , EtlCreatedBy	 varchar(200) not null
  , ExcludeFromMerge bit		  not null constraint DF_tsa_ics_land_vil_MITWHL_ExcludeFromMerge default 0
  , IsDuplicate		 bit		  not null constraint DF_tsa_ics_land_vil_MITWHL_IsDuplicate default 0
  , MWAASQ			 numeric(1, 0)
  , MWACGR			 nchar(10)
  , MWALAC			 numeric(1, 0)
  , MWALWH			 nchar(3)
  , MWALWQ			 nchar(4)
  , MWASOT			 numeric(1, 0)
  , MWAUAD			 numeric(1, 0)
  , MWCALV			 nchar(6)
  , MWCDPD			 numeric(1, 0)
  , MWCDPM			 numeric(1, 0)
  , MWCDYN			 numeric(1, 0)
  , MWCHID			 nchar(10)
  , MWCHNO			 numeric(3, 0)
  , MWCOMA			 nchar(8)
  , MWCONO			 numeric(3, 0)
  , MWCPTE			 numeric(1, 0)
  , MWCPWH			 nchar(3)
  , MWCSCD			 nchar(3)
  , MWCUNO			 nchar(10)
  , MWDAAS			 numeric(2, 0)
  , MWDDLO			 nchar(10)
  , MWDIVI			 nchar(3)
  , MWDMF0			 numeric(3, 0)
  , MWDMF1			 numeric(3, 0)
  , MWDMF2			 numeric(3, 0)
  , MWDMF3			 numeric(3, 0)
  , MWDMF4			 numeric(3, 0)
  , MWDMF5			 numeric(3, 0)
  , MWDMF6			 numeric(3, 0)
  , MWDMF7			 numeric(3, 0)
  , MWDMF8			 numeric(3, 0)
  , MWDMF9			 numeric(3, 0)
  , MWDMFC			 numeric(1, 0)
  , MWDTID			 numeric(13, 0)
  , MWECAR			 nchar(2)
  , MWEPUL			 numeric(1, 0)
  , MWEXDL			 numeric(1, 0)
  , MWFACI			 nchar(3)
  , MWGEOC			 numeric(9, 0)
  , MWGEOX			 numeric(15, 6)
  , MWGEOY			 numeric(15, 6)
  , MWGEOZ			 numeric(15, 6)
  , MWINUL			 numeric(1, 0)
  , MWITDL			 numeric(1, 0)
  , MWLEAM			 numeric(3, 0)
  , MWLMDT			 numeric(8, 0)
  , MWLMTS			 numeric(18, 0)
  , MWLNCD			 nchar(2)
  , MWLSPM			 numeric(1, 0)
  , MWNBID			 nchar(1)
  , MWOREF			 nvarchar(30)
  , MWPAHF			 numeric(4, 0)
  , MWPATF			 numeric(3, 0)
  , MWPHNO			 nchar(16)
  , MWPIDL			 numeric(1, 0)
  , MWPLIS			 nchar(16)
  , MWPMHF			 numeric(4, 0)
  , MWPMTF			 numeric(3, 0)
  , MWRESP			 nchar(10)
  , MWRGDT			 numeric(8, 0)
  , MWRGTM			 numeric(6, 0)
  , MWRSTN			 nchar(10)
  , MWSCED			 numeric(1, 0)
  , MWSDES			 nchar(10)
  , MWSHNM			 nvarchar(25)
  , MWSTOF			 numeric(1, 0)
  , MWSUNO			 nchar(10)
  , MWTAXC			 nchar(3)
  , MWTWSL			 nchar(10)
  , MWTXID			 numeric(13, 0)
  , MWUNST			 nchar(3)
  , MWVRNO			 nchar(16)
  , MWWHLO			 nchar(3)
  , MWWHNM			 nvarchar(36)
  , MWWHPL			 nchar(3)
  , MWWHSY			 nchar(1)
  , MWWHTY			 nchar(2)
) ;