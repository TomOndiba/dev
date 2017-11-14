CREATE TABLE [tsa].[ics_land_m3v7_CIDADR]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_m3v7_CIDADR_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_m3v7_CIDADR_IsDuplicate] DEFAULT ((0)),
[SACONO] [decimal] (3, 0) NULL,
[SASUNO] [nvarchar] (255) NULL,
[SAADTE] [decimal] (2, 0) NULL,
[SAADID] [nvarchar] (255) NULL,
[SASTDT] [decimal] (8, 0) NULL,
[SASUNM] [nvarchar] (255) NULL,
[m3v7RIA] [decimal] (1, 0) NULL,
[SAADR1] [nvarchar] (255) NULL,
[SAADR2] [nvarchar] (255) NULL,
[SAADR3] [nvarchar] (255) NULL,
[SAADR4] [nvarchar] (255) NULL,
[SACSCD] [nvarchar] (255) NULL,
[m3v7ONO] [nvarchar] (255) NULL,
[SAADVI] [nvarchar] (255) NULL,
[SAEDES] [nvarchar] (255) NULL,
[SAGEOC] [decimal] (9, 0) NULL,
[SATAXC] [nvarchar] (255) NULL,
[SAECAR] [nvarchar] (255) NULL,
[SATOWN] [nvarchar] (255) NULL,
[m3v7NOD] [nvarchar] (255) NULL,
[SATXID] [decimal] (13, 0) NULL,
[SARGDT] [decimal] (8, 0) NULL,
[SARGTM] [decimal] (6, 0) NULL,
[SALMDT] [decimal] (8, 0) NULL,
[SACHNO] [decimal] (3, 0) NULL,
[SACHID] [nvarchar] (255) NULL,
[SALMTS] [decimal] (18, 0) NULL
)
GO
CREATE CLUSTERED INDEX [tsa_ics_land_m3v7_CIDADR_1] ON [tsa].[ics_land_m3v7_CIDADR] ([SASUNO], [SAADTE], [SAADID], [SASTDT])
GO
