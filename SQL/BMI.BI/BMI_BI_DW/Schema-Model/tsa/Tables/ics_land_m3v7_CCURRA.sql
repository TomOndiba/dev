CREATE TABLE [tsa].[ics_land_m3v7_CCURRA]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_m3v7_CCURRA_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_m3v7_CCURRA_IsDuplicate] DEFAULT ((0)),
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
[CULMTS] [decimal] (18, 0) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_m3v7_CCURRA_1] ON [tsa].[ics_land_m3v7_CCURRA] ([CUCONO], [CUCRTP], [CUCUCD], [CUCUTD], [CUDIVI])
GO
