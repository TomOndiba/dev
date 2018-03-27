CREATE TABLE [tsa].[ics_land_Navision_BGR_Salesperson_Purchaser]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Salesperson_Purchaser_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Navision_BGR_Salesperson_Purchaser_IsDuplicate] DEFAULT ((0)),
[Code] [varchar] (10) NULL,
[Commission_%] [decimal] (38, 20) NULL,
[E-Mail] [varchar] (80) NULL,
[E-Mail_2] [varchar] (80) NULL,
[Global_Dimension_1_Code] [varchar] (20) NULL,
[Global_Dimension_2_Code] [varchar] (20) NULL,
[Job_Title] [varchar] (30) NULL,
[Name] [varchar] (50) NULL,
[Phone_No_] [varchar] (30) NULL,
[Search_E-Mail] [varchar] (80) NULL,
[timestamp] [varbinary] (max) NULL
)
GO
