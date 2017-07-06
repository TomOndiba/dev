create view [dbo].[V_SCM_ORGANIZATION] as
select pro.PRODLINE_ID, 
	   pro.PRODLINE_NAME, 
       pl.PLANT_ID,
	   pl.PLANT_NAME,
	   sb.SBU,
	   reg.REGION_ID,
	   reg.REGION
from MD_PLANT_PRODLINE as pro
       join
	     MD_PLANT as pl on (pl.PLANT_ID = pro.PLANT_ID)
	   join
	     MD_SBU as sb on (sb.SBU = pl.SBU)
	   join
	     MD_REGION as reg on (reg.REGION_ID = sb.REGION_ID)