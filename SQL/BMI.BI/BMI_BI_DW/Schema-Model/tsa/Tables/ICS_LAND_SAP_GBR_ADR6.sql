CREATE TABLE [tsa].[ICS_LAND_SAP_GBR_ADR6]
(
[EtlBatchRunId] [int] NULL,
[EtlStepRunId] [int] NULL,
[EtlThreadRunId] [int] NULL,
[DataSourceKey] [int] NULL,
[EtlCreatedOn] [datetime] NULL,
[EtlCreatedBy] [varchar] (200) NULL,
[CLIENT] [nvarchar] (3) NULL,
[ADDRNUMBER] [nvarchar] (10) NULL,
[PERSNUMBER] [nvarchar] (10) NULL,
[DATE_FROM] [nvarchar] (20) NULL,
[CONSNUMBER] [nvarchar] (3) NULL,
[FLGDEFAULT] [nvarchar] (1) NULL,
[FLG_NOUSE] [nvarchar] (1) NULL,
[HOME_FLAG] [nvarchar] (1) NULL,
[SMTP_ADDR] [nvarchar] (241) NULL,
[SMTP_SRCH] [nvarchar] (20) NULL,
[DFT_RECEIV] [nvarchar] (1) NULL,
[R3_USER] [nvarchar] (1) NULL,
[ENCODE] [nvarchar] (1) NULL,
[TNEF] [nvarchar] (1) NULL,
[VALID_FROM] [nvarchar] (14) NULL,
[VALID_TO] [nvarchar] (14) NULL,
[EtlSourceTable] [varchar] (200) NOT NULL
)
GO
