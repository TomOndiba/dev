
CREATE view [dbo].[V_CUSTOMER_TRANS] as 
select cmap.SYSTEM_ID
      ,cmap.CUSTOMER_NO
      ,cust.CUSTOMER_NAME
      ,cust.CUSTOMER_ADDRESS_1
      ,cust.CUSTOMER_ADDRESS_2
      ,cust.CUSTOMER_ZIPCODE
      ,cust.CUSTOMER_CITY
      ,cust.CUSTOMER_COUNTRY
      ,cust.CUSTOMER_VAT_NO
      ,cust.CUSTOMER_TYPE_ID
      ,cust.CUSTOMER_TYPE
      ,cust.CUSTOMER_GROUP_1
      ,cust.CUSTOMER_GROUP_2
      ,cust.CUSTOMER_GROUP_3
      ,cust.CUSTOMER_GROUP_4
      ,cust.CUSTOMER_GROUP_5
	    ,sum(cmap.TransactionCount) as TransactionCount
	    ,sum(cmap.AmountGroup)      as AmountGroup
		,cmap.SBU
from SA_CUSTOMER_MAP as cmap
      left outer join
  	    SA_CUSTOMER as cust on (cust.SYSTEM_ID   = cmap.SYSTEM_ID and
	    	                        cust.CUSTOMER_NO = cmap.CUSTOMER_NO)
group by cmap.SYSTEM_ID
      ,cmap.CUSTOMER_NO
      ,cust.CUSTOMER_NAME
      ,cust.CUSTOMER_ADDRESS_1
      ,cust.CUSTOMER_ADDRESS_2
      ,cust.CUSTOMER_ZIPCODE
      ,cust.CUSTOMER_CITY
      ,cust.CUSTOMER_COUNTRY
      ,cust.CUSTOMER_VAT_NO
      ,cust.CUSTOMER_TYPE_ID
      ,cust.CUSTOMER_TYPE
      ,cust.CUSTOMER_GROUP_1
      ,cust.CUSTOMER_GROUP_2
      ,cust.CUSTOMER_GROUP_3
      ,cust.CUSTOMER_GROUP_4
      ,cust.CUSTOMER_GROUP_5
	  ,cmap.SBU