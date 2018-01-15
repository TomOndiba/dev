CREATE TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Code]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Code_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Code_IsDuplicate] DEFAULT ((0)),
[Code] [varchar] (10) NULL,
[Currency_Code] [varchar] (10) NULL,
[Description] [varchar] (50) NULL,
[timestamp] [varbinary] (max) NULL
)
GO
