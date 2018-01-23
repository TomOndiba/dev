CREATE TABLE [tsa].[ics_land_Symfonia_ARM_Items]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_ARM_Items_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_ARM_Items_IsDuplicate] DEFAULT ((0)),
[Code] [varchar] (40) NULL,
[Custom1] [varchar] (1) NULL,
[Custom2] [varchar] (1) NULL,
[GTIN] [varchar] (1) NULL,
[id] [int] NULL,
[Item_Type_Text] [varchar] (1) NULL,
[LocalDescription1] [varchar] (1) NULL,
[LocalDescription2] [varchar] (1) NULL,
[LocalMaterialGroup1] [varchar] (1) NULL,
[LocalMaterialGroup2] [varchar] (1) NULL,
[LocalMaterialGroup3] [varchar] (1) NULL,
[LocalMaterialGroup4] [varchar] (1) NULL,
[LocalMaterialGroup5] [varchar] (1) NULL,
[Name] [varchar] (100) NULL,
[SysID] [int] NULL,
[type1] [varchar] (1) NULL
)
GO
