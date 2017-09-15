CREATE TABLE [psa].[ics_stg_M3V10ved_POL_ODLINE]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_ODLINE_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_ODLINE_IsDuplicate] DEFAULT ((0)),
[UBALUN] [nchar] (3) NULL,
[UBAPBA] [numeric] (18, 0) NULL,
[UBCHID] [nchar] (10) NULL,
[UBCHNO] [numeric] (18, 0) NULL,
[UBCHQT] [numeric] (18, 0) NULL,
[UBCMNO] [nchar] (4) NULL,
[UBCONO] [numeric] (18, 0) NOT NULL,
[UBCUCT] [nchar] (3) NULL,
[UBCUOR] [nvarchar] (20) NULL,
[UBDCOS] [numeric] (18, 0) NULL,
[UBDIA1] [numeric] (18, 0) NULL,
[UBDIA2] [numeric] (18, 0) NULL,
[UBDIA3] [numeric] (18, 0) NULL,
[UBDIA4] [numeric] (18, 0) NULL,
[UBDIA5] [numeric] (18, 0) NULL,
[UBDIA6] [numeric] (18, 0) NULL,
[UBDIC1] [numeric] (18, 0) NULL,
[UBDIC2] [numeric] (18, 0) NULL,
[UBDIC3] [numeric] (18, 0) NULL,
[UBDIC4] [numeric] (18, 0) NULL,
[UBDIC5] [numeric] (18, 0) NULL,
[UBDIC6] [numeric] (18, 0) NULL,
[UBDIP1] [numeric] (18, 0) NULL,
[UBDIP2] [numeric] (18, 0) NULL,
[UBDIP3] [numeric] (18, 0) NULL,
[UBDIP4] [numeric] (18, 0) NULL,
[UBDIP5] [numeric] (18, 0) NULL,
[UBDIP6] [numeric] (18, 0) NULL,
[UBDIVI] [nchar] (3) NULL,
[UBDLIX] [numeric] (18, 0) NOT NULL,
[UBDLQA] [numeric] (18, 0) NULL,
[UBDLQS] [numeric] (18, 0) NULL,
[UBDLQT] [numeric] (18, 0) NULL,
[UBDTID] [numeric] (18, 0) NULL,
[UBELNO] [nchar] (8) NULL,
[UBEXIN] [nchar] (14) NULL,
[UBFACI] [nchar] (3) NULL,
[UBGWTP] [nchar] (10) NULL,
[UBHDPR] [nchar] (15) NULL,
[UBINPR] [numeric] (18, 0) NULL,
[UBINPX] [nchar] (6) NULL,
[UBITNO] [nchar] (15) NULL,
[UBIVNO] [numeric] (18, 0) NULL,
[UBIVQA] [numeric] (18, 0) NULL,
[UBIVQS] [numeric] (18, 0) NULL,
[UBIVQT] [numeric] (18, 0) NULL,
[UBLMDT] [numeric] (18, 0) NULL,
[UBLNAM] [numeric] (18, 0) NULL,
[UBLTYP] [nchar] (1) NULL,
[UBNEPR] [numeric] (18, 0) NULL,
[UBORNO] [nchar] (10) NOT NULL,
[UBPONR] [numeric] (18, 0) NOT NULL,
[UBPOSX] [numeric] (18, 0) NOT NULL,
[UBPOTX] [numeric] (18, 0) NULL,
[UBPRCH] [numeric] (18, 0) NULL,
[UBPRMO] [nchar] (1) NULL,
[UBPROJ] [nchar] (7) NULL,
[UBPRPR] [numeric] (18, 0) NULL,
[UBPRTX] [numeric] (18, 0) NULL,
[UBRGDT] [numeric] (18, 0) NULL,
[UBRGTM] [numeric] (18, 0) NULL,
[UBRTQA] [numeric] (18, 0) NULL,
[UBRTQT] [numeric] (18, 0) NULL,
[UBSACD] [numeric] (18, 0) NULL,
[UBSAPR] [numeric] (18, 0) NULL,
[UBSPUN] [nchar] (3) NULL,
[UBSTCD] [numeric] (18, 0) NULL,
[UBSUNO] [nchar] (10) NULL,
[UBUCCD] [numeric] (18, 0) NULL,
[UBUCOS] [numeric] (18, 0) NULL,
[UBWATP] [nchar] (10) NULL,
[UBWHLO] [nchar] (3) NOT NULL,
[UBYEA4] [numeric] (18, 0) NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_ODLINE] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_ODLINE] PRIMARY KEY CLUSTERED  ([UBCONO], [UBDLIX], [UBORNO], [UBPONR], [UBPOSX], [UBWHLO])
GO
