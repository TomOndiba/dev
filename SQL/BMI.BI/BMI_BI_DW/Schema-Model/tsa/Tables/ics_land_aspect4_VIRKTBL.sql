CREATE TABLE [tsa].[ics_land_aspect4_VIRKTBL]
(
[EtlBatchRunId] [int] NULL,
[EtlThreadRunId] [int] NULL,
[DataSourceKey] [int] NULL,
[EtlSourceTable] [varchar] (200) NULL,
[EtlStepRunId] [int] NULL,
[EtlCreatedOn] [datetime] NULL,
[EtlCreatedBy] [varchar] (200) NULL,
[ExcludeFromMerge] [bit] NULL,
[IsDuplicate] [bit] NULL,
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
