
create view [dbo].[V_MD_SBU_CRM] as
select s.SBU, s.REGION_ID, s.SBU_NAME, r.REGION
from MD_SBU as s
       left outer join
	     MD_REGION as r on (r.REGION_ID = s.REGION_ID)
where s.CRM_SYSTEM = 'Y'