CREATE TABLE [tsa].[ics_land_SAP_GBR_T024]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T024_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T024_IsDuplicate] DEFAULT ((0)),
[MANDT] [nvarchar] (3) NULL,
[EKGRP] [nvarchar] (3) NULL,
[EKNAM] [nvarchar] (18) NULL,
[EKTEL] [nvarchar] (12) NULL,
[LDEST] [nvarchar] (4) NULL,
[TELFX] [nvarchar] (31) NULL,
[TEL_NUMBER] [nvarchar] (30) NULL,
[TEL_EXTENS] [nvarchar] (10) NULL,
[SMTP_ADDR] [nvarchar] (241) NULL
)
GO
