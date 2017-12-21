CREATE TABLE [tsa].[ics_land_baan_ttdpur400610]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttdpur400610_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttdpur400610_IsDuplicate] DEFAULT ((0)),
[t_Refcntd] [int] NULL,
[t_Refcntu] [int] NULL,
[t_bqua] [float] NULL,
[t_date] [datetime] NULL,
[t_dino] [varchar] (10) NULL,
[t_diqu] [float] NULL,
[t_oqua] [float] NULL,
[t_orno] [int] NULL,
[t_pono] [smallint] NULL,
[t_suno] [varchar] (6) NULL,
[t_text] [int] NULL
)
GO
