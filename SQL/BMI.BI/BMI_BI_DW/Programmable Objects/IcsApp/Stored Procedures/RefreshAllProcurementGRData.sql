IF OBJECT_ID('[IcsApp].[RefreshAllProcurementGRData]') IS NOT NULL
	DROP PROCEDURE [IcsApp].[RefreshAllProcurementGRData];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


create     procedure [IcsApp].[RefreshAllProcurementGRData] @dummyPara int
as
	truncate table discovery.ProcurementSnapshotGR ;


insert into discovery.ProcurementSnapshotGR
(
[DateDataExtracted]
  , [DataSource]
  , [DataSourceKey]
  , [Facility]
  , [PurchaseOrderNumber]
  , GoodsReceivedDate
  , [Supplier]
  , [Currency]
  , [PurchaseLine]
  , [ItemNumber]
  ,[ItemDescription]
   , [Product_category_direct]
  , [product_category_level_1]
  , [product_category_level_2]
  , [product_category_level_3]
  , [product_category_level_4]
  , [product_category_level_5]
  , [ReceivedQuantity]
  , GoodReceivedUnit
  , [PricePerUnit]
  , GoodsReceivedLineValueInLocalCurrency
  , [StandardUnitofMeasure]
  , [ReportingUnitofMeasure]
  , ReceivedQuantityConverted
  )
select
	[DateDataExtracted]
  , [DataSource]
  , [DataSourceKey]
  , [Facility]
  , [PurchaseOrderNumber]
  , [GoodsReceivedDate]
  , [Supplier]
  , [Currency]
  , [PurchaseLine]
  , [ItemNumber]
  , [ItemDescription]

  , [product_category_direct]
  , [product_category_level_1]
  , [product_category_level_2]
  , [product_category_level_3]
  , [product_category_level_4]
  , [product_category_level_5]
  , [ReceivedQuantity]
  , [GoodReceivedUnit]
  , ''[PricePerUnit]
  ,[GoodsReceivedLineValueInLocalCurrency]
  , '' as [StandardUnitofMeasure]

  , [ReportingUnitOfMeasure]
  , [ReceivedQuantityConverted]
from
	[discovery].[procurement_snapshot_Baan_GR]
	

insert into discovery.ProcurementSnapshotGR
(
[DateDataExtracted]
  , [DataSource]
  , [DataSourceKey]
  , [Facility]
  , [PurchaseOrderNumber]
  , GoodsReceivedDate
  , [Supplier]
  , [Currency]
  , [PurchaseLine]
  , [ItemNumber]
  ,[ItemDescription]
  , [Product_category_direct]
  , [product_category_level_1]
  , [product_category_level_2]
  , [product_category_level_3]
  , [product_category_level_4]
  , [product_category_level_5]
  , [ReceivedQuantity]
  , GoodReceivedUnit
  , [PricePerUnit]
  , GoodsReceivedLineValueInLocalCurrency
  , [StandardUnitofMeasure]
  , [ReportingUnitofMeasure]
  , ReceivedQuantityConverted
  )
select
	[DateDataExtracted]
  , [DataSource]
  , [DataSourceKey]
  , [Facility]
  , [PurchaseOrder]
  , [GoodsReceivedDate]
  , [Supplier]
  , [Currency]
  , [PurchaseLine]
  , [Item]
  , [ItemDescription]
  , [product_category_direct]
  , [product_category_level_1]
  , [product_category_level_2]
  , [product_category_level_3]
  , [product_category_level_4]
  , [product_category_level_5]
  , [ReceivedQuantity]
  , [PurchaseOrderUnit]
  , ''[PricePerUnit]
  , [LineAmountOrderCurrency] [GoodsReceivedLineValueInLocalCurrency]
  , '' as [StandardUnitofMeasure]
  , [ReportingUnitOfMeasure]
  , [ReceivedQuantityConverted]
from
	[discovery].[procurement_snapshot_iScala_GR]
	

insert into discovery.ProcurementSnapshotGR
(
[DateDataExtracted]
  , [DataSource]
  , [DataSourceKey]
  , [Facility]
  , [PurchaseOrderNumber]
  , GoodsReceivedDate
  , [Supplier]
  , [Currency]
  , [PurchaseLine]
  , [ItemNumber]
  ,[ItemDescription]
  , [Product_category_direct]
  , [product_category_level_1]
  , [product_category_level_2]
  , [product_category_level_3]
  , [product_category_level_4]
  , [product_category_level_5]
  , [ReceivedQuantity]
  , GoodReceivedUnit
  , [PricePerUnit]
  , GoodsReceivedLineValueInLocalCurrency
  , [StandardUnitofMeasure]
  , [ReportingUnitofMeasure]
  , ReceivedQuantityConverted
  )
select
	[DateDataExtracted]
  , [DataSource]
  , [DataSourceKey]
  , [Facility]
  , [PurchaseOrder]
  , [GoodsReceiptDate]
  , [Supplier]
  , [Currency]
  , [PurchaseLine]
  , [Item]
  , [ItemDescription]
  , [product_category_direct]
  , [product_category_level_1]
  , [product_category_level_2]
  , [product_category_level_3]
  , [product_category_level_4]
  , [product_category_level_5]
  , [ReceivedQuantity]
  , [GoodsReceivedUnit]
  , [PricePerUnit]
  , [GoodsReceivedLineValueInLocalCurrency]
  , '' as [StandardUnitofMeasure]
  ,ReportingUnitofMeasure

  , [ReceivedQuantityConverted]
from
	[discovery].[procurement_sap_gbr_GR]
insert into discovery.ProcurementSnapshotGR
(
[DateDataExtracted]
  , [DataSource]
  , [DataSourceKey]
  , [Facility]
  , [PurchaseOrderNumber]
  , GoodsReceivedDate
  , [Supplier]
  , [Currency]
  , [PurchaseLine]
  , [ItemNumber]
  ,[ItemDescription]
  , [Product_category_direct]
  , [product_category_level_1]
  , [product_category_level_2]
  , [product_category_level_3]
  , [product_category_level_4]
  , [product_category_level_5]
  , [ReceivedQuantity]
  , GoodReceivedUnit
  , [PricePerUnit]
  , GoodsReceivedLineValueInLocalCurrency
  , [StandardUnitofMeasure]
  , [ReportingUnitofMeasure]
  , ReceivedQuantityConverted
  )
select
	[DateDataExtracted]
  , [DataSource]
  , [DataSourceKey]
  , [Facility]
  , [PurchaseOrderNo]
  , GoodReceivedDate
  , [Supplier]
  , [Currency]
  , [PurchaseLine]
  , [Item]
  , [ItemDescription]
  , [Product_category_direct]
  , [product_category_level_1]
  , [product_category_level_2]
  , [product_category_level_3]
  , [product_category_level_4]
  , [product_category_level_5]
  , [ReceivedQuantity]
  , [GoodsReceivedUnit]
  , [PricePerUnit]
  , [GoodReceivedLineValueInLocalCurrency]
  , [StandardUnitofMeasure]
  , [ReportingUnitofMeasure]
  , [ReceivedQtyConverted]
from
	[discovery].[procurement_snapshot_M3V7_GR] ;


	insert into discovery.ProcurementSnapshotGR
	(
	[DateDataExtracted]
  , [DataSource]
  , [DataSourceKey]
  , [Facility]
  , [PurchaseOrderNumber]
  , GoodsReceivedDate
  , [Supplier]
  , [Currency]
  , [PurchaseLine]
  , [ItemNumber]
  , [ItemDescription]
  , [Product_category_direct]
  , [product_category_level_1]
  , [product_category_level_2]
  , [product_category_level_3]
  , [product_category_level_4]
  , [product_category_level_5]
  , [ReceivedQuantity]
  , GoodReceivedUnit
  , [PricePerUnit]
  , GoodsReceivedLineValueInLocalCurrency
  , [StandardUnitofMeasure]
  , [ReportingUnitofMeasure]
  , ReceivedQuantityConverted
  )

select
	[DateDataExtracted]
  , [DataSource]
  , [DataSourceKey]
  , [Facility]
  , [PurchaseOrderNo]
  , GoodReceivedDate
  , [Supplier]
  , [Currency]
  , [PurchaseLine]
  , [Item]
  , [ItemDescription]
  , [Product_category_direct]
  , [product_category_level_1]
  , [product_category_level_2]
  , [product_category_level_3]
  , [product_category_level_4]
  , [product_category_level_5]
  , [ReceivedQuantity]
  , [GoodsReceivedUnit]
  , [PricePerUnit]
  , [GoodReceivedLineValueInLocalCurrency]
  , [StandardUnitofMeasure]
  , [ReportingUnitofMeasure]
  , [ReceivedQtyConverted]
from
	[discovery].[procurement_snapshot_M3V10_GR] ;

	

	insert into discovery.ProcurementSnapshotGR
	(
	[DateDataExtracted]
  , [DataSource]
  , [DataSourceKey]
  , [Facility]
  , [PurchaseOrderNumber]
  , GoodsReceivedDate
  , [Supplier]
  , [Currency]
  , [PurchaseLine]
  , [ItemNumber]
  , [ItemDescription]
  , [Product_category_direct]
  , [product_category_level_1]
  , [product_category_level_2]
  , [product_category_level_3]
  , [product_category_level_4]
  , [product_category_level_5]
  , [ReceivedQuantity]
  , GoodReceivedUnit
  , [PricePerUnit]
  , GoodsReceivedLineValueInLocalCurrency
  , [StandardUnitofMeasure]
  , [ReportingUnitofMeasure]
  , ReceivedQuantityConverted
  )
select
	[DateDataExtracted]
  , [DataSource]
  , [DataSourceKey]
  , [Facility]
  , [PurchaseOrderNo]
  , GoodReceivedDate
  , [Supplier]
  , [Currency]
  , [PurchaseLine]
  , [Item]
  , [ItemDescription]
  , [Product_category_direct]
  , [product_category_level_1]
  , [product_category_level_2]
  , [product_category_level_3]
  , [product_category_level_4]
  , [product_category_level_5]
  , [ReceivedQuantity]
  , [GoodsReceivedUnit]
  , [PricePerUnit]
  , [GoodReceivedLineValueInLocalCurrency]
  , [StandardUnitofMeasure]
  , [ReportingUnitofMeasure]
  , [ReceivedQtyConverted]
from
	[discovery].[procurement_snapshot_M3_GR] ;


	insert into discovery.ProcurementSnapshotGR
	(
	[DateDataExtracted]
  , [DataSource]
  , [DataSourceKey]
  , [Facility]
  , [PurchaseOrderNumber]
  , GoodsReceivedDate
  , [Supplier]
  , [Currency]
  , [PurchaseLine]
  , [ItemNumber]
  , [ItemDescription]
  , [Product_category_direct]
  , [product_category_level_1]
  , [product_category_level_2]
  , [product_category_level_3]
  , [product_category_level_4]
  , [product_category_level_5]
  , [ReceivedQuantity]
  , GoodReceivedUnit
  , [PricePerUnit]
  , GoodsReceivedLineValueInLocalCurrency
  , [StandardUnitofMeasure]
  , [ReportingUnitofMeasure]
  , ReceivedQuantityConverted)

select
	[DateDataExtracted]
  , [DataSource]
  , [DataSourceKey]
  , [Facility]
  , [PurchaseOrderNumber]
  , GoodsReceivedDate
  , [Supplier]
  , [Currency]
  , [PurchaseLine]
  , [ItemNumber]
  , [ItemDescription]
  , [product_category_direct]
  , [product_category_level_1]
  , [product_category_level_2]
  , [product_category_level_3]
  , [product_category_level_4]
  , [product_category_level_5]
  , [ReceivedQuantity]
  , GoodReceivedUnit
  , [PricePerUnit]
  , GoodsReceivedLineValueInLocalCurrency
  , [StandardUnitOfMeasure]
  , [ReportingUnitOfMeasure]
  , ReceivedQuantityConverted
  from [discovery].[procurement_snapshot_est_IBS_GR];

  

	insert into discovery.ProcurementSnapshotGR
	(
	[DateDataExtracted]
  , [DataSource]
  , [DataSourceKey]
  , [Facility]
  , [PurchaseOrderNumber]
  , GoodsReceivedDate
  , [Supplier]
  , [Currency]
  , [PurchaseLine]
  , [ItemNumber]
  , [ItemDescription]
  , [Product_category_direct]
  , [product_category_level_1]
  , [product_category_level_2]
  , [product_category_level_3]
  , [product_category_level_4]
  , [product_category_level_5]
  , [ReceivedQuantity]
  , GoodReceivedUnit
  , [PricePerUnit]
  , GoodsReceivedLineValueInLocalCurrency
  , [StandardUnitofMeasure]
  , [ReportingUnitofMeasure]
  , ReceivedQuantityConverted)

select
	[DateDataExtracted]
  , [DataSource]
  , [DataSourceKey]
  , [Facility]
  , [PurchaseOrderNumber]
  , GoodsReceivedDate
  , [Supplier]
  , [Currency]
  , [PurchaseLine]
  , [ItemNumber]
  , [ItemDescription]
  , [product_category_direct]
  , [product_category_level_1]
  , [product_category_level_2]
  , [product_category_level_3]
  , [product_category_level_4]
  , [product_category_level_5]
  , [ReceivedQuantity]
  , GoodReceivedUnit
  , [PricePerUnit]
  , GoodsReceivedLineValueInLocalCurrency
  , StandardUnitOfMeasure
  , [ReportingUnitOfMeasure]
  , ReceivedQuantityConverted
  from [discovery].[procurement_snapshot_lat_IBS_GR];



	insert into discovery.ProcurementSnapshotGR
	(
	[DateDataExtracted]
  , [DataSource]
  , [DataSourceKey]
  , [Facility]
  , [PurchaseOrderNumber]
  , GoodsReceivedDate
  , [Supplier]
  , [Currency]
  , [PurchaseLine]
  , [ItemNumber]
  , [ItemDescription]
  , [Product_category_direct]
  , [product_category_level_1]
  , [product_category_level_2]
  , [product_category_level_3]
  , [product_category_level_4]
  , [product_category_level_5]
  , [ReceivedQuantity]
  , GoodReceivedUnit
  , [PricePerUnit]
  , GoodsReceivedLineValueInLocalCurrency
  , [StandardUnitofMeasure]
  , [ReportingUnitofMeasure]
  , ReceivedQuantityConverted)

select
	[DateDataExtracted]
  , [DataSource]
  , [DataSourceKey]
  , [Facility]
  , [PurchaseOrderNumber]
  , GoodsReceivedDate
  , [Supplier]
  , [Currency]
  , [PurchaseLine]
  , [ItemNumber]
  , [ItemDescription]
  , [product_category_direct]
  , [product_category_level_1]
  , [product_category_level_2]
  , [product_category_level_3]
  , [product_category_level_4]
  , [product_category_level_5]
  , [ReceivedQuantity]
  , GoodReceivedUnit
  , [PricePerUnit]
  , GoodsReceivedLineValueInLocalCurrency
  ,StandardUnitOfMeasure

  , [ReportingUnitOfMeasure]
  , ReceivedQuantityConverted
  from [discovery].[procurement_snapshot_lit_IBS_GR];

	insert into discovery.ProcurementSnapshotGR
	(
	[DateDataExtracted]
  , [DataSource]
  , [DataSourceKey]
  , [Facility]
  , [PurchaseOrderNumber]
  , GoodsReceivedDate
  , [Supplier]
  , [Currency]
  , [PurchaseLine]
  , [ItemNumber]
  , [ItemDescription]
  , [Product_category_direct]
  , [product_category_level_1]
  , [product_category_level_2]
  , [product_category_level_3]
  , [product_category_level_4]
  , [product_category_level_5]
  , [ReceivedQuantity]
  , GoodReceivedUnit
  , [PricePerUnit]
  , GoodsReceivedLineValueInLocalCurrency
  , [StandardUnitofMeasure]
  , [ReportingUnitofMeasure]
  , ReceivedQuantityConverted)

select
	[DateDataExtracted]
  , [DataSource]
  , [DataSourceKey]
  , [Facility]
  , [PurchaseOrderNumber]
  , GoodsReceivedDate
  , [Supplier]
  , [Currency]
  , [PurchaseLine]
  , [ItemNumber]
  , [ItemDescription]
  , [product_category_direct]
  , [product_category_level_1]
  , [product_category_level_2]
  , [product_category_level_3]
  , [product_category_level_4]
  , [product_category_level_5]
  , [ReceivedQuantity]
  , GoodReceivedUnit
  , [PricePerUnit]
  , GoodsReceivedLineValueInLocalCurrency
  ,StandardUnitOfMeasure
  
  , [ReportingUnitOfMeasure]
  , ReceivedQuantityConverted
  from [discovery].[procurement_snapshot_fin_IBS_GR];
GO
