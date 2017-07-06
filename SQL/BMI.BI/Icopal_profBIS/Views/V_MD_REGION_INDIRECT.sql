
create view [dbo].[V_MD_REGION_INDIRECT] as 
select re.REGION_ID, re.REGION as REGION_NAME, re.REGION_DESCRIPTION
from MD_REGION as re
       join
         V_MD_SBU_INDIRECT as sc on (sc.REGION_ID = re.REGION_ID)
group by re.REGION_ID, re.REGION, re.REGION_DESCRIPTION