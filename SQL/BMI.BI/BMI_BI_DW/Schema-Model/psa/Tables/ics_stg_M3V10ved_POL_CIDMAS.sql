CREATE TABLE [psa].[ics_stg_M3V10ved_POL_CIDMAS]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_CIDMAS_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_psa_ics_stg_M3V10ved_POL_CIDMAS_IsDuplicate] DEFAULT ((0)),
[IDALSU] [nchar] (10) NULL,
[IDCFI1] [nchar] (10) NULL,
[IDCFI2] [numeric] (18, 0) NULL,
[IDCFI3] [nchar] (3) NULL,
[IDCFI4] [nchar] (5) NULL,
[IDCFI5] [nchar] (1) NULL,
[IDCHID] [nchar] (10) NULL,
[IDCHNO] [numeric] (18, 0) NULL,
[IDCONO] [numeric] (18, 0) NOT NULL,
[IDCOR2] [nchar] (11) NULL,
[IDCORG] [nchar] (11) NULL,
[IDCSCD] [nchar] (3) NULL,
[IDDESV] [nchar] (2) NULL,
[IDDTFM] [nchar] (3) NULL,
[IDECAR] [nchar] (2) NULL,
[IDEDIT] [nchar] (1) NULL,
[IDFWSC] [nchar] (4) NULL,
[IDHAFE] [nchar] (6) NULL,
[IDLMDT] [numeric] (18, 0) NULL,
[IDLMTS] [numeric] (18, 0) NULL,
[IDLNCD] [nchar] (2) NULL,
[IDMEPF] [nchar] (2) NULL,
[IDPHN2] [nchar] (16) NULL,
[IDPHNO] [nchar] (16) NULL,
[IDPODA] [numeric] (18, 0) NULL,
[IDPPIN] [numeric] (18, 0) NULL,
[IDRGDT] [numeric] (18, 0) NULL,
[IDRGTM] [numeric] (18, 0) NULL,
[IDSTAT] [nchar] (2) NULL,
[IDSUAL] [nchar] (3) NULL,
[IDSUCM] [nvarchar] (20) NULL,
[IDSUCO] [nchar] (10) NULL,
[IDSUNM] [nvarchar] (36) NULL,
[IDSUNO] [nchar] (10) NOT NULL,
[IDSUTY] [numeric] (18, 0) NULL,
[IDTFNO] [nchar] (16) NULL,
[IDTIZO] [nchar] (5) NULL,
[IDTLNO] [nchar] (16) NULL,
[IDTXID] [numeric] (18, 0) NULL,
[IDVRNO] [nchar] (16) NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_CIDMAS] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_CIDMAS] PRIMARY KEY CLUSTERED  ([IDCONO], [IDSUNO])
GO
