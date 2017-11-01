CREATE TABLE [tsa].[ics_land_M3V10ved_POL_CSYTXH]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF_tsa_land_ved_CSYTXH_ExcludeFromMerge] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF_tsa_land_ved_CSYTXH_IsDuplicate] DEFAULT ((0)),
[THCHID] [nchar] (10) NULL,
[THCHNO] [numeric] (3, 0) NULL,
[THCONO] [numeric] (3, 0) NULL,
[THDIVI] [nchar] (3) NULL,
[THFILE] [nchar] (10) NULL,
[THKFLD] [nvarchar] (30) NULL,
[THLMDT] [numeric] (8, 0) NULL,
[THLMTS] [numeric] (18, 0) NULL,
[THLNCD] [nchar] (2) NULL,
[THRGDT] [numeric] (8, 0) NULL,
[THRGTM] [numeric] (6, 0) NULL,
[THTX40] [nvarchar] (40) NULL,
[THTXCC] [nchar] (2) NULL,
[THTXEI] [numeric] (1, 0) NULL,
[THTXID] [numeric] (13, 0) NULL,
[THTXVR] [nchar] (10) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_CSYTXH_1] ON [tsa].[ics_land_M3V10ved_POL_CSYTXH] ([THCONO], [THDIVI], [THLNCD], [THTXID], [THTXVR])
GO
