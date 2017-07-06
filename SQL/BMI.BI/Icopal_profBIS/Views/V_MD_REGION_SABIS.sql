



CREATE view [dbo].[V_MD_REGION_SABIS] as 
select re.REGION_ID, 
       re.REGION as REGION_NAME, 
	   re.REGION_DESCRIPTION
from MD_REGION as re with (nolock)
       join
         V_MD_SBU_SABIS as sc on (sc.REGION_ID = re.REGION_ID)
group by re.REGION_ID, re.REGION, re.REGION_DESCRIPTION