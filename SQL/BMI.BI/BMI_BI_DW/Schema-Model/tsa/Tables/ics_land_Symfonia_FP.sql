CREATE TABLE [tsa].[ics_land_Symfonia_FP]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_FP_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_FP_IsDuplicate] DEFAULT ((0)),
[fundusz] [int] NULL,
[id] [int] NULL,
[idDk] [int] NULL,
[wartNetto] [float] NULL,
[wplata] [float] NULL
)
GO
