CREATE TABLE [tsa].[ICS_LAND_m3_ESP_OCHCUS]
(
[EtlBatchRunId] [int] NULL,
[EtlStepRunId] [int] NULL,
[EtlThreadRunId] [int] NULL,
[DataSourceKey] [int] NULL,
[EtlCreatedOn] [datetime2] NULL,
[EtlCreatedBy] [varchar] (200) NULL,
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
[OSCHID] [nvarchar] (255) NULL,
[EtlSourceTable] [varchar] (200) NOT NULL
)
GO
