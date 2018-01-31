IF OBJECT_ID('[discovery].[procurement_snapshot]') IS NOT NULL
	DROP VIEW [discovery].[procurement_snapshot];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE view [discovery].[procurement_snapshot]

 as 


select [Division]
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
	  , Item
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
      ,[ChangeDate]
      ,[DataSource]
	  --,DateDataExtracted
  from [discovery].[procurement_snapshot_M3]
union

select [Division]
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
	  ,Item
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
      ,[ChangeDate]
      ,[DataSource]
	  --,DateDataExtracted
	  from
[discovery].[procurement_snapshot_M3V10_POL]
union

select [Division]
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
	  ,Item
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
      ,[ChangeDate]
      ,[DataSource]
	  --,DateDataExtracted
	  from
[discovery].[procurement_snapshot_M3V7]
GO
