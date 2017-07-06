


CREATE view [dbo].[V_AMM_RMI] as 
select md.SBU, 
       md.AMM_YEAR, 
       md.AMM_MONTH, 
       md.AMM_GROUP_ID, 
       md.AMM_INDEX, 
       md.AMM_SPEND      as GROUP_SPEND_MONTH, 
       md.ACTUAL_SPEND, 
       md.ACTUAL_QUANTITY,
       md.AMM_PRICE      as MONTH_PRICE,
       yd.AMM_PCT, 
       yd.AMM_SPEND      as GROUP_SPEND_YEAR,
       yd.AMM_PRICE      as BASELINE_PRICE,
       yd.PRICE_SPEND    as BASELINE_SPEND,
       yd.PRICE_QUANTITY as BASELINE_QUANTITY,
       gr.DATA_ENTRY, 
       gr.AMM_GROUP,
       gr.SORT_NO
from AMM_MONTHDATA as md
       join
         MD_SBU as sb on (sb.SBU = md.SBU)
       join
         MD_AMM_GROUP as gr on (gr.AMM_GROUP_ID = md.AMM_GROUP_ID)
       join
         AMM_YEARDATA as yd on (yd.AMM_GROUP_ID = md.AMM_GROUP_ID and
                                yd.AMM_YEAR     = (YEAR(GetDate())-1) and  
                                yd.SBU          = md.SBU)
where (md.AMM_YEAR < Year(GetDate()) or 
      (md.AMM_YEAR = Year(GetDate()) and md.AMM_MONTH <= Month(GetDate()))) and
      sb.IPROBIS_AMM = 'Y'