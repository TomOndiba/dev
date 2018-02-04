IF OBJECT_ID('[discovery].[procurement_snapshot]') IS NOT NULL
	DROP VIEW [discovery].[procurement_snapshot];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




create      view 

[discovery].[procurement_snapshot]
as

select
	 Division
  , CompanyNumber 
  , Facility 
  , Warehouse 
  , PurchaseOrder 
  , POType 
  , LowestStatus 
  , HighestStatus
  , Supplier 
  , Currency 
  , PurchaseLine 
  , Item 
  , OrderedQty 
  , ReceivedQuantity 
  , ApprovedQty 
  , RejectedQty 
  , StoredQty 
  , PurchaseOrderUnit 
  , PurchasePriceUnit 
  , LineAmountOrderCurrency 
  , RequestedDeliveryDate 
  , ConfirmedDeliveryDate 
  , PlanningDeliveryDate 
  , StandardUnitofMeasure
  , StandardUnitofQty 
  , ReportingUnitofMeasure 
  , ReportingUnitofQty 
  , product_category_direct 
  , product_category_level_1 
  , product_category_level_2 
  , product_category_level_3 
  , product_category_level_4 
  , product_category_level_5 
   ,cast(EntryDate as nvarchar(25)) as EntryDate 
  ,  ChangeDate 
  ,  DataSource 
  ,  DataSourceKey 
  ,  DateDataExtracted 
from
	[discovery].[procurement_snapshot_M3]



union



select
	cast (Division as nvarchar(255)) Division
  , cast(CompanyNumber as nvarchar(255))CompanyNumber
  , cast(Facility as nvarchar(255)) Facility
  ,cast( Warehouse as nvarchar(255)) Warehouse
  , cast(PurchaseOrder as nvarchar(255)) PurchaseOrder
  , cast(POType as nvarchar(255)) POType
  , cast(LowestStatus as nvarchar(255)) LowestStatus
  , cast(HighestStatus as nvarchar(255)) HighestStatus
  , cast(Supplier as nvarchar(255)) Supplier
  , cast(Currency as nvarchar(255)) Currency
  , cast(PurchaseLine as nvarchar(255)) PurchaseLine
  , cast(Item as nvarchar(255))  Item
  , cast(OrderedQty as nvarchar(255)) OrderedQty
  , cast(ReceivedQuantity as nvarchar(255)) ReceivedQuantity
  , cast(ApprovedQty as nvarchar(255)) ApprovedQty
  , cast(RejectedQty as nvarchar(255)) RejectedQty
  , cast(StoredQty as nvarchar(255)) StoredQty
  , cast(PurchaseOrderUnit as nvarchar(255)) PurchaseOrderUnit
  , cast(PurchasePriceUnit as nvarchar(255)) PurchasePriceUnit
  , cast(LineAmountOrderCurrency as nvarchar(255)) LineAmountOrderCurrency
  , cast(RequestedDeliveryDate as nvarchar(255)) RequestedDeliveryDate
  , cast(ConfirmedDeliveryDate as nvarchar(255)) ConfirmedDeliveryDate
  , cast(PlanningDeliveryDate as nvarchar(255)) PlanningDeliveryDate
  , cast(StandardUnitofMeasure as nvarchar(255)) StandardUnitofMeasure
  , cast(StandardUnitofQty as nvarchar(255)) StandardUnitofQty
  , cast(ReportingUnitofMeasure as nvarchar(255)) ReportingUnitofMeasure
  , cast(ReportingUnitofQty as nvarchar(255)) ReportingUnitofQty
  , cast(product_category_direct as nvarchar(255)) product_category_direct
  , cast(product_category_level_1 as nvarchar(255)) product_category_level_1
  , cast(product_category_level_2 as nvarchar(255)) product_category_level_2
  , cast(product_category_level_3 as nvarchar(255)) product_category_level_3
  , cast(product_category_level_4 as nvarchar(255)) product_category_level_4
  , cast(product_category_level_5 as nvarchar(255)) product_category_level_5
  ,cast(EntryDate as nvarchar(25))
   , cast( ChangeDate as nvarchar(255)) as ChangeDate
  , cast( DataSource as nvarchar(255))DataSource
  , cast( DataSourceKey as nvarchar(255))DataSourceKey
  ,cast(  DateDataExtracted as nvarchar(255))DateDataExtracted

from
	[discovery].[procurement_snapshot_M3V10_POL]
union



select
	 Division
  , CompanyNumber 
  , Facility 
  , Warehouse 
  , PurchaseOrder 
  , POType 
  , LowestStatus 
  , HighestStatus
  , Supplier 
  , Currency 
  , PurchaseLine 
  , Item 
  , OrderedQty 
  , ReceivedQuantity 
  , ApprovedQty 
  , RejectedQty 
  , StoredQty 
  , PurchaseOrderUnit 
  , PurchasePriceUnit 
  , LineAmountOrderCurrency 
  , RequestedDeliveryDate 
  , ConfirmedDeliveryDate 
  , PlanningDeliveryDate 
  , StandardUnitofMeasure
  , StandardUnitofQty 
  , ReportingUnitofMeasure 
  , ReportingUnitofQty 
  , product_category_direct 
  , product_category_level_1 
  , product_category_level_2 
  , product_category_level_3 
  , product_category_level_4 
  , product_category_level_5 
   ,cast(EntryDate as nvarchar(25)) as EntryDate 
  ,  ChangeDate 
  ,  DataSource 
  ,  DataSourceKey 
  ,  DateDataExtracted 

from
	[discovery].[procurement_snapshot_M3V7] 


	union




select
	cast (Division as nvarchar(255)) Division
  , cast(CompanyNumber as nvarchar(255))CompanyNumber
  , cast(Facility as nvarchar(255)) Facility
  ,cast( Warehouse as nvarchar(255)) Warehouse
  , cast(PurchaseOrder as nvarchar(255)) PurchaseOrder
  , cast(POType as nvarchar(255)) POType
  , cast(LowestStatus as nvarchar(255)) LowestStatus
  , cast(HighestStatus as nvarchar(255)) HighestStatus
  , cast(Supplier as nvarchar(255)) Supplier
  , cast(Currency as nvarchar(255)) Currency
  , cast(PurchaseLine as nvarchar(255)) PurchaseLine
  , cast(Item as nvarchar(255))  Item
  , cast(OrderedQty as nvarchar(255)) OrderedQty
  , cast(ReceivedQuantity as nvarchar(255)) ReceivedQuantity
  , cast(ApprovedQty as nvarchar(255)) ApprovedQty
  , cast(RejectedQty as nvarchar(255)) RejectedQty
  , cast(StoredQty as nvarchar(255)) StoredQty
  , cast(PurchaseOrderUnit as nvarchar(255)) PurchaseOrderUnit
  , cast(PurchasePriceUnit as nvarchar(255)) PurchasePriceUnit
  , cast(LineAmountOrderCurrency as nvarchar(255)) LineAmountOrderCurrency
  , cast(RequestedDeliveryDate as nvarchar(255)) RequestedDeliveryDate
  , cast(ConfirmedDeliveryDate as nvarchar(255)) ConfirmedDeliveryDate
  , cast(PlanningDeliveryDate as nvarchar(255)) PlanningDeliveryDate
  , cast(StandardUnitofMeasure as nvarchar(255)) StandardUnitofMeasure
  , cast(StandardUnitofQty as nvarchar(255)) StandardUnitofQty
  , cast(ReportingUnitofMeasure as nvarchar(255)) ReportingUnitofMeasure
  , cast(ReportingUnitofQty as nvarchar(255)) ReportingUnitofQty
  , cast(product_category_direct as nvarchar(255)) product_category_direct
  , cast(product_category_level_1 as nvarchar(255)) product_category_level_1
  , cast(product_category_level_2 as nvarchar(255)) product_category_level_2
  , cast(product_category_level_3 as nvarchar(255)) product_category_level_3
  , cast(product_category_level_4 as nvarchar(255)) product_category_level_4
  , cast(product_category_level_5 as nvarchar(255)) product_category_level_5
  ,cast(EntryDate as nvarchar(25))
  , cast( ChangeDate as nvarchar(255)) as ChangeDate
  , cast( DataSource as nvarchar(255))DataSource
  , cast( DataSourceKey as nvarchar(255))DataSourceKey
  ,cast(  DateDataExtracted as nvarchar(255))DateDataExtracted
from
	[discovery].[procurement_sap_gbr]

GO
