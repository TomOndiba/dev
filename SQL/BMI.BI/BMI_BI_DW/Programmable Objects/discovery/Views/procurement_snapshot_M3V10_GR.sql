IF OBJECT_ID('[discovery].[procurement_snapshot_M3V10_GR]') IS NOT NULL
	DROP VIEW [discovery].[procurement_snapshot_M3V10_GR];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






create       view [discovery].[procurement_snapshot_M3V10_GR]
as
select
--count(*)

	cast(h.IAFACI as nvarchar(255))		  as Facility	--								  as Facility
  , g.F2PUNO							  as PurchaseOrderNo
    , g.F2SUNO							  as Supplier
  , g.F2CUCD							  as Currency
  , g.F2PNLI							  as PurchaseLine
  , g.F2ITNO							  as Item
  , cast(cc.MMITDS as nvarchar(255))	  as ItemDescription
  , cast(c.ProductHier1 as nvarchar(255)) as product_category_level_1
  , cast(c.ProductHier2 as nvarchar(255)) as product_category_level_2
  , cast(c.ProductHier3 as nvarchar(255)) as product_category_level_3
  , cast(c.ProductHier4 as nvarchar(255)) as product_category_level_4
  , cast(c.ProductHier5 as nvarchar(255)) as product_category_level_5
  , g.F2TRDT							  as GoodReceivedDate
  , null								  as Product_category_direct
  , MMUNMS								  as GoodsReceivedUnit
  , g.F2IVQT							  as ReceivedQuantity
  , g.F2SCOC							  PricePerUnit
  , g.F2RCAC							  as GoodReceivedLineValueInLocalCurrency
  , ''									  StandardUnitofMeasure
  , cast(case
			 when MMUNMS = 'KG'
				 or cc.alternative = 'KG'
				 then 'TN'
			 when MMUNMS = 'TN'
				 then 'TN'
			 when MMUNMS = 'M2'
				 then 'M2'
			 else alternative
		 end as nvarchar(255))			  as 'ReportingUnitofMeasure'
  , cast(case
			 when upper(MMUNMS) in
				 ('M2', 'TN')
				 then g.F2IVQT
			 else case
					  when
					  (
						  upper(MMUNMS) = 'KG'
						  and	upper(alternative) <> 'KG'
					  )
						  then (g.F2IVQT / 1000)
					  when (upper(isnull(alternative,'-9')) = 'KG')
						  then ((g.F2IVQT / conversion) / 1000)
					  else (g.F2IVQT / conversion)
				  end
		 end as nvarchar(255))			  as ReceivedQtyConverted
  , 'Poland Vil'		   as DataSource
  , g.DataSourceKey
  , (


		select	max(d.EtlCreatedOn) from tsa.ics_land_M3V10vil_POL_FGRECL d
	)									  as DateDataExtracted
from
	tsa.ics_land_M3V10vil_POL_FGRECL			  g
left outer join
(
	select
		B.MMITNO
	  , B.MMITDS
	  , A.MUALUN alternative
	  , A.MUCOFA conversion
	  , B.MMUNMS
	  , A.MUAUTP
	  , A.MUDMCF
	from
		psa.ics_stg_M3V10vil_POL_MITMAS			  B
	left outer join psa.ics_stg_M3V10vil_POL_MITAUN A
		on (A.MUITNO = B.MMITNO)
			and A.MUAUTP = 1
			and upper(A.MUALUN) in
					('KG', 'M2', 'TN')
)									  cc
	on cc.MMITNO = g.F2ITNO
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
			and (pl.SYSTEM_ID + 100100) = '100113'
)									  c
	on replace(ltrim(replace(rtrim(c.MATERIAL_CODE), '0', ' ')), ' ', '0') = replace(ltrim(replace(rtrim(g.F2ITNO), '0', ' ')), ' ', '0')
left outer join psa.ics_stg_M3V10vil_POL_MPHEAD h
	on h.IAPUNO = g.F2PUNO
where
	left(g.F2TRDT,4) > 2016 
	and g.F2RPQT <> '0'
	and g.F2RPQA <> '0'
	and g.F2IVQT <> '0'
	and g.F2IVQA <> '0' 


	union



	select
--count(*)

	cast(h.IAFACI as nvarchar(255))		  as Facility	--								  as Facility
  , g.F2PUNO							  as PurchaseOrderNo
  , g.F2SUNO							  as Supplier
  , g.F2CUCD							  as Currency
  , g.F2PNLI							  as PurchaseLine
  , g.F2ITNO							  as Item
  , cast(cc.MMITDS as nvarchar(255))	  as ItemDescription
  , cast(c.ProductHier1 as nvarchar(255)) as product_category_level_1
  , cast(c.ProductHier2 as nvarchar(255)) as product_category_level_2
  , cast(c.ProductHier3 as nvarchar(255)) as product_category_level_3
  , cast(c.ProductHier4 as nvarchar(255)) as product_category_level_4
  , cast(c.ProductHier5 as nvarchar(255)) as product_category_level_5
  , g.F2TRDT							  as GoodReceivedDate
  , null								  as Product_category_direct
  , MMUNMS								  as GoodsReceivedUnit
  , g.F2IVQT							  as ReceivedQuantity
  , g.F2SCOC							  PricePerUnit
  , g.F2RCAC							  as GoodReceivedLineValueInLocalCurrency
  , ''									  StandardUnitofMeasure
  , cast(case
			 when MMUNMS = 'KG'
				 or cc.alternative = 'KG'
				 then 'TN'
			 when MMUNMS = 'TN'
				 then 'TN'
			 when MMUNMS = 'M2'
				 then 'M2'
			 else alternative
		 end as nvarchar(255))			  as 'ReportingUnitofMeasure'
  , cast(case
			 when upper(MMUNMS) in
				 ('M2', 'TN')
				 then g.F2IVQT
			 else case
					  when
					  (
						  upper(MMUNMS) = 'KG'
						  and	upper(isnull(alternative,'-9')) <> 'KG'
					  )
						  then (g.F2IVQT / 1000)
					  when (upper(alternative) = 'KG')
						  then ((g.F2IVQT / conversion) / 1000)
					  else (g.F2IVQT / conversion)
				  end
		 end as nvarchar(255))			  as ReceivedQtyConverted
   , 'Poland Ved'		   as DataSource
  , g.DataSourceKey
  , (
		select	max(d.EtlCreatedOn) from psa.ics_stg_M3V10ved_POL_FGRECL d
	)									  as DateDataExtracted
from
	psa.ics_stg_M3V10ved_POL_FGRECL			  g
left outer join
(
	select
		B.MMITNO
	  , B.MMITDS
	  , A.MUALUN alternative
	  , A.MUCOFA conversion
	  , B.MMUNMS
	  , A.MUAUTP
	  , A.MUDMCF
	from
		psa.ics_stg_M3V10ved_POL_MITMAS			  B
	left outer join psa.ics_stg_M3V10ved_POL_MITAUN A
		on (A.MUITNO = B.MMITNO)
			and A.MUAUTP = 1
			and upper(A.MUALUN) in
					('KG', 'M2', 'TN')
)									  cc
	on cc.MMITNO = g.F2ITNO
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
			and (pl.SYSTEM_ID + 100100) = '100113'
)									  c
	on replace(ltrim(replace(rtrim(c.MATERIAL_CODE), '0', ' ')), ' ', '0') = replace(ltrim(replace(rtrim(g.F2ITNO), '0', ' ')), ' ', '0')
left outer join psa.ics_stg_M3V10ved_POL_MPHEAD h
	on h.IAPUNO = g.F2PUNO
where
	left(g.F2TRDT,4) > 2016 
	and g.F2RPQT <> '0'
	and g.F2RPQA <> '0'
	and g.F2IVQT <> '0'
	and g.F2IVQA <> '0' 



	union

	
	select


	cast(h.IAFACI as nvarchar(255))		  as Facility	--								  as Facility
  , g.F2PUNO							  as PurchaseOrderNo
   , g.F2SUNO							  as Supplier
  , g.F2CUCD							  as Currency
  , g.F2PNLI							  as PurchaseLine
  , g.F2ITNO							  as Item
  , cast(cc.MMITDS as nvarchar(255))	  as ItemDescription
  , cast(c.ProductHier1 as nvarchar(255)) as product_category_level_1
  , cast(c.ProductHier2 as nvarchar(255)) as product_category_level_2
  , cast(c.ProductHier3 as nvarchar(255)) as product_category_level_3
  , cast(c.ProductHier4 as nvarchar(255)) as product_category_level_4
  , cast(c.ProductHier5 as nvarchar(255)) as product_category_level_5
  , g.F2TRDT							  as GoodReceivedDate
  , null								  as Product_category_direct
  , MMUNMS								  as GoodsReceivedUnit
  , g.F2IVQT							  as ReceivedQuantity
  , g.F2SCOC							  PricePerUnit
  , g.F2RCAC							  as GoodReceivedLineValueInLocalCurrency
  , ''									  StandardUnitofMeasure
  , cast(case
			 when MMUNMS = 'KG'
				 or cc.alternative = 'KG'
				 then 'TN'
			 when MMUNMS = 'TN'
				 then 'TN'
			 when MMUNMS = 'M2'
				 then 'M2'
			 else alternative
		 end as nvarchar(255))			  as 'ReportingUnitofMeasure'
  , cast(case
			 when upper(MMUNMS) in
				 ('M2', 'TN')
				 then g.F2IVQT
			 else case
					  when
					  (
						  upper(MMUNMS) = 'KG'
						  and	upper(isnull(alternative,'-9')) <> 'KG'
					  )
						  then (g.F2IVQT / 1000)
					  when (upper(alternative) = 'KG')
						  then ((g.F2IVQT / conversion) / 1000)
					  else (g.F2IVQT / conversion)
				  end
		 end as nvarchar(255))			  as ReceivedQtyConverted
  , 'Poland Gen'		   as DataSource
  , g.DataSourceKey
  , (
		select	max(d.EtlCreatedOn) from psa.ics_stg_M3V10gen_POL_FGRECL d
	)									  as DateDataExtracted
from
	psa.ics_stg_M3V10gen_POL_FGRECL			  g
left outer join
(
	select
		B.MMITNO
	  , B.MMITDS
	  , A.MUALUN alternative
	  , A.MUCOFA conversion
	  , B.MMUNMS
	  , A.MUAUTP
	  , A.MUDMCF
	from
		psa.ics_stg_M3V10gen_POL_MITMAS			  B
	left outer join psa.ics_stg_M3V10gen_POL_MITAUN A
		on (A.MUITNO = B.MMITNO)
			and A.MUAUTP = 1
			and upper(A.MUALUN) in
					('KG', 'M2', 'TN')
)									  cc
	on cc.MMITNO = g.F2ITNO
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
			and (pl.SYSTEM_ID + 100100) = '100113'
)									  c
	on replace(ltrim(replace(rtrim(c.MATERIAL_CODE), '0', ' ')), ' ', '0') = replace(ltrim(replace(rtrim(g.F2ITNO), '0', ' ')), ' ', '0')
left outer join psa.ics_stg_M3V10gen_POL_MPHEAD h
	on h.IAPUNO = g.F2PUNO
where
	left(g.F2TRDT,4) > 2016 
	and g.F2RPQT <> '0'
	and g.F2RPQA <> '0'
	and g.F2IVQT <> '0'
	and g.F2IVQA <> '0' ;





GO
