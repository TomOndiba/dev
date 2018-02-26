-- <Migration ID="bc196043-8ef1-4daa-9ec8-28e8b1284001" />
GO

PRINT N'Creating [tsa].[ics_land_baan_ttiitm004610]'
GO
CREATE TABLE [tsa].[ics_land_baan_ttiitm004610]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttiitm004610_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_baan_ttiitm004610_IsDuplicate] DEFAULT ((0)),
[t_cprj] [nvarchar] (6) NULL,
[t_item] [nvarchar] (16) NULL,
[t_citg] [nvarchar] (6) NULL,
[t_basu] [nvarchar] (3) NULL,
[t_unit] [nvarchar] (3) NULL,
[t_conv] [float] NULL,
[t_rpow] [smallint] NULL,
[t_Refcntd] [int] NULL,
[t_Refcntu] [int] NULL
)
GO
