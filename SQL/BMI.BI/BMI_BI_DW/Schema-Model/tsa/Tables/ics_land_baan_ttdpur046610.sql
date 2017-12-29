CREATE TABLE [tsa].[ics_land_baan_ttdpur046610]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttdpur046610_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttdpur046610_IsDuplicate] DEFAULT ((0)),
[t_Refcntd] [int] NULL,
[t_Refcntu] [int] NULL,
[t_amta] [float] NULL,
[t_amtb] [float] NULL,
[t_amtc] [float] NULL,
[t_aprp] [smallint] NULL,
[t_apry] [smallint] NULL,
[t_ccur] [varchar] (3) NULL,
[t_clos] [tinyint] NULL,
[t_icom] [smallint] NULL,
[t_invn] [int] NULL,
[t_orno] [int] NULL,
[t_pdat] [datetime] NULL,
[t_pono] [smallint] NULL,
[t_qana] [float] NULL,
[t_srnb] [tinyint] NULL,
[t_srni] [tinyint] NULL,
[t_stsp] [tinyint] NULL,
[t_suno] [varchar] (6) NULL,
[t_ttyp] [varchar] (3) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur046610_1] ON [tsa].[ics_land_baan_ttdpur046610] ([t_orno], [t_pono], [t_srnb], [t_srni], [t_suno])
GO
