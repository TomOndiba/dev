CREATE TABLE [tsa].[ics_land_Navision_ROU_Std_Purchase_Line]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Navision_ROU_Std_Purchase_Line_ExcludedFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Navision_ROU_Std_Purchase_Line_IsDuplicate] DEFAULT ((0)),
[timestamp] [varbinary] (8) NULL,
[Standard Purchase Code] [varchar] (10) NOT NULL,
[Line No_] [int] NOT NULL,
[Type] [int] NULL,
[No_] [varchar] (20) NULL,
[Description] [varchar] (50) NULL,
[Quantity] [decimal] (38, 20) NULL,
[Amount Excl_ VAT] [decimal] (38, 20) NULL,
[Unit of Measure Code] [varchar] (10) NULL,
[Shortcut Dimension 1 Code] [varchar] (20) NULL,
[Shortcut Dimension 2 Code] [varchar] (20) NULL,
[Variant Code] [varchar] (10) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Navision_ROU_Std_Purchase_Line] ON [tsa].[ics_land_Navision_ROU_Std_Purchase_Line] ([Standard Purchase Code], [Line No_])
GO
