CREATE TABLE [psa].[ics_stg_aspect4_VEANTBL]
(
[EtlRecordId] [bigint] NOT NULL IDENTITY(1, 1),
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NULL,
[EtlDeletedBy] [varchar] (200) NULL,
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_aspect4_VEANTBL_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa ics_stg_aspect4_VEANTBL_IsIncomplete] DEFAULT ('N'),
[VEAN_RECSTS] [decimal] (1, 0) NULL,
[VEAN_RECID] [nvarchar] (2) NOT NULL,
[VEAN_NUMMER] [nvarchar] (14) NOT NULL,
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
ALTER TABLE [psa].[ics_stg_aspect4_VEANTBL] ADD CONSTRAINT [psa_ics_stg_aspect4_VEANTBL_PK] PRIMARY KEY CLUSTERED  ([VEAN_NUMMER], [VEAN_RECID])
GO
