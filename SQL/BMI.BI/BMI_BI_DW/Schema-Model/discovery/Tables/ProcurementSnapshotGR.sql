CREATE TABLE [discovery].[ProcurementSnapshotGR]
(
[DateDataExtracted] [date] NULL,
[DataSource] [varchar] (50) NULL,
[DataSourceKey] [varchar] (10) NULL,
[Facility] [nvarchar] (30) NULL,
[PurchaseOrderNumber] [nvarchar] (30) NULL,
[GoodsReceivedDate] [nvarchar] (30) NULL,
[Supplier] [nvarchar] (11) NULL,
[Currency] [nvarchar] (40) NULL,
[PurchaseLine] [nvarchar] (30) NULL,
[ItemNumber] [nvarchar] (35) NULL,
[ItemDescription] [nvarchar] (50) NULL,
[Product_category_direct] [nvarchar] (255) NULL,
[product_category_level_1] [nvarchar] (255) NULL,
[product_category_level_2] [nvarchar] (255) NULL,
[product_category_level_3] [nvarchar] (255) NULL,
[product_category_level_4] [nvarchar] (255) NULL,
[product_category_level_5] [nvarchar] (255) NULL,
[ReceivedQuantity] [nvarchar] (30) NULL,
[GoodReceivedUnit] [nvarchar] (50) NULL,
[PricePerUnit] [nvarchar] (30) NULL,
[GoodsReceivedLineValueInLocalCurrency] [nvarchar] (30) NULL,
[StandardUnitofMeasure] [varchar] (10) NULL,
[ReportingUnitofMeasure] [nvarchar] (50) NULL,
[ReceivedQuantityConverted] [nvarchar] (30) NULL
)
GO
