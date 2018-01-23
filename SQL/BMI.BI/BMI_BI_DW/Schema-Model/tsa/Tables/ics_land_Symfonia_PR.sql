CREATE TABLE [tsa].[ics_land_Symfonia_PR]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_PR_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_PR_IsDuplicate] DEFAULT ((0)),
[aktywny] [bit] NULL,
[czas] [datetime] NULL,
[dane] [text] NULL,
[dscname] [varchar] (14) NULL,
[flag] [smallint] NULL,
[id] [int] NULL,
[idComp] [int] NULL,
[is_text] [smallint] NULL,
[katalog] [int] NULL,
[nazwa] [varchar] (68) NULL,
[rap_flag] [smallint] NULL,
[skrot] [varchar] (50) NULL,
[subtyp] [smallint] NULL,
[typ] [smallint] NULL,
[znacznik] [smallint] NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_PR_1] ON [tsa].[ics_land_Symfonia_PR] ([id])
GO
