CREATE TABLE [psa].[ics_stg_baan_ttdpur400610]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_baan_ttdpur400610_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_baan_ttdpur400610_IsIncomplete] DEFAULT ('N'),
[t_Refcntd] [int] NULL,
[t_Refcntu] [int] NULL,
[t_bqua] [float] NULL,
[t_date] [datetime] NULL,
[t_dino] [varchar] (10) NOT NULL,
[t_diqu] [float] NULL,
[t_oqua] [float] NULL,
[t_orno] [int] NOT NULL,
[t_pono] [smallint] NOT NULL,
[t_suno] [varchar] (6) NOT NULL,
[t_text] [int] NULL
)
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur400610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur400610] PRIMARY KEY CLUSTERED  ([t_dino], [t_orno], [t_pono], [t_suno])
GO
EXEC sp_addextendedproperty N'IncludeInMerge', N'Y', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_baan_ttdpur400610', NULL, NULL
GO
