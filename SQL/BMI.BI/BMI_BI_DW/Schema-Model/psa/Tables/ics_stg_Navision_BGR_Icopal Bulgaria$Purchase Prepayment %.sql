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
[Ending Date] [datetime] NULL,
[Item No_] [varchar] (20) NULL,
[Prepayment %] [decimal] (38, 20) NULL,
[Starting Date] [datetime] NULL,
[timestamp] [varbinary] (max) NULL,
[Vendor No_] [varchar] (20) NULL
)
GO
