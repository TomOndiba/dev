
create view [dbo].[V_UNMAPPED_ACCOUNTS_SBU] as
select s.SBU, Count(Distinct(i.ACCOUNT_NO)) as UNMAPPED_COUNT
from PU_INDIRECT as i
       join
         PU_LINK_SITE as ls on (ls.SYSTEM_ID  = i.SYSTEM_ID and
                                ls.LOCAL_SITE = i.SITE)
       join
         MD_SITE as s on (s.SITE_ID = ls.SITE_ID)
where not exists(select *
                 from PU_LINK_ACCOUNT as lc
                 where lc.SYSTEM_ID     = i.SYSTEM_ID and
                       lc.ACCOUNT_NO    = i.ACCOUNT_NO)
group by s.SBU