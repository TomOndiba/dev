
create view [dbo].[V_PU_MAPRATE_INDIRECT] as
select sit.SBU,
       isnull(ua.UNMAPPED_COUNT, 0) as UnmappedAccounts,
       isnull(ma.MAPPED_COUNT, 0) as MappedAccounts
from MD_SITE as sit
       join
         V_MD_SBU_INDIRECT as sc on (sc.SBU = sit.SBU)
       left outer join
         V_UNMAPPED_ACCOUNTS_SBU as ua on (ua.SBU = sit.SBU)
       left outer join
         V_MAPPED_ACCOUNTS as ma on (ma.SBU = sit.SBU)
group by sit.SBU, 
         ua.UNMAPPED_COUNT, 
         ma.MAPPED_COUNT