CREATE TABLE [tsa].[ics_land_Symfonia_StanyMinMax]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_StanyMinMax_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_StanyMinMax_IsDuplicate] DEFAULT ((0)),
[id] [int] NULL,
[MagazynId] [int] NULL,
[StanMax] [float] NULL,
[StanMin] [float] NULL,
[TowarId] [int] NULL
)
GO
