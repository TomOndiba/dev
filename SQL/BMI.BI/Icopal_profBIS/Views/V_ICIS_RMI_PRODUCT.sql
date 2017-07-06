﻿

create view [dbo].[V_ICIS_RMI_PRODUCT] as
select ICIS_PRODUCT, DESCRIPTION, INDEX100_DATE, UNIT_OF_MEASUREMENT, CURRENCY
from MD_ICIS_PRODUCT

union 

select 'IndexMix ' + SBU as ICIS_PRODUCT, 'IndexMix ' + SBU as DESCRIPTION, 
       ic.INDEX100_DATE, ic.UNIT_OF_MEASUREMENT, ic.CURRENCY
from MD_SBU as sbu 
      join
		MD_ICIS_PRODUCT as ic on (ic.ICIS_PRODUCT = sbu.ICIS_PRODUCT_1)
where sbu.ICIS_PCT_1 <> 100