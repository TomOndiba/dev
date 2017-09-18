CREATE TABLE [psa].[ics_stg_m3_OINVOL]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_m3_OINVOL_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_m3_OINVOL_IsIncomplete] DEFAULT ('N'),
[ONCONO] [decimal] (18, 0) NOT NULL,
[ONDIVI] [nvarchar] (255) NOT NULL,
[ONIVNO] [decimal] (18, 0) NOT NULL,
[ONYEA4] [decimal] (18, 0) NOT NULL,
[ONPYNO] [nvarchar] (255) NULL,
[ONIVSQ] [decimal] (18, 0) NOT NULL,
[ONIVTP] [nvarchar] (255) NOT NULL,
[ONORNO] [nvarchar] (255) NOT NULL,
[ONDLIX] [decimal] (18, 0) NOT NULL,
[ONWHLO] [nvarchar] (255) NOT NULL,
[ONIVRF] [nvarchar] (255) NOT NULL,
[ONIVAM] [decimal] (15, 2) NULL,
[ONIVLA] [decimal] (15, 2) NULL,
[ONIVBA] [decimal] (15, 2) NULL,
[ONCVT1] [decimal] (15, 2) NULL,
[ONCVT2] [decimal] (15, 2) NULL,
[ONVTAM] [decimal] (15, 2) NULL,
[ONIVFR] [nvarchar] (255) NULL,
[ONIVAV] [decimal] (15, 2) NULL,
[ONBSCD] [nvarchar] (255) NULL,
[ONECAR] [nvarchar] (255) NULL,
[ONFTCO] [nvarchar] (255) NULL,
[ONVTCD] [decimal] (2, 0) NULL,
[ONVTP1] [decimal] (5, 2) NULL,
[ONVTP2] [decimal] (5, 2) NULL,
[ONVRIN] [nvarchar] (255) NULL,
[ONVRNO] [nvarchar] (255) NULL,
[ONRGDT] [decimal] (8, 0) NULL,
[ONRGTM] [decimal] (6, 0) NULL,
[ONLMDT] [decimal] (8, 0) NULL,
[ONCHNO] [decimal] (3, 0) NULL,
[ONCHID] [nvarchar] (255) NULL,
[ONINPX] [nvarchar] (255) NOT NULL,
[ONEXIN] [nvarchar] (255) NULL,
[ONTEPY] [nvarchar] (255) NULL,
[ONCVDT] [decimal] (8, 0) NULL
)
GO
ALTER TABLE [psa].[ics_stg_m3_OINVOL] ADD CONSTRAINT [PK_stg_m3_OINVOL] PRIMARY KEY CLUSTERED  ([ONCONO], [ONDIVI], [ONDLIX], [ONINPX], [ONIVNO], [ONIVRF], [ONIVSQ], [ONIVTP], [ONORNO], [ONWHLO], [ONYEA4])
GO