CREATE TABLE [tsa].[ics_land_baan_ttdpur333610]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttdpur333610_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttdpur333610_IsDuplicate] DEFAULT ((0)),
[t_Refcntd] [int] NULL,
[t_Refcntu] [int] NULL,
[t_cdis] [varchar] (3) NULL,
[t_cono] [int] NULL,
[t_damt] [float] NULL,
[t_dile] [tinyint] NULL,
[t_disc] [real] NULL,
[t_pono] [smallint] NULL,
[t_qanp] [float] NULL,
[t_stdt] [datetime] NULL,
[t_tdat] [datetime] NULL
)
GO
