CREATE TABLE [tsa].[ics_land_M3V10gen_POL_MSYTXL]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_gen_MSYTXL_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_ics_land_gen_MSYTXL_IsDuplicate] DEFAULT ((0)),
[TLCONO] [numeric] (3, 0) NULL,
[TLDIVI] [nchar] (3) NULL,
[TLLINO] [numeric] (3, 0) NULL,
[TLLMTS] [numeric] (18, 0) NULL,
[TLLNCD] [nchar] (2) NULL,
[TLTX60] [nvarchar] (60) NULL,
[TLTXID] [numeric] (13, 0) NULL,
[TLTXVR] [nchar] (10) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10gen_POL_MSYTXL_1] ON [tsa].[ics_land_M3V10gen_POL_MSYTXL] ([TLCONO], [TLDIVI], [TLLINO], [TLLNCD], [TLTXID], [TLTXVR])
GO
