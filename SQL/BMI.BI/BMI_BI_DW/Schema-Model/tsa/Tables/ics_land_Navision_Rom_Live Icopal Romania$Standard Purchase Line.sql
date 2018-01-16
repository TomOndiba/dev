CREATE TABLE [tsa].[ics_land_Navision_Rom_Live Icopal Romania$Standard Purchase Line]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Standard Purchase Line_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Navision_Rom_Live Icopal Romania1812$Standard Purchase Line_IsDuplicate] DEFAULT ((0)),
[Amount_Excl__VAT] [decimal] (38, 20) NULL,
[Description] [varchar] (50) NULL,
[Line_No_] [int] NULL,
[No_] [varchar] (20) NULL,
[Quantity] [decimal] (38, 20) NULL,
[Shortcut_Dimension_1_Code] [varchar] (20) NULL,
[Shortcut_Dimension_2_Code] [varchar] (20) NULL,
[Standard_Purchase_Code] [varchar] (10) NULL,
[Type] [int] NULL,
[Unit_of_Measure_Code] [varchar] (10) NULL,
[Variant_Code] [varchar] (10) NULL,
[timestamp] [varchar] (30) NULL
)
GO
