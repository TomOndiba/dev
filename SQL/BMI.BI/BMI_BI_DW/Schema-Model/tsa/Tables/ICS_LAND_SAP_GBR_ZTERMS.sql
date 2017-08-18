CREATE TABLE [tsa].[ICS_LAND_SAP_GBR_ZTERMS]
(
[EtlBatchRunId] [int] NULL,
[EtlStepRunId] [int] NULL,
[EtlThreadRunId] [int] NULL,
[DataSourceKey] [int] NULL,
[EtlCreatedOn] [datetime] NULL,
[EtlCreatedBy] [varchar] (200) NULL,
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
[DATBI] [datetime] NULL,
[EtlSourceTable] [varchar] (200) NOT NULL
)
GO
