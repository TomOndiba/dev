CREATE view [dbo].[V_UNMAPPED_MATERIALS_SBU] as
select s.SBU, Count(Distinct(p.ITEM_NO)) as UNMAPPED_COUNT
from PU_PURCHASE as p
       join
         PU_LINK_SITE as ls on (ls.SYSTEM_ID  = p.SYSTEM_ID and
                                ls.LOCAL_SITE = p.SHIP_TO_SITE)
       join
         MD_SITE as s on (s.SITE_ID = ls.SITE_ID)
where not exists(select *
                 from PU_LINK_ITEM as lc
                 where lc.SYSTEM_ID     = p.SYSTEM_ID and
                       lc.ITEM_NO       = p.ITEM_NO) and
      not p.ITEM_NO in ('FREIGHT', 'DUTY')
group by s.SBU