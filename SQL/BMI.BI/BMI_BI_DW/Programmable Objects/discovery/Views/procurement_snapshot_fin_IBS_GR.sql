IF OBJECT_ID('[discovery].[procurement_snapshot_fin_IBS_GR]') IS NOT NULL
	DROP VIEW [discovery].[procurement_snapshot_fin_IBS_GR];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




create    view [discovery].[procurement_snapshot_fin_IBS_GR]
as
select
   cast(g.EtlCreatedOn as date) as  [DateDataExtracted]
  , 'Fin'								  [DataSource]
  , '100112'							  as DataSourceKey	---100142
   ,g.GRSROM							as	[Facility]
  , g.GRORNO							as  PurchaseOrderNumber
  ,	g.GRRDAT							as GoodsReceivedDate
  , g.GRSUNO							as  Supplier
  , g.GRPCUR							as Currency
  , g.GRLINE							as  PurchaseLine
  , g.GRPRDC							as ItemNumber
  , g.GRDESC        					as ItemDescription 
  , cast(c.MATERIAL_CODE as nvarchar(255)) as product_category_direct
  , cast(c.ProductHier1 as nvarchar(255)) as product_category_level_1
  , cast(c.ProductHier2 as nvarchar(255)) as product_category_level_2
  , cast(c.ProductHier3 as nvarchar(255)) as product_category_level_3
  , cast(c.ProductHier4 as nvarchar(255)) as product_category_level_4
  , cast(c.ProductHier5 as nvarchar(255)) as product_category_level_5
  , g.GRCQTY							  as ReceivedQuantity
  , g.GRUNIT							as GoodReceivedUnit
  , g.GRPURP							  as PricePerUnit
  , u.PJUNIT							as StandardUnitOfMeasure
  , case
		when g.GRUNIT = 'M2'
			then g.GRUNIT
		when
		(
			g.GRUNIT = 'KG'
			or	u.PJUNIT = 'KG'
		)
			then 'TN'
		else u.PJUNIT
	end									  ReportingUnitOfMeasure
  , cast(case
			 when upper(g.GRUNIT) in
				 ('M2', 'TN')
				 then g.GRCQTY
			 else case
					  when
					  (
						  upper(u.PJUNIT) = 'KG'
						  and	(upper(g.GRUNIT)) <> 'KG'
					  )
						  then ((g.GRCQTY / u.PJCONV) / 1000)
					  when (upper(g.GRUNIT) = 'KG')
						  then (g.GRCQTY / 1000)
					  else (g.GRCQTY / u.PJCONV)
				  end
		 end as nvarchar(255))			  ReceivedQuantityConverted 
		 , cast(g.GRCQTY * g.GRPURP as decimal(16,4))					as GoodsReceivedLineValueInLocalCurrency
from
	psa.ics_stg_ibs_fin_procure_SROGRT	  g
left outer join psa.ics_stg_ibs_fin_procure_SROPRU	  u
	on u.PJPRDC = g.GRPRDC
		and upper(u.PJUNIT) in
				('M2', 'KG')
left outer join
(
	select
		pl.MATERIAL_CODE
	  , c.ProductHier1
	  , c.ProductHier2
	  , c.ProductHier3
	  , c.ProductHier4
	  , c.ProductHier5
	from
		tsa.PU_LINK_CATEGORY   pl
	inner join tsa.PU_CATEGORY c
		on c.CATEGORY_ID = pl.CATEGORY_ID
			and (pl.SYSTEM_ID + 100100) = 100112
)													  c
	on replace(ltrim(replace(rtrim(c.MATERIAL_CODE), '0', ' ')), ' ', '0') = replace(ltrim(replace(rtrim(g.GRPRDC), '0', ' ')), ' ', '0')
where
	year(cast(g.GRRDAT as nvarchar)) > '2016' ;

GO
