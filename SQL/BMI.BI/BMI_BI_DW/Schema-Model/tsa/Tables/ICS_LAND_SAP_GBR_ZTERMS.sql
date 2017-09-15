CREATE TABLE [tsa].[ics_land_SAP_GBR_ZTERMS]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_ZTERMS_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_ZTERMS_IsDuplicate] DEFAULT ((0)),
[MANDT] [nvarchar] (3) NULL,
[VKORG] [nvarchar] (4) NULL,
[KUNNR] [nvarchar] (10) NULL,
[MATNR] [nvarchar] (18) NULL,
[SEQUENCE] [nvarchar] (10) NULL,
[MAKTX] [nvarchar] (40) NULL,
[PRICE] [decimal] (11, 2) NULL,
[ROLLS] [decimal] (5, 0) NULL,
[M2PRICE] [decimal] (11, 2) NULL,
[SROLLS] [decimal] (15, 3) NULL,
[VKGRP] [nvarchar] (3) NULL,
[VKBUR] [nvarchar] (4) NULL,
[WAERS] [nvarchar] (5) NULL,
[DATAB] [datetime] NULL,
[DATBI] [datetime] NULL
)
GO
