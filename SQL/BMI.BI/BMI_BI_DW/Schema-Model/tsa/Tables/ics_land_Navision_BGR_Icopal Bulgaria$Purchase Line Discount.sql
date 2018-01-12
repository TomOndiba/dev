CREATE TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line Discount]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line Discount_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line Discount_IsDuplicate] DEFAULT ((0)),
[Currency Code] [varchar] (10) NULL,
[Ending Date] [datetime] NULL,
[Item No_] [varchar] (20) NULL,
[Line Discount %] [decimal] (38, 20) NULL,
[Minimum Quantity] [decimal] (38, 20) NULL,
[Starting Date] [datetime] NULL,
[timestamp] [varbinary] (max) NULL,
[Unit of Measure Code] [varchar] (10) NULL,
[Variant Code] [varchar] (10) NULL,
[Vendor No_] [varchar] (20) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line Discount_1] ON [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Line Discount] ([Currency Code], [Item No_], [Minimum Quantity], [Starting Date], [Unit of Measure Code], [Variant Code], [Vendor No_])
GO
