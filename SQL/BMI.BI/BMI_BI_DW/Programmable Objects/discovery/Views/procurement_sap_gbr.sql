IF OBJECT_ID('[discovery].[procurement_sap_gbr]') IS NOT NULL
	DROP VIEW [discovery].[procurement_sap_gbr];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

--/****** Object:  View [discovery].[procurement_sap_gbr]    Script Date: 29/01/2018 14:56:49 ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO


create   view [discovery].[procurement_sap_gbr]
as
with cte
as
(
	select
		''																												  as 'Division'
	  , ekp.BUKRS																										  as [CompanyNumber]
	  , ''																												  as [Facility]
	  , be.WERKS																										  as [Warehouse]
	  , be.EBELN																										  as [PurchaseOrder]
	  , ek.BSART																										  [POType]
	  , ''																												  as [LowestStatus]
	  , ''																												  as [HighestStatus]
	  , ek.LIFNR																										  Supplier
	  , ek.WAERS																										  as [Currency]
	  , be.EBELP																										  as [PurchaseLine]
	  , be.MATNR																										  [Item]
	  , ekp.MENGE																										  [OrderedQty]
	  , case when be.BWART = 102 then be.MENGE * (-1) else be.MENGE end													  [ReceivedQuantity]
	  , ''																												  [ApprovedQty]
	  , ''																												  [RejectedQty]
	  , ''																												  [StoredQty]
	  , ekp.MEINS																										  [PurchaseOrderUnit]
	  , round(cast((ekp.NETWR / case when isnull(ekp.MENGE, 1) = 0 then 1 else isnull(ekp.MENGE, 1) end) as float), 0, 1) [PurchasePriceUnit]
	  , case when be.BWART = 102 then ekp.NETWR * (-1) else ekp.NETWR end												  [LineAmountOrderCurrency]
	  , max(et.EINDT)																									  as [RequestedDeliveryDate]
	  , ''																												  [ConfirmedDeliveryDate]
	  , ''																												  [PlanningDeliveryDate]
	  , ma.MEINS																										  as native_unit_of_measure
	  , um.unit_of_measure_code																							  as standard_unit_of_measure
	  , um.reporting_unit_of_measure_id																					  as ReportingunitOfMeasureCode
	  , ek.AEDAT																										  [ChangeDate]
	  , 'SAP GBR'																											  [DataSource]
	from
		psa.ics_stg_SAP_GBR_EKKO			   ek
	left outer join psa.ics_stg_SAP_GBR_EKBE   be
		on ek.EBELN = be.EBELN
	left outer join psa.ics_stg_SAP_GBR_EKPO   ekp
		on ekp.EBELN = be.EBELN
			and ekp.EBELP = be.EBELP
	left outer join psa.ics_stg_SAP_GBR_MARA   ma --- material master 
		on ma.MATNR = be.MATNR
	left outer join psa.ics_stg_SAP_GBR_EKET   et
		on et.EBELP = ekp.EBELP
			and et.EBELN = ekp.EBELN
	left outer join etl.unit_of_measure_lookup l
		on upper(ma.MEINS) = upper(l.native_key)
			and l.data_source_key = 100101
	left outer join dbo.unit_of_measure		   um
		on um.unit_of_measure_id = l.unit_of_measure_id
	where
		year(ek.AEDAT) >= '2017'
		and upper(isnull(ekp.LOEKZ, '-99')) <> 'L' --po filter
		and upper(isnull(be.BEWTP, '-99')) = 'E' --gr filter

	group by
		ekp.BUKRS
	  , be.WERKS
	  , be.EBELN
	  , ek.BSART
	  , be.EBELP
	  , be.MATNR
	  , ekp.MENGE
	  , case when be.BWART = 102 then be.MENGE * (-1) else be.MENGE end
	  , ekp.MEINS
	  , round(cast((ekp.NETWR / case when isnull(ekp.MENGE, 1) = 0 then 1 else isnull(ekp.MENGE, 1) end) as float), 0, 1)
	  , case when be.BWART = 102 then ekp.NETWR * (-1) else ekp.NETWR end
	  , ma.MEINS
	  , ek.AEDAT
	  , ek.LIFNR
	  , ek.WAERS
	  , um.unit_of_measure_code
	  , um.reporting_unit_of_measure_id
)
   , cte1
as
(
	select
		cte.*
	  , l.native_key ReportingunitOfMeasure
	from
		cte
	left outer join etl.unit_of_measure_lookup l
		on l.unit_of_measure_id = cte.ReportingunitOfMeasureCode
	inner join psa.ics_stg_SAP_GBR_MARM		   ma
		on ma.MATNR = cte.Item
			and ma.MEINH = l.native_key
	where
		l.data_source_key = 100101
)
select distinct


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
      ,[ChangeDate]
      , [DataSource]
	 , (select max(d.EtlCreatedOn) from psa.ics_stg_SAP_GBR_EKBE d) as DateDataExtracted


 from	cte1 ;



GO
