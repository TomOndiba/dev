CREATE TABLE [tsa].[ics_land_Symfonia_RO]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_RO_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_RO_IsDuplicate] DEFAULT ((0)),
[data] [datetime] NULL,
[flag] [smallint] NULL,
[id] [int] NULL,
[id1] [int] NULL,
[id2] [int] NULL,
[ilosc] [float] NULL,
[typ] [smallint] NULL,
[wartosc] [float] NULL
)
GO
