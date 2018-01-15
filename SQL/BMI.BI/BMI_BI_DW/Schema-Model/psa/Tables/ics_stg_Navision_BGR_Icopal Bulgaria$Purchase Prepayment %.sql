CREATE TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %_IsIncomplete] DEFAULT ('N'),
[Ending_Date] [datetime] NULL,
[Item_No_] [varchar] (20) NOT NULL,
[Prepayment_%] [decimal] (38, 20) NULL,
[Starting_Date] [datetime] NOT NULL,
[timestamp] [varbinary] (max) NULL,
[Vendor_No_] [varchar] (20) NOT NULL
)
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %] ADD CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Icopal Bulgaria$Purchase Prepayment %] PRIMARY KEY CLUSTERED  ([Item_No_], [Starting_Date], [Vendor_No_])
GO
