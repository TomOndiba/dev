IF OBJECT_ID('[discovery].[procurement_snapshot_M3V10_POL]') IS NOT NULL
	DROP VIEW [discovery].[procurement_snapshot_M3V10_POL];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





create   view [discovery].[procurement_snapshot_M3V10_POL]
as
select
	h.IACONO				   as Division
  , h.IADIVI				   as CompanyNumber
  , h.IAFACI				   as Facility
  , h.IAWHLO				   as Warehouse
  , h.IAPUNO				   as PurchaseOrder
  , h.IAORTY				   as POType
  , h.IAPUSL				   as LowestStatus
  , h.IAPUST				   as HighestStatus
  , h.IASUNO				   as Supplier
  , h.IACUCD				   as Currency
  , l.IBPNLI				   as PurchaseLine
  , l.IBITNO				   as Item
  , l.IBORQA				   as OrderedQty
  , l.IBRVQA				   as ReceivedQuantity
  , l.IBCAQA				   as ApprovedQty
  , l.IBRJQA				   as RejectedQty
  , l.IBSDQA				   as StoredQty
  , l.IBPUUN				   as PurchaseOrderUnit
  , l.IBPPUN				   as PurchasePriceUnit
  , l.IBLNAM				   as LineAmountOrderCurrency
  , l.IBDWDT				   as RequestedDeliveryDate
  , l.IBCODT				   as ConfirmedDeliveryDate
  , l.IBPLDT				   as PlanningDeliveryDate
  , null					   as 'StandardUnitofMeasure'
  , null					   as 'StandardUnitofQty'
  , null					   as 'ReportingUnitofMeasure'
  , null					   as 'ReportingUnitofQty'
  , p.ProductCategoryBaseLevel as product_category_direct
  , p.ProductCategoryLevel1	   as product_category_level_1
  , p.ProductCategoryLevel2	   as product_category_level_2
  , p.ProductCategoryLevel3	   as product_category_level_3
  , p.ProductCategoryLevel4	   as product_category_level_4
  , p.ProductCategoryLevel5	   as product_category_level_5
    ,h.IARGDT  as EntryDate
  , l.IBLMDT				   as ChangeDate
  , 'Vil Poland M3V10'			   as DataSource
  ,h.DataSourceKey
  , (
		select	max(d.EtlCreatedOn) from psa.ics_stg_M3V10vil_POL_MPHEAD d
	)						   as DateDataExtracted
from
	psa.ics_stg_M3V10vil_POL_MPHEAD				h ---Header
left outer join psa.ics_stg_M3V10vil_POL_MPLINE l
	on ---line
h.IAPUNO = l.IBPUNO
left outer join qvstg.Product			p
	--on   rtrim(ltrim(l.IBITNO)) = rtrim(ltrim(p.NativeProductKey))
	on  replace(ltrim(replace(rtrim(l.IBITNO),'0',' ')),' ','0') = replace(ltrim(replace(p.NativeProductKey,'0',' ')),' ','0')
		and p.DataSourceKey = 100141
where
	year(cast(IARGDT as nvarchar(20))) > '2016'
	and ( ---po filter
			h.IAPUSL <> '99'
			and	h.IAPUST <> '99'
			and	l.IBPUST <> '99'
			and	l.IBPUSL <> '99'
		)
	and l.IBITNO not in ---gr filter
		(
			select
				i.F2PNLI
			from
				psa.ics_stg_M3V10vil_POL_FGRECL i
			where
				(
					i.F2RPQT = '0'
					and	i.F2RPQA = '0'
					and	i.F2IVQT = '0'
					and	i.F2IVQA = '0'
				)
				and cast(i.F2PNLI as nvarchar(250)) = l.IBITNO
				and l.IBPUNO = cast(i.F2PUNO as nvarchar(250))
		) 


		union 



		select
	h.IACONO				   as Division
  , h.IADIVI				   as CompanyNumber
  , h.IAFACI				   as Facility
  , h.IAWHLO				   as Warehouse
  , h.IAPUNO				   as PurchaseOrder
  , h.IAORTY				   as POType
  , h.IAPUSL				   as LowestStatus
  , h.IAPUST				   as HighestStatus
  , h.IASUNO				   as Supplier
  , h.IACUCD				   as Currency
  , l.IBPNLI				   as PurchaseLine
  , l.IBITNO				   as Item
  , l.IBORQA				   as OrderedQty
  , l.IBRVQA				   as ReceivedQuantity
  , l.IBCAQA				   as ApprovedQty
  , l.IBRJQA				   as RejectedQty
  , l.IBSDQA				   as StoredQty
  , l.IBPUUN				   as PurchaseOrderUnit
  , l.IBPPUN				   as PurchasePriceUnit
  , l.IBLNAM				   as LineAmountOrderCurrency
  , l.IBDWDT				   as RequestedDeliveryDate
  , l.IBCODT				   as ConfirmedDeliveryDate
  , l.IBPLDT				   as PlanningDeliveryDate
  , null					   as 'StandardUnitofMeasure'
  , null					   as 'StandardUnitofQty'
  , null					   as 'ReportingUnitofMeasure'
  , null					   as 'ReportingUnitofQty'
  , p.ProductCategoryBaseLevel as product_category_direct
  , p.ProductCategoryLevel1	   as product_category_level_1
  , p.ProductCategoryLevel2	   as product_category_level_2
  , p.ProductCategoryLevel3	   as product_category_level_3
  , p.ProductCategoryLevel4	   as product_category_level_4
  , p.ProductCategoryLevel5	   as product_category_level_5
     ,h.IARGDT  as EntryDate
  , l.IBLMDT				   as ChangeDate
  , 'Ved Poland M3V10'			   as DataSource
  ,h.DataSourceKey
  , (
		select	max(d.EtlCreatedOn) from psa.ics_stg_M3V10ved_POL_MPHEAD d
	)						   as DateDataExtracted
from
	psa.ics_stg_M3V10ved_POL_MPHEAD				h ---Header
left outer join psa.ics_stg_M3V10ved_POL_MPLINE l
	on ---line
h.IAPUNO = l.IBPUNO
left outer join qvstg.Product			p
	--on   rtrim(ltrim(l.IBITNO)) = rtrim(ltrim(p.NativeProductKey))
	on  replace(ltrim(replace(rtrim(l.IBITNO),'0',' ')),' ','0') = replace(ltrim(replace(p.NativeProductKey,'0',' ')),' ','0')
		and p.DataSourceKey = 100140
where
	year(cast(IARGDT as nvarchar(20))) > '2016'
	and ( ---po filter
			h.IAPUSL <> '99'
			and	h.IAPUST <> '99'
			and	l.IBPUST <> '99'
			and	l.IBPUSL <> '99'
		)
	and l.IBITNO not in ---gr filter
		(
			select
				i.F2PNLI
			from
				psa.ics_stg_M3V10ved_POL_FGRECL i
			where
				(
					i.F2RPQT = '0'
					and	i.F2RPQA = '0'
					and	i.F2IVQT = '0'
					and	i.F2IVQA = '0'
				)
				and cast(i.F2PNLI as nvarchar(250)) = l.IBITNO
				and l.IBPUNO = cast(i.F2PUNO as nvarchar(250))
		) 


		union 

select
	h.IACONO				   as Division
  , h.IADIVI				   as CompanyNumber
  , h.IAFACI				   as Facility
  , h.IAWHLO				   as Warehouse
  , h.IAPUNO				   as PurchaseOrder
  , h.IAORTY				   as POType
  , h.IAPUSL				   as LowestStatus
  , h.IAPUST				   as HighestStatus
  , h.IASUNO				   as Supplier
  , h.IACUCD				   as Currency
  , l.IBPNLI				   as PurchaseLine
  , l.IBITNO				   as Item
  , l.IBORQA				   as OrderedQty
  , l.IBRVQA				   as ReceivedQuantity
  , l.IBCAQA				   as ApprovedQty
  , l.IBRJQA				   as RejectedQty
  , l.IBSDQA				   as StoredQty
  , l.IBPUUN				   as PurchaseOrderUnit
  , l.IBPPUN				   as PurchasePriceUnit
  , l.IBLNAM				   as LineAmountOrderCurrency
  , l.IBDWDT				   as RequestedDeliveryDate
  , l.IBCODT				   as ConfirmedDeliveryDate
  , l.IBPLDT				   as PlanningDeliveryDate
  , null					   as 'StandardUnitofMeasure'
  , null					   as 'StandardUnitofQty'
  , null					   as 'ReportingUnitofMeasure'
  , null					   as 'ReportingUnitofQty'
  , p.ProductCategoryBaseLevel as product_category_direct
  , p.ProductCategoryLevel1	   as product_category_level_1
  , p.ProductCategoryLevel2	   as product_category_level_2
  , p.ProductCategoryLevel3	   as product_category_level_3
  , p.ProductCategoryLevel4	   as product_category_level_4
  , p.ProductCategoryLevel5	   as product_category_level_5
     ,h.IARGDT  as EntryDate
  , l.IBLMDT				   as ChangeDate
  , 'Gen Poland M3V10'		   as DataSource
  , h.DataSourceKey
  , (
		select	max(d.EtlCreatedOn) from psa.ics_stg_M3V10gen_POL_MPHEAD d
	)						   as DateDataExtracted
from
	psa.ics_stg_M3V10gen_POL_MPHEAD				h ---Header
left outer join psa.ics_stg_M3V10gen_POL_MPLINE l
	on ---line
h.IAPUNO = l.IBPUNO
left outer join qvstg.Product					p
	--on rtrim(ltrim(l.IBITNO)) = rtrim(ltrim(p.NativeProductKey))
	on  replace(ltrim(replace(rtrim(l.IBITNO),'0',' ')),' ','0') = replace(ltrim(replace(p.NativeProductKey,'0',' ')),' ','0')
		and p.DataSourceKey = 100113
where
	year(cast(IARGDT as nvarchar(20))) > '2016'
	and ( ---po filter
			h.IAPUSL <> '99'
			and	h.IAPUST <> '99'
			and	l.IBPUST <> '99'
			and	l.IBPUSL <> '99'
		)
	and l.IBITNO not in ---gr filter
		(
			select
				i.F2PNLI
			from
				psa.ics_stg_M3V10gen_POL_FGRECL i
			where
				(
					i.F2RPQT = '0'
					and	i.F2RPQA = '0'
					and	i.F2IVQT = '0'
					and	i.F2IVQA = '0'
				)
				and cast(i.F2PNLI as nvarchar(250)) = l.IBITNO
				and l.IBPUNO = cast(i.F2PUNO as nvarchar(250))
		) ;


GO
