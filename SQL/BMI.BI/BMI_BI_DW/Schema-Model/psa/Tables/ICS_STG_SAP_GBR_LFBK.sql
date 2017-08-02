CREATE TABLE [psa].[ICS_STG_SAP_GBR_LFBK]
(
[EtlBatchRunId] [int] NULL,
[EtlStepRunId] [int] NULL,
[EtlThreadRunId] [int] NULL,
[DataSourceKey] [int] NULL,
[EtlCreatedOn] [datetime] NULL,
[EtlCreatedBy] [varchar] (200) NULL,
[MANDT] [nvarchar] (3) NULL,
[LIFNR] [nvarchar] (10) NULL,
[BANKS] [nvarchar] (3) NULL,
[BANKL] [nvarchar] (15) NULL,
[BANKN] [nvarchar] (18) NULL,
[BKONT] [nvarchar] (2) NULL,
[BVTYP] [nvarchar] (4) NULL,
[XEZER] [nvarchar] (1) NULL,
[BKREF] [nvarchar] (20) NULL,
[KOINH] [nvarchar] (60) NULL,
[EBPP_ACCNAME] [nvarchar] (40) NULL,
[EBPP_BVSTATUS] [nvarchar] (1) NULL,
[KOVON] [datetime] NULL,
[KOBIS] [datetime] NULL,
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
