CREATE TABLE [stg].[SSIS_STG_BUDGET_2017_Sales]
(
[NativeBusinessUnit] [nvarchar] (200) NOT NULL,
[NativeMonthCode] [char] (3) NOT NULL,
[NativeRegionName] [nvarchar] (200) NOT NULL,
[BusinessUnitKey] [int] NOT NULL,
[DateKey] [int] NOT NULL,
[InstallationServices_10000] [decimal] (38, 16) NULL,
[ProducedGoods_10100] [decimal] (38, 16) NULL,
[GroupGoods_10200] [decimal] (38, 16) NULL,
[CommercialGoods_10300] [decimal] (38, 16) NULL,
[ExternalSales_11890] [decimal] (38, 16) NULL,
[IC_Transf_SBU_11000] [decimal] (38, 16) NULL,
[IC_Transf_Region_11100] [decimal] (38, 16) NULL,
[IC_Transf_Abroad_11200] [decimal] (38, 16) NULL,
[IC_Transf_US_11300] [decimal] (38, 16) NULL,
[Total_IC_Sales] [decimal] (38, 16) NULL,
[TotalSalesAndTransfers_11990] [decimal] (38, 16) NULL
)
GO
ALTER TABLE [stg].[SSIS_STG_BUDGET_2017_Sales] ADD CONSTRAINT [PK_stg_SSIS_STG_BUDGET_2017_Sales] PRIMARY KEY CLUSTERED  ([NativeBusinessUnit], [NativeMonthCode])
GO
