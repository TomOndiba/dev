

CREATE VIEW [dbo].[v_PU_ITEMS_NHA]
AS
SELECT itm.SYSTEM_ID
      ,itm.ITEM_NO
	  ,itm.ITEM_NAME
	  ,isnull(li.CATEGORY_ID, fxp.TEKST) as CATEGORY_ID
FROM  MD_ITEMS as itm
       left outer join
         PU_LINK_ITEM as li on (li.SYSTEM_ID = itm.SYSTEM_ID and
                                li.ITEM_NO   = itm.ITEM_NO)
       join
         FLEXPARAMS as fxp on (fxp.PARAMTYPE = 'DWH' and 
                               fxp.PARAMNAVN = 'CAT_UNMAPPED')
where (exists (select 1
               from PU_PURCHASE as pu
		 	   where pu.SYSTEM_ID = itm.SYSTEM_ID 
			     and pu.ITEM_NO   = itm.ITEM_NO))