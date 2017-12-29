CREATE TABLE [psa].[ics_stg_baan_ttdpur302610]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_baan_ttdpur302610_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_baan_ttdpur302610_IsIncomplete] DEFAULT ('N'),
[t_Refcntd] [int] NULL,
[t_Refcntu] [int] NULL,
[t_cono] [int] NOT NULL,
[t_ddta] [datetime] NOT NULL,
[t_orno] [int] NULL,
[t_pono] [smallint] NOT NULL,
[t_posi] [smallint] NULL,
[t_quan] [float] NULL
)
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur302610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur302610] PRIMARY KEY CLUSTERED  ([t_cono], [t_ddta], [t_pono])
GO
