CREATE TABLE [psa].[ICS_STG_m3v7_fra_ccurra]
(
[EtlBatchRunId] [int] NULL,
[EtlStepRunId] [int] NULL,
[EtlThreadRunId] [int] NULL,
[DataSourceKey] [int] NULL,
[EtlCreatedOn] [datetime2] NULL,
[EtlCreatedBy] [varchar] (200) NULL,
[CUCONO] [decimal] (3, 0) NULL,
[CUDIVI] [nvarchar] (255) NULL,
[CUGLOC] [nvarchar] (255) NULL,
[CUCUCD] [nvarchar] (255) NULL,
[CUCRTP] [decimal] (2, 0) NULL,
[CUCUTD] [decimal] (8, 0) NULL,
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
[CULMTS] [decimal] (18, 0) NULL,
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
