IF OBJECT_ID('[discovery].[procurement_snapshot_Baan]') IS NOT NULL
	DROP VIEW [discovery].[procurement_snapshot_Baan];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

create   view [discovery].[procurement_snapshot_Baan]
as

select 
'' as [Division]
  ,po.t_comp [CompanyNumber]
  , ''[Facility]
  , po.t_cwar[Warehouse]
  , g.t_orno[PurchaseOrder]
  , ''[POType]
  , ''[LowestStatus]
  , ''[HighestStatus]
  , po.t_suno[Supplier]
  , po.t_ccur[Currency]
  , pl.t_pono[PurchaseLine]
  , pl.t_item [Item]
  --, [ItemDescription]
    --, [ConversionRate]
  --, [alternative]
  , pl.t_oqua [OrderedQty]
  --, [OrderedQtyConverted]
  ,g.t_dqua [ReceivedQuantity]
  --, [ReceivedQuantityConverted]
  , g.t_quap[ApprovedQty]
  --, [ApprovedQtyConverted]
  ,g.t_quad [RejectedQty]
  --, [RejectedQtyConverted]
  ,'' [StoredQty]
  ,'' [StoredQtyConverted]
  , pl.t_cuqp [PurchaseOrderUnit]
  , pl.t_cupp [PurchasePriceUnit]
  , po.t_ccur[LineAmountOrderCurrency]
  , pl.t_ddta [RequestedDeliveryDate]
  , pl.t_ddtc[ConfirmedDeliveryDate]
  , pl.t_ddtb[PlanningDeliveryDate]
  , '' [StandardUnitofMeasure]
  , ''[StandardUnitofQty]
  ,pl.t_cupp [ReportingUnitofMeasure]
  , ''[ReportingUnitofQty]
    , null															as product_category_direct
, cast(c.ProductHier1 as nvarchar(255))							as product_category_level_1
  , cast(c.ProductHier2 as nvarchar(255))							as product_category_level_2
  , cast(c.ProductHier3 as nvarchar(255))							as product_category_level_3
  , cast(c.ProductHier4 as nvarchar(255))							as product_category_level_4
  , cast(c.ProductHier5 as nvarchar(255))							as product_category_level_5
  , po.t_ddat[EntryDate]

  , ''[ChangeDate]
  , 'Baan'[DataSource]
  , po.[DataSourceKey]---100142
  --, [DateDataExtracted]

  from psa.ics_stg_baan_ttdpur040610 po
inner join psa.ics_stg_baan_ttdpur041610 pl
on po.t_orno=pl.t_orno
and po.t_suno=pl.t_suno
inner join 
psa.ics_stg_baan_ttdpur045610 g
on g.t_orno=po.t_orno
and g.t_suno=po.t_suno
and g.t_pono=pl.t_pono
left outer join  psa.ics_stg_baan_ttiitm004610 con 
on
con.t_item=pl.t_item

                                          

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
			and (pl.SYSTEM_ID + 100100) = 100107
)										c
	on replace(ltrim(replace(rtrim(c.MATERIAL_CODE), '0', ' ')), ' ', '0') = replace(ltrim(replace(rtrim(pl.t_item ), '0', ' ')), ' ', '0')


	--select * from information_schema
	--where table_name like '%tm004610%'


	
	--select * from tsa.ics_land_baan_ttiitm004610
GO
