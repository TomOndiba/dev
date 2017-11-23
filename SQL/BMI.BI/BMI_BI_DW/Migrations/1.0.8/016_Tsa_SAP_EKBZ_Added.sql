﻿-- <Migration ID="7f564314-79e8-47a4-a736-c7942743c807" />
GO


if object_id('tsa.ics_land_SAP_GBR_EKBZ', 'U') is not null
	drop table [tsa].[ics_land_SAP_GBR_EKBZ] ;


PRINT N'Creating [tsa].[ics_land_SAP_GBR_EKBZ]'
GO
CREATE TABLE [tsa].[ics_land_SAP_GBR_EKBZ]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_EKBZ_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_EKBZ_IsDuplicate] DEFAULT ((0)),
[MANDT] [nvarchar] (3) NULL,
[EBELN] [nvarchar] (10) NULL,
[EBELP] [nvarchar] (5) NULL,
[STUNR] [nvarchar] (3) NULL,
[ZAEHK] [nvarchar] (2) NULL,
[VGABE] [nvarchar] (1) NULL,
[GJAHR] [nvarchar] (4) NULL,
[BELNR] [nvarchar] (10) NULL,
[BUZEI] [nvarchar] (4) NULL,
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
PRINT N'Creating index [tsa_ics_land_SAP_GBR_EKBZ_1] on [tsa].[ics_land_SAP_GBR_EKBZ]'
GO
CREATE CLUSTERED INDEX [tsa_ics_land_SAP_GBR_EKBZ_1] ON [tsa].[ics_land_SAP_GBR_EKBZ] ([EBELN], [ZAEHK], [BELNR], [BUZEI])
GO
