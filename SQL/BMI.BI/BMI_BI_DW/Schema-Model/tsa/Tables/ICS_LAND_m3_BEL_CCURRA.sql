CREATE TABLE [tsa].[ICS_LAND_m3_BEL_CCURRA]
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
[EtlSourceTable] [varchar] (200) NOT NULL
)
GO
