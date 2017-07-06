create view [dbo].[V_UNMAPPED_COUNTRIES] as
--
-- Tæl antal Lande der ikke er Mapped
--
select su.SYSTEM_ID, su.COUNTRY,
       Count(*) as UnmapCountryCount
from PU_SUPPLIER as su
where not exists(select *
                 from PU_LINK_COUNTRY as lc
                 where lc.SYSTEM_ID = su.SYSTEM_ID and
                       lc.COUNTRY   = su.COUNTRY)
group by su.SYSTEM_ID, su.COUNTRY