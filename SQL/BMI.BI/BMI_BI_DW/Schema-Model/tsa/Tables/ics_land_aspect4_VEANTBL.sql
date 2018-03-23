CREATE TABLE [tsa].[ics_land_aspect4_VEANTBL]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_aspect4_VEANTBL_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_aspect4_VEANTBL_IsDuplicate] DEFAULT ((0)),
[VEAN_RECSTS] [decimal] (1, 0) NULL,
[VEAN_RECID] [nvarchar] (2) NULL,
[VEAN_NUMMER] [nvarchar] (14) NULL,
[VEAN_KONCRN] [decimal] (3, 0) NULL,
[VEAN_FIRMA] [decimal] (3, 0) NULL,
[VEAN_VARENR] [nvarchar] (16) NULL,
[VEAN_UDF1] [nvarchar] (5) NULL,
[VEAN_UDF2] [nvarchar] (5) NULL,
[VEAN_UDF3] [nvarchar] (5) NULL,
[VEAN_UDF4] [nvarchar] (5) NULL,
[VEAN_UDF5] [nvarchar] (5) NULL,
[VEAN_AENDDT] [decimal] (8, 0) NULL,
[VEAN_AENDAF] [nvarchar] (10) NULL,
[VEAN_OPRDT] [decimal] (8, 0) NULL,
[VEAN_OPRAF] [nvarchar] (10) NULL,
[VEAN_ENHED] [nvarchar] (5) NULL,
[VEAN_TS] [decimal] (8, 0) NULL
)
GO
