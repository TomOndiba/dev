

CREATE view [dbo].[V_UNMAPPED_UOM] as
--
-- Tæl antal Enheder der ikke er Mapped
--
select SYSTEM_ID, UOM, sum(UnmapUOMCount) as UnmapUOMCount
from (
select purch.SYSTEM_ID, purch.LOCAL_UOM as UOM, Count(*) as UnmapUOMCount
from PU_PURCHASE as purch with (nolock)
where not exists(select *
                 from PU_LINK_UOM as lu with (nolock)
                 where lu.SYSTEM_ID = purch.SYSTEM_ID and
                       lu.LOCAL_UOM = purch.LOCAL_UOM)
group by purch.SYSTEM_ID, purch.LOCAL_UOM 

union

select purch.SYSTEM_ID, purch.AGREED_UOM_LOCAL as UOM, Count(*) as UnmapUOMCount
from PU_PURCHASE as purch with (nolock)
where not exists(select *
                 from PU_LINK_UOM as lu with (nolock)
                 where lu.SYSTEM_ID = purch.SYSTEM_ID and
                       lu.LOCAL_UOM = purch.AGREED_UOM_LOCAL)
group by purch.SYSTEM_ID, purch.AGREED_UOM_LOCAL 

union

select sa.SYSTEM_ID, sa.STATISTIC_UOM as UOM, Count(*) as UnmapUOMCount
from SA_INVOICE as sa with (nolock)
where not exists (select *
                 from PU_LINK_UOM as lu with (nolock)
                 where lu.SYSTEM_ID = sa.SYSTEM_ID and
                       lu.LOCAL_UOM = sa.STATISTIC_UOM)
group by sa.SYSTEM_ID, sa.STATISTIC_UOM) as xx
group by SYSTEM_ID, UOM