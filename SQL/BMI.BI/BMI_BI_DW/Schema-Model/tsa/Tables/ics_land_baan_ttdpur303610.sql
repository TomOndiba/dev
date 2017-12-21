CREATE TABLE [tsa].[ics_land_baan_ttdpur303610]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttdpur303610_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttdpur303610_IsDuplicate] DEFAULT ((0)),
[t_Refcntd] [int] NULL,
[t_Refcntu] [int] NULL,
[t_cadr] [varchar] (6) NULL,
[t_ccty] [varchar] (3) NULL,
[t_ckor] [tinyint] NULL,
[t_cono] [int] NULL,
[t_geoc_l] [varchar] (10) NULL,
[t_nama] [varchar] (35) NULL,
[t_namb] [varchar] (30) NULL,
[t_namc] [varchar] (30) NULL,
[t_namd] [varchar] (30) NULL,
[t_name] [varchar] (30) NULL,
[t_namf] [varchar] (30) NULL,
[t_pstc] [varchar] (10) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_baan_ttdpur303610_1] ON [tsa].[ics_land_baan_ttdpur303610] ([t_ckor], [t_cono])
GO
