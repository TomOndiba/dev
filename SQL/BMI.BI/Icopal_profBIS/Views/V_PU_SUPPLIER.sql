



CREATE view [dbo].[V_PU_SUPPLIER] as
SELECT (cast(sup.SYSTEM_ID as Varchar(10)) + sup.SUPPLIER_CODE) as SUPPLIER_ID, 
       sup.SYSTEM_ID,
       sup.SUPPLIER_CODE,
       sup.SUPPLIER_NAME, 
       sup.ADDRESS1, 
       sup.ADDRESS2, 
       sup.ADDRESS3, 
       sup.ZIPCODE, 
       sup.CITY, 
       sup.COUNTRY, 
       'N' as INTERNAL_SUPPLIER,
       isnull(lsc.SUPPLIER_CATEGORY_ID, fpsi.TEKST) as SUPPLIER_CATEGORY_ID,
	   sup.VAT_NO,
	   sup.NACE_ID
FROM  PU_SUPPLIER as sup
       left outer join
          PU_LINK_SUPPLIER_CATEGORY as lsc on (lsc.SYSTEM_ID     = sup.SYSTEM_ID and
                                               lsc.SUPPLIER_CODE = sup.SUPPLIER_CODE)
       left outer join
          FLEXPARAMS as fpsi on (PARAMTYPE = 'DWH' and
                                 PARAMNAVN = 'SUPPLIER_INDEPENDENT')
where exists (select *
              from PU_PURCHASE as p
              where p.SYSTEM_ID     = sup.SYSTEM_ID and
                    p.SUPPLIER_CODE = sup.SUPPLIER_CODE) or
      exists (select *
              from PU_INDIRECT as i
              where i.SYSTEM_ID     = sup.SYSTEM_ID and
                    i.SUPPLIER_CODE = sup.SUPPLIER_CODE) or
      exists (select *
              from PU_CONTRACTING as c
              where c.SYSTEM_ID     = sup.SYSTEM_ID and
                    c.SUPPLIER_CODE = sup.SUPPLIER_CODE)


union

select 'UNKNOWN' as SUPPLIER_ID,
       0 as SYSTEM_ID,
       'UNKNOWN' as SUPPLIER_CODE,
       'UNKNOWN' as SUPPLIER_NAME,
       '' as ADDRESS1,
       '' as ADDRESS2,
       '' as ADDRESS3, 
       '' as ZIPCODE, 
       '' as CITY, 
       '' as COUNTRY, 
       'N' as INTERNAL_SUPPLIER,
       37071 as SUPPLIER_CATEGORY_ID,
	   ''  as VAT_NO,
	   '999999' as NACE_ID