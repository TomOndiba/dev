CREATE TABLE [psa].[ics_stg_baan_ttdpur333610]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_baan_ttdpur333610_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_baan_ttdpur333610_IsIncomplete] DEFAULT ('N'),
[t_Refcntd] [int] NULL,
[t_Refcntu] [int] NULL,
[t_cdis] [varchar] (3) NULL,
[t_cono] [int] NOT NULL,
[t_damt] [float] NULL,
[t_dile] [tinyint] NOT NULL,
[t_disc] [real] NULL,
[t_pono] [smallint] NOT NULL,
[t_qanp] [float] NOT NULL,
[t_stdt] [datetime] NOT NULL,
[t_tdat] [datetime] NULL
)
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur333610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur333610] PRIMARY KEY CLUSTERED  ([t_cono], [t_dile], [t_pono], [t_qanp], [t_stdt])
GO
