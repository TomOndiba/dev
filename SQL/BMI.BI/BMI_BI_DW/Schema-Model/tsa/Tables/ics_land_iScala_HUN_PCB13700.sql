CREATE TABLE [tsa].[ics_land_iScala_HUN_PCB13700]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_iScala_HUN_PCB13700_ExcludedFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_iScala_HUN_PCB13700_IsDuplicate] DEFAULT ((0)),
[PCB1001] [nchar] (38) NOT NULL,
[PCB1002] [nvarchar] (35) NULL,
[PCB1003] [int] NULL,
[PCB1004] [int] NULL,
[PCB1005] [nchar] (10) NULL,
[PCB1006] [nvarchar] (35) NULL,
[PCB1007] [numeric] (28, 8) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_iScala_HUN_PCB13700] ON [tsa].[ics_land_iScala_HUN_PCB13700] ([PCB1001])
GO
