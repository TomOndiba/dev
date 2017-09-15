CREATE TABLE [psa].[ics_stg_M3V10gen_POL_OOHEAD]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_OOHEAD_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10gen_POL_OOHEAD_IsDuplicate] DEFAULT ((0)),
[OA3RDP] [nchar] (10) NULL,
[OAADID] [nchar] (6) NULL,
[OAAGNO] [nchar] (7) NULL,
[OAAGNT] [nchar] (10) NULL,
[OAAICD] [numeric] (18, 0) NULL,
[OAARAT] [numeric] (18, 0) NULL,
[OABAGC] [nchar] (10) NULL,
[OABAGD] [numeric] (18, 0) NULL,
[OABLRO] [numeric] (18, 0) NULL,
[OABRAM] [numeric] (18, 0) NULL,
[OABREC] [nchar] (10) NULL,
[OABRLA] [numeric] (18, 0) NULL,
[OACHID] [nchar] (10) NULL,
[OACHL1] [nchar] (10) NULL,
[OACHL2] [nchar] (10) NULL,
[OACHL3] [nchar] (10) NULL,
[OACHL4] [nchar] (10) NULL,
[OACHNO] [numeric] (18, 0) NULL,
[OACHSY] [nchar] (10) NULL,
[OACMPN] [nchar] (4) NULL,
[OACOAM] [numeric] (18, 0) NULL,
[OACONO] [numeric] (18, 0) NOT NULL,
[OACPRE] [nchar] (5) NULL,
[OACRTP] [numeric] (18, 0) NULL,
[OACUCD] [nchar] (3) NULL,
[OACUDT] [numeric] (18, 0) NULL,
[OACUNO] [nchar] (10) NULL,
[OACUOR] [nvarchar] (20) NULL,
[OACURD] [numeric] (18, 0) NULL,
[OADCCD] [numeric] (18, 0) NULL,
[OADICD] [numeric] (18, 0) NULL,
[OADISY] [nchar] (10) NULL,
[OADIVI] [nchar] (3) NULL,
[OADLSP] [nchar] (12) NULL,
[OADMCU] [numeric] (18, 0) NULL,
[OADMDT] [numeric] (18, 0) NULL,
[OADSTX] [nvarchar] (36) NULL,
[OADTID] [numeric] (18, 0) NULL,
[OAECLC] [nchar] (2) NULL,
[OAECTT] [numeric] (18, 0) NULL,
[OAELNO] [nchar] (8) NULL,
[OAEXCD] [nchar] (2) NULL,
[OAFACI] [nchar] (3) NULL,
[OAFDDT] [numeric] (18, 0) NULL,
[OAFDED] [numeric] (18, 0) NULL,
[OAFECN] [nchar] (10) NULL,
[OAFRE1] [nchar] (5) NULL,
[OAGRWE] [numeric] (18, 0) NULL,
[OAHAFE] [nchar] (6) NULL,
[OAHOCD] [numeric] (18, 0) NULL,
[OAIAPD] [numeric] (18, 0) NULL,
[OAINRC] [nchar] (10) NULL,
[OAIPAD] [nvarchar] (20) NULL,
[OAIPIV] [numeric] (18, 0) NULL,
[OAJNA] [nchar] (10) NULL,
[OAJNU] [numeric] (18, 0) NULL,
[OALDED] [numeric] (18, 0) NULL,
[OALMDT] [numeric] (18, 0) NULL,
[OALMTS] [numeric] (18, 0) NULL,
[OALNCD] [nchar] (2) NULL,
[OALOCD] [nchar] (3) NULL,
[OAMODL] [nchar] (3) NULL,
[OANBNS] [numeric] (18, 0) NULL,
[OANEWE] [numeric] (18, 0) NULL,
[OANREF] [nvarchar] (20) NULL,
[OANTAM] [numeric] (18, 0) NULL,
[OANTLA] [numeric] (18, 0) NULL,
[OAOBLC] [numeric] (18, 0) NULL,
[OAOFNO] [nchar] (10) NULL,
[OAOPRI] [numeric] (18, 0) NULL,
[OAORDT] [numeric] (18, 0) NULL,
[OAOREF] [nvarchar] (30) NULL,
[OAORNO] [nchar] (10) NOT NULL,
[OAORSL] [nchar] (2) NULL,
[OAORST] [nchar] (2) NULL,
[OAORTP] [nchar] (3) NULL,
[OAOT38] [numeric] (18, 0) NULL,
[OAOTBA] [numeric] (18, 0) NULL,
[OAOTDP] [numeric] (18, 0) NULL,
[OAPLTB] [nchar] (10) NULL,
[OAPOTX] [numeric] (18, 0) NULL,
[OAPROJ] [nchar] (7) NULL,
[OAPRTX] [numeric] (18, 0) NULL,
[OAPYCD] [nchar] (3) NULL,
[OAPYNO] [nchar] (10) NULL,
[OARESP] [nchar] (10) NULL,
[OARGDT] [numeric] (18, 0) NULL,
[OARGTM] [numeric] (18, 0) NULL,
[OARLDT] [numeric] (18, 0) NULL,
[OARLDZ] [numeric] (18, 0) NULL,
[OARLHM] [numeric] (18, 0) NULL,
[OARLHZ] [numeric] (18, 0) NULL,
[OARODN] [numeric] (18, 0) NULL,
[OAROUT] [nchar] (6) NULL,
[OARPIV] [numeric] (18, 0) NULL,
[OASCED] [numeric] (18, 0) NULL,
[OASMCD] [nchar] (4) NULL,
[OASPLM] [nchar] (8) NULL,
[OATAXC] [nchar] (3) NULL,
[OATBLG] [numeric] (18, 0) NULL,
[OATECD] [nchar] (3) NULL,
[OATEDL] [nchar] (3) NULL,
[OATEL2] [nvarchar] (36) NULL,
[OATEPA] [nchar] (3) NULL,
[OATEPY] [nchar] (3) NULL,
[OATINC] [numeric] (18, 0) NULL,
[OATIZO] [nchar] (5) NULL,
[OATOPR] [numeric] (18, 0) NULL,
[OATXAP] [numeric] (18, 0) NULL,
[OATXID] [numeric] (18, 0) NULL,
[OAVAPD] [numeric] (18, 0) NULL,
[OAVOL3] [numeric] (18, 0) NULL,
[OAVRCD] [nchar] (2) NULL,
[OAVTCD] [numeric] (18, 0) NULL,
[OAWCON] [nchar] (3) NULL,
[OAWHLO] [nchar] (3) NULL,
[OAYREF] [nvarchar] (30) NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10gen_POL_OOHEAD] ADD CONSTRAINT [PK_psa_ics_stg_M3V10gen_POL_OOHEAD] PRIMARY KEY CLUSTERED  ([OACONO], [OAORNO])
GO
