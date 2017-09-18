CREATE TABLE [psa].[ics_stg_m3_OCHCUS]
(
[EtlRecordId] [bigint] NOT NULL IDENTITY(1, 1),
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NULL,
[EtlDeletedBy] [varchar] (200) NULL,
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_m3_OCHCUS_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_m3_OCHCUS_IsIncomplete] DEFAULT ('N'),
[OSCONO] [decimal] (18, 0) NOT NULL,
[OSCUNO] [nvarchar] (255) NOT NULL,
[OSCHCT] [nvarchar] (255) NOT NULL,
[OSCHL1] [nvarchar] (255) NULL,
[OSCHL2] [nvarchar] (255) NULL,
[OSCHL3] [nvarchar] (255) NULL,
[OSCHL4] [nvarchar] (255) NULL,
[OSFVDT] [decimal] (18, 0) NOT NULL,
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
ALTER TABLE [psa].[ics_stg_m3_OCHCUS] ADD CONSTRAINT [PK_stg_m3_OCHCUS] PRIMARY KEY CLUSTERED  ([OSCHCT], [OSCONO], [OSCUNO], [OSFVDT])
GO