CREATE TABLE [tsa].[ics_land_Symfonia_KR]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_KR_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_KR_IsDuplicate] DEFAULT ((0)),
[aktywny] [bit] NULL,
[flag] [smallint] NULL,
[formatNIP] [varchar] (100) NULL,
[formatVAT] [varchar] (100) NULL,
[id] [int] NULL,
[kod] [varchar] (40) NULL,
[nazwa] [varchar] (100) NULL,
[typ] [smallint] NULL,
[ue] [bit] NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_KR_1] ON [tsa].[ics_land_Symfonia_KR] ([id])
GO
