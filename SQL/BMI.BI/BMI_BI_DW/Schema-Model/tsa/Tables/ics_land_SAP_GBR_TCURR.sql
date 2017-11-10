CREATE TABLE [tsa].[ics_land_SAP_GBR_TCURR]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_TCURR_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_TCURR_IsDuplicate] DEFAULT ((0)),
[MANDT] [nvarchar] (3) NULL,
[KURST] [nvarchar] (4) NULL,
[FCURR] [nvarchar] (5) NULL,
[TCURR] [nvarchar] (5) NULL,
[GDATU] [nvarchar] (8) NULL,
[UKURS] [decimal] (9, 5) NULL,
[FFACT] [decimal] (9, 0) NULL,
[TFACT] [decimal] (9, 0) NULL
)
GO
CREATE CLUSTERED INDEX [tsa_ics_land_SAP_GBR_TCURR_1] ON [tsa].[ics_land_SAP_GBR_TCURR] ([MANDT], [KURST], [FCURR], [TCURR], [GDATU])
GO
