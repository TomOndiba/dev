


CREATE view [dbo].[V_AMM_PRICE_TRACKING] as 
select sb.IPROBIS_AMM_NAME    as SBU, 
       YEAR(pu.INVOICE_DATE)  as INVOICE_YEAR, 
       MONTH(pu.INVOICE_DATE) as INVOICE_MONTH, 
       gr.AMM_GROUP_ID,
       gr.SORT_NO,
       SUM(INVOICE_AMOUNT_GROUP) as AMOUNT_GROUP,
       SUM(INVOICE_AMOUNT_LOCAL) as AMOUNT_LOCAL,
       pu.INVOICE_LOCAL_CURRENCY as LOCAL_CURRENCY,
       SUM(QUANTITY)             as QUANTITY,
	   flx.TEKST                 as Index100_Year
from V_PU_PURCHASE as pu
       join
          MD_SITE as sit on (sit.SITE_ID = pu.SHIP_TO_SITE)
       join
          MD_SBU as sb on (sb.SBU = sit.SBU)
       join
          PU_LINK_AMM_CATEGORY as lac on (lac.CATEGORY_ID = pu.CATEGORY_ID)
       join
          MD_AMM_GROUP as gr on (gr.AMM_GROUP_ID = lac.AMM_GROUP_ID and
                                 gr.DATA_ENTRY   = 'N')
  	   join
	      FLEXPARAMS as flx on (flx.PARAMTYPE = 'DWH' and
		                        flx.PARAMNAVN = 'AMM_INDEX100_YEAR')
where (sb.IPROBIS_AMM     = 'Y' and gr.AMM_TYPE_ID = 1) or 
      (sb.IPROBIS_AMM_PVC = 'Y' and gr.AMM_TYPE_ID = 2)
group by sb.IPROBIS_AMM_NAME, YEAR(pu.INVOICE_DATE), MONTH(pu.INVOICE_DATE), gr.AMM_GROUP_ID, gr.SORT_NO, pu.INVOICE_LOCAL_CURRENCY,
         flx.TEKST