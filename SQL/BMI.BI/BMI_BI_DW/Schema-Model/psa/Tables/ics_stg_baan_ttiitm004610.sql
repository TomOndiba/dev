CREATE TABLE [psa].[ics_stg_baan_ttiitm004610]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_baan_ttiitm004610_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_baan_ttiitm004610_IsIncomplete] DEFAULT ('N'),
[t_cprj] [nvarchar] (6) NULL,
[t_item] [nvarchar] (16) NOT NULL,
[t_citg] [nvarchar] (6) NULL,
[t_basu] [nvarchar] (3) NOT NULL,
[t_unit] [nvarchar] (3) NOT NULL,
[t_conv] [float] NULL,
[t_rpow] [smallint] NULL,
[t_Refcntd] [int] NULL,
[t_Refcntu] [int] NULL
)
GO
ALTER TABLE [psa].[ics_stg_baan_ttiitm004610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttiitm004610] PRIMARY KEY CLUSTERED  ([t_item], [t_basu], [t_unit])
GO
EXEC sp_addextendedproperty N'IncludeInMerge', N'Y', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_baan_ttiitm004610', NULL, NULL
GO
