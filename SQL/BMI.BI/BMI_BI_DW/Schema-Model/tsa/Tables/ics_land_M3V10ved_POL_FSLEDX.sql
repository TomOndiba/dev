CREATE TABLE [tsa].[ics_land_M3V10ved_POL_FSLEDX]
(
[EtlBatchRunId] [int] NOT NULL,
[EtlStepRunId] [int] NOT NULL,
[EtlThreadRunId] [int] NOT NULL,
[DataSourceKey] [int] NOT NULL,
[EtlSourceTable] [varchar] (200) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[ExcludeFromMerge] [bit] NOT NULL CONSTRAINT [DF__ics_land___Exclu__4E546D01] DEFAULT ((0)),
[IsDuplicate] [bit] NOT NULL CONSTRAINT [DF__ics_land___IsDup__4F48913A] DEFAULT ((0)),
[ESCHID] [nchar] (10) NULL,
[ESCHNO] [numeric] (18, 0) NULL,
[ESCONO] [numeric] (18, 0) NULL,
[ESDIVI] [nchar] (3) NULL,
[ESJRNO] [numeric] (18, 0) NULL,
[ESJSNO] [numeric] (18, 0) NULL,
[ESLMDT] [numeric] (18, 0) NULL,
[ESLMTS] [numeric] (18, 0) NULL,
[ESRGDT] [numeric] (18, 0) NULL,
[ESRGTM] [numeric] (18, 0) NULL,
[ESSEXI] [nvarchar] (45) NULL,
[ESSEXN] [numeric] (18, 0) NULL,
[ESSEXS] [numeric] (18, 0) NULL,
[ESTXID] [numeric] (18, 0) NULL,
[ESYEA4] [numeric] (18, 0) NULL
)
GO
CREATE CLUSTERED INDEX [IndClust_tsa_ics_land_M3V10ved_POL_FSLEDX_1] ON [tsa].[ics_land_M3V10ved_POL_FSLEDX] ([ESCONO], [ESDIVI], [ESJRNO], [ESJSNO], [ESSEXI], [ESSEXN], [ESSEXS], [ESYEA4])
GO