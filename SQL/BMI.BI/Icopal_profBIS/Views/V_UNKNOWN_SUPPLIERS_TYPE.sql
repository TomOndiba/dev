
Create view [dbo].[V_UNKNOWN_SUPPLIERS_TYPE] as

--
-- Tæl antal transaktioner hvor der ikke findes en leverandør i SUPPLIER
--
select SYSTEM_ID, CostType, SUM(Antal) as TransactionCount, COUNT(*) as SupplierCount
from (select 'Direct costs' as CostType, pu.SYSTEM_ID, COUNT(*) as Antal
      from PU_PURCHASE as pu
      where not exists (select *
                        from PU_SUPPLIER as ps
                        where ps.SYSTEM_ID     = pu.SYSTEM_ID and
                              ps.SUPPLIER_CODE = pu.SUPPLIER_CODE)
      group by pu.SYSTEM_ID, SUPPLIER_CODE
            
      union all
      
      select 'Indirect costs' as CostType, indir.SYSTEM_ID, COUNT(*) as Antal
      from PU_INDIRECT as indir
      where not exists (select *
                        from PU_SUPPLIER as ps
                        where ps.SYSTEM_ID     = indir.SYSTEM_ID and
                              ps.SUPPLIER_CODE = indir.SUPPLIER_CODE)
      group by indir.SYSTEM_ID, SUPPLIER_CODE
      
      union all
      
      select 'Contraction costs' as CostType, con.SYSTEM_ID, COUNT(*) as Antal
      from PU_CONTRACTING as con
      where not exists (select *
                        from PU_SUPPLIER as ps
                        where ps.SYSTEM_ID     = con.SYSTEM_ID and
                              ps.SUPPLIER_CODE = con.SUPPLIER_CODE)
      group by con.SYSTEM_ID, SUPPLIER_CODE) as xx
      
group by SYSTEM_ID, CostType