CREATE view V_GENERATE_CUSTOMER_MAP as 
select xx.SYSTEM_ID,
       xx.SHIP_TO							as CUSTOMER_NO,
	   sb.SBU,
	   isnull(lc.CUSTOMER_CATEGORY_ID, 0)	as CATEGORY_ID,
	   sum(xx.AmountGroup)					as AmountGroup,
	   sum(xx.RecordCount)					as RecordCount
from 
(
select inv.SYSTEM_ID,
       inv.SHIP_TO,
	   inv.SITE_SOLD,
       1					as RecordCount,
       GROUP_AMOUNT         as AmountGroup
from SA_INVOICE as inv with (nolock)

union all

select inv.SYSTEM_ID,
       inv.SHIP_TO,
	   inv.SITE_SOLD,
       1					as RecordCount,
       GROUP_AMOUNT         as AmountGroup
from SA_ORDER_BACKLOG as inv with (nolock)

union all

select inv.SYSTEM_ID,
       inv.SHIP_TO,
	   inv.SITE_SOLD,
       1                    as RecordCount,
       GROUP_AMOUNT         as AmountGroup
from SA_ORDER_SNI as inv with (nolock)

) as xx
     join
       PU_LINK_SITE as ls with (nolock)
			on (ls.SYSTEM_ID  = xx.SYSTEM_ID and
                ls.LOCAL_SITE = xx.SITE_SOLD)
     join
       MD_SITE as sit with (nolock)
			on (sit.SITE_ID = ls.SITE_ID)
     join
       MD_SBU as sb with (nolock) 
			on (sb.SBU = sit.SBU)
     left outer join
       SA_CUSTOMER as cust with (nolock)
			on (cust.SYSTEM_ID   = xx.SYSTEM_ID and
                cust.CUSTOMER_NO = xx.SHIP_TO)
     left outer join
       SA_LINK_CUSTOMER as lc with (nolock)
			on (lc.SYSTEM_ID   = xx.SYSTEM_ID and
                lc.CUSTOMER_NO = xx.SHIP_TO)
--where (xx.SYSTEM_ID = 12) and isnull(lc.CUSTOMER_CATEGORY_ID, 0) = 0
group by 
       xx.SYSTEM_ID,
       xx.SHIP_TO,
	   sb.SBU,
	   isnull(lc.CUSTOMER_CATEGORY_ID, 0)