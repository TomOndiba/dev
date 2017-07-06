create view [dbo].[V_PU_PURCHASE_EXCL_GROUP] as 
SELECT *
from V_PU_PURCHASE as pur
       join
          FLEXPARAMS as fs on (fs.PARAMTYPE = 'DWH' and
                               fs.PARAMNAVN = 'CAT_GROUP_ITEMS')
where pur.CATEGORY_ID <> Cast(fs.TEKST as Integer)