CREATE TABLE [tsa].[ics_land_baan_ttdpur081610]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttdpur081610_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttdpur081610_IsDuplicate] DEFAULT ((0)),
[t_Refcntd] [int] NULL,
[t_Refcntu] [int] NULL,
[t_amta] [float] NULL,
[t_cntr] [varchar] (3) NULL,
[t_item] [varchar] (16) NULL,
[t_orno] [int] NULL,
[t_qana] [float] NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur081610_1] ON [tsa].[ics_land_baan_ttdpur081610] ([t_cntr], [t_item], [t_orno])
GO
