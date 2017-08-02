CREATE TABLE [tsa].[ICS_LAND_m3_BEL_MILOMA]
(
[EtlBatchRunId] [int] NULL,
[EtlStepRunId] [int] NULL,
[EtlThreadRunId] [int] NULL,
[DataSourceKey] [int] NULL,
[EtlCreatedOn] [datetime2] NULL,
[EtlCreatedBy] [varchar] (200) NULL,
[LMCONO] [decimal] (3, 0) NULL,
[LMITNO] [nvarchar] (255) NULL,
[LMBANO] [nvarchar] (255) NULL,
[LMLOTY] [decimal] (1, 0) NULL,
[LMINRE] [decimal] (1, 0) NULL,
[LMALOC] [decimal] (1, 0) NULL,
[LMARLA] [nvarchar] (255) NULL,
[LMIDET] [nvarchar] (255) NULL,
[LMRORC] [decimal] (1, 0) NULL,
[LMRORN] [nvarchar] (255) NULL,
[LMRORL] [decimal] (6, 0) NULL,
[LMREPN] [decimal] (10, 0) NULL,
[LMSUNO] [nvarchar] (255) NULL,
[LMMFIT] [nvarchar] (255) NULL,
[LMMFSN] [nvarchar] (255) NULL,
[LMPROD] [nvarchar] (255) NULL,
[LMBREF] [nvarchar] (255) NULL,
[LMBRE2] [nvarchar] (255) NULL,
[LMOWNC] [nvarchar] (255) NULL,
[LMLPCY] [decimal] (5, 2) NULL,
[LMORCO] [nvarchar] (255) NULL,
[LMLOTC] [decimal] (17, 6) NULL,
[LMREDA] [decimal] (8, 0) NULL,
[LMQIAD] [decimal] (8, 0) NULL,
[LMMFDT] [decimal] (8, 0) NULL,
[LMEXPI] [decimal] (8, 0) NULL,
[LMCNDT] [decimal] (8, 0) NULL,
[LMSEDT] [decimal] (8, 0) NULL,
[LMRCLS] [decimal] (8, 0) NULL,
[LMLATD] [decimal] (8, 0) NULL,
[LMCFI3] [nvarchar] (255) NULL,
[LMCFJ0] [nvarchar] (255) NULL,
[LMCFI2] [decimal] (15, 2) NULL,
[LMECVE] [nvarchar] (255) NULL,
[LMFACI] [nvarchar] (255) NULL,
[LMAAGN] [nvarchar] (255) NULL,
[LMTXID] [decimal] (13, 0) NULL,
[LMATNR] [decimal] (17, 0) NULL,
[LMRGDT] [decimal] (8, 0) NULL,
[LMRGTM] [decimal] (6, 0) NULL,
[LMLMDT] [decimal] (8, 0) NULL,
[LMCHNO] [decimal] (3, 0) NULL,
[LMCHID] [nvarchar] (255) NULL,
[LMRORX] [decimal] (3, 0) NULL,
[LMLMTS] [decimal] (18, 0) NULL,
[LMLIRR] [decimal] (1, 0) NULL,
[LMBBDT] [decimal] (8, 0) NULL,
[LMHVDT] [decimal] (8, 0) NULL,
[LMHVIT] [nvarchar] (255) NULL,
[LMHVLT] [nvarchar] (255) NULL,
[LMTIHM] [decimal] (4, 0) NULL,
[LMCUEX] [nvarchar] (255) NULL,
[EtlSourceTable] [varchar] (200) NOT NULL
)
GO
