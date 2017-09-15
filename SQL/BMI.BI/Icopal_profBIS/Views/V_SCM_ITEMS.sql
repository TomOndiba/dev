
CREATE view [dbo].[V_SCM_ITEMS] as 
SELECT itm.[SYSTEM_ID]
      ,itm.[ITEM_NO]
      ,isnull(itm.[ITEM_NAME], 'UNKNOWN') as ITEM_NAME
      ,ITEM_CATEGORY_ID =
			case
				when not sli.ITEM_NO is null then  RTrim(LTrim(Cast(itm.SYSTEM_ID as Varchar(10)))) + '|' + itm.ITEM_NO
				else
					fx.TEKST
			end
  FROM MD_ITEMS as  itm
     left outer join
	    SA_LINK_ITEM as sli on (sli.SYSTEM_ID = itm.SYSTEM_ID and
		                        sli.ITEM_NO   = itm.ITEM_NO)
	   left outer join
	     FLEXPARAMS as fx on (fx.PARAMTYPE = 'DWH' and
		                      fx.PARAMNAVN = 'SA_UNMAPPED_ITEM') 
where (
		exists (select 1
			    from KPI_SHIFT_PRODUCTION_NEW as sprod
                 where sprod.SYSTEM_ID = itm.SYSTEM_ID and
                       sprod.ITEM_NO   = itm.ITEM_NO) 
		or
		exists (select 1
			    from KPI_SHIFT_PRODUCTION_NEW as sprod
                 where sprod.SYSTEM_ID = itm.SYSTEM_ID and
                       sprod.ITEM_NO   = SUBSTRING(itm.ITEM_NO, PATINDEX('%[^0]%', itm.ITEM_NO+'.'), LEN(itm.ITEM_NO)))
	   )

union 

select plant.SYSTEM_ID,
       spi.ITEM_NO,
	   spi.ITEM_NAME,
	   fx.TEKST		as ITEM_CATEGORY_ID
	   --RTrim(LTrim(Cast(plant.SYSTEM_ID as Varchar(10)))) + '|' + spi.ITEM_NO as ITEM_CATEGORY_ID
from KPI_SHIFT_PLANT_ITEMS as spi
       left outer join
	     MD_PLANT as plant on (plant.PLANT_ID = spi.PLANT_ID)
	   left outer join
	     FLEXPARAMS as fx on (fx.PARAMTYPE = 'DWH' and
		                      fx.PARAMNAVN = 'SA_UNMAPPED_ITEM') 
where not exists (select 1
                  from MD_ITEMS as itm
				  where itm.SYSTEM_ID = plant.SYSTEM_ID and
				        itm.ITEM_NO   = spi.ITEM_NO)