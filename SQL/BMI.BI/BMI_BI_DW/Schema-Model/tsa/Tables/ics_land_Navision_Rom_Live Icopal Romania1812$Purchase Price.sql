CREATE TABLE [tsa].[ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Price]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Price_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Purchase Price_IsDuplicate] DEFAULT ((0)),
[Currency_Code] [varchar] (10) NULL,
[Direct_Unit_Cost] [decimal] (38, 20) NULL,
[Ending_Date] [datetime] NULL,
[Item_No_] [varchar] (20) NULL,
[Minimum_Quantity] [decimal] (38, 20) NULL,
[Starting_Date] [datetime] NULL,
[Unit_of_Measure_Code] [varchar] (10) NULL,
[Variant_Code] [varchar] (10) NULL,
[Vendor_No_] [varchar] (20) NULL,
[timestamp] [timestamp] NOT NULL
)
GO
