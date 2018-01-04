CREATE TABLE [psa].[ics_stg_Navision_ROU_Purchase_Line_Discount]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Navision_ROU_Purchase_Line_Discount_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Navision_ROU_Purchase_Line_Discount_IsIncomplete] DEFAULT ('N'),
[timestamp] [varbinary] (8) NULL,
[Item No_] [varchar] (20) NOT NULL,
[Vendor No_] [varchar] (20) NOT NULL,
[Starting Date] [datetime] NOT NULL,
[Currency Code] [varchar] (10) NOT NULL,
[Variant Code] [varchar] (10) NOT NULL,
[Unit of Measure Code] [varchar] (10) NOT NULL,
[Minimum Quantity] [decimal] (38, 20) NOT NULL,
[Line Discount %] [decimal] (38, 20) NULL,
[Ending Date] [datetime] NULL
)
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_Purchase_Line_Discount] ADD CONSTRAINT [PK_psa_ics_stg_Navision_ROU_Purchase_Line_Discount] PRIMARY KEY CLUSTERED  ([Item No_], [Vendor No_], [Starting Date], [Currency Code], [Variant Code], [Unit of Measure Code], [Minimum Quantity])
GO
