IF OBJECT_ID('[discovery].[procurement_snapshot_M3]') IS NOT NULL
	DROP VIEW [discovery].[procurement_snapshot_M3];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO









create       view [discovery].[procurement_snapshot_M3]
as
select

l.IBPUST,
			l.IBPUSL,

	cast (h.IACONO as nvarchar(255))				   as Division
  , cast(h.IADIVI	as nvarchar(255))			   as CompanyNumber
  , cast(h.IAFACI	 as nvarchar(255))			   as Facility
  ,cast( h.IAWHLO	as	nvarchar(255))		   as Warehouse
  , cast(h.IAPUNO	 as nvarchar(255))			   as PurchaseOrder
  , cast(h.IAORTY	as nvarchar(255))			   as POType
  , cast(h.IAPUSL	as nvarchar(255))			   as LowestStatus
  , cast(h.IAPUST	as nvarchar(255))			   as HighestStatus
  , cast(h.IASUNO	as nvarchar(255))			   as Supplier
  , cast(h.IACUCD as nvarchar(255))				   as Currency
  , cast(l.IBPNLI as nvarchar(255))				   as PurchaseLine
  , cast(l.IBITNO 	as nvarchar(255))			   as Item
  , cast(l.IBORQA	as nvarchar(255))			   as OrderedQty
  , cast(l.IBRVQA		as		  nvarchar(255)) as ReceivedQuantity
  , cast(l.IBCAQA			as	   nvarchar(255)) as ApprovedQty
  , cast(l.IBRJQA			as	   nvarchar(255)) as RejectedQty
  , cast(l.IBSDQA			as	   nvarchar(255)) as StoredQty
  , cast(l.IBPUUN			as	   nvarchar(255)) as PurchaseOrderUnit
  , cast(l.IBPPUN			as	   nvarchar(255)) as PurchasePriceUnit
  , cast(l.IBLNAM			as	   nvarchar(255)) as LineAmountOrderCurrency
  , cast(l.IBDWDT			as	   nvarchar(255)) as RequestedDeliveryDate
  , cast(l.IBCODT			as	   nvarchar(255)) as ConfirmedDeliveryDate
  , cast(l.IBPLDT			as	   nvarchar(255)) as PlanningDeliveryDate
  , cast(null				as nvarchar(255))	   as 'StandardUnitofMeasure'
  , cast(null					as   nvarchar(255))as 'StandardUnitofQty'
  , cast(null					  as nvarchar(255))as 'ReportingUnitofMeasure'
  , cast(null					  as nvarchar(255)) as 'ReportingUnitofQty'
  , cast(p.ProductCategoryBaseLevel as nvarchar(255)) as product_category_direct
  , cast(p.ProductCategoryLevel1	as nvarchar(255))  as product_category_level_1
  , cast(p.ProductCategoryLevel2	as nvarchar(255))   as product_category_level_2
  , cast(p.ProductCategoryLevel3	 as nvarchar(255))  as product_category_level_3
  , cast(p.ProductCategoryLevel4	 as nvarchar(255))  as product_category_level_4
  , cast( p.ProductCategoryLevel5 as	nvarchar(255))   as product_category_level_5



     ,h.IARGDT   as EntryDate
  , cast (l.IBLMDT as nvarchar(255))				   as ChangeDate
  ,   'M3'  			   as DataSource   
  ,h.DataSourceKey
  , (
		select	max(d.EtlCreatedOn) from psa.ics_stg_m3_MPHEAD d
	)						   as DateDataExtracted
from
	psa.ics_stg_m3_MPHEAD				h ---Header
left outer join psa.ics_stg_m3_MPLINE l
	on ---line
h.IAPUNO = l.IBPUNO
left outer join qvstg.Product			p
	--on ltrim(rtrim(l.IBITNO)) = ltrim(rtrim(p.NativeProductKey))
	 on replace(ltrim(replace(rtrim(l.IBITNO),'0',' ')),' ','0') = replace(ltrim(replace(rtrim(p.NativeProductKey),'0',' ')),' ','0')
		and p.DataSourceKey = '100102'
where
	year(cast(IARGDT as nvarchar(20))) > '2016'
	and ( ---po filter
			isnull(h.IAPUSL,'')  not in ( '99')
			and isnull(	h.IAPUST,'')  not in ( '99')
			and	isnull(l.IBPUST,'') <> '99'
			and	isnull(l.IBPUSL,'')  <> '99'
		)


	and cast(l.IBITNO as nvarchar(255) ) not in ---gr filter
		(
			select
		cast(		i.F2PNLI as nvarchar(255))
			from
				psa.ics_stg_m3_FGRECL i
			where
				(
					i.F2RPQT = '0'
					and	i.F2RPQA = '0'
					and	i.F2IVQT = '0'
					and i.F2IVQA = '0'
				)
				and 
				cast(i.F2PNLI as nvarchar(250)) = l.IBITNO
				and l.IBPUNO = cast(i.F2PUNO as nvarchar(250))
		) ;
GO
