CREATE TABLE [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %_IsDuplicate] DEFAULT ((0)),
[Ending_Date] [datetime] NULL,
[Item_No_] [varchar] (20) NULL,
[Prepayment_%] [decimal] (38, 20) NULL,
[Starting_Date] [datetime] NULL,
[timestamp] [varbinary] (max) NULL,
[Vendor_No_] [varchar] (20) NULL
)
GO
