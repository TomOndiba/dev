CREATE TABLE [tsa].[ics_land_Symfonia_ZN]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_ZN_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_ZN_IsDuplicate] DEFAULT ((0)),
[data] [datetime] NULL,
[dzial] [int] NULL,
[id] [int] NULL,
[idUser] [int] NULL,
[opcje] [smallint] NULL,
[opis] [varchar] (100) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_ZN_1] ON [tsa].[ics_land_Symfonia_ZN] ([id])
GO
