CREATE TABLE [tsa].[ics_land_Symfonia_SR]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_SR_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_SR_IsDuplicate] DEFAULT ((0)),
[id] [int] NULL,
[idrj] [int] NULL,
[stannl] [float] NULL,
[stannlwal] [float] NULL,
[stanpl] [float] NULL,
[stanplwal] [float] NULL,
[waluta] [varchar] (3) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_Symfonia_SR_1] ON [tsa].[ics_land_Symfonia_SR] ([id])
GO
