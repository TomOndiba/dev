CREATE TABLE [tsa].[ics_land_SAP_GBR_LFBK]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_LFBK_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_LFBK_IsDuplicate] DEFAULT ((0)),
[MANDT] [nvarchar] (3) NULL,
[LIFNR] [nvarchar] (10) NULL,
[BANKS] [nvarchar] (3) NULL,
[BANKL] [nvarchar] (15) NULL,
[BANKN] [nvarchar] (18) NULL,
[BKONT] [nvarchar] (2) NULL,
[BVTYP] [nvarchar] (4) NULL,
[XEZER] [nvarchar] (1) NULL,
[BKREF] [nvarchar] (20) NULL,
[KOINH] [nvarchar] (60) NULL,
[EBPP_ACCNAME] [nvarchar] (40) NULL,
[EBPP_BVSTATUS] [nvarchar] (1) NULL,
[KOVON] [datetime] NULL,
[KOBIS] [datetime] NULL
)
GO
