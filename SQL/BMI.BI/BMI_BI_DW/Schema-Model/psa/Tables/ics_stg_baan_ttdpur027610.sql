CREATE TABLE [psa].[ics_stg_baan_ttdpur027610]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_baan_ttdpur027610_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_baan_ttdpur027610_IsIncomplete] DEFAULT ('N'),
[t_Refcntd] [int] NULL,
[t_Refcntu] [int] NULL,
[t_ccos] [varchar] (3) NULL,
[t_cplp] [varchar] (3) NOT NULL,
[t_inta] [tinyint] NULL,
[t_suno] [varchar] (6) NOT NULL
)
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur027610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur027610] PRIMARY KEY CLUSTERED  ([t_cplp], [t_suno])
GO
