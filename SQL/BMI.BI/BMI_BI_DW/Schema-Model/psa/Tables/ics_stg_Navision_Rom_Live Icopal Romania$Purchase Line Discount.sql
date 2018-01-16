CREATE TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Purchase Line Discount]
(
[EtlRecordId] [bigint] NOT NULL IDENTITY(1, 1),
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NULL,
[EtlDeletedBy] [varchar] (200) NULL,
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Line Discount_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Line Discount_IsIncomplete] DEFAULT ('N'),
[Currency_Code] [varchar] (10) NOT NULL,
[Ending_Date] [datetime] NULL,
[Item_No_] [varchar] (20) NOT NULL,
[Line_Discount_%] [decimal] (38, 20) NULL,
[Minimum_Quantity] [decimal] (18, 0) NOT NULL,
[Starting_Date] [datetime] NOT NULL,
[Unit_of_Measure_Code] [varchar] (10) NOT NULL,
[Variant_Code] [varchar] (10) NOT NULL,
[Vendor_No_] [varchar] (20) NOT NULL,
[timestamp] [varchar] (30) NULL
)
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Purchase Line Discount] ADD CONSTRAINT [PK_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Purchase Line Discount] PRIMARY KEY CLUSTERED  ([Currency_Code], [Item_No_], [Minimum_Quantity], [Starting_Date], [Unit_of_Measure_Code], [Variant_Code], [Vendor_No_])
GO
