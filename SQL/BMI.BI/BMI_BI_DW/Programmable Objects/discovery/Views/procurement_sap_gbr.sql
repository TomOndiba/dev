IF OBJECT_ID('[discovery].[procurement_sap_gbr]') IS NOT NULL
	DROP VIEW [discovery].[procurement_sap_gbr];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO








--/****** Object:  View [discovery].[procurement_sap_gbr]    Script Date: 29/01/2018 14:56:49 ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO

create view


--select * from 
[discovery].[procurement_sap_gbr]
as
with cte
as
(
	select
		''																						 as 'Division'
	  , ekp.BUKRS																				 as [CompanyNumber]
	  , ''																						 as [Warehouse]
	  , be.WERKS																				 as [Facility]
	  , be.EBELN																				 as [PurchaseOrder]
	  , ek.BSART																				 [POType]
	  , ''																						 as [LowestStatus]
	  , ''																						 as [HighestStatus]
	  , ek.LIFNR																				 Supplier
	  , ek.WAERS																				 as [Currency]
	  , be.EBELP																				 as [PurchaseLine]
	  , be.MATNR																				 [Item]
	  , t.MAKTX																					 ItemDescription
	  , ekp.MENGE																				 [OrderedQty]
	  , case
			when ekp.MEINS is null
				or	ekp.MENGE is null
				then null
			when ekp.MEINS is not null
				and ekp.MENGE is not null
				and (
						upper(ReportingUnitOfMeasure) = 'KG'
						and upper(ekp.MEINS) <> 'KG'
					)
				then round(((((mm.UMREN) / (mm.UMREZ)) * ekp.MENGE)) / 1000, 2)
			when ekp.MEINS is not null
				and ekp.MENGE is not null
				and (
						upper(ReportingUnitOfMeasure) <> 'KG'
						and upper(ekp.MEINS) <> 'KG'
					)
				then round((((mm.UMREN) / (mm.UMREZ)) * ekp.MENGE), 2)
			when ekp.MEINS is not null
				and be.MENGE is not null
				and (upper(ekp.MEINS) = 'KG')
				then round(((ekp.MENGE)) / 1000, 2)
		end																						 [OrderedQtyConverted]
	  , case when be.BWART = 102 then be.MENGE * (-1) else be.MENGE end							 [ReceivedQuantity]
	  , case
			when ekp.MEINS is null
				or	be.MENGE is null
				then null
			when be.BWART = 102
				then be.MENGE * (-1)
			when ekp.MEINS is not null
				and be.MENGE is not null
				and (
						upper(mm.ReportingUnitOfMeasure) <> 'KG'
						and upper(ekp.MEINS) <> 'KG'
					)
				then round(((mm.UMREN) / (mm.UMREZ) * be.MENGE), 2)
			when ekp.MEINS is not null
				and be.MENGE is not null
				and (
						upper(mm.ReportingUnitOfMeasure) = 'KG'
						and upper(ekp.MEINS) <> 'KG'
					)
				then round((((mm.UMREN) / (mm.UMREZ) * be.MENGE)) / 1000, 2)
			when ekp.MEINS is not null
				and be.MENGE is not null
				and (upper(ekp.MEINS) = 'KG')
				then round(((be.MENGE)) / 1000, 2)
		end																						 [ReceivedQuantityConverted]
	  , ''																						 [ApprovedQty]
	  , ''																						 [RejectedQty]
	  , ''																						 [StoredQty]
	  , ekp.MEINS																				 [PurchaseOrderUnit]
	  , ekp.MEINS																				 [PurchasePriceUnit]	-- round(cast((ekp.NETWR / case when isnull(ekp.MENGE, 1) = 0 then 1 else isnull(ekp.MENGE, 1) end) as float), 0, 1) 
	  , case when be.BWART = 102 then ekp.NETWR * (-1) else ekp.NETWR end						 [LineAmountOrderCurrency]
	  , et.EINDT																				 as [RequestedDeliveryDate]
	  , ''																						 [ConfirmedDeliveryDate]
	  , ''																						 [PlanningDeliveryDate]
	  , ekp.MEINS																				 as native_unit_of_measure
	  , null																					 as [StandardUnitofMeasure]
	  , case
			when ekp.MEINS is null
				or	ekp.MENGE is null
				then null
			else cast(case
						  when
						  (
							  upper(ReportingUnitOfMeasure) = 'KG'
							  or upper(ekp.MEINS) = 'KG'
						  )
							  then 'TN'
						  else ReportingUnitOfMeasure
					  end as nvarchar(255))
		end																						 as 'ReportingUnitofMeasure'
	  , cast(null as nvarchar(255))																 as 'ReportingUnitofQty'
	  , cast(null as nvarchar(255))																 as 'StandardUnitofQty'
	  , null																					 as ReportingunitOfMeasureCode
	  , null																					 as product_category_direct
	  , cast(c.ProductHier1 as nvarchar(255))													 as product_category_level_1
	  , cast(c.ProductHier2 as nvarchar(255))													 as product_category_level_2
	  , cast(c.ProductHier3 as nvarchar(255))													 as product_category_level_3
	  , cast(c.ProductHier4 as nvarchar(255))													 as product_category_level_4
	  , cast(c.ProductHier5 as nvarchar(255))													 as product_category_level_5
	  , ek.AEDAT																				 [ChangeDate]
																														-- , case		--	when ek.BUKRS = 'CC01'
																														--		then 'SAP GBR'
																														--	when ek.BUKRS = 'CC10'
																														--		then 'SAP Ireland'			--	else 'Not Known'		--end	
	  , 'UK'																					 as [DataSource]
	  , ek.DataSourceKey																		 as DataSourceKey
	  , cast(convert(char(8), ek.AEDAT, 112) as int)											 as EntryDate
	  , (
			select	max(d.EtlCreatedOn) from psa.ics_stg_SAP_GBR_EKBE d
		)																						 as DateDataExtracted
	  , row_number() over (partition by be.EBELN, be.MATNR order by ekp.MENGE asc, et.EINDT asc) rn
	from
		psa.ics_stg_SAP_GBR_EKKO			 ek
	left outer join
	(
		select
			WERKS
		  , EBELN
		  , EBELP
		  , MATNR
		  , BWART
		  , BEWTP
		  , sum(case when BWART = 102 then MENGE * (-1) else MENGE end) as MENGE
		from
			psa.ics_stg_SAP_GBR_EKBE EKBE
		where
			upper(isnull(BEWTP, '-99')) = 'E'
		group by
			WERKS
		  , EBELN
		  , EBELP
		  , MATNR
		  , BWART
		  , BEWTP
	)										 be
		on ek.EBELN = be.EBELN
	left outer join psa.ics_stg_SAP_GBR_EKPO ekp
		on ekp.EBELN = be.EBELN
			and ekp.EBELP = be.EBELP
	left outer join psa.ics_stg_SAP_GBR_MARA ma --- material master 
		on ma.MATNR = be.MATNR
	left outer join psa.ics_stg_SAP_GBR_EKET et
		on et.EBELP = ekp.EBELP
			and et.EBELN = ekp.EBELN
	left outer join psa.ics_stg_SAP_GBR_MAKT t
		on t.MATNR = be.MATNR
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
	)										 c
		on replace(ltrim(replace(rtrim(c.MATERIAL_CODE), '0', ' ')), ' ', '0') = replace(ltrim(replace(rtrim(be.MATNR), '0', ' ')), ' ', '0')
	left outer join
	(
		select
			m.MATNR
		  , MEINH
		  , UMREN
		  , UMREZ
		  , ReportingUnitOfMeasure
		  , row_number() over (partition by m.MATNR order by m.MATNR) rn
		from
			psa.ics_stg_SAP_GBR_MARM m
		where
			upper(m.MEINH) in
				('KG', 'M2')
			and ReportingUnitOfMeasure <> '0'
	)										 mm
		on mm.MATNR = be.MATNR
			and rn = 1
	where
		year(ek.AEDAT) >= '2017'
		and upper(isnull(ekp.LOEKZ, '-99')) <> 'L' --po filter
		and upper(isnull(be.BEWTP, '-99')) = 'E' --gr filter
		and upper(ek.BSART)<>'UB'

)
select	* from	cte where	rn = 1 ;

GO
