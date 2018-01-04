CREATE TABLE [tsa].[ics_land_Navision_BGR_SalesPerson_Purchaser]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Navision_BGR_SalesPerson_Purchaser_ExcludedFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Navision_BGR_SalesPerson_Purchaser_IsDuplicate] DEFAULT ((0)),
[timestamp] [varbinary] (8) NULL,
[Code] [varchar] (10) NOT NULL,
[Name] [varchar] (50) NULL,
[Commission %] [decimal] (38, 20) NULL,
[Global Dimension 1 Code] [varchar] (20) NULL,
[Global Dimension 2 Code] [varchar] (20) NULL,
[E-Mail] [varchar] (80) NULL,
[Phone No_] [varchar] (30) NULL,
[Job Title] [varchar] (30) NULL,
[Search E-Mail] [varchar] (80) NULL,
[E-Mail 2] [varchar] (80) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Navision_BGR_SalesPerson_Purchaser] ON [tsa].[ics_land_Navision_BGR_SalesPerson_Purchaser] ([Code])
GO
