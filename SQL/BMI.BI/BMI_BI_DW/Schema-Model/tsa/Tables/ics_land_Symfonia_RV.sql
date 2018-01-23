CREATE TABLE [tsa].[ics_land_Symfonia_RV]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_RV_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_Symfonia_RV_IsDuplicate] DEFAULT ((0)),
[datarej] [datetime] NULL,
[datawyst] [datetime] NULL,
[dkid] [int] NULL,
[id] [int] NULL,
[netto] [float] NULL,
[rejestr] [int] NULL,
[stvat] [int] NULL,
[vat] [float] NULL
)
GO
