CREATE TABLE [tsa].[ics_land_Navision_BGR_Purchase_PrePayment_Pct]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Purchase_PrePayment_Pct_ExcludedFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Purchase_PrePayment_Pct_IsDuplicate] DEFAULT ((0)),
[timestamp] [varbinary] (8) NULL,
[Item No_] [varchar] (20) NOT NULL,
[Vendor No_] [varchar] (20) NOT NULL,
[Starting Date] [datetime] NOT NULL,
[Ending Date] [datetime] NULL,
[Prepayment %] [decimal] (38, 20) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Navision_BGR_Purchase_PrePayment_Pct] ON [tsa].[ics_land_Navision_BGR_Purchase_PrePayment_Pct] ([Item No_], [Vendor No_], [Starting Date])
GO
