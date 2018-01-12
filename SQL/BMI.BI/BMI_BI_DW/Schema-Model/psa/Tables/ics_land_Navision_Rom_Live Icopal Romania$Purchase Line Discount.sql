CREATE TABLE [psa].[ics_land_Navision_Rom_Live Icopal Romania$Purchase Line Discount]
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
[Currency Code] [varchar] (10) NULL,
[Ending Date] [datetime] NULL,
[Item No_] [varchar] (20) NULL,
[Line Discount %] [decimal] (38, 20) NULL,
[Minimum Quantity] [decimal] (38, 20) NULL,
[Starting Date] [datetime] NULL,
[Unit of Measure Code] [varchar] (10) NULL,
[Variant Code] [varchar] (10) NULL,
[Vendor No_] [varchar] (20) NULL,
[timestamp] [timestamp] NOT NULL
)
GO
