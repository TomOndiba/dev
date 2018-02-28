IF OBJECT_ID('[discovery].[procurement_snapshot_M3]') IS NOT NULL
	DROP VIEW [discovery].[procurement_snapshot_M3];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






create   view [discovery].[procurement_snapshot_M3]
as
select
	cast(h.IACONO as nvarchar(255))									as Division
  , cast(h.IADIVI as nvarchar(255))									as CompanyNumber
  , cast(h.IAFACI as nvarchar(255))									as Facility
  , cast(h.IAWHLO as nvarchar(255))									as Warehouse
  , cast(h.IAPUNO as nvarchar(255))									as PurchaseOrder
  , cast(h.IAORTY as nvarchar(255))									as POType
  , cast(h.IAPUSL as nvarchar(255))									as LowestStatus
  , cast(h.IAPUST as nvarchar(255))									as HighestStatus
  , cast(h.IASUNO as nvarchar(255))									as Supplier
  , cast(h.IACUCD as nvarchar(255))									as Currency
  , cast(l.IBPNLI as nvarchar(255))									as PurchaseLine
  , cast(l.IBITNO as nvarchar(255))									as Item
  , cast(MMITDS as nvarchar(255))									as ItemDescription
  , conversion														as ConversionRate
  , cc.alternative
  , cast(l.IBORQA as nvarchar(255))									as OrderedQty
  , cast(case
			 when upper(l.IBPUUN) in
				 ('M2', 'TN')
				 then l.IBORQA
			 else case
					  when (upper(alternative) = 'KG')
						  then ((l.IBORQA / conversion) / 1000)
					  when (upper(l.IBPUUN) = 'KG')
						  then (l.IBORQA / 1000)
					  else (l.IBORQA / conversion)
				  end
		 end as nvarchar(255))										as OrderedQtyConverted
  , cast(l.IBRVQA as nvarchar(255))									as ReceivedQuantity
  , cast(case
			 when upper(l.IBPUUN) in
				 ('M2', 'TN')
				 then l.IBRVQA
			 else case
					  when (upper(alternative) = 'KG')
						  then ((l.IBRVQA / conversion) / 1000)
					  when (upper(l.IBPUUN) = 'KG')
						  then (l.IBRVQA / 1000)
					  else (l.IBRVQA / conversion)
				  end
		 end as nvarchar(255))										as ReceivedQuantityConverted
  , cast(l.IBCAQA as nvarchar(255))									as ApprovedQty
  , cast(case
			 when upper(l.IBPUUN) in
				 ('M2', 'TN')
				 then l.IBCAQA
			 else case
					  when (upper(alternative) = 'KG')
						  then ((l.IBCAQA / conversion) / 1000)
					  when (upper(l.IBPUUN) = 'KG')
						  then (l.IBCAQA / 1000)
					  else (l.IBCAQA / conversion)
				  end
		 end as nvarchar(255))										as ApprovedQtyConverted
  , cast(l.IBRJQA as nvarchar(255))									as RejectedQty
  , cast(case
			 when upper(l.IBPUUN) in
				 ('M2', 'TN')
				 then l.IBRJQA
			 else case
					  when (upper(l.IBPUUN) = 'KG')
						  then (l.IBRJQA / 1000)
					  when (upper(alternative) = 'KG')
						  then ((l.IBRJQA / conversion) / 1000)
					  else (l.IBRJQA / conversion)
				  end
		 end as nvarchar(255))										as RejectedQtyConverted
  , cast(l.IBSDQA as nvarchar(255))									as StoredQty
  , cast(case
			 when upper(l.IBPUUN) in
				 ('M2', 'TN')
				 then l.IBSDQA
			 else case
					  when (upper(alternative) = 'KG')
						  then ((l.IBSDQA / conversion) / 1000)
					  when (upper(l.IBPUUN) = 'KG')
						  then (l.IBSDQA / 1000)
					  else (l.IBSDQA / conversion)
				  end
		 end as nvarchar(255))										as StoredQtyConverted
  , cast(l.IBPUUN as nvarchar(255))									as PurchaseOrderUnit
  , cast(l.IBPPUN as nvarchar(255))									as PurchasePriceUnit
  , cast(l.IBLNAM as nvarchar(255))									as LineAmountOrderCurrency
  , cast(l.IBDWDT as nvarchar(255))									as RequestedDeliveryDate
  , cast(l.IBCODT as nvarchar(255))									as ConfirmedDeliveryDate
  , cast(l.IBPLDT as nvarchar(255))									as PlanningDeliveryDate
  , cast(null as nvarchar(255))										as 'StandardUnitofMeasure'
  , cast(null as nvarchar(255))										as 'StandardUnitofQty'
  , cast( case
					   when l.IBPUUN = 'KG'
						   then 'TN'
					   when l.IBPUUN = 'TN'
						   then 'TN'
					   when l.IBPUUN = 'M2'
						   then 'M2'
					   else null
				   end
			   as nvarchar(255))									as 'ReportingUnitofMeasure'
  , cast(null as nvarchar(255))										as 'ReportingUnitofQty'
  , null															as product_category_direct
  , cast(c.ProductHier1 as nvarchar(255))							as product_category_level_1
  , cast(c.ProductHier2 as nvarchar(255))							as product_category_level_2
  , cast(c.ProductHier3 as nvarchar(255))							as product_category_level_3
  , cast(c.ProductHier4 as nvarchar(255))							as product_category_level_4
  , cast(c.ProductHier5 as nvarchar(255))							as product_category_level_5
  , h.IARGDT														as EntryDate
  , cast(l.IBLMDT as nvarchar(255))									as ChangeDate
  , case
		when cast(h.IADIVI as int) in
			(1, 2, 4, 5, 6, 7)
			then 'Sweden'
		when cast(h.IADIVI as int) in
			(30, 41, 45, 47, 55, 56, 58, 59, 999, 60)
			then 'Denmark'
		when cast(h.IADIVI as int) in
			(110, 112)
			then 'Czech Republic'
		when cast(h.IADIVI as int) in
			(140)
			then 'Belgium'
		when cast(h.IADIVI as int) in
			(910)
			then 'Norway'
	end									  as DataSource
  , h.DataSourceKey
  , (
		select	max(d.EtlCreatedOn) from psa.ics_stg_m3_MPHEAD d
	)																as DateDataExtracted
from
	psa.ics_stg_m3_MPHEAD				h ---Header
left outer join
(
	select
		c.IBPUNO
	  , c.IBPNLI
	  , c.IBITNO
	  , sum(c.IBORQA) IBORQA
	  , max(c.IBPUUN) IBPUUN
	  , sum(c.IBCAQA) IBCAQA
	  , sum(c.IBRVQA) IBRVQA
	  , sum(c.IBRJQA) IBRJQA
	  , sum(c.IBSDQA) IBSDQA
	  , sum(c.IBLNAM) IBLNAM
	  , max(c.IBPPUN) IBPPUN
	  , max(c.IBDWDT) IBDWDT
	  , max(c.IBCODT) IBCODT
	  , max(c.IBPLDT) IBPLDT
	  , max(IBPUST)	  IBPUST
	  , max(IBPUSL)	  IBPUSL
	  , max(IBLMDT)	  IBLMDT
	from
		psa.ics_stg_m3_MPLINE c
	group by
		c.IBPNLI
	  , c.IBITNO
	  , c.IBPUNO
)							l
	on ---line
h.IAPUNO = l.IBPUNO
left outer join
(
	select
		MATERIAL_CODE
	  , ProductHier1
	  , ProductHier2
	  , ProductHier3
	  , ProductHier4
	  , ProductHier5
	from
		tsa.PU_LINK_CATEGORY   pl
	inner join tsa.PU_CATEGORY c
		on c.CATEGORY_ID = pl.CATEGORY_ID
			and (pl.SYSTEM_ID + 100100) = 100102
)										c
	on replace(ltrim(replace(rtrim(c.MATERIAL_CODE), '0', ' ')), ' ', '0') = replace(ltrim(replace(rtrim(l.IBITNO), '0', ' ')), ' ', '0')
left outer join
(
	select
		A.MUITNO
	  , B.MMITDS
	  , A.MUALUN alternative
	  , A.MUCOFA conversion
	  , B.MMUNMS
	  , A.MUAUTP
	  , A.MUDMCF
	from
		psa.ics_stg_m3_MITAUN		A
	inner join psa.ics_stg_m3_MITMAS B
		on (A.MUITNO = B.MMITNO)
			and A.MUAUTP = 1
			and upper(A.MUALUN) in
					('KG', 'M2', 'TN')
)										cc
	on cc.MUITNO = l.IBITNO
		and cc.MMUNMS = cast(l.IBPUUN as nvarchar(255))
where
	year(cast(IARGDT as nvarchar(20))) > '2016'
	and ( ---po filter
			isnull(h.IAPUSL, '') not in
				('99')
			and isnull(h.IAPUST, '') not in
					('99')
			and isnull(l.IBPUST, '') <> '99'
			and isnull(l.IBPUSL, '') <> '99'
		)
	and cast(l.IBITNO as nvarchar(255))not in ---gr filter
		(
			select
				cast(i.F2PNLI as nvarchar(255))
			from
				psa.ics_stg_m3_FGRECL i
			where
				(
					i.F2RPQT = '0'
					and i.F2RPQA = '0'
					and i.F2IVQT = '0'
					and i.F2IVQA = '0'
				)
				and cast(i.F2PNLI as nvarchar(250)) = l.IBITNO
				and l.IBPUNO = cast(i.F2PUNO as nvarchar(250))
		) ;



GO
