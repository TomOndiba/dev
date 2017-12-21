CREATE TABLE [tsa].[ics_land_baan_ttdpur037610]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttdpur037610_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttdpur037610_IsDuplicate] DEFAULT ((0)),
[t_Refcntd] [int] NULL,
[t_Refcntu] [int] NULL,
[t_cntr] [varchar] (3) NULL,
[t_cplp] [varchar] (3) NULL,
[t_cuni] [varchar] (3) NULL,
[t_dile] [tinyint] NULL,
[t_dmth] [tinyint] NULL,
[t_item] [varchar] (16) NULL,
[t_kogr] [tinyint] NULL,
[t_stsc] [tinyint] NULL
)
GO
