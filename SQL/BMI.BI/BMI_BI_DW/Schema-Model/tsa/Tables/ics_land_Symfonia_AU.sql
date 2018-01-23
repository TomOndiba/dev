CREATE TABLE [tsa].[ics_land_Symfonia_AU]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_AU_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_AU_IsDuplicate] DEFAULT ((0)),
[id] [int] NULL,
[o_id] [int] NULL,
[o_oper] [smallint] NULL,
[o_parent] [int] NULL,
[o_seed] [int] NULL,
[o_type] [int] NULL,
[o_unit] [int] NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_AU_1] ON [tsa].[ics_land_Symfonia_AU] ([id], [o_seed])
GO
