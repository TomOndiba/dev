CREATE TABLE [tsa].[ics_land_Navision_ROU_Purchase_Code]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Navision_ROU_Purchase_Code_ExcludedFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Navision_ROU_Purchase_Code_IsDuplicate] DEFAULT ((0)),
[Code] [varchar] (10) NOT NULL,
[Currency Code] [varchar] (10) NULL,
[Description] [varchar] (50) NULL,
[timestamp] [varbinary] (8) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Navision_ROU_Purchase_Code] ON [tsa].[ics_land_Navision_ROU_Purchase_Code] ([Code])
GO
