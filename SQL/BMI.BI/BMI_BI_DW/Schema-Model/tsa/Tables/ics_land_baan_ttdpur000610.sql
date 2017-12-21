CREATE TABLE [tsa].[ics_land_baan_ttdpur000610]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttdpur000610_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttdpur000610_IsDuplicate] DEFAULT ((0)),
[t_Refcntd] [int] NULL,
[t_Refcntu] [int] NULL,
[t_acpd_4] [tinyint] NULL,
[t_agto_4] [tinyint] NULL,
[t_arac_4] [tinyint] NULL,
[t_back_4] [tinyint] NULL,
[t_brla_3] [tinyint] NULL,
[t_cabt_3] [tinyint] NULL,
[t_caiq_4] [tinyint] NULL,
[t_capo_1] [tinyint] NULL,
[t_citt] [varchar] (3) NULL,
[t_clro_4] [tinyint] NULL,
[t_cmod_3] [tinyint] NULL,
[t_conp_3] [tinyint] NULL,
[t_copy_3] [smallint] NULL,
[t_cppy_3] [tinyint] NULL,
[t_cpty_4] [tinyint] NULL,
[t_cpyp_3] [tinyint] NULL,
[t_csoc_4] [tinyint] NULL,
[t_csog_4] [tinyint] NULL,
[t_cspn_4] [smallint] NULL,
[t_edib] [tinyint] NULL,
[t_erac_4] [tinyint] NULL,
[t_erdc_4] [tinyint] NULL,
[t_fmsa] [tinyint] NULL,
[t_fpri_4] [tinyint] NULL,
[t_hish_3] [tinyint] NULL,
[t_hisl_3] [tinyint] NULL,
[t_hisp_5] [tinyint] NULL,
[t_hisq_1] [tinyint] NULL,
[t_hist_3] [tinyint] NULL,
[t_imae_3] [tinyint] NULL,
[t_lipf_6] [tinyint] NULL,
[t_mavp_4] [tinyint] NULL,
[t_mldi_4] [tinyint] NULL,
[t_muco_3] [tinyint] NULL,
[t_nbol] [smallint] NULL,
[t_ndbe_3] [tinyint] NULL,
[t_pcac_3] [tinyint] NULL,
[t_pccd_5] [tinyint] NULL,
[t_pcus] [tinyint] NULL,
[t_pitd_4] [tinyint] NULL,
[t_pors] [tinyint] NULL,
[t_potd_4] [tinyint] NULL,
[t_pqcp_1] [smallint] NULL,
[t_prcp_4] [smallint] NULL,
[t_puom] [varchar] (3) NULL,
[t_purc_4] [tinyint] NULL,
[t_pusd] [tinyint] NULL,
[t_reno_4] [tinyint] NULL,
[t_rmcp_1] [smallint] NULL,
[t_rnlb_4] [tinyint] NULL,
[t_rpcs_3] [tinyint] NULL,
[t_rpds_1] [int] NULL,
[t_sepi_4] [tinyint] NULL,
[t_sern] [smallint] NULL,
[t_serp_3] [tinyint] NULL,
[t_serp_4] [tinyint] NULL,
[t_serq_1] [tinyint] NULL,
[t_sspc_3] [tinyint] NULL,
[t_sspi_1] [tinyint] NULL,
[t_sspo_4] [tinyint] NULL,
[t_tcsp_5] [tinyint] NULL,
[t_uoia_3] [tinyint] NULL
)
GO
