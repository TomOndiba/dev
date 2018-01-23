CREATE TABLE [tsa].[ics_land_Symfonia_RN]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_RN_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_RN_IsDuplicate] DEFAULT ((0)),
[aktywny] [bit] NULL,
[createdBy] [int] NULL,
[createdDate] [datetime] NULL,
[id] [int] NULL,
[idtw] [int] NULL,
[kod] [varchar] (40) NULL,
[modifiedBy] [int] NULL,
[modifiedDate] [datetime] NULL,
[nazwa] [varchar] (100) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_RN_1] ON [tsa].[ics_land_Symfonia_RN] ([id])
GO
