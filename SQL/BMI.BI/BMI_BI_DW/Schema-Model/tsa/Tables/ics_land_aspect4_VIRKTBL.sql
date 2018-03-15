CREATE TABLE [tsa].[ics_land_aspect4_VIRKTBL]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_aspect4_VIRKTBL_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_aspect4_VIRKTBL_IsDuplicate] DEFAULT ((0)),
[VIRK_STATUS_KODE] [decimal] (1, 0) NULL,
[VIRK_RECORD_ID] [nvarchar] (2) NULL,
[VIRK_PAR_NAVN] [nvarchar] (8) NULL,
[VIRK_KEY_REST] [nvarchar] (10) NULL,
[VIRK_KONCRN] [decimal] (3, 0) NULL,
[VIRK_FIRMA] [decimal] (3, 0) NULL,
[VIRK_DATA] [nvarchar] (300) NULL,
[VIRK_OPDAT_DATO] [decimal] (8, 0) NULL,
[VIRK_OPDAT_AF] [nvarchar] (10) NULL,
[VIRK_OPRET_DATO] [decimal] (8, 0) NULL,
[VIRK_OPRET_AF] [nvarchar] (10) NULL,
[VIRK_TS] [decimal] (8, 0) NULL
)
GO
