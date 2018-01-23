CREATE TABLE [tsa].[ics_land_Symfonia_RLKS]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_RLKS_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_RLKS_IsDuplicate] DEFAULT ((0)),
[id] [int] NULL,
[iddp] [int] NULL,
[idmz] [int] NULL,
[ilosc] [float] NULL,
[wartosc] [float] NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_RLKS_1] ON [tsa].[ics_land_Symfonia_RLKS] ([id])
GO
