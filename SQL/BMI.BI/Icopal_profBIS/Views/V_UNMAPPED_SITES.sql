





CREATE view [dbo].[V_UNMAPPED_SITES] as
--
-- Tæl antal Sites der ikke er Mapped
--
select SYSTEM_ID, SITE_ID, Count(*) as UnmapSiteCount
from(
     -- Find Unmapped ORDERING_SITE i Direct
--     select purch.SYSTEM_ID, purch.ORDERING_SITE as SITE_ID
--     from PU_PURCHASE as purch
--     where not exists(select *
--                      from PU_LINK_SITE as lp
--                       where lp.SYSTEM_ID  = purch.SYSTEM_ID and
--                             lp.LOCAL_SITE = purch.ORDERING_SITE)
    
--     union all

	-- Find Unmapped SHIP_TO_SITE i Direct
     select purch.SYSTEM_ID, purch.SHIP_TO_SITE as SITE_ID
     from PU_PURCHASE as purch
     where not exists(select *
                      from PU_LINK_SITE as lp
                       where lp.SYSTEM_ID  = purch.SYSTEM_ID and
                             lp.LOCAL_SITE = purch.SHIP_TO_SITE)

	union all
	    
	-- Find Unmapped SHIP_TO_SITE i Indirect
     select purch.SYSTEM_ID, purch.SITE as SITE_ID
     from PU_INDIRECT as purch
     where not exists(select *
                      from PU_LINK_SITE as lp
                       where lp.SYSTEM_ID  = purch.SYSTEM_ID and
                             lp.LOCAL_SITE = purch.SITE)
    
	union all

	-- Find Unmapped SHIP_TO_SITE i Contracting
     select purch.SYSTEM_ID, purch.SITE as SITE_ID
     from PU_CONTRACTING as purch
     where not exists(select *
                      from PU_LINK_SITE as lp
                       where lp.SYSTEM_ID  = purch.SYSTEM_ID and
                             lp.LOCAL_SITE = purch.SITE)
  
	union all

	-- Find Unmapped "Sales Company" in SA_INVOICE
     select sa.SYSTEM_ID, sa.SITE_SOLD as SITE_ID
     from SA_INVOICE as sa
     where not exists(select *
                      from PU_LINK_SITE as lp
                       where lp.SYSTEM_ID  = sa.SYSTEM_ID and
                             lp.LOCAL_SITE = sa.SITE_SOLD)
  
  	union all

	-- Find Unmapped "Sales Company" in SA_ORDER_BACKLOG
     select sa.SYSTEM_ID, sa.SITE_SOLD as SITE_ID
     from SA_ORDER_BACKLOG as sa
     where not exists(select *
                      from PU_LINK_SITE as lp
                       where lp.SYSTEM_ID  = sa.SYSTEM_ID and
                             lp.LOCAL_SITE = sa.SITE_SOLD)
  
	union all

	-- Find Unmapped "Sales Company" in SA_ORDER_SNI
     select sa.SYSTEM_ID, sa.SITE_SOLD as SITE_ID
     from SA_ORDER_SNI as sa
     where not exists(select *
                      from PU_LINK_SITE as lp
                       where lp.SYSTEM_ID  = sa.SYSTEM_ID and
                             lp.LOCAL_SITE = sa.SITE_SOLD)
  
	  
	 ) as xx
group by xx.SYSTEM_ID, xx.SITE_ID