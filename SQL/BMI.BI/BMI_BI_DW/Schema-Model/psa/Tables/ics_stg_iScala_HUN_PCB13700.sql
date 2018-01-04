CREATE TABLE [psa].[ics_stg_iScala_HUN_PCB13700]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_iScala_HUN_PCB13700_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_iScala_HUN_PCB13700_IsIncomplete] DEFAULT ('N'),
[PCB1001] [nchar] (38) NOT NULL,
[PCB1002] [nvarchar] (35) NULL,
[PCB1003] [int] NULL,
[PCB1004] [int] NULL,
[PCB1005] [nchar] (10) NULL,
[PCB1006] [nvarchar] (35) NULL,
[PCB1007] [numeric] (28, 8) NULL
)
GO
ALTER TABLE [psa].[ics_stg_iScala_HUN_PCB13700] ADD CONSTRAINT [PK_psa_ics_stg_iScala_HUN_PCB13700] PRIMARY KEY CLUSTERED  ([PCB1001])
GO
