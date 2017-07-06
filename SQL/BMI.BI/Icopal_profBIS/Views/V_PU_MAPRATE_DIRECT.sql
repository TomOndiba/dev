
create view [dbo].[V_PU_MAPRATE_DIRECT] as
select sit.SBU,
       isnull(um.UNMAPPED_COUNT, 0) as UnmappedMaterials,
       isnull(mm.MAPPED_COUNT, 0) as MappedMaterials
from MD_SITE as sit
       join
         V_MD_SBU_DIRECT as sc on (sc.SBU = sit.SBU)
       left outer join
         V_UNMAPPED_MATERIALS_SBU as um on (um.SBU = sit.SBU)
       left outer join
         V_MAPPED_MATERIALS as mm on (mm.SBU = sit.SBU)
group by sit.SBU, 
         um.UNMAPPED_COUNT,
         mm.MAPPED_COUNT