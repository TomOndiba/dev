CREATE TABLE [tsa].[ics_land_Symfonia_CK]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_CK_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_CK_IsDuplicate] DEFAULT ((0)),
[aktywny] [bit] NULL,
[cenowy] [smallint] NULL,
[cykliczny] [smallint] NULL,
[czw] [bit] NULL,
[datado] [datetime] NULL,
[dataod] [datetime] NULL,
[dzial] [int] NULL,
[id] [int] NULL,
[kod] [varchar] (40) NULL,
[kontrah] [smallint] NULL,
[laczony] [smallint] NULL,
[nd] [bit] NULL,
[numer] [smallint] NULL,
[numerlacz] [smallint] NULL,
[opis] [varchar] (80) NULL,
[pon] [bit] NULL,
[pt] [bit] NULL,
[sb] [bit] NULL,
[sr] [bit] NULL,
[wt] [bit] NULL,
[znacznik] [smallint] NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_CK_1] ON [tsa].[ics_land_Symfonia_CK] ([id])
GO
