CREATE TABLE [stg].[SSIS_LAND_BUDGET_2017_Sales]
(
[RecordId] [int] NOT NULL IDENTITY(1, 1),
[MonthCode] [char] (3) NOT NULL,
[RowHeader] [nvarchar] (500) NULL,
[InstallationServices_10000] [nvarchar] (500) NULL,
[ProducedGoods_10100] [nvarchar] (500) NULL,
[GroupGoods_10200] [nvarchar] (500) NULL,
[CommercialGoods_10300] [nvarchar] (500) NULL,
[ExternalSales_11890] [nvarchar] (500) NULL,
[IC_Transf_SBU_11000] [nvarchar] (500) NULL,
[IC_Transf_Region_11100] [nvarchar] (500) NULL,
[IC_Transf_Abroad_11200] [nvarchar] (500) NULL,
[IC_Transf_US_11300] [nvarchar] (500) NULL,
[Total_IC_Sales] [nvarchar] (500) NULL,
[TotalSalesAndTransfers_11990] [nvarchar] (500) NULL
)
GO
