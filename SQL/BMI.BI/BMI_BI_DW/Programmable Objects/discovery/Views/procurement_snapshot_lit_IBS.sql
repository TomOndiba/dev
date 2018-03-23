IF OBJECT_ID('[discovery].[procurement_snapshot_lit_IBS]') IS NOT NULL
	DROP VIEW [discovery].[procurement_snapshot_lit_IBS];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


create view [discovery].[procurement_snapshot_lit_IBS]
as
select
	OHDIVN								  as [Division]
  , 'B2'								  [CompanyNumber]
  , OHSROM								  [Facility]
  , h.OHFSRM							  [Warehouse]
  , OHORDT								  [POType]
  , OHORDS								  [LowestStatus]
  , OHORDS								  [HighestStatus]
  , h.OHORNO							  as PurchaseOrder
  , h.OHSUNO							  Supplier
  , h.OHPCUR							  Currency
  , l.OLLINE							  PurchaseLine
  , l.OLPRDC							  as Item
  , OLDESC								  ItemDescription
  , l.OLOQTY							  as OrderedQty
  , cast(case
			 when upper(l.OLUNIT) in
				 ('M2', 'TN')
				 then l.OLOQTY
			 else case
					  when
					  (
						  upper(PJUNIT) = 'KG'
						  and	(upper(l.OLUNIT)) <> 'KG'
					  )
						  then ((l.OLOQTY / PJCONV) / 1000)
					  when (upper(l.OLUNIT) = 'KG')
						  then (l.OLOQTY / 1000)
					  else (l.OLOQTY / PJCONV)
				  end
		 end as nvarchar(255))			  OrderedQtyConverted
  , g.GRCQTY							  as ReceivedQuantity
  , cast(case
			 when upper(l.OLUNIT) in
				 ('M2', 'TN')
				 then g.GRCQTY
			 else case
					  when
					  (
						  upper(PJUNIT) = 'KG'
						  and	(upper(l.OLUNIT)) <> 'KG'
					  )
						  then ((g.GRCQTY / PJCONV) / 1000)
					  when (upper(l.OLUNIT) = 'KG')
						  then (g.GRCQTY / 1000)
					  else (g.GRCQTY / PJCONV)
				  end
		 end as nvarchar(255))			  ReceivedQuantityConverted
  , g.GRQQTY							  as ApprovedQty
  , cast(case
			 when upper(l.OLUNIT) in
				 ('M2', 'TN')
				 then g.GRQQTY
			 else case
					  when
					  (
						  upper(PJUNIT) = 'KG'
						  and	(upper(l.OLUNIT)) <> 'KG'
					  )
						  then ((g.GRQQTY / PJCONV) / 1000)
					  when (upper(l.OLUNIT) = 'KG')
						  then (g.GRQQTY / 1000)
					  else (g.GRQQTY / PJCONV)
				  end
		 end as nvarchar(255))			  ApprovedQtyConverted
  , ''									  as RejectedQty
  , ''									  as [RejectedQtyConverted]
  , ''									  as StoredQty
  , ''									  as StoredQtyConverted
  , l.OLPURP							  as PurchaseOrderUnit
  , case
		when l.OLUNIT = 'M2'
			then l.OLUNIT
		when
		(
			l.OLUNIT = 'KG'
			or	PJUNIT = 'KG'
		)
			then 'TN'
		else PJUNIT
	end									  ReportingUnitOfMeasure
  , l.OLPURP							  as PurchasePriceUnit
  , l.OLAMOU							  as LineAmountOrderCurrency
  , l.OLRDDT							  as RequestedDeliveryDate
  , l.OLCNFD							  as ConfirmedDeliveryDate
  , l.OLSDDT							  as PlanningDeliveryDate
  , cast(c.ProductHier1 as nvarchar(255)) as product_category_level_1
  , cast(c.ProductHier2 as nvarchar(255)) as product_category_level_2
  , cast(c.ProductHier3 as nvarchar(255)) as product_category_level_3
  , cast(c.ProductHier4 as nvarchar(255)) as product_category_level_4
  , cast(c.ProductHier5 as nvarchar(255)) as product_category_level_5
  , null								  as ChangeDate		--h.OHECHG
  , h.OHODAT							  as EntryDate
  , 'Lit'								  [DataSource]
  , '100112'							  as DataSourceKey	---100142
  , (
		select	max(d.EtlCreatedOn) from psa.ics_stg_ibs_lit_procure_SROORPHE d
	)									  [DateDataExtracted]
from
	psa.ics_stg_ibs_lit_procure_SROORPHE			  h
left outer join psa.ics_stg_ibs_lit_procure_SROORPPL l
	on h.OHORNO = l.OLORNO
left outer join psa.ics_stg_ibs_lit_procure_SROGRT	  g
	on g.GRORNO = l.OLORNO
		and g.GRPRDC = l.OLPRDC
		and g.GRLINE = l.OLLINE
left outer join psa.ics_stg_ibs_lit_procure_SROPRU	  u
	on u.PJPRDC = l.OLPRDC
		and upper(PJUNIT) in
				('M2', 'KG')
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
			and (pl.SYSTEM_ID + 100100) = 100112
)													  c
	on replace(ltrim(replace(rtrim(c.MATERIAL_CODE), '0', ' ')), ' ', '0') = replace(ltrim(replace(rtrim(l.OLPRDC), '0', ' ')), ' ', '0')
where
	year(cast(h.OHODAT as nvarchar)) > '2016' ;

GO
