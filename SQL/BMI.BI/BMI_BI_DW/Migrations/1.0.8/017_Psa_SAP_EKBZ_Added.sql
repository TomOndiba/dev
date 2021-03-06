﻿-- <Migration ID="14e0d318-3682-4617-8b76-d77a6305afe3" />
GO

PRINT N'Creating [psa].[ics_stg_SAP_GBR_EKBZ]'
GO
CREATE TABLE [psa].[ics_stg_SAP_GBR_EKBZ]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_EKBZ_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_GBR_EKBZ_IsIncomplete] DEFAULT ('N'),
[MANDT] [nvarchar] (3) NULL,
[EBELN] [nvarchar] (10) NOT NULL,
[EBELP] [nvarchar] (5) NULL,
[STUNR] [nvarchar] (3) NULL,
[ZAEHK] [nvarchar] (2) NOT NULL,
[VGABE] [nvarchar] (1) NULL,
[GJAHR] [nvarchar] (4) NULL,
[BELNR] [nvarchar] (10) NOT NULL,
[BUZEI] [nvarchar] (4) NOT NULL,
[BEWTP] [nvarchar] (1) NULL,
[BUDAT] [datetime] NULL,
[MENGE] [decimal] (13, 3) NULL,
[DMBTR] [decimal] (13, 2) NULL,
[WRBTR] [decimal] (13, 2) NULL,
[WAERS] [nvarchar] (5) NULL,
[AREWR] [decimal] (13, 2) NULL,
[SHKZG] [nvarchar] (1) NULL,
[XBLNR] [nvarchar] (16) NULL,
[FRBNR] [nvarchar] (16) NULL,
[LIFNR] [nvarchar] (10) NULL,
[CPUDT] [datetime] NULL,
[CPUTM] [datetime] NULL,
[REEWR] [decimal] (13, 2) NULL,
[REFWR] [decimal] (13, 2) NULL,
[BWTAR] [nvarchar] (10) NULL,
[KSCHL] [nvarchar] (4) NULL,
[BPMNG] [decimal] (13, 3) NULL,
[AREWW] [decimal] (13, 2) NULL,
[HSWAE] [nvarchar] (5) NULL,
[VNETW] [decimal] (13, 2) NULL,
[ERNAM] [nvarchar] (12) NULL,
[SHKKO] [nvarchar] (1) NULL,
[AREWB] [decimal] (13, 2) NULL,
[REWRB] [decimal] (13, 2) NULL,
[SAPRL] [nvarchar] (4) NULL,
[MENGE_POP] [decimal] (13, 3) NULL,
[DMBTR_POP] [decimal] (13, 2) NULL,
[WRBTR_POP] [decimal] (13, 2) NULL,
[BPMNG_POP] [decimal] (13, 3) NULL,
[AREWR_POP] [decimal] (13, 2) NULL,
[KUDIF] [decimal] (13, 2) NULL,
[XMACC] [nvarchar] (1) NULL,
[WKURS] [decimal] (9, 5) NULL
)
GO
PRINT N'Creating primary key [psa_ics_stg_SAP_GBR_EKBZ_PK] on [psa].[ics_stg_SAP_GBR_EKBZ]'
GO
ALTER TABLE [psa].[ics_stg_SAP_GBR_EKBZ] ADD CONSTRAINT [psa_ics_stg_SAP_GBR_EKBZ_PK] PRIMARY KEY CLUSTERED  ([EBELN], [ZAEHK], [BELNR], [BUZEI])
GO
