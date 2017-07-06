CREATE view [dbo].[V_UNMAPPED_SUPPLIERS] as
select s.SBU, Count(Distinct(p.SUPPLIER_CODE)) as UNMAPPED_COUNT
from PU_PURCHASE as p
	   join
         PU_LINK_SITE as ls on (ls.SYSTEM_ID  = p.SYSTEM_ID and
                                ls.LOCAL_SITE = p.SHIP_TO_SITE)
       join
         MD_SITE as s on (s.SITE_ID = ls.SITE_ID)
where not exists(select *
                 from PU_SUPPLIER as ls
                 where ls.SYSTEM_ID     = p.SYSTEM_ID and
                       ls.SUPPLIER_CODE = p.SUPPLIER_CODE)
group by s.SBU