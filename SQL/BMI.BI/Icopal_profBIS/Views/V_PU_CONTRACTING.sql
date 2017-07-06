


CREATE view [dbo].[V_PU_CONTRACTING] as
-- Faktura og kreditnota
select c.SYSTEM_ID, 
       c.INVOICE_DATE, 
       c.INVOICE_NUMBER, 
       c.INVOICE_LINE_NUMBER, 
       c.INVOICE_TYPE, 
       c.SUPPLIER_CODE,
       isnull((cast(sup.SYSTEM_ID as Varchar(10)) + sup.SUPPLIER_CODE), 'UNKNOWN') as SUPPLIER_ID,
       cosite.SITE_ID as SITE_ID,
       c.ACCOUNT_NO as LOCAL_ACCOUNT_ID,
       c.ACCOUNT_NAME as LOCAL_ACCOUNT_NAME,
       c.DEPARTMENT_NO as LOCAL_DEPARTMENT_ID,
       c.DEPARTMENT_NAME as LOCAL_DEPARTMENT_NAME,
       c.PROJECT_ELEMENT as LOCAL_PROJECT_ELEMENT,
       c.PROJECT_ELEMENT_NAME as LOCAL_PROJECT_ELEMENT_NAME,
       c.JOB_NO, 
       c.INVOICE_AMOUNT, c.INVOICE_CURRENCY, 
       c.INVOICE_AMOUNT_GROUP, 
       c.INVOICE_AMOUNT_LOCAL as LOCAL_INVOICE_AMOUNT,
       c.INVOICE_LOCAL_CURRENCY as LOCAL_INVOICE_CURRENCY,
       isnull(clink.CATEGORY_ID, fxp.TEKST) as CATEGORY_ID,
       isnull(cpay.PAYMENTTERM_ID, fxup.TEKST) as PAYMENTTERM_ID,
       c.PAYMENT_TERM as LOCAL_PAYMENTTERM,
       c.PAYMENT_TERM_TEXT as LOCAL_PAYMENTTERMTEXT,
       isnull(lsc.SUPPLIER_CATEGORY_ID, fxus.TEKST) as SUPPLIER_CATEGORY_ID
from PU_CONTRACTING as c
       left outer join
         PU_SUPPLIER as sup on (sup.SYSTEM_ID     = c.SYSTEM_ID and
                                sup.SUPPLIER_CODE = c.SUPPLIER_CODE)
       left outer join
         PU_LINK_SUPPLIER_CATEGORY as lsc on (lsc.SYSTEM_ID     = c.SYSTEM_ID and
                                              lsc.SUPPLIER_CODE = c.SUPPLIER_CODE)
       left outer join
         PU_LINK_ELEMENT as clink on (clink.SYSTEM_ID       = c.SYSTEM_ID and
                                      clink.PROJECT_ELEMENT = c.PROJECT_ELEMENT)
       left outer join
         PU_LINK_PAYMENTTERM as cpay on (cpay.SYSTEM_ID     = c.SYSTEM_ID and
                                         cpay.PAYMENT_TERM  = c.PAYMENT_TERM)
       left outer join
         PU_LINK_SITE as cosite on (cosite.SYSTEM_ID  = c.SYSTEM_ID and
                                    cosite.LOCAL_SITE = c.SITE)
       left outer join
         FLEXPARAMS as fxp on (fxp.PARAMTYPE = 'DWH' and 
                               fxp.PARAMNAVN = 'CONTRACTING_UNMAPPED')
       join
         FLEXPARAMS as fxup on (fxup.PARAMTYPE = 'DWH' and 
                                fxup.PARAMNAVN = 'PAYMENT_UNMAPPED')
       left outer join
         FLEXPARAMS as fxsi on (fxsi.PARAMTYPE = 'DWH' and 
                                fxsi.PARAMNAVN = 'SUPPLIER_INTERNAL')
       join
         FLEXPARAMS as fxus on (fxus.PARAMTYPE = 'DWH' and 
                                fxus.PARAMNAVN = 'SUPPLIER_INDEPENDENT')
where isnull(lsc.SUPPLIER_CATEGORY_ID, -1) <> Cast(isnull(fxsi.TEKST, 0) as Integer) and
     c.INVOICE_DATE >= (select TEKST
                         from FLEXPARAMS
                         where PARAMTYPE = 'DWH' and
                               PARAMNAVN = 'DATA_START_DATE')