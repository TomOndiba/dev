CREATE TABLE [psa].[ics_stg_baan_ttdpur041610]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_baan_ttdpur041610_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_baan_ttdpur041610_IsIncomplete] DEFAULT ('N'),
[t_Refcntd] [int] NULL,
[t_Refcntu] [int] NULL,
[t_amta] [float] NULL,
[t_bqua] [float] NULL,
[t_btsp] [tinyint] NULL,
[t_cact] [varchar] (8) NULL,
[t_ccco] [varchar] (8) NULL,
[t_ccty] [varchar] (3) NULL,
[t_cdis_1] [varchar] (3) NULL,
[t_cdis_2] [varchar] (3) NULL,
[t_cdis_3] [varchar] (3) NULL,
[t_citg] [varchar] (6) NULL,
[t_citt] [varchar] (3) NULL,
[t_clot] [varchar] (16) NULL,
[t_cntr] [varchar] (3) NULL,
[t_cono] [int] NULL,
[t_cpla] [varchar] (3) NULL,
[t_cprj] [varchar] (6) NULL,
[t_csgp] [varchar] (6) NULL,
[t_cspa] [varchar] (8) NULL,
[t_cstl] [varchar] (4) NULL,
[t_ctrj] [varchar] (3) NULL,
[t_cupp] [varchar] (3) NULL,
[t_cuqp] [varchar] (3) NULL,
[t_cvat] [varchar] (9) NULL,
[t_cvpp] [float] NULL,
[t_cvqp] [float] NULL,
[t_cwar] [varchar] (3) NULL,
[t_ddta] [datetime] NULL,
[t_ddtb] [datetime] NULL,
[t_ddtc] [datetime] NULL,
[t_ddtd] [datetime] NULL,
[t_dim1] [varchar] (6) NULL,
[t_dim2] [varchar] (6) NULL,
[t_dim3] [varchar] (6) NULL,
[t_dim4] [varchar] (6) NULL,
[t_dim5] [varchar] (6) NULL,
[t_disc_1] [real] NULL,
[t_disc_2] [real] NULL,
[t_disc_3] [real] NULL,
[t_dlev_1] [tinyint] NULL,
[t_dlev_2] [tinyint] NULL,
[t_dlev_3] [tinyint] NULL,
[t_dmth_1] [tinyint] NULL,
[t_dmth_2] [tinyint] NULL,
[t_dmth_3] [tinyint] NULL,
[t_dqua] [float] NULL,
[t_item] [varchar] (16) NULL,
[t_ldam_1] [float] NULL,
[t_ldam_2] [float] NULL,
[t_ldam_3] [float] NULL,
[t_leng] [float] NULL,
[t_lsel] [tinyint] NULL,
[t_odat] [datetime] NULL,
[t_opno] [smallint] NULL,
[t_opol] [tinyint] NULL,
[t_oqua] [float] NULL,
[t_orno] [int] NULL,
[t_pacn] [varchar] (12) NULL,
[t_pdno] [int] NULL,
[t_plev] [tinyint] NULL,
[t_pono] [smallint] NULL,
[t_posi] [smallint] NULL,
[t_pric] [float] NULL,
[t_quad] [float] NULL,
[t_qual] [tinyint] NULL,
[t_quap] [float] NULL,
[t_revi] [varchar] (6) NULL,
[t_sdsc] [tinyint] NULL,
[t_sorn] [int] NULL,
[t_spon] [smallint] NULL,
[t_srvo] [int] NULL,
[t_srvp] [smallint] NULL,
[t_suno] [varchar] (6) NULL,
[t_thic] [float] NULL,
[t_txta] [int] NULL,
[t_typ1] [tinyint] NULL,
[t_typ2] [tinyint] NULL,
[t_typ3] [tinyint] NULL,
[t_typ4] [tinyint] NULL,
[t_typ5] [tinyint] NULL,
[t_widt] [float] NULL
)
GO
