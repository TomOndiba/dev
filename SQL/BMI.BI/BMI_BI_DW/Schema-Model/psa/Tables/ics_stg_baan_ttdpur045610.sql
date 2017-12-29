CREATE TABLE [psa].[ics_stg_baan_ttdpur045610]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_baan_ttdpur045610_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_baan_ttdpur045610_IsIncomplete] DEFAULT ('N'),
[t_Refcntd] [int] NULL,
[t_Refcntu] [int] NULL,
[t_amnt] [float] NULL,
[t_bqua] [float] NULL,
[t_cdis] [varchar] (3) NULL,
[t_cntr] [varchar] (3) NULL,
[t_comp] [smallint] NULL,
[t_cono] [int] NULL,
[t_coop] [float] NULL,
[t_copr] [float] NULL,
[t_cpcp] [varchar] (3) NULL,
[t_cprj] [varchar] (6) NULL,
[t_cwar] [varchar] (3) NULL,
[t_damt_1] [float] NULL,
[t_damt_2] [float] NULL,
[t_damt_3] [float] NULL,
[t_date] [datetime] NULL,
[t_ddtb] [datetime] NULL,
[t_dino] [varchar] (10) NULL,
[t_diqu] [float] NULL,
[t_disc_1] [real] NULL,
[t_disc_2] [real] NULL,
[t_disc_3] [real] NULL,
[t_dqua] [float] NULL,
[t_fico] [smallint] NULL,
[t_iamt] [float] NULL,
[t_invd] [datetime] NULL,
[t_invn] [int] NULL,
[t_iqan] [float] NULL,
[t_item] [varchar] (16) NULL,
[t_ldam] [float] NULL,
[t_mark] [tinyint] NULL,
[t_matc] [tinyint] NULL,
[t_odam] [float] NULL,
[t_opno] [smallint] NULL,
[t_orno] [int] NOT NULL,
[t_pdno] [int] NULL,
[t_pmsk] [varchar] (20) NULL,
[t_pono] [smallint] NOT NULL,
[t_posi] [smallint] NULL,
[t_pric] [float] NULL,
[t_quad] [float] NULL,
[t_quap] [float] NULL,
[t_reno] [int] NULL,
[t_rono] [smallint] NULL,
[t_spur] [tinyint] NULL,
[t_srnb] [tinyint] NOT NULL,
[t_stsc] [tinyint] NULL,
[t_stsd] [tinyint] NULL,
[t_suno] [varchar] (6) NULL,
[t_torn] [int] NULL,
[t_tpon] [smallint] NULL,
[t_tsrn] [smallint] NULL,
[t_txta] [int] NULL
)
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur045610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur045610] PRIMARY KEY CLUSTERED  ([t_orno], [t_pono], [t_srnb])
GO
