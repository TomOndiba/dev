CREATE TABLE [tsa].[ICS_LAND_SAP_GBR_KNVH]
(
[EtlBatchRunId] [int] NULL,
[EtlStepRunId] [int] NULL,
[EtlThreadRunId] [int] NULL,
[DataSourceKey] [int] NULL,
[EtlCreatedOn] [datetime] NULL,
[EtlCreatedBy] [varchar] (200) NULL,
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
[exp_deltaKey] [datetime] NULL,
[EtlSourceTable] [varchar] (200) NOT NULL
)
GO