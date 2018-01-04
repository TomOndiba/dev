CREATE TABLE [tsa].[ics_land_iScala_HUN_PCR13700]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_iScala_HUN_PCR13700_ExcludedFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_iScala_HUN_PCR13700_IsDuplicate] DEFAULT ((0)),
[PCR1001] [nvarchar] (10) NOT NULL,
[PCR1002] [nvarchar] (35) NULL,
[PCR1003] [nvarchar] (6) NULL,
[PCR1004] [datetime] NULL,
[PCR1005] [datetime] NULL,
[PCR1006] [nvarchar] (6) NULL,
[PCR1007] [nvarchar] (1) NULL,
[PCR1008] [nvarchar] (8) NULL,
[PCR1009] [datetime] NULL,
[PCR1010] [datetime] NULL,
[PCR1011] [nvarchar] (1) NULL,
[PCR1012] [nvarchar] (6) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_iScala_HUN_PCR13700] ON [tsa].[ics_land_iScala_HUN_PCR13700] ([PCR1001])
GO
