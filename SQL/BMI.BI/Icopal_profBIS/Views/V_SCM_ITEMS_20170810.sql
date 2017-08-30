






CREATE view [dbo].[V_SCM_ITEMS_20170810] as
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
  	left outer join
	   SA_LINK_ITEM as lic on (lic.SYSTEM_ID = itm.SYSTEM_ID and
	                           lic.ITEM_NO   = itm.ITEM_NO)
where exists (select *
              from KPI_SHIFT_PRODUCTION_NEW as sprod
              where sprod.SYSTEM_ID = itm.SYSTEM_ID and
                    sprod.ITEM_NO   = itm.ITEM_NO)