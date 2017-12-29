CREATE TABLE [tsa].[ics_land_baan_ttdpur061610]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttdpur061610_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttdpur061610_IsDuplicate] DEFAULT ((0)),
[t_Refcntd] [int] NULL,
[t_Refcntu] [int] NULL,
[t_citg] [varchar] (6) NULL,
[t_dejt] [int] NULL,
[t_dete] [int] NULL,
[t_detl] [int] NULL,
[t_frte] [real] NULL,
[t_frtl] [real] NULL,
[t_item] [varchar] (16) NULL,
[t_ndte] [smallint] NULL,
[t_ndtl] [smallint] NULL,
[t_suno] [varchar] (6) NULL,
[t_year] [smallint] NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur061610_1] ON [tsa].[ics_land_baan_ttdpur061610] ([t_citg], [t_item], [t_suno], [t_year])
GO
