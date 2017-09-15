CREATE TABLE [tsa].[ics_land_m3_OCHCUS]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_m3_OCHCUS_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_m3_OCHCUS_IsDuplicate] DEFAULT ((0)),
[OSCONO] [decimal] (3, 0) NULL,
[OSCUNO] [nvarchar] (255) NULL,
[OSCHCT] [nvarchar] (255) NULL,
[OSCHL1] [nvarchar] (255) NULL,
[OSCHL2] [nvarchar] (255) NULL,
[OSCHL3] [nvarchar] (255) NULL,
[OSCHL4] [nvarchar] (255) NULL,
[OSFVDT] [decimal] (8, 0) NULL,
[OSLVDT] [decimal] (8, 0) NULL,
[OSCHMB] [nvarchar] (255) NULL,
[OSMBST] [decimal] (1, 0) NULL,
[OSTXID] [decimal] (13, 0) NULL,
[OSRGDT] [decimal] (8, 0) NULL,
[OSRGTM] [decimal] (6, 0) NULL,
[OSLMDT] [decimal] (8, 0) NULL,
[OSCHNO] [decimal] (3, 0) NULL,
[OSCHID] [nvarchar] (255) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3_OCHCUS_1] ON [tsa].[ics_land_m3_OCHCUS] ([OSCHCT], [OSCONO], [OSCUNO], [OSFVDT])
GO
