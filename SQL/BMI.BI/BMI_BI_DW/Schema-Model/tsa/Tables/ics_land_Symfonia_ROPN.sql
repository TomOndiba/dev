CREATE TABLE [tsa].[ics_land_Symfonia_ROPN]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_ROPN_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_ROPN_IsDuplicate] DEFAULT ((0)),
[data] [datetime] NULL,
[id] [int] NULL,
[id1] [int] NULL,
[id2] [int] NULL,
[kurs1] [float] NULL,
[kurs2] [float] NULL,
[wartosc] [float] NULL,
[wartoscW1] [float] NULL,
[wartoscW2] [float] NULL
)
GO
