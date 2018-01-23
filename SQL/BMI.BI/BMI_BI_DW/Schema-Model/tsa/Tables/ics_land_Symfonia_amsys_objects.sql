CREATE TABLE [tsa].[ics_land_Symfonia_amsys_objects]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_amsys_objects_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_amsys_objects_IsDuplicate] DEFAULT ((0)),
[init] [smallint] NULL,
[lp] [int] NULL,
[name] [varchar] (100) NULL,
[obtype] [varchar] (2) NULL,
[type] [char] (1) NULL,
[ver] [smallint] NULL
)
GO
