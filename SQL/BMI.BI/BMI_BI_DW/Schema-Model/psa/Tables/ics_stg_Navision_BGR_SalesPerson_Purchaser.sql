CREATE TABLE [psa].[ics_stg_Navision_BGR_Salesperson_Purchaser]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Salesperson_Purchaser_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Salesperson_Purchaser_IsIncomplete] DEFAULT ('N'),
[Code] [varchar] (10) NOT NULL,
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
ALTER TABLE [psa].[ics_stg_Navision_BGR_Salesperson_Purchaser] ADD CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Salesperson_Purchaser]]] PRIMARY KEY CLUSTERED  ([Code])
GO
