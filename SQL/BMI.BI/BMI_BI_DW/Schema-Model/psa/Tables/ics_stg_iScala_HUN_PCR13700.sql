CREATE TABLE [psa].[ics_stg_iScala_HUN_PCR13700]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_iScala_HUN_PCR13700_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_iScala_HUN_PCR13700_IsIncomplete] DEFAULT ('N'),
[PCR1001] [nvarchar] (10) NOT NULL,
[PCR1002] [nvarchar] (35) NULL,
[PCR1003] [nvarchar] (6) NULL,
[PCR1004] [datetime] NULL,
[PCR1005] [datetime] NULL,
[PCR1006] [nvarchar] (6) NULL,
[PCR1007] [nvarchar] (1) NULL,
[PCR1008] [nvarchar] (8) NULL,
[PCR1009] [datetime] NULL,
[PCR1010] [datetime] NULL,
[PCR1011] [nvarchar] (1) NULL,
[PCR1012] [nvarchar] (6) NULL
)
GO
ALTER TABLE [psa].[ics_stg_iScala_HUN_PCR13700] ADD CONSTRAINT [PK_psa_ics_stg_iScala_HUN_PCR13700] PRIMARY KEY CLUSTERED  ([PCR1001])
GO
