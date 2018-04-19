CREATE TABLE [psa].[ics_stg_Navision_ROU_Standard_Purch_Line]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Navision_ROU_Standard_Purch_Line_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_Navision_ROU_Standard_Purch_Line_IsIncomplete] DEFAULT ('N'),
[timestamp] [varbinary] (max) NULL,
[Standard Purchase Code] [varchar] (10) NOT NULL,
[Line_No_] [int] NOT NULL,
[Type] [int] NULL,
[No_] [varchar] (20) NULL,
[Description] [varchar] (50) NULL,
[Quantity] [decimal] (38, 20) NULL,
[Amount_Excl__VAT] [decimal] (38, 20) NULL,
[Unit_of_Measure_Code] [varchar] (10) NULL,
[Shortcut_Dimension_1_Code] [varchar] (20) NULL,
[Shortcut_Dimension_2_Code] [varchar] (20) NULL,
[Variant_Code] [varchar] (10) NULL
)
GO
ALTER TABLE [psa].[ics_stg_Navision_ROU_Standard_Purch_Line] ADD CONSTRAINT [PK_psa_ics_stg_Navision_ROU_Standard_Purch_Line] PRIMARY KEY CLUSTERED  ([Standard Purchase Code], [Line_No_])
GO
EXEC sp_addextendedproperty N'IncludeInMerge', N'Y', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_Navision_ROU_Standard_Purch_Line', NULL, NULL
GO
