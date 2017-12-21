CREATE TABLE [tsa].[ics_land_baan_ttdpur401610]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttdpur401610_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttdpur401610_IsDuplicate] DEFAULT ((0)),
[t_Refcntd] [int] NULL,
[t_Refcntu] [int] NULL,
[t_clot] [varchar] (16) NULL,
[t_cntr] [varchar] (3) NULL,
[t_cprj] [varchar] (6) NULL,
[t_dino] [varchar] (10) NULL,
[t_item] [varchar] (16) NULL,
[t_orno] [int] NULL,
[t_pono] [smallint] NULL,
[t_qstc] [float] NULL,
[t_qstr] [float] NULL,
[t_sera] [tinyint] NULL,
[t_serb] [int] NULL,
[t_suno] [varchar] (6) NULL
)
GO
