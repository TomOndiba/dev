CREATE TABLE [psa].[ics_stg_baan_ttdpur306610]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_baan_ttdpur306610_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_baan_ttdpur306610_IsIncomplete] DEFAULT ('N'),
[t_Refcntd] [int] NULL,
[t_Refcntu] [int] NULL,
[t_bamt] [float] NULL,
[t_bqan] [float] NULL,
[t_camt] [float] NULL,
[t_ccty] [varchar] (3) NULL,
[t_cdat] [datetime] NULL,
[t_cdis_1] [varchar] (3) NULL,
[t_cdis_2] [varchar] (3) NULL,
[t_cdis_3] [varchar] (3) NULL,
[t_cntr] [varchar] (3) NULL,
[t_comp] [smallint] NOT NULL,
[t_cono] [int] NOT NULL,
[t_cpgp] [varchar] (6) NULL,
[t_cqan] [float] NULL,
[t_cupp] [varchar] (3) NULL,
[t_cuqp] [varchar] (3) NULL,
[t_cvat] [varchar] (9) NULL,
[t_cvpp] [float] NULL,
[t_cvqp] [float] NULL,
[t_disc_1] [real] NULL,
[t_disc_2] [real] NULL,
[t_disc_3] [real] NULL,
[t_dmth_1] [tinyint] NULL,
[t_dmth_2] [tinyint] NULL,
[t_dmth_3] [tinyint] NULL,
[t_icyp] [tinyint] NULL,
[t_idel] [tinyint] NULL,
[t_idil] [tinyint] NULL,
[t_idtr] [tinyint] NULL,
[t_ieva] [tinyint] NULL,
[t_ipri] [tinyint] NULL,
[t_iprl] [tinyint] NULL,
[t_iqab] [tinyint] NULL,
[t_item] [varchar] (16) NULL,
[t_ldam_1] [float] NULL,
[t_ldam_2] [float] NULL,
[t_ldam_3] [float] NULL,
[t_leng] [float] NULL,
[t_loco] [varchar] (8) NULL,
[t_maxq] [float] NULL,
[t_minq] [float] NULL,
[t_orno] [int] NULL,
[t_pono] [smallint] NOT NULL,
[t_posi] [smallint] NULL,
[t_pric] [float] NULL,
[t_quan] [float] NULL,
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
ALTER TABLE [psa].[ics_stg_baan_ttdpur306610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur306610] PRIMARY KEY CLUSTERED  ([t_comp], [t_cono], [t_pono], [t_sern], [t_trdt], [t_trtm])
GO
