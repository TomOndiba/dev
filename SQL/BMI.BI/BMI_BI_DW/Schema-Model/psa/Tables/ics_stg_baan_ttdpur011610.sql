CREATE TABLE [psa].[ics_stg_baan_ttdpur011610]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_baan_ttdpur011610_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_baan_ttdpur011610_IsIncomplete] DEFAULT ('N'),
[t_Refcntd] [int] NULL,
[t_Refcntu] [int] NULL,
[t_amnt] [float] NULL,
[t_cact] [varchar] (8) NULL,
[t_ccco] [varchar] (8) NULL,
[t_ccty] [varchar] (3) NULL,
[t_cdis_1] [varchar] (3) NULL,
[t_cdis_2] [varchar] (3) NULL,
[t_cdis_3] [varchar] (3) NULL,
[t_cntr] [varchar] (3) NULL,
[t_cpla] [varchar] (3) NULL,
[t_cprj] [varchar] (6) NULL,
[t_cspa] [varchar] (8) NULL,
[t_cstl] [varchar] (4) NULL,
[t_cuqp] [varchar] (3) NULL,
[t_cvat] [varchar] (9) NULL,
[t_cvqp] [float] NULL,
[t_cwar] [varchar] (3) NULL,
[t_ddat] [datetime] NULL,
[t_disc_1] [real] NULL,
[t_disc_2] [real] NULL,
[t_disc_3] [real] NULL,
[t_dmth_1] [tinyint] NULL,
[t_dmth_2] [tinyint] NULL,
[t_dmth_3] [tinyint] NULL,
[t_item] [varchar] (16) NULL,
[t_ldam_1] [float] NULL,
[t_ldam_2] [float] NULL,
[t_ldam_3] [float] NULL,
[t_leng] [float] NULL,
[t_opol] [tinyint] NULL,
[t_oqua] [float] NULL,
[t_pono] [smallint] NOT NULL,
[t_pric] [float] NULL,
[t_prih] [float] NULL,
[t_qdat] [datetime] NULL,
[t_qono] [int] NOT NULL,
[t_qspa] [tinyint] NULL,
[t_sdsc] [tinyint] NULL,
[t_sern] [smallint] NOT NULL,
[t_suno] [varchar] (6) NULL,
[t_thic] [float] NULL,
[t_trdt] [datetime] NOT NULL,
[t_trtm] [int] NOT NULL,
[t_txta] [int] NULL,
[t_widt] [float] NULL
)
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur011610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur011610] PRIMARY KEY CLUSTERED  ([t_pono], [t_qono], [t_sern], [t_trdt], [t_trtm])
GO