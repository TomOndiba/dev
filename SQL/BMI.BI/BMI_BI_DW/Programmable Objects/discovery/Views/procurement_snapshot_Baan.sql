IF OBJECT_ID('[discovery].[procurement_snapshot_Baan]') IS NOT NULL
	DROP VIEW [discovery].[procurement_snapshot_Baan];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO









--6456


create    view [discovery].[procurement_snapshot_Baan]

--select count(*) from [discovery].[procurement_snapshot_Baan]
as
select 

	''									  as [Division]
  , po.t_comp							  [CompanyNumber]
  , 'P'									  [Facility]
  , po.t_cwar							  [Warehouse]
  , po.t_orno							  [PurchaseOrder]
  , ''									  [POType]
  , ''									  [LowestStatus]
  , ''									  [HighestStatus]
  , po.t_suno							  [Supplier]
  , po.t_ccur							  [Currency]
  , pl.t_pono							  [PurchaseLine]
  , pl.t_item							  [Item]
  ,md.t_dsca                                  [ItemDescription]
  , t_conv								  [ConversionRate]
  , pl.t_cuqp							  [alternative]
  , pl.t_oqua							  [OrderedQty]
  , cast(case
			 when upper(pl.t_cuqp) in
				 ('M2', 'TN')
				 then pl.t_oqua
			 else case
					  when (upper(con.t_conv) = 'KG' and upper(pl.t_cuqp) <> 'KG')
						  then ((pl.t_oqua * t_conv) / 1000)
					  when (upper(pl.t_cuqp) = 'KG')
						  then (pl.t_oqua / 1000)
					  else (pl.t_oqua * t_conv)
				  end
		 end as nvarchar(255))			  [OrderedQtyConverted]
  , g.t_dqua							  [ReceivedQuantity]
  , cast(case
			 when upper(pl.t_cuqp) in
				 ('M2', 'TN')
				 then g.t_dqua
			 else case
					  when (upper(con.t_conv) = 'KG')
						  then ((g.t_dqua * t_conv) / 1000)
					  when (upper(pl.t_cuqp) = 'KG')
						  then (g.t_dqua / 1000)
					  else (g.t_dqua * t_conv)
				  end
		 end as nvarchar(255))			  [ReceivedQuantityConverted]
  , g.t_quap							  [ApprovedQty]
  , cast(case
			 when upper(pl.t_cuqp) in
				 ('M2', 'TN')
				 then g.t_quap
			 else case
					  when (upper(con.t_conv) = 'KG')
						  then ((g.t_quap * t_conv) / 1000)
					  when (upper(pl.t_cuqp) = 'KG')
						  then (g.t_quap / 1000)
					  else (g.t_quap * t_conv)
				  end
		 end as nvarchar(255))			  [ApprovedQtyConverted]
  , g.t_quad							  [RejectedQty]
  , cast(case
			 when upper(pl.t_cuqp) in
				 ('M2', 'TN')
				 then g.t_quad
			 else case
					  when (upper(con.t_conv) = 'KG')
						  then ((g.t_quad * t_conv) / 1000)
					  when (upper(pl.t_cuqp) = 'KG')
						  then (g.t_quad / 1000)
					  else (g.t_quad * t_conv)
				  end
		 end as nvarchar(255))			  [RejectedQtyConverted]
  , ''									  [StoredQty]
  , ''									  [StoredQtyConverted]
  , pl.t_cuqp							  [PurchaseOrderUnit]
  , pl.t_cupp							  [PurchasePriceUnit]
  , t_pric							  [LineAmountOrderCurrency]
  , pl.t_ddta							  [RequestedDeliveryDate]
  , pl.t_ddtc							  [ConfirmedDeliveryDate]
  , pl.t_ddtb							  [PlanningDeliveryDate]
  , ''									  [StandardUnitofMeasure]
  , ''									  [StandardUnitofQty]


    ,case when pl.t_cupp='M2'
  then pl.t_cupp
  when   (pl.t_cupp='KG' or upper(t_unit)= 'KG') then 'TN'
  else  upper(t_unit) end   ReportingUnitOfMeasure


  
  , ''									  [ReportingUnitofQty]
  , null								  as product_category_direct
  , cast(c.ProductHier1 as nvarchar(255)) as product_category_level_1
  , cast(c.ProductHier2 as nvarchar(255)) as product_category_level_2
  , cast(c.ProductHier3 as nvarchar(255)) as product_category_level_3
  , cast(c.ProductHier4 as nvarchar(255)) as product_category_level_4
  , cast(c.ProductHier5 as nvarchar(255)) as product_category_level_5
  , po.t_ddat							  [EntryDate]
  , ''									  [ChangeDate]
  , 'Baan'								  [DataSource]
  , '100107'							  as DataSourceKey	---100142
  , (
		select	max(d.EtlCreatedOn) from psa.ics_stg_baan_ttdpur040610 d
	)									  [DateDataExtracted]
from
	psa.ics_stg_baan_ttdpur040610			  po
left outer   join psa.ics_stg_baan_ttdpur041610	  pl
	on po.t_orno = pl.t_orno
		and po.t_suno = pl.t_suno
	left outer join
(
	select
		c.t_orno
	  , c.t_pono
	  , c.t_item
	  , c.t_suno
	  , sum(c.t_dqua) t_dqua
	  , sum(c.t_quap) t_quap
	  , sum(c.t_quad) t_quad
	from
		psa.ics_stg_baan_ttdpur045610 c
	group by
		c.t_pono
	  , c.t_item
	  , c.t_suno
	  , c.t_orno
)											  g
	on g.t_orno = po.t_orno
		and g.t_suno = po.t_suno
		and g.t_pono = pl.t_pono
left outer join psa.ics_stg_baan_ttiitm004610 con
	on con.t_item = pl.t_item
		and con.t_basu = pl.t_cuqp
		and upper(t_unit) in
				('KG', 'M2')
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
	inner join   tsa.PU_CATEGORY c
		on c.CATEGORY_ID = pl.CATEGORY_ID
			and (pl.SYSTEM_ID + 100100) = 100107
)											  c
	on replace(ltrim(replace(rtrim(c.MATERIAL_CODE), '0', ' ')), ' ', '0') = replace(ltrim(replace(rtrim(pl.t_item), '0', ' ')), ' ', '0') 

	left outer join
	psa.ics_stg_baan_tiitm001610 md
	on md.t_item=pl.t_item
	where 	 year(po.t_ddat) > 2016



GO
