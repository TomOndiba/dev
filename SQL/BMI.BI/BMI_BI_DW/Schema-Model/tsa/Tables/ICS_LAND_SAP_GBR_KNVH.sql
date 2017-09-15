CREATE TABLE [tsa].[ics_land_SAP_GBR_KNVH]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_KNVH_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_KNVH_IsDuplicate] DEFAULT ((0)),
[MANDT] [nvarchar] (3) NULL,
[HITYP] [nvarchar] (1) NULL,
[KUNNR] [nvarchar] (10) NULL,
[VKORG] [nvarchar] (4) NULL,
[VTWEG] [nvarchar] (2) NULL,
[SPART] [nvarchar] (2) NULL,
[DATAB] [datetime] NULL,
[DATBI] [datetime] NULL,
[HKUNNR] [nvarchar] (10) NULL,
[HVKORG] [nvarchar] (4) NULL,
[HVTWEG] [nvarchar] (2) NULL,
[HSPART] [nvarchar] (2) NULL,
[GRPNO] [nvarchar] (3) NULL,
[BOKRE] [nvarchar] (1) NULL,
[PRFRE] [nvarchar] (1) NULL,
[HZUOR] [nvarchar] (2) NULL,
[exp_deltaKey] [datetime] NULL
)
GO
