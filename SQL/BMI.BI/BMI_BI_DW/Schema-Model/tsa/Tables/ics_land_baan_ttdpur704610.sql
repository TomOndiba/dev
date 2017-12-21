CREATE TABLE [tsa].[ics_land_baan_ttdpur704610]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttdpur704610_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttdpur704610_IsDuplicate] DEFAULT ((0)),
[t_Refcntd] [int] NULL,
[t_Refcntu] [int] NULL,
[t_akcd] [varchar] (2) NULL,
[t_cosn] [varchar] (8) NULL,
[t_crcd] [varchar] (3) NULL,
[t_ctcd] [varchar] (3) NULL,
[t_date] [datetime] NULL,
[t_orno] [int] NULL,
[t_pono] [smallint] NULL,
[t_suno] [varchar] (6) NULL,
[t_time] [int] NULL,
[t_user] [varchar] (12) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur704610_1] ON [tsa].[ics_land_baan_ttdpur704610] ([t_date], [t_orno], [t_pono], [t_time])
GO
