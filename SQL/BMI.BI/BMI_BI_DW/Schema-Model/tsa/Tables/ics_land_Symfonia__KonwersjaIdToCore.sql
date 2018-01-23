CREATE TABLE [tsa].[ics_land_Symfonia__KonwersjaIdToCore]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia__KonwersjaIdToCore_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia__KonwersjaIdToCore_IsDuplicate] DEFAULT ((0)),
[coreId] [int] NULL,
[hmfID] [int] NULL,
[objId] [int] NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia__KonwersjaIdToCore_1] ON [tsa].[ics_land_Symfonia__KonwersjaIdToCore] ([coreId], [hmfID], [objId])
GO
