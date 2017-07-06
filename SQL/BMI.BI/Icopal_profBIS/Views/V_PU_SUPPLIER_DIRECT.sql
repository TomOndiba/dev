




CREATE view [dbo].[V_PU_SUPPLIER_DIRECT] as 
select sup.SYSTEM_ID,
       sup.SUPPLIER_CODE,
--       sit.SBU + ' - ' + sup.SUPPLIER_NAME as SUPPLIER_NAME,
       sup.SUPPLIER_NAME,
       isnull(lsc.SUPPLIER_CATEGORY_ID, fpsi.TEKST) as SUPPLIER_CATEGORY_ID,
--       sit.SBU + '-' + sup.SUPPLIER_CODE as SBU_SUPPLIER_CODE
       sup.SUPPLIER_CODE as SBU_SUPPLIER_CODE,
	   isnull(sup.NACE_ID, '') as NACE_ID,
	   sup.VAT_NO,
	   sup.ZIPCODE,
	   sup.CITY
from V_PU_PURCHASE as p
       join
         MD_SITE as sit on (sit.SITE_ID = p.SHIP_TO_SITE)
       join
         PU_SUPPLIER as sup on (sup.SYSTEM_ID     = p.SYSTEM_ID and
                                sup.SUPPLIER_CODE = p.SUPPLIER_CODE)
       left outer join
         PU_LINK_SUPPLIER_CATEGORY as lsc on (lsc.SYSTEM_ID     = p.SYSTEM_ID and
                                              lsc.SUPPLIER_CODE = p.SUPPLIER_CODE)
       join
          FLEXPARAMS as fpsi on (PARAMTYPE = 'DWH' and
                                 PARAMNAVN = 'SUPPLIER_INDEPENDENT')       
group by sup.SYSTEM_ID,
         sup.SUPPLIER_CODE,
         sup.SUPPLIER_NAME,
--         sit.SBU + ' - ' + sup.SUPPLIER_NAME,
         lsc.SUPPLIER_CATEGORY_ID,
         fpsi.TEKST,
--         sit.SBU + '-' + sup.SUPPLIER_CODE
         sup.SUPPLIER_CODE,
		 sup.NACE_ID,
		 sup.VAT_NO,
	     sup.ZIPCODE,
	     sup.CITY