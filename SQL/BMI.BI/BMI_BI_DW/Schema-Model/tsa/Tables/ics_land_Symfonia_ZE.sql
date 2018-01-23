CREATE TABLE [tsa].[ics_land_Symfonia_ZE]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_ZE_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_ZE_IsDuplicate] DEFAULT ((0)),
[id] [int] NULL,
[idKh] [int] NULL,
[idTw] [int] NULL,
[idZn] [int] NULL,
[ilosc] [float] NULL,
[lp] [int] NULL
)
GO
