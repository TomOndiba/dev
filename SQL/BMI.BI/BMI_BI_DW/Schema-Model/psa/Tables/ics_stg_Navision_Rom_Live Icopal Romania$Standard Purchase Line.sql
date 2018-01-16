CREATE TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Standard Purchase Line]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Standard Purchase Line_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Standard Purchase Line_IsIncomplete] DEFAULT ('N'),
[Amount_Excl__VAT] [decimal] (38, 20) NULL,
[Description] [varchar] (50) NULL,
[Line_No_] [int] NOT NULL,
[No_] [varchar] (20) NULL,
[Quantity] [decimal] (38, 20) NULL,
[Shortcut_Dimension_1_Code] [varchar] (20) NULL,
[Shortcut_Dimension_2_Code] [varchar] (20) NULL,
[Standard_Purchase_Code] [varchar] (10) NOT NULL,
[Type] [int] NULL,
[Unit_of_Measure_Code] [varchar] (10) NULL,
[Variant_Code] [varchar] (10) NULL,
[timestamp] [varchar] (30) NULL
)
GO
ALTER TABLE [psa].[ics_stg_Navision_Rom_Live Icopal Romania$Standard Purchase Line] ADD CONSTRAINT [PK_psa_ics_stg_Navision_Rom_Live Icopal Romania1812$Standard Purchase Line] PRIMARY KEY CLUSTERED  ([Line_No_], [Standard_Purchase_Code])
GO
