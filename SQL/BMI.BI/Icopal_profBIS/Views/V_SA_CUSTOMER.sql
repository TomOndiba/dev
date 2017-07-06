


CREATE view [dbo].[V_SA_CUSTOMER] as 
SELECT cust.[SYSTEM_ID]
      ,cust.[CUSTOMER_NO]
      ,cust.[CUSTOMER_NAME]
      ,cust.[CUSTOMER_ADDRESS_1]
      ,cust.[CUSTOMER_ADDRESS_2]
      ,cust.[CUSTOMER_ADDRESS_3]
      ,cust.[CUSTOMER_ZIPCODE]
      ,cust.[CUSTOMER_CITY]
      ,cust.[CUSTOMER_COUNTRY]
      ,cust.[CUSTOMER_VAT_NO]
      ,cust.[CUSTOMER_TYPE_ID]
      ,cust.[CUSTOMER_TYPE]
      ,cust.[CUSTOMER_GROUP_1]
      ,cust.[CUSTOMER_GROUP_2]
      ,cust.[CUSTOMER_GROUP_3]
      ,cust.[CUSTOMER_GROUP_4]
      ,cust.[CUSTOMER_GROUP_5]
      ,RTRIM(LTRIM(CAST(cust.SYSTEM_ID as VarChar(10)))) + '|' + cust.CUSTOMER_NO as CUSTOMER_CATEGORY_ID
  FROM [SA_CUSTOMER] as cust with (nolock)
	left outer join
	   SA_LINK_CUSTOMER as lcc with (nolock) on (lcc.SYSTEM_ID   = cust.SYSTEM_ID and
	                               lcc.CUSTOMER_NO = cust.CUSTOMER_NO)
	left outer join
	   FLEXPARAMS as fxc with (nolock) on (fxc.PARAMTYPE = 'DWH' and
	                         fxc.PARAMNAVN = 'SA_UNMAPPED_CUSTOMER')
where (
       exists (select 1
               from SA_INVOICE as inv  with (nolock)
		   	   where inv.SYSTEM_ID = cust.SYSTEM_ID and
			         inv.SOLD_TO   = cust.CUSTOMER_NO) or
	   exists (select 1
               from SA_INVOICE as inv with (nolock)
		   	   where inv.SYSTEM_ID = cust.SYSTEM_ID and
			         inv.SHIP_TO   = cust.CUSTOMER_NO) or
       exists (select 1
               from SA_ORDER_BACKLOG as inv  with (nolock)
		   	   where inv.SYSTEM_ID = cust.SYSTEM_ID and
			         inv.SOLD_TO   = cust.CUSTOMER_NO) or
	   exists (select 1
               from SA_ORDER_BACKLOG as inv with (nolock)
		   	   where inv.SYSTEM_ID = cust.SYSTEM_ID and
			         inv.SHIP_TO   = cust.CUSTOMER_NO) or
       exists (select 1
               from SA_ORDER_SNI as inv  with (nolock)
		   	   where inv.SYSTEM_ID = cust.SYSTEM_ID and
			         inv.SOLD_TO   = cust.CUSTOMER_NO) or
	   exists (select 1
               from SA_ORDER_SNI as inv with (nolock)
		   	   where inv.SYSTEM_ID = cust.SYSTEM_ID and
			         inv.SHIP_TO   = cust.CUSTOMER_NO)
	  )