CREATE TABLE [psa].[ICS_STG_m3_BEL_MITAUN]
(
[EtlBatchRunId] [int] NULL,
[EtlStepRunId] [int] NULL,
[EtlThreadRunId] [int] NULL,
[DataSourceKey] [int] NULL,
[EtlCreatedOn] [datetime2] NULL,
[EtlCreatedBy] [varchar] (200) NULL,
[MUCONO] [decimal] (3, 0) NULL,
[MUITNO] [nvarchar] (255) NULL,
[MUAUTP] [decimal] (1, 0) NULL,
[MUALUN] [nvarchar] (255) NULL,
[MUDCCD] [decimal] (1, 0) NULL,
[MUCOFA] [decimal] (15, 9) NULL,
[MUDMCF] [decimal] (1, 0) NULL,
[MUPCOF] [decimal] (15, 9) NULL,
[MUAUS1] [decimal] (1, 0) NULL,
[MUAUS2] [decimal] (1, 0) NULL,
[MUAUS3] [decimal] (1, 0) NULL,
[MUAUS4] [decimal] (1, 0) NULL,
[MUAUS5] [decimal] (1, 0) NULL,
[MUAUS6] [decimal] (1, 0) NULL,
[MUAUS9] [decimal] (1, 0) NULL,
[MUUNMU] [decimal] (15, 6) NULL,
[MUFMID] [nvarchar] (255) NULL,
[MURESI] [nvarchar] (255) NULL,
[MUTXID] [decimal] (13, 0) NULL,
[MURGDT] [decimal] (8, 0) NULL,
[MURGTM] [decimal] (6, 0) NULL,
[MULMDT] [decimal] (8, 0) NULL,
[MUCHNO] [decimal] (3, 0) NULL,
[MUCHID] [nvarchar] (255) NULL,
[MULMTS] [decimal] (18, 0) NULL,
[MUPACT] [nvarchar] (255) NULL,
[MUAUSC] [decimal] (1, 0) NULL,
[MUAUSB] [decimal] (1, 0) NULL,
[MUCUEX] [nvarchar] (255) NULL,
[MULGUN] [decimal] (1, 0) NULL,
[EtlRecordId] [bigint] NOT NULL,
[IsIncomplete] [char] (1) NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NOT NULL,
[EtlDeletedBy] [varchar] (200) NOT NULL,
[IsDeleted] [char] (1) NOT NULL
)
GO
