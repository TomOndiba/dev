




CREATE view [dbo].[V_MD_SITE_SABIS] as 
select sit.SITE_ID, 
	   sit.NAME as SITE_NAME, 
	   sit.SBU,
	   sc.SALESCENTER_SBU, 
	   sit.SYSTEM_ID, 
	   sit.SITE_DESCRIPTION
from MD_SITE as sit with (nolock)
     join
        V_MD_SBU_SABIS as sc on (sc.SBU = sit.SBU)