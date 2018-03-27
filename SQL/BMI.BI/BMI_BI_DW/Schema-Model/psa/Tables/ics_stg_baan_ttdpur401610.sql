CREATE TABLE [psa].[ics_stg_baan_ttdpur401610]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_baan_ttdpur401610_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_baan_ttdpur401610_IsIncomplete] DEFAULT ('N'),
[t_Refcntd] [int] NULL,
[t_Refcntu] [int] NULL,
[t_clot] [varchar] (16) NULL,
[t_cntr] [varchar] (3) NULL,
[t_cprj] [varchar] (6) NULL,
[t_dino] [varchar] (10) NOT NULL,
[t_item] [varchar] (16) NULL,
[t_orno] [int] NOT NULL,
[t_pono] [smallint] NOT NULL,
[t_qstc] [float] NULL,
[t_qstr] [float] NULL,
[t_sera] [tinyint] NOT NULL,
[t_serb] [int] NOT NULL,
[t_suno] [varchar] (6) NOT NULL
)
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur401610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur401610] PRIMARY KEY CLUSTERED  ([t_dino], [t_orno], [t_pono], [t_sera], [t_serb], [t_suno])
GO
EXEC sp_addextendedproperty N'IncludeInMerge', N'Y', 'SCHEMA', N'psa', 'TABLE', N'ics_stg_baan_ttdpur401610', NULL, NULL
GO
