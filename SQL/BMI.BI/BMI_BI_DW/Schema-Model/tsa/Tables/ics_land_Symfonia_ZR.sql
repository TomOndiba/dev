CREATE TABLE [tsa].[ics_land_Symfonia_ZR]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_ZR_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_ZR_IsDuplicate] DEFAULT ((0)),
[id] [int] NULL,
[idtw] [int] NULL,
[idzl] [int] NULL,
[ilosc] [float] NULL,
[wartosc] [float] NULL,
[wspolczynnik] [float] NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_ZR_1] ON [tsa].[ics_land_Symfonia_ZR] ([id])
GO
