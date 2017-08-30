



CREATE view [dbo].[V_PU_PURCHASE] as
-- Faktura og kreditnota 
select p.SYSTEM_ID, 
       p.INVOICE_DATE, 
       p.INVOICE_NUMBER, 
       p.INVOICE_LINE_NUMBER, 
       p.SUPPLIER_CODE,
       isnull((cast(sup.SYSTEM_ID as Varchar(10)) + sup.SUPPLIER_CODE), 'UNKNOWN') as SUPPLIER_ID,
       isnull(lsc.SUPPLIER_CATEGORY_ID, fxus.TEKST) as SUPPLIER_CATEGORY_ID,
       cosite.SITE_ID as ORDERING_SITE, 
       cssite.SITE_ID as SHIP_TO_SITE, 
	   p.SHIP_TO_SITE as LOCAL_DELIVERY_SITE,
       p.SHIP_TO_SITE as SHIP_TO_SITE_NAME,
       p.INVOICE_TYPE, 
       p.ITEM_NO,
       p.INVOICE_AMOUNT, 
       p.INVOICE_CURRENCY, 
       p.INVOICE_AMOUNT_GROUP, 
       p.INVOICE_AMOUNT_LOCAL, 
       p.INVOICE_LOCAL_CURRENCY, 
	   LOCAL_QUANTITY = case p.INVOICE_TYPE 
							when 9 then 0
							else p.LOCAL_QUANTITY
						end, 
--       p.LOCAL_QUANTITY, 
       p.LOCAL_UOM as LOCAL_UOM, 
       itm.ITEM_NAME, 
       itm.ITEM_DESCRIPTION_1, 
       isnull(clink.CATEGORY_ID, fxp.TEKST) as CATEGORY_ID,
       isnull(cpay.PAYMENTTERM_ID, fxup.TEKST) as PAYMENTTERM_ID,
       p.PAYMENT_TERM      as LOCAL_PAYMENTTERM,
       p.PAYMENT_TERM_TEXT as LOCAL_PAYMENTTERMTEXT,
	   QUANTITY = case p.INVOICE_TYPE 
	                 when 9 then 0
					 else p.QUANTITY
		          end, 
--       p.QUANTITY,
       p.UOM,
       p.AGREED_DATE,
       p.AGREED_QUANTITY,
       p.AGREED_UOM,
       p.AGREED_QUANTITY_LOCAL,
       p.AGREED_UOM_LOCAL,
	   p.ORDERED_QUANTITY,
       p.DELIVERY_DATE,
	   p.REQUESTED_DELIVERY_DATE,
       p.DELIVERY_PRECISION,
       p.QUANTITY_PRECISION,
	   p.REQUESTED_DELIVERY_PRECISION,
       dd.DELIVERY_DAY_TEXT as DELIVERY_PRECISION_TEXT,
       dr.DELIVERY_DAY_TEXT as REQUESTED_DELIVERY_PRECISION_TEXT,
       dq.QUANTITY_PCT_TEXT as QUANTITY_PRECISION_TEXT,
       p.BUYER,
       p.COMPLIANCE_ID,
       p.COMPLIANCE_KEPT,
	   p.COMPLIANCE_AMOUNT_LOCAL,
	   p.COMPLIANCE_AMOUNT_GROUP,
       p.PRICELIST_ID,
	   p.PRICELIST_KEPT,
       p.PRICELIST_AMOUNT_LOCAL,
	   p.PRICELIST_AMOUNT_GROUP,
	   isnull(p.UNSPSC_ID, '') UNSPSC_ID,
	   isnull(sup.NACE_ID, '') as NACE_ID,
	   p.PO_NO,
	   p.PO_DATE,
	   p.PO_DATE_CONFIRMED,
	   p.PO_CONFIRMED_WORKDAYS,
	   p.PRECISION_REC
      ,cat.[LEVEL_1_NAME]
      ,cat.[LEVEL_2_NAME]
      ,cat.[LEVEL_3_NAME]
      ,cat.[LEVEL_4_NAME]
      ,cat.[LEVEL_5_NAME]
      ,cat.[LEVEL_6_NAME]
	  ,p.ADDITIONAL_TEXT1
	  ,p.ADDITIONAL_TEXT2
	  ,p.ADDITIONAL_TEXT3
	  ,p.ADDITIONAL_TEXT4
	  ,p.ADDITIONAL_TEXT5
	  ,p.SUPPLIER_ITEM_TEXT
	  ,idx100.LOCAL_AMOUNT as INDEX100_LOCAL_AMOUNT
	  ,idx100.GROUP_AMOUNT as INDEX100_GROUP_AMOUNT
	  ,idx100.QUANTITY     as INDEX100_QUANTITY
	  ,idx100.INDEX100_YEAR
	  ,idx100.INDEX100_MONTH

from PU_PURCHASE as p
       left outer join
         PU_SUPPLIER as sup on (sup.SYSTEM_ID     = p.SYSTEM_ID and
                                sup.SUPPLIER_CODE = p.SUPPLIER_CODE)
       left outer join
         PU_LINK_ITEM as clink on (clink.SYSTEM_ID = p.SYSTEM_ID and
                                   clink.ITEM_NO   = p.ITEM_NO)
	   left outer join
	     MD_ITEMS as itm on (itm.SYSTEM_ID = p.SYSTEM_ID and
		                     itm.ITEM_NO   = p.ITEM_NO)
       left outer join
         PU_LINK_PAYMENTTERM as cpay on (cpay.SYSTEM_ID     = p.SYSTEM_ID and
                                         cpay.PAYMENT_TERM  = p.PAYMENT_TERM)
       left outer join
         PU_LINK_SITE as cosite on (cosite.SYSTEM_ID  = p.SYSTEM_ID and
                                    cosite.LOCAL_SITE = p.ORDERING_SITE)
       join
         PU_LINK_SITE as cssite on (cssite.SYSTEM_ID  = p.SYSTEM_ID and
                                    cssite.LOCAL_SITE = p.SHIP_TO_SITE)
       left outer join
         PU_LINK_SUPPLIER_CATEGORY as lsc on (lsc.SYSTEM_ID     = p.SYSTEM_ID and
                                              lsc.SUPPLIER_CODE = p.SUPPLIER_CODE)
       join
         FLEXPARAMS as fxp on (fxp.PARAMTYPE = 'DWH' and 
                               fxp.PARAMNAVN = 'CAT_UNMAPPED')
       join
         FLEXPARAMS as fxup on (fxup.PARAMTYPE = 'DWH' and 
                                fxup.PARAMNAVN = 'PAYMENT_UNMAPPED')
       join
         FLEXPARAMS as fxus on (fxus.PARAMTYPE = 'DWH' and 
                                fxus.PARAMNAVN = 'SUPPLIER_INDEPENDENT')
       left outer join
         PU_LINK_UOM as plu on (plu.SYSTEM_ID = p.SYSTEM_ID and
                                plu.LOCAL_UOM = p.LOCAL_UOM)
       left outer join
         PU_DELIVERY_DAYS as dd on (p.DELIVERY_PRECISION >= dd.DELIVERY_DAY_START and
                                    p.DELIVERY_PRECISION <= dd.DELIVERY_DAY_END)
       left outer join
         PU_DELIVERY_DAYS as dr on (p.REQUESTED_DELIVERY_PRECISION >= dr.DELIVERY_DAY_START and
                                    p.REQUESTED_DELIVERY_PRECISION <= dr.DELIVERY_DAY_END)
       left outer join
         PU_DELIVERY_QUANTITY as dq on (p.QUANTITY_PRECISION >= dq.QUANTITY_PCT_START and
                                        p.QUANTITY_PRECISION <= dq.QUANTITY_PCT_END)
       join
         MD_SITE as msite on (msite.SITE_ID = cssite.SITE_ID)
       join
         MD_SBU as sbu on (sbu.SBU              = msite.SBU and
                           sbu.IPROBIS_PURCHASE = 'Y')
	   left outer join
	     PU_CATEGORY as cat on (cat.CATEGORY_ID = clink.CATEGORY_ID) 
	   left outer join
	     PU_INDEX100 as Idx100 on (idx100.SYSTEM_ID     = p.SYSTEM_ID and
		                           idx100.ITEM_NO       = p.ITEM_NO and
								   idx100.SUPPLIER_CODE = p.SUPPLIER_CODE)
where p.INVOICE_TYPE in (1, 2, 4, 9) and
      p.INVOICE_DATE >= (select TEKST
                         from FLEXPARAMS
                         where PARAMTYPE = 'DWH' and
                               PARAMNAVN = 'DATA_START_DATE') 
and not exists (select *
                from PU_PURCHASE_EXCEPTIONS pex
                where pex.SYSTEM_ID           = p.SYSTEM_ID and
                      pex.INVOICE_DATE        = p.INVOICE_DATE and
                      pex.INVOICE_NUMBER      = p.INVOICE_NUMBER and
                      pex.INVOICE_LINE_NUMBER = p.INVOICE_LINE_NUMBER and
                      pex.SUPPLIER_CODE       = p.SUPPLIER_CODE)
and
Upper(p.ITEM_NO) <> 'FREIGHT' and Upper(p.ITEM_NO) <> 'DUTY'
and
not cssite.SITE_ID in (366, 367, 368)