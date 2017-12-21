CREATE TABLE [psa].[ics_stg_baan_ttdpur703610]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_baan_ttdpur703610_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_baan_ttdpur703610_IsIncomplete] DEFAULT ('N'),
[t_Refcntd] [int] NULL,
[t_Refcntu] [int] NULL,
[t_ckor] [tinyint] NULL,
[t_cosn] [varchar] (8) NULL,
[t_crcd] [varchar] (3) NULL,
[t_ctcd] [varchar] (3) NULL,
[t_date] [datetime] NULL,
[t_orno] [int] NOT NULL,
[t_pono] [smallint] NOT NULL,
[t_sern] [smallint] NULL,
[t_suno] [varchar] (6) NULL,
[t_time] [int] NULL,
[t_user] [varchar] (12) NULL
)
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur703610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur703610] PRIMARY KEY CLUSTERED  ([t_orno], [t_pono])
GO
