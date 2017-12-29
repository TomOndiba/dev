CREATE TABLE [tsa].[ics_land_baan_ttdpur305610]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttdpur305610_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttdpur305610_IsDuplicate] DEFAULT ((0)),
[t_Refcntd] [int] NULL,
[t_Refcntu] [int] NULL,
[t_ccon] [int] NULL,
[t_ccrs] [varchar] (3) NULL,
[t_ccty] [varchar] (3) NULL,
[t_ccur] [varchar] (3) NULL,
[t_cdat] [datetime] NULL,
[t_cdec] [varchar] (3) NULL,
[t_cdes] [varchar] (30) NULL,
[t_cfrw] [varchar] (3) NULL,
[t_clan] [varchar] (3) NULL,
[t_cono] [int] NULL,
[t_cpay] [varchar] (3) NULL,
[t_csts] [tinyint] NULL,
[t_cvyn] [tinyint] NULL,
[t_cwar] [varchar] (3) NULL,
[t_edat] [datetime] NULL,
[t_icap] [tinyint] NULL,
[t_icpr] [tinyint] NULL,
[t_icyp] [tinyint] NULL,
[t_idtr] [tinyint] NULL,
[t_loco] [varchar] (8) NULL,
[t_refe] [varchar] (30) NULL,
[t_sdat] [datetime] NULL,
[t_suno] [varchar] (6) NULL,
[t_trdt] [datetime] NULL,
[t_trtm] [int] NULL,
[t_txta] [int] NULL,
[t_txtb] [int] NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur305610_1] ON [tsa].[ics_land_baan_ttdpur305610] ([t_cono], [t_trdt], [t_trtm])
GO
