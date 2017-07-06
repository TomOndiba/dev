create view [dbo].[V_MD_SITE] as 
select SITE_ID, NAME as SITE_NAME, SBU, SYSTEM_ID, SITE_DESCRIPTION
from MD_SITE