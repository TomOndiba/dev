CREATE TABLE [tsa].[ics_land_SAP_GBR_MARM]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_MARM_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_MARM_IsDuplicate] DEFAULT ((0)),
[ATINN] [nvarchar] (10) NULL,
[BFLME_MARM] [nvarchar] (1) NULL,
[BREIT] [decimal] (18, 0) NULL,
[BRGEW] [decimal] (18, 0) NULL,
[CAPAUSE] [decimal] (18, 0) NULL,
[EAN11] [nvarchar] (18) NULL,
[EANNR] [nvarchar] (13) NULL,
[GEWEI] [nvarchar] (3) NULL,
[GTIN_VARIANT] [nvarchar] (2) NULL,
[HOEHE] [decimal] (18, 0) NULL,
[KZWSO] [nvarchar] (1) NULL,
[LAENG] [decimal] (18, 0) NULL,
[MANDT] [nvarchar] (3) NULL,
[MATNR] [nvarchar] (18) NULL,
[MAX_STACK] [smallint] NULL,
[MEABM] [nvarchar] (3) NULL,
[MEINH] [nvarchar] (3) NULL,
[MESRT] [nvarchar] (2) NULL,
[MESUB] [nvarchar] (3) NULL,
[MSEHI] [nvarchar] (3) NULL,
[NEST_FTR] [decimal] (18, 0) NULL,
[NUMTP] [nvarchar] (2) NULL,
[TY2TQ] [nvarchar] (1) NULL,
[UMREN] [decimal] (18, 0) NULL,
[UMREZ] [decimal] (18, 0) NULL,
[VOLEH] [nvarchar] (3) NULL,
[VOLUM] [decimal] (18, 0) NULL,
[XBEWW] [nvarchar] (1) NULL,
[XFHDW] [nvarchar] (1) NULL
)
GO
CREATE CLUSTERED INDEX [tsa_ics_land_SAP_GBR_MARM_1] ON [tsa].[ics_land_SAP_GBR_MARM] ([MATNR], [MEINH])
GO
