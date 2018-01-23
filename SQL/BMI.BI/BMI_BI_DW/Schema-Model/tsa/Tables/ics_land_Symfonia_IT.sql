CREATE TABLE [tsa].[ics_land_Symfonia_IT]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_IT_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_IT_IsDuplicate] DEFAULT ((0)),
[dostawa] [varchar] (3) NULL,
[id] [int] NULL,
[idKrajuPo] [int] NULL,
[idKrajuWy] [int] NULL,
[idmg] [int] NULL,
[transakcja] [smallint] NULL,
[transport] [smallint] NULL,
[wartStat] [float] NULL,
[zmieniony] [smallint] NULL
)
GO
