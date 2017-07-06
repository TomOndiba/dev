
CREATE view [dbo].[V_UNMAPPED_ACCOUNTS] as
select i.SYSTEM_ID, Count(Distinct(i.ACCOUNT_NO)) as UNMAPPED_COUNT
from PU_INDIRECT as i
where not exists(select *
                 from PU_LINK_ACCOUNT as lc
                 where lc.SYSTEM_ID     = i.SYSTEM_ID and
                       lc.ACCOUNT_NO    = i.ACCOUNT_NO)
group by i.SYSTEM_ID