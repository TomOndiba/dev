CREATE TABLE [tsa].[ics_land_Symfonia_KP]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_KP_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_KP_IsDuplicate] DEFAULT ((0)),
[flag] [smallint] NULL,
[id] [int] NULL,
[idck] [int] NULL,
[idpd] [int] NULL,
[typpd] [smallint] NULL
)
GO
