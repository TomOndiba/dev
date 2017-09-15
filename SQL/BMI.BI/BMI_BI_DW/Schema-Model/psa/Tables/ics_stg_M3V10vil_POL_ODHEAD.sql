CREATE TABLE [psa].[ics_stg_M3V10vil_POL_ODHEAD]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_ODHEAD_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10vil_POL_ODHEAD_IsDuplicate] DEFAULT ((0)),
[UA3RDP] [nchar] (10) NULL,
[UAACDT] [numeric] (18, 0) NULL,
[UAADID] [nchar] (6) NULL,
[UAAICD] [numeric] (18, 0) NULL,
[UAAPBY] [nchar] (15) NULL,
[UAAPDT] [numeric] (18, 0) NULL,
[UABRAM] [numeric] (18, 0) NULL,
[UACHID] [nchar] (10) NULL,
[UACHNO] [numeric] (18, 0) NULL,
[UACIME] [numeric] (18, 0) NULL,
[UACONN] [numeric] (18, 0) NULL,
[UACONO] [numeric] (18, 0) NOT NULL,
[UACUCD] [nchar] (3) NULL,
[UACUNO] [nchar] (10) NULL,
[UADBCR] [nchar] (1) NULL,
[UADIVI] [nchar] (3) NULL,
[UADLDT] [numeric] (18, 0) NULL,
[UADLIX] [numeric] (18, 0) NOT NULL,
[UADLTM] [numeric] (18, 0) NULL,
[UADNNO] [nchar] (10) NULL,
[UADTID] [numeric] (18, 0) NULL,
[UAELNO] [nchar] (8) NULL,
[UAEXIN] [nchar] (14) NULL,
[UAFACI] [nchar] (3) NULL,
[UAFECN] [nchar] (10) NULL,
[UAGRWE] [numeric] (18, 0) NULL,
[UAINPX] [nchar] (6) NULL,
[UAINRC] [nchar] (10) NULL,
[UAINTM] [numeric] (18, 0) NULL,
[UAIVDT] [numeric] (18, 0) NULL,
[UAIVGP] [nchar] (3) NULL,
[UAIVNO] [numeric] (18, 0) NULL,
[UALMDT] [numeric] (18, 0) NULL,
[UALMTS] [numeric] (18, 0) NULL,
[UAMODL] [nchar] (3) NULL,
[UANEWE] [numeric] (18, 0) NULL,
[UANREF] [nvarchar] (20) NULL,
[UANTAM] [numeric] (18, 0) NULL,
[UAOPRI] [numeric] (18, 0) NULL,
[UAORNO] [nchar] (10) NOT NULL,
[UAORS1] [numeric] (18, 0) NULL,
[UAORS2] [numeric] (18, 0) NULL,
[UAORST] [nchar] (2) NULL,
[UAORTP] [nchar] (3) NULL,
[UAPLRI] [nchar] (10) NULL,
[UAPOTX] [numeric] (18, 0) NULL,
[UAPROJ] [nchar] (7) NULL,
[UAPRST] [nchar] (2) NULL,
[UAPRTX] [numeric] (18, 0) NULL,
[UAPYNO] [nchar] (10) NULL,
[UARAIN] [numeric] (18, 0) NULL,
[UARDLX] [numeric] (18, 0) NULL,
[UARGDT] [numeric] (18, 0) NULL,
[UARGTM] [numeric] (18, 0) NULL,
[UARINP] [nchar] (6) NULL,
[UARIVN] [numeric] (18, 0) NULL,
[UARODN] [numeric] (18, 0) NULL,
[UAROUT] [nchar] (6) NULL,
[UARXIN] [nchar] (14) NULL,
[UARYEA] [numeric] (18, 0) NULL,
[UATEDL] [nchar] (3) NULL,
[UATEPY] [nchar] (3) NULL,
[UATXID] [numeric] (18, 0) NULL,
[UAUPIS] [numeric] (18, 0) NULL,
[UAUPST] [numeric] (18, 0) NULL,
[UAVOL3] [numeric] (18, 0) NULL,
[UAWHLO] [nchar] (3) NOT NULL,
[UAYEA4] [numeric] (18, 0) NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10vil_POL_ODHEAD] ADD CONSTRAINT [PK_psa_ics_stg_M3V10vil_POL_ODHEAD] PRIMARY KEY CLUSTERED  ([UACONO], [UADLIX], [UAORNO], [UAWHLO])
GO
