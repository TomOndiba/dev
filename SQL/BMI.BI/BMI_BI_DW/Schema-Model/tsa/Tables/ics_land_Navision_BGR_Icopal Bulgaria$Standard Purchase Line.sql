CREATE TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Line]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Line_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Line_IsDuplicate] DEFAULT ((0)),
[Amount Excl_ VAT] [decimal] (38, 20) NULL,
[Description] [varchar] (50) NULL,
[Line No_] [int] NULL,
[No_] [varchar] (20) NULL,
[Quantity] [decimal] (38, 20) NULL,
[Shortcut Dimension 1 Code] [varchar] (20) NULL,
[Shortcut Dimension 2 Code] [varchar] (20) NULL,
[Standard Purchase Code] [varchar] (10) NULL,
[timestamp] [varbinary] (max) NULL,
[Type] [int] NULL,
[Unit of Measure Code] [varchar] (10) NULL,
[Variant Code] [varchar] (10) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Line_1] ON [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Standard Purchase Line] ([Line No_], [Standard Purchase Code])
GO
