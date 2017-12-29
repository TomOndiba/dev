CREATE TABLE [tsa].[ics_land_baan_ttdpur028610]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttdpur028610_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttdpur028610_IsDuplicate] DEFAULT ((0)),
[t_Refcntd] [int] NULL,
[t_Refcntu] [int] NULL,
[t_ccos] [varchar] (3) NULL,
[t_crtr] [tinyint] NULL,
[t_frcs] [tinyint] NULL,
[t_item] [varchar] (16) NULL,
[t_llim] [float] NULL,
[t_luni] [tinyint] NULL,
[t_pono] [smallint] NULL,
[t_puni] [tinyint] NULL,
[t_raun] [varchar] (3) NULL,
[t_ulim] [float] NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur028610_1] ON [tsa].[ics_land_baan_ttdpur028610] ([t_ccos], [t_pono])
GO
