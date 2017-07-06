

CREATE view [dbo].[V_PU_INDIRECT] as
-- Faktura og kreditnota
select i.SYSTEM_ID, 
       i.INVOICE_DATE, 
       i.INVOICE_NUMBER, 
       i.INVOICE_LINE_NUMBER, 
       i.INVOICE_TYPE, 
       i.SUPPLIER_CODE,
       isnull((cast(sup.SYSTEM_ID as Varchar(10)) + sup.SUPPLIER_CODE), 'UNKNOWN') as SUPPLIER_ID,
       cosite.SITE_ID as SITE_ID,
       i.ACCOUNT_NO as LOCAL_ACCOUNT_NO,
       i.LOCAL_ACCOUNT_NAME,
       i.DEPARTMENT_NO as LOCAL_DEPARTMENT_ID,
       i.DEPARTMENT_NAME as LOCAL_DEPARTMENT_NAME,
       i.INVOICE_AMOUNT, i.INVOICE_CURRENCY, 
       i.INVOICE_AMOUNT_GROUP, 
       i.INVOICE_AMOUNT_LOCAL as LOCAL_INVOICE_AMOUNT,
       i.INVOICE_LOCAL_CURRENCY as LOCAL_INVOICE_CURRENCY,
       isnull(clink.CATEGORY_ID, fxp.TEKST) as CATEGORY_ID,
       isnull(cpay.PAYMENTTERM_ID, fxup.TEKST) as PAYMENTTERM_ID,
       i.PAYMENT_TERM as LOCAL_PAYMENTTERM,
       i.PAYMENT_TERM_TEXT as LOCAL_PAYMENTTERMTEXT,
       isnull(lsc.SUPPLIER_CATEGORY_ID, fxus.TEKST) as SUPPLIER_CATEGORY_ID
from PU_INDIRECT as i
       left outer join
         PU_SUPPLIER as sup on (sup.SYSTEM_ID     = i.SYSTEM_ID and
                                sup.SUPPLIER_CODE = i.SUPPLIER_CODE)
       left outer join
         PU_LINK_ACCOUNT as clink on (clink.SYSTEM_ID  = i.SYSTEM_ID and
                                      clink.ACCOUNT_NO = i.ACCOUNT_NO)
       left outer join
         PU_LINK_PAYMENTTERM as cpay on (cpay.SYSTEM_ID     = i.SYSTEM_ID and
                                         cpay.PAYMENT_TERM  = i.PAYMENT_TERM)
       left outer join
         PU_LINK_SITE as cosite on (cosite.SYSTEM_ID  = i.SYSTEM_ID and
                                    cosite.LOCAL_SITE = i.SITE)
       left outer join
         PU_LINK_SUPPLIER_CATEGORY as lsc on (lsc.SYSTEM_ID     = i.SYSTEM_ID and
                                              lsc.SUPPLIER_CODE = i.SUPPLIER_CODE)
       left outer join
         FLEXPARAMS as fxp on (fxp.PARAMTYPE = 'DWH' and 
                               fxp.PARAMNAVN = 'INDIR_UNMAPPED')
       left outer join
         FLEXPARAMS as fxne on (fxne.PARAMTYPE = 'DWH' and 
                                fxne.PARAMNAVN = 'INDIR_NOT_QLIKVIEW')
       join
         FLEXPARAMS as fxus on (fxus.PARAMTYPE = 'DWH' and 
                                fxus.PARAMNAVN = 'SUPPLIER_INDEPENDENT')
       join
         FLEXPARAMS as fxup on (fxup.PARAMTYPE = 'DWH' and 
                                fxup.PARAMNAVN = 'PAYMENT_UNMAPPED')
where isnull(clink.CATEGORY_ID, 0) <> fxne.TEKST and
      i.INVOICE_DATE >= (select TEKST
                         from FLEXPARAMS
                         where PARAMTYPE = 'DWH' and
                               PARAMNAVN = 'DATA_START_DATE')