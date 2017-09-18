CREATE TABLE [tsa].[ics_land_SAP_GBR_STKO]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_STKO_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_STKO_IsDuplicate] DEFAULT ((0)),
[MANDT] [nvarchar] (3) NULL,
[STLTY] [nvarchar] (1) NULL,
[STLNR] [nvarchar] (8) NULL,
[STLAL] [nvarchar] (2) NULL,
[STKOZ] [nvarchar] (8) NULL,
[DATUV] [datetime] NULL,
[TECHV] [nvarchar] (12) NULL,
[AENNR] [nvarchar] (12) NULL,
[LKENZ] [nvarchar] (1) NULL,
[LOEKZ] [nvarchar] (1) NULL,
[VGKZL] [nvarchar] (8) NULL,
[ANDAT] [datetime] NULL,
[ANNAM] [nvarchar] (12) NULL,
[AEDAT] [datetime] NULL,
[AENAM] [nvarchar] (12) NULL,
[BMEIN] [nvarchar] (3) NULL,
[BMENG] [decimal] (13, 3) NULL,
[CADKZ] [nvarchar] (1) NULL,
[LABOR] [nvarchar] (3) NULL,
[LTXSP] [nvarchar] (1) NULL,
[STKTX] [nvarchar] (40) NULL,
[STLST] [nvarchar] (2) NULL,
[WRKAN] [nvarchar] (4) NULL,
[DVDAT] [datetime] NULL,
[DVNAM] [nvarchar] (12) NULL,
[AEHLP] [nvarchar] (2) NULL,
[ALEKZ] [nvarchar] (1) NULL,
[GUIDX] [binary] (16) NULL
)
GO