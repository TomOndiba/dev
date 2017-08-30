CREATE TABLE [psa].[ics_stg_movex_CCURRA]
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
[IsDeleted] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_movex_CCURRA_IsDeleted] DEFAULT ('N'),
[IsIncomplete] [char] (1) NOT NULL CONSTRAINT [DF_psa_ics_stg_movex_CCURRA_IsIncomplete] DEFAULT ('N'),
[CUCONO] [decimal] (18, 0) NOT NULL,
[CUDIVI] [nvarchar] (255) NOT NULL,
[CUGLOC] [nvarchar] (255) NULL,
[CUCUCD] [nvarchar] (255) NOT NULL,
[CUCRTP] [decimal] (18, 0) NOT NULL,
[CUCUTD] [decimal] (18, 0) NOT NULL,
[CUARAT] [decimal] (11, 6) NULL,
[CUTXID] [decimal] (13, 0) NULL,
[CULOCD] [nvarchar] (255) NULL,
[CUDMCU] [decimal] (1, 0) NULL,
[CURAFA] [decimal] (1, 0) NULL,
[CURGDT] [decimal] (8, 0) NULL,
[CURGTM] [decimal] (6, 0) NULL,
[CULMDT] [decimal] (8, 0) NULL,
[CUCHNO] [decimal] (3, 0) NULL,
[CUCHID] [nvarchar] (255) NULL,
[CULMTS] [decimal] (18, 0) NULL
)
GO
ALTER TABLE [psa].[ics_stg_movex_CCURRA] ADD CONSTRAINT [PK_stg_movex_CCURRA] PRIMARY KEY CLUSTERED  ([CUCONO], [CUCRTP], [CUCUCD], [CUCUTD], [CUDIVI])
GO
