CREATE TABLE [psa].[ics_stg_M3V10ved_POL_MSYTXL]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_ved_MSYTXL_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_ved_MSYTXL_IsIncomplete] DEFAULT ('N'),
[TLCONO] [numeric] (18, 0) NOT NULL,
[TLDIVI] [nchar] (3) NOT NULL,
[TLLINO] [numeric] (18, 0) NOT NULL,
[TLLMTS] [numeric] (18, 0) NULL,
[TLLNCD] [nchar] (2) NOT NULL,
[TLTX60] [nvarchar] (60) NULL,
[TLTXID] [numeric] (18, 0) NOT NULL,
[TLTXVR] [nchar] (10) NOT NULL
)
GO
ALTER TABLE [psa].[ics_stg_M3V10ved_POL_MSYTXL] ADD CONSTRAINT [PK_psa_ics_stg_M3V10ved_POL_MSYTXL] PRIMARY KEY CLUSTERED  ([TLCONO], [TLDIVI], [TLLINO], [TLLNCD], [TLTXID], [TLTXVR])
GO
