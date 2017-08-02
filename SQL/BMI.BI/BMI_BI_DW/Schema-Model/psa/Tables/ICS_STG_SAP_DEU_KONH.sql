CREATE TABLE [psa].[ICS_STG_SAP_DEU_KONH]
(
[EtlBatchRunId] [int] NULL,
[EtlStepRunId] [int] NULL,
[EtlThreadRunId] [int] NULL,
[DataSourceKey] [int] NULL,
[EtlCreatedOn] [datetime] NULL,
[EtlCreatedBy] [varchar] (200) NULL,
[MANDT] [nvarchar] (3) NULL,
[KNUMH] [nvarchar] (10) NULL,
[ERNAM] [nvarchar] (12) NULL,
[ERDAT] [datetime] NULL,
[KVEWE] [nvarchar] (1) NULL,
[KOTABNR] [nvarchar] (3) NULL,
[KAPPL] [nvarchar] (2) NULL,
[KSCHL] [nvarchar] (4) NULL,
[VAKEY] [nvarchar] (100) NULL,
[DATAB] [datetime] NULL,
[DATBI] [datetime] NULL,
[KOSRT] [nvarchar] (10) NULL,
[KZUST] [nvarchar] (3) NULL,
[KNUMA_PI] [nvarchar] (10) NULL,
[KNUMA_AG] [nvarchar] (10) NULL,
[KNUMA_SQ] [nvarchar] (10) NULL,
[KNUMA_SD] [nvarchar] (10) NULL,
[AKTNR] [nvarchar] (10) NULL,
[KNUMA_BO] [nvarchar] (10) NULL,
[LICNO] [nvarchar] (20) NULL,
[LICDT] [datetime] NULL,
[VADAT] [nvarchar] (100) NULL,
[EtlRecordId] [bigint] NOT NULL,
[IsIncomplete] [char] (1) NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NOT NULL,
[EtlDeletedBy] [varchar] (200) NOT NULL,
[IsDeleted] [char] (1) NOT NULL
)
GO
