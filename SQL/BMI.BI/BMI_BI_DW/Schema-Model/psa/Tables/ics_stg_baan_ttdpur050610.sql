CREATE TABLE [psa].[ics_stg_baan_ttdpur050610]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_baan_ttdpur050610_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_baan_ttdpur050610_IsIncomplete] DEFAULT ('N'),
[t_Refcntd] [int] NULL,
[t_Refcntu] [int] NULL,
[t_cbrn] [varchar] (6) NULL,
[t_ccon] [int] NULL,
[t_ccor] [varchar] (3) NULL,
[t_ccrs] [varchar] (3) NULL,
[t_ccty] [varchar] (3) NULL,
[t_ccur] [varchar] (3) NULL,
[t_cdec] [varchar] (3) NULL,
[t_cfrw] [varchar] (3) NULL,
[t_cfsg] [varchar] (3) NULL,
[t_clan] [varchar] (3) NULL,
[t_comp] [smallint] NULL,
[t_corg] [tinyint] NULL,
[t_cosn] [varchar] (8) NULL,
[t_cotp] [varchar] (3) NULL,
[t_cpay] [varchar] (3) NULL,
[t_cplp] [varchar] (3) NULL,
[t_crcd] [varchar] (3) NULL,
[t_creg] [varchar] (3) NULL,
[t_ctcd] [varchar] (3) NULL,
[t_cvyn] [tinyint] NULL,
[t_cwar] [varchar] (3) NULL,
[t_odis] [real] NULL,
[t_orno] [int] NOT NULL,
[t_prno] [int] NULL,
[t_pspr] [varchar] (6) NULL,
[t_pstx] [varchar] (6) NULL,
[t_ragr] [varchar] (16) NULL,
[t_ratf] [int] NULL,
[t_ratp] [float] NULL,
[t_refa] [varchar] (30) NULL,
[t_refb] [varchar] (20) NULL,
[t_stat] [tinyint] NULL,
[t_suno] [varchar] (6) NULL,
[t_trdt] [datetime] NOT NULL,
[t_trtm] [int] NOT NULL,
[t_txta] [int] NULL,
[t_txtb] [int] NULL,
[t_user] [varchar] (12) NULL
)
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur050610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur050610] PRIMARY KEY CLUSTERED  ([t_orno], [t_trdt], [t_trtm])
GO
