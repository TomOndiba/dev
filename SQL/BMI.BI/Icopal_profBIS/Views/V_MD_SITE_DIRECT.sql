

CREATE view [dbo].[V_MD_SITE_DIRECT] as 
select sit.SITE_ID, 
--       sit.NAME as SITE_NAME, 
       sit.PROCUREMENT_NAME as SITE_NAME, 
	   sit.SBU, 
	   sit.SITE_DESCRIPTION,
	   sit.COUNTRY,
	   lc.COMPANY_CATEGORY_ID
from MD_SITE as sit
       left outer join
	      MD_LINK_COMPANY as lc on (lc.SITE_ID = sit.SITE_ID)
       join
          V_MD_SBU_DIRECT as sc on (sc.SBU = sit.SBU)