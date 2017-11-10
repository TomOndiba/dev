CREATE TABLE [tsa].[ics_land_SAP_GBR_T052U]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T052U_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T052U_IsDuplicate] DEFAULT ((0)),
[MANDT] [nvarchar] (3) NULL,
[SPRAS] [nvarchar] (1) NULL,
[ZTERM] [nvarchar] (4) NULL,
[ZTAGG] [nvarchar] (2) NULL,
[TEXT1] [nvarchar] (50) NULL
)
GO
CREATE CLUSTERED INDEX [tsa_ics_land_SAP_GBR_T052U_1] ON [tsa].[ics_land_SAP_GBR_T052U] ([MANDT], [SPRAS], [ZTERM], [ZTAGG])
GO
