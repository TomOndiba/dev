




CREATE VIEW [dbo].[V_SA_CUSTOMER_CATEGORY]
AS
-- All Categories 
SELECT RTrim(LTrim(Cast(CUSTOMER_CATEGORY_ID as Varchar(10)))) as CUSTOMER_CATEGORY_ID, 
       CUSTOMER_CATEGORY_NAME, 
       RTrim(LTrim(Cast(CUSTOMER_PARENT_ID as VarChar(10)))) as CUSTOMER_PARENT_ID,
       0 as CUSTOMER_UNMAPPED_ONECOUNT
FROM SA_CUSTOMER_CATEGORY with (nolock)

union

-- All mapped Customers
select RTrim(LTrim(Cast(lcc.SYSTEM_ID as Varchar(10)))) + '|' + lcc.CUSTOMER_NO as CUSTOMER_CATEGORY_ID,
       cus.CUSTOMER_NAME + ' (' + RTrim(LTrim(Cast(lcc.SYSTEM_ID as Varchar(10)))) + '|' + lcc.CUSTOMER_NO + ')'       as CUSTOMER_CATEGORY_NAME,
       RTrim(LTrim(Cast(lcc.CUSTOMER_CATEGORY_ID as Varchar(10)))) as CUSTOMER_PARENT_ID,
       0      as CUSTOMER_UNMAPPED_ONECOUNT
from SA_LINK_CUSTOMER as lcc with (nolock)
      join
        SA_CUSTOMER as cus with (nolock) on (cus.SYSTEM_ID   = lcc.SYSTEM_ID and
                               cus.CUSTOMER_NO = lcc.CUSTOMER_NO)
                            
union

-- All unmapped Customers
select RTrim(LTrim(Cast(cus.SYSTEM_ID as Varchar(10)))) + '|' + cus.CUSTOMER_NO as CUSTOMER_CATEGORY_ID,
       cus.CUSTOMER_NAME + ' (' + RTrim(LTrim(Cast(cus.SYSTEM_ID as Varchar(10)))) + '|' + cus.CUSTOMER_NO + ')'        as CUSTOMER_CATEGORY_NAME,
       fxi.TEKST            as CUSTOMER_PARENT_ID,
       1                    as CUSTOMER_UNMAPPED_ONECOUNT
from SA_CUSTOMER as cus with (nolock)
       join
         FLEXPARAMS as fxi with (nolock) on (fxi.PARAMTYPE = 'DWH' and
                               fxi.PARAMNAVN = 'SA_UNMAPPED_CUSTOMER')
where not exists (select *
                  from SA_LINK_CUSTOMER as lcc with (nolock) 
                  where lcc.SYSTEM_ID   = cus.SYSTEM_ID and
                        lcc.CUSTOMER_NO = cus.CUSTOMER_NO)