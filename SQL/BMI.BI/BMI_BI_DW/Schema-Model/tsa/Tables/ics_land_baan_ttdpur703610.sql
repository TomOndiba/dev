CREATE TABLE [tsa].[ics_land_baan_ttdpur703610]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttdpur703610_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttdpur703610_IsDuplicate] DEFAULT ((0)),
[t_Refcntd] [int] NULL,
[t_Refcntu] [int] NULL,
[t_ckor] [tinyint] NULL,
[t_cosn] [varchar] (8) NULL,
[t_crcd] [varchar] (3) NULL,
[t_ctcd] [varchar] (3) NULL,
[t_date] [datetime] NULL,
[t_orno] [int] NULL,
[t_pono] [smallint] NULL,
[t_sern] [smallint] NULL,
[t_suno] [varchar] (6) NULL,
[t_time] [int] NULL,
[t_user] [varchar] (12) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur703610_1] ON [tsa].[ics_land_baan_ttdpur703610] ([t_orno], [t_pono])
GO
