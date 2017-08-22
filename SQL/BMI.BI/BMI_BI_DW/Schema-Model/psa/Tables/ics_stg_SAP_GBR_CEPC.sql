CREATE TABLE [psa].[ics_stg_SAP_GBR_CEPC]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_stg_SAP_GBR_CEPC_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_stg_SAP_GBR_CEPC_IsDuplicate] DEFAULT ((0)),
[MANDT] [nvarchar] (3) NULL,
[PRCTR] [nvarchar] (10) NULL,
[DATBI] [datetime] NULL,
[KOKRS] [nvarchar] (4) NULL,
[DATAB] [datetime] NULL,
[ERSDA] [datetime] NULL,
[USNAM] [nvarchar] (12) NULL,
[MERKMAL] [nvarchar] (30) NULL,
[ABTEI] [nvarchar] (12) NULL,
[VERAK] [nvarchar] (20) NULL,
[VERAK_USER] [nvarchar] (12) NULL,
[WAERS] [nvarchar] (5) NULL,
[NPRCTR] [nvarchar] (10) NULL,
[LAND1] [nvarchar] (3) NULL,
[ANRED] [nvarchar] (15) NULL,
[NAME1] [nvarchar] (35) NULL,
[NAME2] [nvarchar] (35) NULL,
[NAME3] [nvarchar] (35) NULL,
[NAME4] [nvarchar] (35) NULL,
[ORT01] [nvarchar] (35) NULL,
[ORT02] [nvarchar] (35) NULL,
[STRAS] [nvarchar] (35) NULL,
[PFACH] [nvarchar] (10) NULL,
[PSTLZ] [nvarchar] (10) NULL,
[PSTL2] [nvarchar] (10) NULL,
[SPRAS] [nvarchar] (1) NULL,
[TELBX] [nvarchar] (15) NULL,
[TELF1] [nvarchar] (16) NULL,
[TELF2] [nvarchar] (16) NULL,
[TELFX] [nvarchar] (31) NULL,
[TELTX] [nvarchar] (30) NULL,
[TELX1] [nvarchar] (30) NULL,
[DATLT] [nvarchar] (14) NULL,
[DRNAM] [nvarchar] (4) NULL,
[KHINR] [nvarchar] (12) NULL,
[BUKRS] [nvarchar] (4) NULL,
[VNAME] [nvarchar] (6) NULL,
[RECID] [nvarchar] (2) NULL,
[ETYPE] [nvarchar] (3) NULL,
[TXJCD] [nvarchar] (15) NULL,
[REGIO] [nvarchar] (3) NULL,
[KVEWE] [nvarchar] (1) NULL,
[KAPPL] [nvarchar] (2) NULL,
[KALSM] [nvarchar] (6) NULL,
[LOGSYSTEM] [nvarchar] (10) NULL,
[LOCK_IND] [nvarchar] (1) NULL,
[PCA_TEMPLATE] [nvarchar] (10) NULL,
[SEGMENT] [nvarchar] (10) NULL
)
GO
