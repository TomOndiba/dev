IF OBJECT_ID('[discovery].[procurement_snapshot_Baan_GR]') IS NOT NULL
	DROP VIEW [discovery].[procurement_snapshot_Baan_GR];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





create    view 

--select * from 
[discovery].[procurement_snapshot_Baan_GR]
as
select 
   cast(g.EtlCreatedOn as date) as  [DateDataExtracted]
  , 'Baan'								as  [DataSource]
  , '100107'							as DataSourceKey	
   ,'P'							as	[Facility]
  , g.t_orno						as  PurchaseOrderNumber
  ,cast( replace( cast(cast(	g.t_date as date) as nvarchar(25)) ,'-','') as int)							as GoodsReceivedDate
  , g.t_suno							as  Supplier
  , po.t_ccur							as Currency
  , g.t_pono 								as  PurchaseLine
  , g.t_item							as ItemNumber
  , md.t_dsca         					as ItemDescription 
  , cast(c.CATEGORY_NAME as nvarchar(255)) as product_category_direct
  , cast(c.ProductHier1 as nvarchar(255)) as product_category_level_1
  , cast(c.ProductHier2 as nvarchar(255)) as product_category_level_2
  , cast(c.ProductHier3 as nvarchar(255)) as product_category_level_3
  , cast(c.ProductHier4 as nvarchar(255)) as product_category_level_4
  , cast(c.ProductHier5 as nvarchar(255)) as product_category_level_5
  , g.t_dqua							  as ReceivedQuantity
  , pl.t_cuqp							as GoodReceivedUnit
  , g.t_pric							  as PricePerUnit
  , g.t_iamt				as GoodsReceivedLineValueInLocalCurrency
  , ''							as StandardUnitOfMeasure
    ,case when pl.t_cupp='M2'
  then pl.t_cupp
  when   (pl.t_cupp='KG' or upper(con.t_unit)= 'KG') then 'TN'
  else  upper(con.t_unit) end   ReportingUnitOfMeasure
  , cast(case
			 when upper(pl.t_cuqp) in
				 ('M2', 'TN')
				 then g.t_dqua
			 else case
					  when (upper(con.t_conv) = 'KG')
						  then ((g.t_dqua * con.t_conv) / 1000)
					  when (upper(pl.t_cuqp) = 'KG')
						  then (g.t_dqua / 1000)
					  else (g.t_dqua * con.t_conv)
				  end
		 end as nvarchar(255))			  [ReceivedQuantityConverted]

from [psa].[ics_stg_baan_ttdpur045610] g
inner join psa.ics_stg_baan_ttdpur040610 po
	on po.t_orno = g.t_orno
left outer   join psa.ics_stg_baan_ttdpur041610	  pl
	on g.t_orno = pl.t_orno
		and g.t_pono = pl.t_pono
left outer join psa.ics_stg_baan_ttiitm004610 con
	on con.t_item = pl.t_item
		and con.t_basu = pl.t_cuqp
		and upper(con.t_unit) in
				('KG', 'M2')
left outer join
(
	select
		pl.MATERIAL_CODE
		, c.CATEGORY_NAME
	  , c.ProductHier1
	  , c.ProductHier2
	  , c.ProductHier3
	  , c.ProductHier4
	  , c.ProductHier5
	from
		 tsa.PU_LINK_CATEGORY   pl
	inner join   tsa.PU_CATEGORY c
		on c.CATEGORY_ID = pl.CATEGORY_ID
			and (pl.SYSTEM_ID + 100100) = 100107
)											  c
	on replace(ltrim(replace(rtrim(c.MATERIAL_CODE), '0', ' ')), ' ', '0') = replace(ltrim(replace(rtrim(g.t_item), '0', ' ')), ' ', '0') 
	left outer join
	psa.ics_stg_baan_tiitm001610 md
	on md.t_item=g.t_item
where 	g.t_dqua <> 0 and year(g.t_date) > 2016
GO
