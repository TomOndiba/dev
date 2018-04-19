CREATE TABLE [tsa].[ics_land_Navision_ROU_Standard_Purch_Line]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Navision_ROU_Standard_Purch_Line_ExcludedFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Navision_ROU_Standard_Purch_Line_IsDuplicate] DEFAULT ((0)),
[timestamp] [varbinary] (max) NULL,
[Line No_] [int] NOT NULL,
[Type] [int] NULL,
[No_] [varchar] (20) NULL,
[Description] [varchar] (50) NULL,
[Quantity] [decimal] (38, 20) NULL,
[Amount_Excl__VAT] [decimal] (38, 20) NULL,
[Unit_of_Measure_Code] [varchar] (10) NULL,
[Shortcut_Dimension_1_Code] [varchar] (20) NULL,
[Shortcut_Dimension_2_Code] [varchar] (20) NULL,
[Variant Code] [varchar] (10) NULL,
[Line_No_] [int] NULL,
[Variant_Code] [varchar] (10) NULL
)
GO
