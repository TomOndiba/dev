CREATE TABLE [tsa].[ics_land_Symfonia_EK]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_EK_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_EK_IsDuplicate] DEFAULT ((0)),
[flag] [smallint] NULL,
[id] [int] NULL,
[idEKwzor] [int] NULL,
[idSK] [int] NULL,
[kod] [varchar] (40) NULL,
[kwota] [smallint] NULL,
[mnoznik] [float] NULL,
[nazwa] [varchar] (100) NULL,
[nr_poz] [smallint] NULL,
[szablon] [varchar] (40) NULL,
[wymiar01] [varchar] (40) NULL,
[wymiar02] [varchar] (40) NULL,
[wymiar03] [varchar] (40) NULL,
[wymiar04] [varchar] (40) NULL,
[wymiar05] [varchar] (40) NULL,
[wymiar06] [varchar] (40) NULL,
[wymiar07] [varchar] (40) NULL,
[wymiar08] [varchar] (40) NULL,
[wymiar09] [varchar] (40) NULL,
[wymiar10] [varchar] (40) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_EK_1] ON [tsa].[ics_land_Symfonia_EK] ([id])
GO
