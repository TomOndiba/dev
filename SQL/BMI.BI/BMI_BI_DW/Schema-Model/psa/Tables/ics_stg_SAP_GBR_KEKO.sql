CREATE TABLE [psa].[ics_stg_SAP_GBR_KEKO]
(
[EtlRecordId] [bigint] NOT NULL IDENTITY(1, 1),
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NULL,
[EtlDeletedBy] [varchar] (200) NULL,
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_KEKO_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_KEKO_IsIncomplete] DEFAULT ('N'),
[MANDT] [nvarchar] (3) NULL,
[BZOBJ] [nvarchar] (1) NULL,
[KALNR] [nvarchar] (12) NULL,
[KALKA] [nvarchar] (2) NULL,
[KADKY] [datetime] NULL,
[TVERS] [nvarchar] (2) NULL,
[BWVAR] [nvarchar] (3) NULL,
[KKZMA] [nvarchar] (1) NULL,
[MATNR] [nvarchar] (18) NULL,
[WERKS] [nvarchar] (4) NULL,
[BWKEY] [nvarchar] (4) NULL,
[BWTAR] [nvarchar] (10) NULL,
[KOKRS] [nvarchar] (4) NULL,
[KADAT] [datetime] NULL,
[BIDAT] [datetime] NULL,
[KADAM] [datetime] NULL,
[BIDAM] [datetime] NULL,
[BWDAT] [datetime] NULL,
[ALDAT] [datetime] NULL,
[BEDAT] [datetime] NULL,
[VERID] [nvarchar] (4) NULL,
[STNUM] [nvarchar] (8) NULL,
[STLAN] [nvarchar] (1) NULL,
[STALT] [nvarchar] (2) NULL,
[STCNT] [nvarchar] (8) NULL,
[PLNNR] [nvarchar] (8) NULL,
[PLNTY] [nvarchar] (1) NULL,
[PLNAL] [nvarchar] (2) NULL,
[PLNCT] [nvarchar] (8) NULL,
[LOEKZ] [nvarchar] (1) NULL,
[LOSGR] [decimal] (13, 3) NULL,
[MEINS] [nvarchar] (3) NULL,
[ERFNM] [nvarchar] (12) NULL,
[ERFMA] [nvarchar] (12) NULL,
[CPUDT] [datetime] NULL,
[CPUDM] [datetime] NULL,
[CPUTIME] [datetime] NULL,
[FEH_ANZ] [bigint] NULL,
[FEH_K_ANZ] [bigint] NULL,
[FEH_STA] [nvarchar] (2) NULL,
[MAXMSG] [nvarchar] (1) NULL,
[FREIG] [nvarchar] (1) NULL,
[MKALK] [nvarchar] (1) NULL,
[BALTKZ] [nvarchar] (1) NULL,
[KALNR_BA] [nvarchar] (12) NULL,
[BTYP] [nvarchar] (4) NULL,
[MISCH_VERH] [decimal] (13, 3) NULL,
[BWVAR_BA] [nvarchar] (3) NULL,
[PLSCN] [nvarchar] (3) NULL,
[PLMNG] [decimal] (15, 3) NULL,
[SOBSL] [nvarchar] (2) NULL,
[SOBES] [nvarchar] (1) NULL,
[SOWRK] [nvarchar] (4) NULL,
[SOBWT] [nvarchar] (10) NULL,
[SODIR] [nvarchar] (1) NULL,
[SODUM] [nvarchar] (1) NULL,
[KALSM] [nvarchar] (6) NULL,
[AUFZA] [nvarchar] (1) NULL,
[BWSMR] [nvarchar] (1) NULL,
[SUBSTRAT] [nvarchar] (1) NULL,
[KLVAR] [nvarchar] (4) NULL,
[KOSGR] [nvarchar] (10) NULL,
[ZSCHL] [nvarchar] (6) NULL,
[POPER] [nvarchar] (3) NULL,
[BDATJ] [nvarchar] (4) NULL,
[STKOZ] [nvarchar] (8) NULL,
[ZAEHL] [nvarchar] (8) NULL,
[TOPKA] [nvarchar] (1) NULL,
[CMF_NR] [nvarchar] (12) NULL,
[OCS_COUNT] [nvarchar] (5) NULL,
[OBJNR] [nvarchar] (22) NULL,
[ERZKA] [nvarchar] (1) NULL,
[LOSAU] [decimal] (13, 3) NULL,
[AUSID] [nvarchar] (1) NULL,
[AUSSS] [decimal] (5, 2) NULL,
[SAPRL] [nvarchar] (4) NULL,
[KZROH] [nvarchar] (1) NULL,
[AUFPL] [nvarchar] (10) NULL,
[CUOBJ] [nvarchar] (18) NULL,
[CUOBJID] [nvarchar] (1) NULL,
[TECHS] [nvarchar] (12) NULL,
[TYPE] [nvarchar] (18) NULL,
[WRKLT] [nvarchar] (4) NULL,
[VORMDAT] [datetime] NULL,
[VORMUSR] [nvarchar] (12) NULL,
[FREIDAT] [datetime] NULL,
[FREIUSR] [nvarchar] (12) NULL,
[UEBID] [nvarchar] (4) NULL,
[PROZESS] [nvarchar] (18) NULL,
[PR_VERID] [nvarchar] (4) NULL,
[CSPLIT] [nvarchar] (4) NULL,
[KZKUP] [nvarchar] (1) NULL,
[FXPRU] [nvarchar] (1) NULL,
[CFXPR] [nvarchar] (1) NULL,
[ZIFFR] [decimal] (3, 0) NULL,
[SUMZIFFR] [decimal] (5, 0) NULL,
[AFAKT] [float] NULL,
[VBELN] [nvarchar] (10) NULL,
[POSNR] [nvarchar] (6) NULL,
[PSPNR] [nvarchar] (8) NULL,
[SBDKZ] [nvarchar] (1) NULL,
[MLMAA] [nvarchar] (1) NULL,
[BESKZ] [nvarchar] (1) NULL,
[DISST] [nvarchar] (3) NULL,
[KALST] [nvarchar] (4) NULL,
[TEMPLATE] [nvarchar] (10) NULL,
[PATNR] [nvarchar] (6) NULL,
[PART_VRSN] [nvarchar] (2) NULL,
[ELEHK] [nvarchar] (2) NULL,
[ELEHKNS] [nvarchar] (2) NULL,
[VOCNT] [nvarchar] (1) NULL,
[GSBER] [nvarchar] (4) NULL,
[PRCTR] [nvarchar] (10) NULL,
[TPVAR] [nvarchar] (3) NULL,
[KURST] [nvarchar] (4) NULL,
[MGTYP] [nvarchar] (5) NULL,
[HWAER] [nvarchar] (5) NULL,
[FWAER_KPF] [nvarchar] (5) NULL,
[REFID] [nvarchar] (2) NULL,
[MEINH_WS] [nvarchar] (3) NULL,
[KZWSO] [nvarchar] (1) NULL,
[ASL] [nvarchar] (1) NULL,
[KALAID] [nvarchar] (8) NULL,
[KALADAT] [datetime] NULL,
[OTYP] [nvarchar] (2) NULL,
[BAPI_CREATED] [nvarchar] (1) NULL
)
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_KEKO] ADD CONSTRAINT [AK_psa_ics_stg_SAP_GBR_KEKO_EtlRecordId] UNIQUE CLUSTERED  ([EtlRecordId])
GO