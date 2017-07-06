

create view [dbo].[V_MD_SITE_CONTRACTING] as 
select sit.SITE_ID, sit.NAME as SITE_NAME, sit.SBU, sit.SYSTEM_ID, sit.SITE_DESCRIPTION
from MD_SITE as sit
     join
        V_MD_SBU_CONTRACTING as sc on (sc.SBU = sit.SBU)