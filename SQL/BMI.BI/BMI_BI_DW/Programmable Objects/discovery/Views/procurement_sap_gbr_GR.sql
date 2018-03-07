IF OBJECT_ID('[discovery].[procurement_sap_gbr_GR]') IS NOT NULL
	DROP VIEW [discovery].[procurement_sap_gbr_GR];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



create    view 
--select * from
 [discovery].[procurement_sap_gbr_GR]
as
select
	(
		select	max(d.EtlCreatedOn) from psa.ics_stg_SAP_GBR_EKBE d
	)									  as DateDataExtracted
  , 'UK'								  as DataSource
  , EKPO.DataSourceKey
  , EKBE.WERKS							  as [Facility]
  , EKBE.EBELN							  as PurchaseOrder
  , cast(cast(replace(EKBE.BLDAT,'-','') as nvarchar(8)) as int)							  as GoodsReceiptDate
  , EKKO.LLIEF							  as Supplier
  , EKKO.WAERS							  as [Currency]
  , EKPO.EBELP							  as PurchaseLine
  , EKBE.MATNR							  as Item
  , ''									  as ItemDescription
  , ''									  as product_category_direct
  , cast(c.ProductHier1 as nvarchar(255)) as product_category_level_1
  , cast(c.ProductHier2 as nvarchar(255)) as product_category_level_2
  , cast(c.ProductHier3 as nvarchar(255)) as product_category_level_3
  , cast(c.ProductHier4 as nvarchar(255)) as product_category_level_4
  , cast(c.ProductHier5 as nvarchar(255)) as product_category_level_5
  , EKBE.MENGE							  as ReceivedQuantity
  , EKPO.MEINS							  as GoodsReceivedUnit
  , round((EKBE.DMBTR / EKBE.MENGE), 2)	  as PricePerUnit
  , EKBE.DMBTR							  as GoodsReceivedLineValueInLocalCurrency
  , ''									  as StandardUnitofQty
  , case
		when EKPO.MEINS is null
			or	EKPO.MENGE is null
			then null
		else cast(case
					  when
					  (
						  upper(ReportingUnitOfMeasure) = 'KG'
						  or upper(EKPO.MEINS) = 'KG'
					  )
						  then 'TN'
					  else ReportingUnitOfMeasure
				  end as nvarchar(255))
	end									  as 'ReportingUnitofMeasure'
	,EKPO.MEINS																				 [PurchaseOrderUnit]
  , case
		when EKPO.MEINS is null
			or	EKBE.MENGE is null
			then null
		when EKBE.BWART = 102
			then EKBE.MENGE * (-1)
		when EKPO.MEINS is not null
			and EKBE.MENGE is not null
			and (
					upper(MM.ReportingUnitOfMeasure) <> 'KG'
					and upper(EKPO.MEINS) <> 'KG'
				)
			then round(((MM.UMREN) / (MM.UMREZ) * EKBE.MENGE), 2)
		when EKPO.MEINS is not null
			and EKBE.MENGE is not null
			and (
					upper(MM.ReportingUnitOfMeasure) = 'KG'
					and upper(EKPO.MEINS) <> 'KG'
				)
			then round((((MM.UMREN) / (MM.UMREZ) * EKBE.MENGE)) / 1000, 2)
		when EKPO.MEINS is not null
			and EKBE.MENGE is not null
			and (upper(EKPO.MEINS) = 'KG')
			then round(((EKBE.MENGE)) / 1000, 2)
	end									  [ReceivedQuantityConverted]
from
	psa.ics_stg_SAP_GBR_EKKO		EKKO
left join psa.ics_stg_SAP_GBR_EKPO EKPO
	on EKKO.EBELN = EKPO.EBELN
left join
(
	select
		WERKS
	  , EBELN
	  , BLDAT
	  , EBELP
	  , MATNR
	  , BWART
	  , BEWTP
	  , case BWART when '102' then MENGE * (-1) else MENGE end as MENGE
	  , case BWART when '102' then DMBTR * (-1) else DMBTR end as DMBTR
	from
		[psa].[ics_stg_SAP_GBR_EKBE]
	where
		upper(BEWTP) = 'E'
)									EKBE
	on EKPO.EBELN = EKBE.EBELN
		and EKPO.EBELP = EKBE.EBELP
left join
(
	select distinct
		MARM.MATNR											--MARM_055.Material AS MATNR,
	  , MARM.MEINH											--AUn AS MEINH,
	  , MARM.UMREN											--Denom AS UMREN,
	  , MARM.UMREZ											--Numer AS UMREZ,
	  , MARM.MEINH			  as [AlternativeUnitOfMeasure] --AUn AS AlternativeUnitOfMeasure
	  , ReportingUnitOfMeasure
	    , row_number() over (partition by MARM.MATNR order by MARM.MATNR) rn
	from
		psa.ics_stg_SAP_GBR_MARM MARM
	where
		upper(MARM.MEINH) in
			('KG', 'M2', 'TO')
			and MARM.ReportingUnitOfMeasure <>'0'
)									MM
	on (
		   MM.MATNR = EKPO.MATNR
		 	and rn = 1
	   )
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
			and (pl.SYSTEM_ID + 100100) = 100101
)									c
	on replace(ltrim(replace(rtrim(c.MATERIAL_CODE), '0', ' ')), ' ', '0') = replace(ltrim(replace(rtrim(EKBE.MATNR), '0', ' ')), ' ', '0')
where
	year(EKBE.BLDAT) >= 2017 ;
--			AND              

--             UPPER(EKPO.D) <> 'L'

----ORDER BY 5, 9;
GO
