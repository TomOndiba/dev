CREATE TABLE [psa].[ics_stg_Navision_BGR_Purchase_Price]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Purchase_Price_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Navision_BGR_Purchase_Price_IsIncomplete] DEFAULT ('N'),
[Currency Code] [varchar] (10) NOT NULL,
[Direct Unit Cost] [decimal] (38, 20) NULL,
[Ending Date] [datetime] NULL,
[Item No_] [varchar] (20) NOT NULL,
[Minimum Quantity] [decimal] (38, 20) NOT NULL,
[Starting Date] [datetime] NOT NULL,
[timestamp] [varbinary] (8) NULL,
[Unit of Measure Code] [varchar] (10) NOT NULL,
[Variant Code] [varchar] (10) NOT NULL,
[Vendor No_] [varchar] (20) NOT NULL
)
GO
ALTER TABLE [psa].[ics_stg_Navision_BGR_Purchase_Price] ADD CONSTRAINT [PK_psa_ics_stg_Navision_BGR_Purchase_Price] PRIMARY KEY CLUSTERED  ([Item No_], [Vendor No_], [Starting Date], [Currency Code], [Variant Code], [Unit of Measure Code], [Minimum Quantity])
GO
