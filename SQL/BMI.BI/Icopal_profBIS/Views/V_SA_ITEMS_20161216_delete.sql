




CREATE view [dbo].[V_SA_ITEMS_20161216_delete] as
SELECT itm.[SYSTEM_ID]
      ,itm.[ITEM_NO]
      ,isnull(itm.[ITEM_NAME], 'UNKNOWN') as ITEM_NAME
      ,isnull(itm.[ITEM_TYPE_ID], 9)      as ITEM_TYPE_ID
      ,itm.[ITEM_TYPE]
      ,itm.[ITEM_GNIT]
      ,itm.[ITEM_DESCRIPTION_1]
      ,itm.[ITEM_DESCRIPTION_2]
      ,itm.[ITEM_GROUP_1]
      ,itm.[ITEM_GROUP_2]
      ,itm.[ITEM_GROUP_3]
      ,itm.[ITEM_GROUP_4]
      ,itm.[ITEM_GROUP_5]
      ,RTrim(LTrim(Cast(itm.SYSTEM_ID as Varchar(10)))) + '|' + itm.ITEM_NO as ITEM_CATEGORY_ID
  FROM MD_ITEMS as  itm
--    left outer join
--       SA_ITEMS as itm on (itm.SYSTEM_ID = inv.SYSTEM_ID and
--                           itm.ITEM_NO   = inv.ITEM_NO)
  	left outer join
	   SA_LINK_ITEM as lic on (lic.SYSTEM_ID = itm.SYSTEM_ID and
	                           lic.ITEM_NO   = itm.ITEM_NO)
	left outer join
	   FLEXPARAMS as fxi on (fxi.PARAMTYPE = 'DWH' and
	                         fxi.PARAMNAVN = 'SA_UNMAPPED_ITEM')
    left outer join
       FLEXPARAMS as fxne on (fxne.PARAMTYPE = 'DWH' and 
                              fxne.PARAMNAVN = 'SALES_NOT_QLIKVIEW')
where exists (select *
              from SA_INVOICE as inv
              where inv.SYSTEM_ID = itm.SYSTEM_ID and
                    inv.ITEM_NO   = itm.ITEM_NO) 
   or exists (select *
              from SA_ORDER_BACKLOG as bl
              where bl.SYSTEM_ID = itm.SYSTEM_ID and
                    bl.ITEM_NO   = itm.ITEM_NO) 
   or exists (select *
              from SA_ORDER_SNI as sni
              where sni.SYSTEM_ID = itm.SYSTEM_ID and
                    sni.ITEM_NO   = itm.ITEM_NO)