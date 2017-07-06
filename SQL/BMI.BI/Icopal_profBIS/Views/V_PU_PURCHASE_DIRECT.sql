


CREATE view [dbo].[V_PU_PURCHASE_DIRECT] as 
select p.*,
--       sit.SBU + '-' + p.SUPPLIER_CODE as SBU_SUPPLIER_CODE
       p.SUPPLIER_CODE as SBU_SUPPLIER_CODE
from V_PU_PURCHASE as p
       left outer join
         MD_SITE as sit on (sit.SITE_ID = p.SHIP_TO_SITE)