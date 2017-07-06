

CREATE view [dbo].[V_PU_PURCHASE_RMI] as
--
-- selects PURCHASE transactions to be used in to RMI application
-- 
--
select 
       pu.SYSTEM_ID, pu.INVOICE_DATE, pu.INVOICE_NUMBER, pu.INVOICE_LINE_NUMBER, 
       pu.SUPPLIER_CODE, 
       pu.SUPPLIER_ID, 
       lsc.SUPPLIER_CATEGORY_ID, 
       pu.ORDERING_SITE, 
       pu.SHIP_TO_SITE, 
       pu.INVOICE_TYPE, 
       pu.ITEM_NO, 
       pu.INVOICE_AMOUNT, 
       pu.INVOICE_CURRENCY, 
       pu.INVOICE_AMOUNT_GROUP, 
       pu.INVOICE_AMOUNT_LOCAL, 
       pu.INVOICE_LOCAL_CURRENCY, 
       pu.LOCAL_QUANTITY, 
       pu.LOCAL_UOM, 
       pu.ITEM_NAME, 
       pu.CATEGORY_ID,
       pu.QUANTITY, pu.UOM,
       pg.PRODUCT_GROUP, 
       isnull(uni1.UOM, pg.UOM) as RMI_UOM,
       sit.SBU,
       krb.FREIGHT_BUDGET as FREIGHT_BUDGET_LOCAL
from V_PU_PURCHASE as pu
     join
        PU_LINK_RMI_CATEGORY as lrc on (lrc.CATEGORY_ID = pu.CATEGORY_ID)
     left outer join
        PU_LINK_SUPPLIER_CATEGORY as lsc on (lsc.SYSTEM_ID     = pu.SYSTEM_ID and
                                             lsc.SUPPLIER_CODE = pu.SUPPLIER_CODE)
     join
        MD_PRODUCTGROUPS as pg on (pg.PRODUCT_GROUP = lrc.PRODUCT_GROUP)
     join
        MD_SITE as sit on (sit.SITE_ID = pu.SHIP_TO_SITE)
     left outer join
        KPI_RMI_BUDGET as krb on (krb.SBU           = sit.SBU and
                                  krb.PRODUCT_GROUP = lrc.PRODUCT_GROUP and
                                  krb.BUDGET_YEAR   = Year(pu.INVOICE_DATE))
     join
        MD_UNIT as uni on (uni.UOM = pg.UOM)
     left outer join
        MD_UNIT as uni1 on (uni1.UOM = uni.FACTOR1_UOM)
where pg.UOM_CHECK_ONLY <> 'Y'