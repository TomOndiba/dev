CREATE TABLE [tsa].[ics_land_Navision_BGR_Purchase_Line_Discount]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Purchase_Line_Discount_ExcludedFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Purchase_Line_Discount_IsDuplicate] DEFAULT ((0)),
[timestamp] [varbinary] (8) NULL,
[Item No_] [varchar] (20) NOT NULL,
[Vendor No_] [varchar] (20) NOT NULL,
[Starting Date] [datetime] NOT NULL,
[Currency Code] [varchar] (10) NOT NULL,
[Variant Code] [varchar] (10) NOT NULL,
[Unit of Measure Code] [varchar] (10) NOT NULL,
[Minimum Quantity] [decimal] (38, 20) NOT NULL,
[Line Discount %] [decimal] (38, 20) NULL,
[Ending Date] [datetime] NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Navision_BGR_Purchase_Line_Discount] ON [tsa].[ics_land_Navision_BGR_Purchase_Line_Discount] ([Item No_], [Vendor No_], [Starting Date], [Currency Code], [Variant Code], [Unit of Measure Code], [Minimum Quantity])
GO
