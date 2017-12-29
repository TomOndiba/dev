CREATE TABLE [tsa].[ics_land_baan_ttdpur027610]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttdpur027610_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttdpur027610_IsDuplicate] DEFAULT ((0)),
[t_Refcntd] [int] NULL,
[t_Refcntu] [int] NULL,
[t_ccos] [varchar] (3) NULL,
[t_cplp] [varchar] (3) NULL,
[t_inta] [tinyint] NULL,
[t_suno] [varchar] (6) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur027610_1] ON [tsa].[ics_land_baan_ttdpur027610] ([t_cplp], [t_suno])
GO
