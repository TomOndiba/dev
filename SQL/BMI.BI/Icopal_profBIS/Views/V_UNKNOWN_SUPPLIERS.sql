create view [dbo].[V_UNKNOWN_SUPPLIERS] as

--
-- Tæl antal transaktioner hvor der ikke findes en leverandør i SUPPLIER
--
select SYSTEM_ID, SUPPLIER_CODE, Count(*) as UnknownCount
from(
     -- Find Unknown suppliers in Direct
     select pu.SYSTEM_ID, pu.SUPPLIER_CODE
     from PU_PURCHASE as pu
     where not exists (select *
                  from PU_SUPPLIER as ps
                  where ps.SYSTEM_ID     = pu.SYSTEM_ID and
                        ps.SUPPLIER_CODE = pu.SUPPLIER_CODE)
    
     union all

     -- Find Unknown suppliers in Indirect
     select ind.SYSTEM_ID, ind.SUPPLIER_CODE
     from PU_INDIRECT as ind
     where not exists (select *
                  from PU_SUPPLIER as ps
                  where ps.SYSTEM_ID     = ind.SYSTEM_ID and
                        ps.SUPPLIER_CODE = ind.SUPPLIER_CODE)

     union all

     -- Find Unknown suppliers in Contracting
     select con.SYSTEM_ID, con.SUPPLIER_CODE
     from PU_CONTRACTING as con
     where not exists (select *
                  from PU_SUPPLIER as ps
                  where ps.SYSTEM_ID     = con.SYSTEM_ID and
                        ps.SUPPLIER_CODE = con.SUPPLIER_CODE)
	 ) as xx
group by xx.SYSTEM_ID, xx.SUPPLIER_CODE