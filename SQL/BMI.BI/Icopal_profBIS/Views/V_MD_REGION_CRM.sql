
create view [dbo].[V_MD_REGION_CRM] as
select re.REGION_ID,
       re.REGION,
	   re.REGION_DESCRIPTION
from MD_REGION as re
       join
	     V_MD_SBU_CRM as sc on (sc.REGION_ID = re.REGION_ID)