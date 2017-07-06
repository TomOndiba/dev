

CREATE view [dbo].[V_AMM_DATA1] as 
select sb.IPROBIS_AMM_NAME as SBU, 
       md.AMM_YEAR, 
       md.AMM_MONTH, 
       md.AMM_GROUP_ID, 
       md.AMM_INDEX, 
       md.AMM_SPEND      as GROUP_SPEND_MONTH, 
       md.ACTUAL_SPEND, 
       md.ACTUAL_QUANTITY,
       md.AMM_PRICE      as MONTH_PRICE,
       yd.AMM_PCT, 
       gr.DATA_ENTRY, 
       gr.AMM_GROUP,
       gr.SORT_NO,
	   ty.AMM_TYPE_ID,
	   ty.AMM_TYPE_NAME,
	   reg.REGION as REGION_NAME
from AMM_MONTHDATA as md
       join
         MD_SBU as sb on (sb.SBU = md.SBU)
       join
         MD_REGION as reg on (reg.REGION_ID = sb.REGION_ID)
       join
         MD_AMM_GROUP as gr on (gr.AMM_GROUP_ID = md.AMM_GROUP_ID)
       join
         MD_AMM_TYPE as ty on (ty.AMM_TYPE_ID = gr.AMM_TYPE_ID)
       join
         AMM_YEARDATA as yd on (yd.AMM_GROUP_ID = md.AMM_GROUP_ID and
                                yd.AMM_YEAR     = (YEAR(GetDate())-1) and    
                                yd.SBU          = md.SBU)
where (md.AMM_YEAR < Year(GetDate()) or 
      (md.AMM_YEAR = Year(GetDate()) and md.AMM_MONTH <= Month(GetDate()))) and
      ((sb.IPROBIS_AMM     = 'Y' and gr.AMM_TYPE_ID = 1) or
       (sb.IPROBIS_AMM_PVC = 'Y' and gr.AMM_TYPE_ID = 2))