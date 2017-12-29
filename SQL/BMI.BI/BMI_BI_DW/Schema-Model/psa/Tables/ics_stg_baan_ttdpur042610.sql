CREATE TABLE [psa].[ics_stg_baan_ttdpur042610]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_baan_ttdpur042610_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_baan_ttdpur042610_IsIncomplete] DEFAULT ('N'),
[t_Refcntd] [int] NULL,
[t_Refcntu] [int] NULL,
[t_cadr] [varchar] (6) NULL,
[t_ccty] [varchar] (3) NULL,
[t_ckor] [tinyint] NOT NULL,
[t_geoc_l] [varchar] (10) NULL,
[t_nama] [varchar] (35) NULL,
[t_namb] [varchar] (30) NULL,
[t_namc] [varchar] (30) NULL,
[t_namd] [varchar] (30) NULL,
[t_name] [varchar] (30) NULL,
[t_namf] [varchar] (30) NULL,
[t_orno] [int] NOT NULL,
[t_pono] [smallint] NOT NULL,
[t_pstc] [varchar] (10) NULL
)
GO
ALTER TABLE [psa].[ics_stg_baan_ttdpur042610] ADD CONSTRAINT [PK_psa_ics_stg_baan_ttdpur042610] PRIMARY KEY CLUSTERED  ([t_ckor], [t_orno], [t_pono])
GO
