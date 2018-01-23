CREATE TABLE [tsa].[ics_land_Symfonia_SD]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_SD_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_SD_IsDuplicate] DEFAULT ((0)),
[aktywny] [bit] NULL,
[dzial] [bit] NULL,
[id] [int] NULL,
[idTypDok] [int] NULL,
[kod] [varchar] (40) NULL,
[numeracja] [smallint] NULL,
[szablon] [varchar] (100) NULL
)
GO
