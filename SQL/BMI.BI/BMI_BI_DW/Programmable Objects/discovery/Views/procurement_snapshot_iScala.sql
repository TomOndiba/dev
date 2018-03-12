IF OBJECT_ID('[discovery].[procurement_snapshot_iScala]') IS NOT NULL
	DROP VIEW [discovery].[procurement_snapshot_iScala];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




create view 
 [discovery].[procurement_snapshot_iScala]

--select count(*) from [discovery].[procurement_snapshot_Baan]
as
select
	''									  as [Division]
  , '37'									  [CompanyNumber]
  , ''									  [Facility]
  , PC01023								  [Warehouse]
  , PC01001								  [PurchaseOrder]
  , PC01002								  [POType]
  , ''									  [LowestStatus]
  , ''									  [HighestStatus]
  , PC01003								  [Supplier]
  , case
		when (cast(PC01022 as int) = 0)
			then 'HUF'
		when (cast(PC01022 as int) = 1)
			then 'DEM'
		when (cast(PC01022 as int) = 2)
			then 'ATS'
		when (cast(PC01022 as int) = 3)
			then 'ITL'
		when (cast(PC01022 as int) = 4)
			then 'USD'
		when (cast(PC01022 as int) = 5)
			then 'FRF'
		when (cast(PC01022 as int) = 6)
			then 'EUR'
		when (cast(PC01022 as int) = 7)
			then 'CHF'
		when (cast(PC01022 as int) = 8)
			then 'GBP'
		when (cast(PC01022 as int) = 9)
			then 'DKK'
		when (cast(PC01022 as int) = 10)
			then 'PLN'
		when (cast(PC01022 as int) = 11)
			then 'NOK'
		when (cast(PC01022 as int) = 12)
			then 'RON'
		when (cast(PC01022 as int) = 13)
			then 'SEK'
	end									  [Currency]
  , PC03002								  [PurchaseLine]
  , PC03005								  [Item]
  , PC03006								  [ItemDescription]
  , ''									  [ConversionRate]
  , ''									  [alternative]
  , PC03010								  [OrderedQty]
  , ''									  [OrderedQtyConverted]
  , PC03011								  [ReceivedQuantity]
  , ''									  [ReceivedQuantityConverted]
  , PC03012									  [ApprovedQty]
  , ''									  [ApprovedQtyConverted]
  , ''									  [RejectedQty]
  , ''									  [RejectedQtyConverted]
  , ''									  [StoredQty]
  , ''									  [StoredQtyConverted]
  , case
		when (PC03009 = '0000')
			then 'm2'
		when (PC03009 = '0001')
			then 'pcs'
		when (PC03009 = '0002')
			then 'kg'
		when (PC03009 = '0003')
			then 'm3'
		when (PC03009 = '0004')
			then 'm'
		when (PC03009 = '0005')
			then 'L'
		when (PC03009 = '0006')
			then 'can'
		when (PC03009 = '0007')
			then 'Packet'
		when (PC03009 = '0008')
			then 'rm'
		when (PC03009 = '0009')
			then 'HUF'
		when (PC03009 = '0010')
			then 'HUF'
		when (PC03009 = '0011')
			then 'HUf'
		when (PC03009 = '0012')
			then 'Tage'
		when (PC03009 = '0013')
			then 'HUF/Pers'
		when (PC03009 = '0014')
			then 'km'
		when (PC03009 = '0015')
			then 'Ton'
		when (PC03009 = '0016')
			then 'Roll'
		when (PC03009 = '0018')
			then 'carton'
		when (PC03009 = '0019')
			then 'HUF/pallet'
		when (PC03009 = '0020')
			then 'EUR/MONTH'
		when (PC03009 = '0021')
			then '€/H'
	end									  as [PurchaseOrderUnit]
  ,  case
		when (PC03009 = '0000')
			then 'm2'
		when (PC03009 = '0001')
			then 'pcs'
		when (PC03009 = '0002')
			then 'kg'
		when (PC03009 = '0003')
			then 'm3'
		when (PC03009 = '0004')
			then 'm'
		when (PC03009 = '0005')
			then 'L'
		when (PC03009 = '0006')
			then 'can'
		when (PC03009 = '0007')
			then 'Packet'
		when (PC03009 = '0008')
			then 'rm'
		when (PC03009 = '0009')
			then 'HUF'
		when (PC03009 = '0010')
			then 'HUF'
		when (PC03009 = '0011')
			then 'HUf'
		when (PC03009 = '0012')
			then 'Tage'
		when (PC03009 = '0013')
			then 'HUF/Pers'
		when (PC03009 = '0014')
			then 'km'
		when (PC03009 = '0015')
			then 'Ton'
		when (PC03009 = '0016')
			then 'Roll'
		when (PC03009 = '0018')
			then 'carton'
		when (PC03009 = '0019')
			then 'HUF/pallet'
		when (PC03009 = '0020')
			then 'EUR/MONTH'
		when (PC03009 = '0021')
			then '€/H'
	end									  as 							  [PurchasePriceUnit]
  , PC03056                             [LineAmountOrderCurrency]
  , PC03093								  [RequestedDeliveryDate]
  , PC03084								  [ConfirmedDeliveryDate]
  , PC03093                              [PlanningDeliveryDate]
  , ''									  [StandardUnitofMeasure]
  , ''									  [StandardUnitofQty]
  , ''									  ReportingUnitOfMeasure
  , ''									  [ReportingUnitofQty]
  , null								  as product_category_direct
  , cast(c.ProductHier1 as nvarchar(255)) as product_category_level_1
  , cast(c.ProductHier2 as nvarchar(255)) as product_category_level_2
  , cast(c.ProductHier3 as nvarchar(255)) as product_category_level_3
  , cast(c.ProductHier4 as nvarchar(255)) as product_category_level_4
  , cast(c.ProductHier5 as nvarchar(255)) as product_category_level_5
  , PC03017								  [EntryDate]
  , PC03016								  [ChangeDate]
  , 'iScala'							  [DataSource]
  , '100120'							  as DataSourceKey	---100142
  , (
		select	max(d.EtlCreatedOn) from psa.[ics_stg_iScala_HUN_PC013700] d
	)									  [DateDataExtracted]
from
	psa.[ics_stg_iScala_HUN_PC013700]		 h
left outer join psa.[ics_stg_iScala_HUN_PC033700]  l
	on h.PC01001 = l.PC03001
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
			and (pl.SYSTEM_ID + 100100) = 100120
)											 c
	on replace(ltrim(replace(rtrim(c.MATERIAL_CODE), '0', ' ')), ' ', '0') = replace(ltrim(replace(rtrim(PC03005), '0', ' ')), ' ', '0')
where
	year(PC03017) > 2016 ;
GO
