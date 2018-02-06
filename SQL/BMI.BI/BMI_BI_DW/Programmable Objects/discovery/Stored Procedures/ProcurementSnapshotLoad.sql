IF OBJECT_ID('[discovery].[ProcurementSnapshotLoad]') IS NOT NULL
	DROP PROCEDURE [discovery].[ProcurementSnapshotLoad];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

create    procedure [discovery].[ProcurementSnapshotLoad]
@dummy int  
as


truncate table discovery.ProcurementSnapshot
insert into discovery.ProcurementSnapshot
(
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
  , EntryDate
  , ChangeDate
  , DataSource
  , DataSourceKey
  , DateDataExtracted
)

select 
  [Division]
      ,[CompanyNumber]
      ,[Facility]
      ,[Warehouse]
      ,[PurchaseOrder]
      ,[POType]
      ,[LowestStatus]
      ,[HighestStatus]
      ,[Supplier]
      ,[Currency]
      ,[PurchaseLine]
      ,[Item]
      ,[OrderedQty]
      ,[ReceivedQuantity]
      ,[ApprovedQty]
      ,[RejectedQty]
      ,[StoredQty]
      ,[PurchaseOrderUnit]
      ,[PurchasePriceUnit]
      ,[LineAmountOrderCurrency]
      ,[RequestedDeliveryDate]
      ,[ConfirmedDeliveryDate]
      ,[PlanningDeliveryDate]
      ,[StandardUnitofMeasure]
      ,[StandardUnitofQty]
      ,[ReportingUnitofMeasure]
      ,[ReportingUnitofQty]
      ,[product_category_direct]
      ,[product_category_level_1]
      ,[product_category_level_2]
      ,[product_category_level_3]
      ,[product_category_level_4]
      ,[product_category_level_5]
      ,[EntryDate]
      ,[ChangeDate]
      ,[DataSource]
      ,[DataSourceKey]
      ,[DateDataExtracted]
  from [discovery].[procurement_snapshot_M3V10_POL]

insert into discovery.ProcurementSnapshot
(
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
  , EntryDate
  , ChangeDate
  , DataSource
  , DataSourceKey
  , DateDataExtracted
)

select 
  [Division]
      ,[CompanyNumber]
      ,[Facility]
      ,[Warehouse]
      ,[PurchaseOrder]
      ,[POType]
      ,[LowestStatus]
      ,[HighestStatus]
      ,[Supplier]
      ,[Currency]
      ,[PurchaseLine]
      ,[Item]
      ,[OrderedQty]
      ,[ReceivedQuantity]
      ,[ApprovedQty]
      ,[RejectedQty]
      ,[StoredQty]
      ,[PurchaseOrderUnit]
      ,[PurchasePriceUnit]
      ,[LineAmountOrderCurrency]
      ,[RequestedDeliveryDate]
      ,[ConfirmedDeliveryDate]
      ,[PlanningDeliveryDate]
      ,[StandardUnitofMeasure]
      ,[StandardUnitofQty]
      ,[ReportingUnitofMeasure]
      ,[ReportingUnitofQty]
      ,[product_category_direct]
      ,[product_category_level_1]
      ,[product_category_level_2]
      ,[product_category_level_3]
      ,[product_category_level_4]
      ,[product_category_level_5]
      ,[EntryDate]
      ,[ChangeDate]
      ,[DataSource]
      ,[DataSourceKey]
      ,[DateDataExtracted]
  from [discovery].[procurement_sap_gbr]


insert into discovery.ProcurementSnapshot
(
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
  , EntryDate
  , ChangeDate
  , DataSource
  , DataSourceKey
  , DateDataExtracted
)

select 
  [Division]
      ,[CompanyNumber]
      ,[Facility]
      ,[Warehouse]
      ,[PurchaseOrder]
      ,[POType]
      ,[LowestStatus]
      ,[HighestStatus]
      ,[Supplier]
      ,[Currency]
      ,[PurchaseLine]
      ,[Item]
      ,[OrderedQty]
      ,[ReceivedQuantity]
      ,[ApprovedQty]
      ,[RejectedQty]
      ,[StoredQty]
      ,[PurchaseOrderUnit]
      ,[PurchasePriceUnit]
      ,[LineAmountOrderCurrency]
      ,[RequestedDeliveryDate]
      ,[ConfirmedDeliveryDate]
      ,[PlanningDeliveryDate]
      ,[StandardUnitofMeasure]
      ,[StandardUnitofQty]
      ,[ReportingUnitofMeasure]
      ,[ReportingUnitofQty]
      ,[product_category_direct]
      ,[product_category_level_1]
      ,[product_category_level_2]
      ,[product_category_level_3]
      ,[product_category_level_4]
      ,[product_category_level_5]
      ,[EntryDate]
      ,[ChangeDate]
      ,[DataSource]
      ,[DataSourceKey]
      ,[DateDataExtracted]
  from [discovery].[procurement_snapshot_M3]

  
insert into discovery.ProcurementSnapshot
(
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
  , EntryDate
  , ChangeDate
  , DataSource
  , DataSourceKey
  , DateDataExtracted
)


select 
  [Division]
      ,[CompanyNumber]
      ,[Facility]
      ,[Warehouse]
      ,[PurchaseOrder]
      ,[POType]
      ,[LowestStatus]
      ,[HighestStatus]
      ,[Supplier]
      ,[Currency]
      ,[PurchaseLine]
      ,[Item]
      ,[OrderedQty]
      ,[ReceivedQuantity]
      ,[ApprovedQty]
      ,[RejectedQty]
      ,[StoredQty]
      ,[PurchaseOrderUnit]
      ,[PurchasePriceUnit]
      ,[LineAmountOrderCurrency]
      ,[RequestedDeliveryDate]
      ,[ConfirmedDeliveryDate]
      ,[PlanningDeliveryDate]
      ,[StandardUnitofMeasure]
      ,[StandardUnitofQty]
      ,[ReportingUnitofMeasure]
      ,[ReportingUnitofQty]
      ,[product_category_direct]
      ,[product_category_level_1]
      ,[product_category_level_2]
      ,[product_category_level_3]
      ,[product_category_level_4]
      ,[product_category_level_5]
      ,[EntryDate]
      ,[ChangeDate]
      ,[DataSource]
      ,[DataSourceKey]
      ,[DateDataExtracted]
  from [discovery].[procurement_snapshot_M3V7]
GO
