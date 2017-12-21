CREATE TABLE [tsa].[ics_land_baan_ttdpur047610]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttdpur047610_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttdpur047610_IsDuplicate] DEFAULT ((0)),
[t_Refcntd] [int] NULL,
[t_Refcntu] [int] NULL,
[t_cntr] [varchar] (3) NULL,
[t_cprj] [varchar] (6) NULL,
[t_cwar] [varchar] (3) NULL,
[t_opol] [tinyint] NULL,
[t_orno] [int] NULL,
[t_ponb] [smallint] NULL,
[t_pono] [smallint] NULL,
[t_qana] [float] NULL,
[t_sitm] [varchar] (16) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur047610_1] ON [tsa].[ics_land_baan_ttdpur047610] ([t_orno], [t_ponb], [t_pono])
GO
