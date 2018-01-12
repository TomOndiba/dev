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
[Ending Date] [datetime] NULL,
[Item No_] [varchar] (20) NULL,
[Prepayment %] [decimal] (38, 20) NULL,
[Starting Date] [datetime] NULL,
[timestamp] [varbinary] (max) NULL,
[Vendor No_] [varchar] (20) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %_1] ON [tsa].[ics_land_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %] ([Item No_], [Starting Date], [Vendor No_])
GO
