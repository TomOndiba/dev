CREATE TABLE [tsa].[ics_land_baan_ttdpur310610]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttdpur310610_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttdpur310610_IsDuplicate] DEFAULT ((0)),
[t_Refcntd] [int] NULL,
[t_Refcntu] [int] NULL,
[t_cono] [int] NULL,
[t_pono] [smallint] NULL,
[t_upid] [int] NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur310610_1] ON [tsa].[ics_land_baan_ttdpur310610] ([t_cono], [t_pono], [t_upid])
GO
