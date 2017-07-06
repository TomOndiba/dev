







CREATE VIEW [dbo].[V_SA_ITEM_CATEGORY]
AS
-- All categories
SELECT     RTrim(LTrim(Cast(ITEM_CATEGORY_ID as Varchar(10)))) as ITEM_CATEGORY_ID, 
           ITEM_CATEGORY_NAME, 
           RTrim(LTrim(Cast(ITEM_PARENT_ID as VarChar(10)))) as ITEM_PARENT_ID, 
           ITEM_SORTSTRING,
           0 as ITEM_UNMAPPED_ONECOUNT
FROM SA_ITEM_CATEGORY with (nolock)

union

-- All mapped Items
select RTrim(LTrim(Cast(lic.SYSTEM_ID as Varchar(10)))) + '|' + lic.ITEM_NO as ITEM_CATEGORY_ID,
       itm.ITEM_NAME + ' (' + RTrim(LTrim(Cast(lic.SYSTEM_ID as Varchar(10)))) + '|' + lic.ITEM_NO + ')'       as ITEM_CATEGORY_NAME,
       RTrim(LTrim(Cast(lic.ITEM_CATEGORY_ID as Varchar(10)))) as ITEM_PARENT_ID,
       '0'                  as ITEM_SORTSTRING,
       0                    as ITEM_UNMAPPED_ONECOUNT
from SA_LINK_ITEM as lic with (nolock)
      join
        V_SA_ITEMS as itm with (nolock)
		                  on (itm.SYSTEM_ID = lic.SYSTEM_ID and
                              itm.ITEM_NO   = lic.ITEM_NO)
                            
union

-- All unmapped Items
select RTrim(LTrim(Cast(itm.SYSTEM_ID as Varchar(10)))) + '|' + itm.ITEM_NO as ITEM_CATEGORY_ID,
       itm.ITEM_NAME + ' (' + RTrim(LTrim(Cast(itm.SYSTEM_ID as Varchar(10)))) + '|' + itm.ITEM_NO + ')'        as ITEM_CATEGORY_NAME,
       fxi.TEKST            as ITEM_PARENT_ID,
       '0'                  as ITEM_SORTSTRING,
       1                    as ITEM_UNMAPPED_ONECOUNT
from V_SA_ITEMS as itm with (nolock)
       join
         FLEXPARAMS as fxi with (nolock)
		                   on (fxi.PARAMTYPE = 'DWH' and
                               fxi.PARAMNAVN = 'SA_UNMAPPED_ITEM')
where not exists (select *
                  from SA_LINK_ITEM as lic with (nolock)
                  where lic.SYSTEM_ID = itm.SYSTEM_ID and
                        lic.ITEM_NO   = itm.ITEM_NO)