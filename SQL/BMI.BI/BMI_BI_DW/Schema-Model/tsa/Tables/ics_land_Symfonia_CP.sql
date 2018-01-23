CREATE TABLE [tsa].[ics_land_Symfonia_CP]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_CP_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_CP_IsDuplicate] DEFAULT ((0)),
[bazapoz] [smallint] NULL,
[cena] [float] NULL,
[cenowy] [smallint] NULL,
[flag] [smallint] NULL,
[id] [int] NULL,
[idck] [int] NULL,
[idpoz] [int] NULL,
[kod] [varchar] (40) NULL,
[typ] [smallint] NULL,
[waluta] [varchar] (3) NULL
)
GO
