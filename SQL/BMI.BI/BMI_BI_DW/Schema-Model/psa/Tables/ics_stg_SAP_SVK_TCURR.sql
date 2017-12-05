CREATE TABLE [psa].[ics_stg_SAP_SVK_TCURR]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_SVK_TCURR_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_SAP_SVK_TCURR_IsIncomplete] DEFAULT ('N'),
[FCURR] [nvarchar] (5) NOT NULL,
[FFACT] [decimal] (9, 0) NULL,
[GDATU] [nvarchar] (8) NOT NULL,
[KURST] [nvarchar] (4) NOT NULL,
[MANDT] [nvarchar] (3) NOT NULL,
[TCURR] [nvarchar] (5) NOT NULL,
[TFACT] [decimal] (9, 0) NULL,
[UKURS] [decimal] (9, 5) NULL
)
GO
ALTER TABLE [psa].[ics_stg_SAP_SVK_TCURR] ADD CONSTRAINT [PK_psa_ics_stg_SAP_SVK_TCURR] PRIMARY KEY CLUSTERED  ([GDATU], [TCURR], [FCURR], [KURST], [MANDT])
GO
