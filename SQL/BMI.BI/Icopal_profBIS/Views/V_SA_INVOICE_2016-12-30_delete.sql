

CREATE view [dbo].[V_SA_INVOICE_2016-12-30_delete] as 
select inv.SYSTEM_ID, 
       inv.INVOICE_DATE, 
       inv.INVOICE_NUMBER, 
       inv.INVOICE_LINE_NUMBER, 
       inv.SHIP_TO,
	   inv.SOLD_TO,
       inv.SITE_SOLD, 
       ssite.SITE_ID,
       inv.INVOICE_TYPE, 
       inv.ITEM_NO as ITEM_NO,
	   inv.INVOICE_AMOUNT, 
       inv.INVOICE_CURRENCY, 
       inv.GROUP_AMOUNT, 
       inv.LOCAL_AMOUNT, 
       inv.LOCAL_CURRENCY, 
	   inv.LINE_DISCOUNT_AMOUNT,
	   inv.INVOICE_DISCOUNT_AMOUNT,
	   inv.LINE_BONUS_AMOUNT,
	   inv.BONUS_SHARE_AMOUNT,
	   inv.STD_COST,
	   inv.STD_FREIGHT,
	   inv.STATISTIC_QUANTITY,
	   inv.STATISTIC_UOM,
	   inv.INVOICE_QUANTITY,
	   inv.INVOICE_UOM,
	   inv.QUANTITY,
	   inv.UOM,
       isnull(cpay.PAYMENTTERM_ID, fxup.TEKST) as PAYMENTTERM_ID,
       inv.PAYMENT_TERM                        as LOCAL_PAYMENTTERM,
       inv.PAYMENT_TERM_TEXT                   as LOCAL_PAYMENTTERMTEXT,
	   inv.SALESPERSON_ID,
	   inv.SALESPERSON_NAME,
	   isnull(lic.ITEM_CATEGORY_ID, fxi.TEKST) as ITEM_CATEGORY_ID,
	   sbu.SBU,
	   lec.ENV_CATEGORY_ID
from sa_INVOICE as inv
       left outer join
         PU_LINK_PAYMENTTERM as cpay on (cpay.SYSTEM_ID     = inv.SYSTEM_ID and
                                         cpay.PAYMENT_TERM  = inv.PAYMENT_TERM)
       join
         PU_LINK_SITE as ssite on (ssite.SYSTEM_ID  = inv.SYSTEM_ID and
                                   ssite.LOCAL_SITE = inv.SITE_SOLD)
       join
         MD_SITE as msite on (msite.SITE_ID = ssite.SITE_ID)
       join
         MD_SBU as sbu on (sbu.SBU   = msite.SBU and
                           sbu.SABIS = 'Y')
       join
         FLEXPARAMS as fxup on (fxup.PARAMTYPE = 'DWH' and 
                                fxup.PARAMNAVN = 'PAYMENT_UNMAPPED')
       left outer join
         FLEXPARAMS as fxne on (fxne.PARAMTYPE = 'DWH' and 
                                fxne.PARAMNAVN = 'SALES_NOT_QLIKVIEW')
	   left outer join
	     FLEXPARAMS as fxi on (fxi.PARAMTYPE = 'DWH' and
	                           fxi.PARAMNAVN = 'SA_UNMAPPED_ITEM')	   
	   left outer join
         PU_LINK_UOM as plu on (plu.SYSTEM_ID = inv.SYSTEM_ID and
                                plu.LOCAL_UOM = inv.UOM)
	   left outer join
	     SA_LINK_ITEM as lic on (lic.SYSTEM_ID = inv.SYSTEM_ID and
		                         lic.ITEM_NO   = inv.ITEM_NO)
	   left outer join
	     SA_LINK_ENV as lec on (lec.SYSTEM_ID = inv.SYSTEM_ID and
		                        lec.ITEM_NO   = inv.ITEM_NO)
where inv.INVOICE_TYPE in (1, 2) and
      isnull(lic.ITEM_CATEGORY_ID, -1) <> isnull(fxne.TEKST, -2) and      
      inv.INVOICE_DATE >= (select TEKST
                           from FLEXPARAMS
                            where PARAMTYPE = 'DWH' and
                                  PARAMNAVN = 'DATA_START_DATE')