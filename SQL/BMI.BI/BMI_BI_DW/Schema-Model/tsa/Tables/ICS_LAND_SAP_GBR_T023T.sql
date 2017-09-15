CREATE TABLE [tsa].[ics_land_SAP_GBR_T023T]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T023T_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_SAP_GBR_T023T_IsDuplicate] DEFAULT ((0)),
[MANDT] [nvarchar] (3) NULL,
[SPRAS] [nvarchar] (1) NULL,
[MATKL] [nvarchar] (9) NULL,
[WGBEZ] [nvarchar] (20) NULL,
[WGBEZ60] [nvarchar] (60) NULL
)
GO
