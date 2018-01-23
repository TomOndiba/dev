CREATE TABLE [tsa].[ics_land_Symfonia_ErrorLog]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_ErrorLog_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_ErrorLog_IsDuplicate] DEFAULT ((0)),
[data] [datetime] NULL,
[errno] [int] NULL,
[id] [int] NULL,
[opis] [varchar] (2000) NULL,
[super] [int] NULL,
[typ] [smallint] NULL
)
GO
