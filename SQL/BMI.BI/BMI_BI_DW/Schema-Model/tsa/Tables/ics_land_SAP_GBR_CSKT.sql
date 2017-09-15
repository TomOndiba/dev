CREATE TABLE [tsa].[ics_land_SAP_GBR_CSKT]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_CSKT_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_CSKT_IsDuplicate] DEFAULT ((0)),
[MANDT] [nvarchar] (3) NULL,
[SPRAS] [nvarchar] (1) NULL,
[KOKRS] [nvarchar] (4) NULL,
[KOSTL] [nvarchar] (10) NULL,
[DATBI] [datetime] NULL,
[KTEXT] [nvarchar] (20) NULL,
[LTEXT] [nvarchar] (40) NULL,
[MCTXT] [nvarchar] (20) NULL
)
GO
