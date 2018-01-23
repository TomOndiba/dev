CREATE TABLE [tsa].[ics_land_Symfonia_SM]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_SM_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_SM_IsDuplicate] DEFAULT ((0)),
[flag] [smallint] NULL,
[id] [int] NULL,
[idtw] [int] NULL,
[magazyn] [int] NULL,
[stan] [float] NULL,
[stanHandl] [float] NULL,
[subtyp] [smallint] NULL,
[typ] [smallint] NULL,
[wartosc] [float] NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_SM_1] ON [tsa].[ics_land_Symfonia_SM] ([id])
GO
