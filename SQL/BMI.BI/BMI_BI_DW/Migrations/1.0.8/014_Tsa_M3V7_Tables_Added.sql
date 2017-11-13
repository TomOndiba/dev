-- <Migration ID="00200c0a-cadd-4b8a-b219-0064e3a50fa2" />
GO
if object_id('tsa.ics_land_m3v7_CIDADR', 'U') is not null
	drop table [tsa].[ics_land_m3v7_CIDADR] ;
go
if object_id('tsa.ics_land_m3v7_CIDMAS', 'U') is not null
	drop table [tsa].[ics_land_m3v7_CIDMAS] ;
go
if object_id('tsa.ics_land_m3v7_MITWHL', 'U') is not null
	drop table [tsa].[ics_land_m3v7_MITWHL] ;
go

PRINT N'Creating [tsa].[ics_land_m3v7_CIDADR]'
GO
CREATE TABLE [tsa].[ics_land_m3v7_CIDADR]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL,
[IsDuplicate] [bit] NOT NULL,
[SACONO] [decimal] (3, 0) NULL,
[SASUNO] [nvarchar] (255) NULL,
[SAADTE] [decimal] (2, 0) NULL,
[SAADID] [nvarchar] (255) NULL,
[SASTDT] [decimal] (8, 0) NULL,
[SASUNM] [nvarchar] (255) NULL,
[SAPRIA] [decimal] (1, 0) NULL,
[SAADR1] [nvarchar] (255) NULL,
[SAADR2] [nvarchar] (255) NULL,
[SAADR3] [nvarchar] (255) NULL,
[SAADR4] [nvarchar] (255) NULL,
[SACSCD] [nvarchar] (255) NULL,
[SAPONO] [nvarchar] (255) NULL,
[SAADVI] [nvarchar] (255) NULL,
[SAEDES] [nvarchar] (255) NULL,
[SAGEOC] [decimal] (9, 0) NULL,
[SATAXC] [nvarchar] (255) NULL,
[SAECAR] [nvarchar] (255) NULL,
[SATOWN] [nvarchar] (255) NULL,
[SAPNOD] [nvarchar] (255) NULL,
[SATXID] [decimal] (13, 0) NULL,
[SARGDT] [decimal] (8, 0) NULL,
[SARGTM] [decimal] (6, 0) NULL,
[SALMDT] [decimal] (8, 0) NULL,
[SACHNO] [decimal] (3, 0) NULL,
[SACHID] [nvarchar] (255) NULL,
[SALMTS] [decimal] (18, 0) NULL
)
GO
PRINT N'Creating index [tsa_ics_land_m3v7_CIDADR_1] on [tsa].[ics_land_m3v7_CIDADR]'
GO
CREATE CLUSTERED INDEX [tsa_ics_land_m3v7_CIDADR_1] ON [tsa].[ics_land_m3v7_CIDADR] ([SASUNO], [SAADTE], [SAADID], [SASTDT])
GO
PRINT N'Creating [tsa].[ics_land_m3v7_CIDMAS]'
GO
CREATE TABLE [tsa].[ics_land_m3v7_CIDMAS]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL,
[IsDuplicate] [bit] NOT NULL,
[IDCONO] [decimal] (3, 0) NULL,
[IDSUNO] [nvarchar] (255) NULL,
[IDSUTY] [decimal] (1, 0) NULL,
[IDSUNM] [nvarchar] (255) NULL,
[IDALSU] [nvarchar] (255) NULL,
[IDSTAT] [nvarchar] (255) NULL,
[IDCORG] [nvarchar] (255) NULL,
[IDCOR2] [nvarchar] (255) NULL,
[IDLNCD] [nvarchar] (255) NULL,
[IDPHNO] [nvarchar] (255) NULL,
[IDPHN2] [nvarchar] (255) NULL,
[IDTLNO] [nvarchar] (255) NULL,
[IDTFNO] [nvarchar] (255) NULL,
[IDCSCD] [nvarchar] (255) NULL,
[IDECAR] [nvarchar] (255) NULL,
[IDDTFM] [nvarchar] (255) NULL,
[IDEDIT] [nvarchar] (255) NULL,
[IDVRNO] [nvarchar] (255) NULL,
[IDSUCO] [nvarchar] (255) NULL,
[IDSUAL] [nvarchar] (255) NULL,
[IDSUCM] [nvarchar] (255) NULL,
[IDMEPF] [nvarchar] (255) NULL,
[IDPODA] [decimal] (3, 0) NULL,
[IDCFI1] [nvarchar] (255) NULL,
[IDCFI2] [decimal] (15, 2) NULL,
[IDCFI3] [nvarchar] (255) NULL,
[IDCFI4] [nvarchar] (255) NULL,
[IDCFI5] [nvarchar] (255) NULL,
[IDHAFE] [nvarchar] (255) NULL,
[IDDESV] [nvarchar] (255) NULL,
[IDTIZO] [nvarchar] (255) NULL,
[IDFWSC] [nvarchar] (255) NULL,
[IDTXID] [decimal] (13, 0) NULL,
[IDRGDT] [decimal] (8, 0) NULL,
[IDRGTM] [decimal] (6, 0) NULL,
[IDLMDT] [decimal] (8, 0) NULL,
[IDCHNO] [decimal] (3, 0) NULL,
[IDCHID] [nvarchar] (255) NULL,
[IDLMTS] [decimal] (18, 0) NULL
)
GO
PRINT N'Creating index [tsa_ics_land_m3v7_CIDMAS_1] on [tsa].[ics_land_m3v7_CIDMAS]'
GO
CREATE CLUSTERED INDEX [tsa_ics_land_m3v7_CIDMAS_1] ON [tsa].[ics_land_m3v7_CIDMAS] ([IDSUNO])
GO
PRINT N'Creating [tsa].[ics_land_m3v7_MITWHL]'
GO
CREATE TABLE [tsa].[ics_land_m3v7_MITWHL]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL,
[IsDuplicate] [bit] NOT NULL,
[MWCONO] [decimal] (3, 0) NULL,
[MWWHLO] [nvarchar] (255) NULL,
[MWWHNM] [nvarchar] (255) NULL,
[MWDIVI] [nvarchar] (255) NULL,
[MWFACI] [nvarchar] (255) NULL,
[MWWHTY] [nvarchar] (255) NULL,
[MWWHSY] [nvarchar] (255) NULL,
[MWWHPL] [nvarchar] (255) NULL,
[MWOREF] [nvarchar] (255) NULL,
[MWPHNO] [nvarchar] (255) NULL,
[MWCOMA] [nvarchar] (255) NULL,
[MWCUNO] [nvarchar] (255) NULL,
[MWSUNO] [nvarchar] (255) NULL,
[MWSDES] [nvarchar] (255) NULL,
[MWSHNM] [nvarchar] (255) NULL,
[MWPLIS] [nvarchar] (255) NULL,
[MWCSCD] [nvarchar] (255) NULL,
[MWECAR] [nvarchar] (255) NULL,
[MWVRNO] [nvarchar] (255) NULL,
[MWLNCD] [nvarchar] (255) NULL,
[MWCPWH] [nvarchar] (255) NULL,
[MWAUAD] [decimal] (1, 0) NULL,
[MWALWH] [nvarchar] (255) NULL,
[MWALAC] [decimal] (1, 0) NULL,
[MWRESP] [nvarchar] (255) NULL,
[MWTWSL] [nvarchar] (255) NULL,
[MWGEOC] [decimal] (9, 0) NULL,
[MWTAXC] [nvarchar] (255) NULL,
[MWUNST] [nvarchar] (255) NULL,
[MWTXID] [decimal] (13, 0) NULL,
[MWDTID] [decimal] (13, 0) NULL,
[MWAASQ] [decimal] (1, 0) NULL,
[MWDMF0] [decimal] (3, 0) NULL,
[MWDMF1] [decimal] (3, 0) NULL,
[MWDMF2] [decimal] (3, 0) NULL,
[MWDMF3] [decimal] (3, 0) NULL,
[MWDMF4] [decimal] (3, 0) NULL,
[MWDMF5] [decimal] (3, 0) NULL,
[MWDMF6] [decimal] (3, 0) NULL,
[MWDMF7] [decimal] (3, 0) NULL,
[MWDMF8] [decimal] (3, 0) NULL,
[MWDMF9] [decimal] (3, 0) NULL,
[MWINUL] [decimal] (1, 0) NULL,
[MWEPUL] [decimal] (1, 0) NULL,
[MWEXDL] [decimal] (1, 0) NULL,
[MWPIDL] [decimal] (1, 0) NULL,
[MWALWQ] [nvarchar] (255) NULL,
[MWITDL] [decimal] (1, 0) NULL,
[MWCDYN] [decimal] (1, 0) NULL,
[MWPATF] [decimal] (3, 0) NULL,
[MWPAHF] [decimal] (4, 0) NULL,
[MWPMTF] [decimal] (3, 0) NULL,
[MWPMHF] [decimal] (4, 0) NULL,
[MWDDLO] [nvarchar] (255) NULL,
[MWCDPD] [decimal] (1, 0) NULL,
[MWCDPM] [decimal] (1, 0) NULL,
[MWCALV] [nvarchar] (255) NULL,
[MWACGR] [nvarchar] (255) NULL,
[MWNBID] [nvarchar] (255) NULL,
[MWSTOF] [decimal] (1, 0) NULL,
[MWASOT] [decimal] (1, 0) NULL,
[MWDAAS] [decimal] (2, 0) NULL,
[MWLEAM] [decimal] (3, 0) NULL,
[MWDMFC] [decimal] (1, 0) NULL,
[MWLSPM] [decimal] (1, 0) NULL,
[MWRSTN] [nvarchar] (255) NULL,
[MWRGDT] [decimal] (8, 0) NULL,
[MWRGTM] [decimal] (6, 0) NULL,
[MWLMDT] [decimal] (8, 0) NULL,
[MWCHNO] [decimal] (3, 0) NULL,
[MWCHID] [nvarchar] (255) NULL,
[MWLMTS] [decimal] (18, 0) NULL
)
GO
PRINT N'Creating index [tsa_ics_land_m3v7_MITWHL_1] on [tsa].[ics_land_m3v7_MITWHL]'
GO
CREATE CLUSTERED INDEX [tsa_ics_land_m3v7_MITWHL_1] ON [tsa].[ics_land_m3v7_MITWHL] ([MWCONO], [MWWHLO])
GO
