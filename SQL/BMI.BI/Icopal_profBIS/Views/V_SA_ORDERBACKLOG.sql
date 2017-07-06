





CREATE view [dbo].[V_SA_ORDERBACKLOG] as
select obl.SYSTEM_ID, 
       obl.EXPECTED_INVOICE_DATE, 
       obl.ORDER_NUMBER, 
       obl.ORDER_LINE_NUMBER, 
       obl.SHIP_TO,
	   obl.SOLD_TO,
       obl.SITE_SOLD, 
       ssite.SITE_ID,
       obl.ORDER_TYPE, 
       obl.ITEM_NO as ITEM_NO,
	   obl.ORDER_AMOUNT, 
       obl.ORDER_CURRENCY, 
       obl.GROUP_AMOUNT, 
       obl.LOCAL_AMOUNT, 
       obl.LOCAL_CURRENCY, 
	   obl.LINE_DISCOUNT_AMOUNT,
	   obl.ORDER_DISCOUNT_AMOUNT,
	   obl.LINE_BONUS_AMOUNT,
	   obl.BONUS_SHARE_AMOUNT,
	   obl.STATISTIC_QUANTITY,
	   obl.STATISTIC_UOM,
	   obl.ORDER_QUANTITY,
	   obl.ORDER_UOM,
	   obl.QUANTITY,
	   obl.UOM,
	   obl.SALESPERSON_ID,
	   obl.SALESPERSON_NAME,
	   RTrim(LTrim(Cast(obl.SYSTEM_ID as VarChar(10)))) + '|' + obl.ITEM_NO as ITEM_CATEGORY_ID,
	   RTrim(LTrim(Cast(obl.SYSTEM_ID as VarChar(10)))) + '|' + obl.SHIP_TO as CUSTOMER_CATEGORY_ID,
	   sbu.SBU,
	   lec.ENV_CATEGORY_ID
from sa_ORDER_BACKLOG as obl with (nolock)
       join
         PU_LINK_SITE as ssite with (nolock) on (ssite.SYSTEM_ID  = obl.SYSTEM_ID and
                                   ssite.LOCAL_SITE = obl.SITE_SOLD)
       join
         MD_SITE as msite with (nolock) on (msite.SITE_ID = ssite.SITE_ID)
       join
         MD_SBU as sbu with (nolock) on (sbu.SBU   = msite.SBU and
                           sbu.SABIS = 'Y')
       join
         FLEXPARAMS as fxup with (nolock) on (fxup.PARAMTYPE = 'DWH' and 
                                fxup.PARAMNAVN = 'PAYMENT_UNMAPPED')
       left outer join
         FLEXPARAMS as fxne with (nolock) on (fxne.PARAMTYPE = 'DWH' and 
                                fxne.PARAMNAVN = 'SALES_NOT_QLIKVIEW')
       left outer join
         FLEXPARAMS as fxnc with (nolock) on (fxnc.PARAMTYPE = 'DWH' and 
                                fxnc.PARAMNAVN = 'CUSTOMER_NOT_EXPORTED')
	   left outer join
         PU_LINK_UOM as plu with (nolock) on (plu.SYSTEM_ID = obl.SYSTEM_ID and
                                plu.LOCAL_UOM = obl.UOM)
	   left outer join
	     SA_LINK_ITEM as lic with (nolock) on (lic.SYSTEM_ID = obl.SYSTEM_ID and
		                         lic.ITEM_NO   = obl.ITEM_NO)
	   left outer join
	     SA_LINK_ENV as lec with (nolock) on (lec.SYSTEM_ID = obl.SYSTEM_ID and
		                        lec.ITEM_NO   = obl.ITEM_NO)
	   left outer join
	     SA_LINK_CUSTOMER as lis with (nolock) on (lis.SYSTEM_ID   = obl.SYSTEM_ID and
		                             lis.CUSTOMER_NO = obl.SHIP_TO)
where obl.ORDER_TYPE in (1, 2) and
      isnull(lic.ITEM_CATEGORY_ID, -1)     <> isnull(fxne.TEKST, -2) and      
      isnull(lis.CUSTOMER_CATEGORY_ID, -1) <> isnull(fxnc.TEKST, -2) and      
      obl.EXPECTED_INVOICE_DATE >= (select TEKST
                           from FLEXPARAMS with (nolock) 
                            where PARAMTYPE = 'DWH' and
                                  PARAMNAVN = 'DATA_START_DATE')