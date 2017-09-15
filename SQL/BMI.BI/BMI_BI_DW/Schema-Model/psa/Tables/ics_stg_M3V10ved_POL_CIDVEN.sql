CREATE TABLE [psa].[ics_stg_M3V10ved_POL_CIDVEN]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_CIDVEN_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_CIDVEN_IsDuplicate] DEFAULT ((0)),
[IIABSK] [nchar] (1) NULL,
[IIABSM] [numeric] (18, 0) NULL,
[IIACRF] [nchar] (8) NULL,
[IIAGNT] [nchar] (10) NULL,
[IIATPR] [nchar] (1) NULL,
[IIAVCD] [nchar] (3) NULL,
[IIBUYE] [nchar] (10) NULL,
[IICFI1] [nchar] (10) NULL,
[IICFI2] [numeric] (18, 0) NULL,
[IICFI3] [nchar] (3) NULL,
[IICFI4] [nchar] (5) NULL,
[IICFI5] [nchar] (1) NULL,
[IICHID] [nchar] (10) NULL,
[IICHNO] [numeric] (18, 0) NULL,
[IICOBI] [nchar] (10) NULL,
[IICONO] [numeric] (18, 0) NOT NULL,
[IICRTP] [numeric] (18, 0) NULL,
[IICUCD] [nchar] (3) NULL,
[IIDCSM] [numeric] (18, 0) NULL,
[IIDT4T] [numeric] (18, 0) NULL,
[IIDTCD] [numeric] (18, 0) NULL,
[IIDTDY] [numeric] (18, 0) NULL,
[IIFUSC] [nchar] (3) NULL,
[IIGRPY] [numeric] (18, 0) NULL,
[IIIAPC] [numeric] (18, 0) NULL,
[IIIAPE] [numeric] (18, 0) NULL,
[IIIAPF] [numeric] (18, 0) NULL,
[IIIAPT] [numeric] (18, 0) NULL,
[IILIDT] [numeric] (18, 0) NULL,
[IILMDT] [numeric] (18, 0) NULL,
[IILMTS] [numeric] (18, 0) NULL,
[IIMODL] [nchar] (3) NULL,
[IIORTY] [nchar] (3) NULL,
[IIOUCN] [nchar] (10) NULL,
[IIPACD] [nchar] (1) NULL,
[IIPOOT] [nchar] (3) NULL,
[IIPRSU] [nchar] (10) NULL,
[IIPSTM] [nchar] (8) NULL,
[IIPTDY] [numeric] (18, 0) NULL,
[IIPWMT] [nchar] (10) NULL,
[IIPYME] [nchar] (3) NULL,
[IIQUCL] [nchar] (2) NULL,
[IIREGR] [numeric] (18, 0) NULL,
[IIRESP] [nchar] (10) NULL,
[IIRGDT] [numeric] (18, 0) NULL,
[IIRGTM] [numeric] (18, 0) NULL,
[IISBPE] [numeric] (18, 0) NULL,
[IISCNO] [nchar] (10) NULL,
[IISERS] [numeric] (18, 0) NULL,
[IISHAC] [numeric] (18, 0) NULL,
[IISHST] [numeric] (18, 0) NULL,
[IISPFC] [nchar] (2) NULL,
[IISUCL] [nchar] (3) NULL,
[IISUGR] [nchar] (10) NULL,
[IISUNO] [nchar] (10) NOT NULL,
[IISUST] [numeric] (18, 0) NULL,
[IISUSY] [numeric] (18, 0) NULL,
[IITAME] [numeric] (18, 0) NULL,
[IITAXC] [nchar] (3) NULL,
[IITDCD] [nchar] (4) NULL,
[IITEAF] [nchar] (3) NULL,
[IITECD] [nchar] (3) NULL,
[IITEDL] [nchar] (3) NULL,
[IITEPA] [nchar] (3) NULL,
[IITEPY] [nchar] (3) NULL,
[IITIDN] [numeric] (18, 0) NULL,
[IITINO] [nchar] (15) NULL,
[IITXAP] [numeric] (18, 0) NULL,
[IITXID] [numeric] (18, 0) NULL,
[IIVTCD] [numeric] (18, 0) NULL,
[IIWIPR] [numeric] (18, 0) NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CIDVEN] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_CIDVEN] PRIMARY KEY CLUSTERED  ([IICONO], [IISUNO])
GO
