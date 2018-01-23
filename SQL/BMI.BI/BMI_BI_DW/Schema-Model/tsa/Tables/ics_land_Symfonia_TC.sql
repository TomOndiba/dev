CREATE TABLE [tsa].[ics_land_Symfonia_TC]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_TC_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_TC_IsDuplicate] DEFAULT ((0)),
[aktywny] [bit] NULL,
[icon] [int] NULL,
[id] [int] NULL,
[kod] [varchar] (40) NULL,
[nazwa] [varchar] (100) NULL,
[powiazanie] [int] NULL,
[rodzaj] [int] NULL
)
GO
