CREATE view [dbo].[V_MD_REGION_DIRECT] as 
select re.REGION_ID, re.REGION as REGION_NAME, re.REGION_DESCRIPTION
from MD_REGION as re
       join
         V_MD_SBU_DIRECT as sc on (sc.REGION_ID = re.REGION_ID)
group by re.REGION_ID, re.REGION, re.REGION_DESCRIPTION