create function [privy].[OrderShippedNotInvoicedDeltaHash]
(
  @Uniqueifier bigint
, @SYSTEM_ID int
, @ORDER_NUMBER nvarchar(50)
, @ORDER_LINE_NUMBER nvarchar(50)
, @SHIPPING_DOCUMENT nvarchar(50)
, @EXPECTED_INVOICE_DATE datetime
, @ORDER_TYPE nvarchar(1)
, @OrderTypeName nvarchar(50)
, @LOCAL_SITE_SOLD nvarchar(50)
, @SITE_ID int
, @ITEM_NO nvarchar(20)
, @ITEM_CATEGORY_ID int
, @ENV_CATEGORY_ID int
, @SOLD_TO_CUSTOMER_NO nvarchar(50)
, @SHIP_TO_CUSTOMER_NO nvarchar(50)
, @SALESPERSON_ID nvarchar(50)
, @SALESPERSON_NAME nvarchar(100)
, @SHIPPED_QUANTITY decimal(12,2)
, @SHIPPED_UOM nvarchar(20)
, @STATISTIC_QUANTITY decimal(12,2)
, @STATISTIC_UOM nvarchar(20)
, @QUANTITY decimal(12,2)
, @LOCAL_UOM nvarchar(20)
, @LOCAL_UOM_HARMONIZED nvarchar(20)
, @LOCAL_UOM_FACTOR decimal(11, 4)
, @SHIPPED_AMOUNT decimal(15, 4)
, @LOCAL_AMOUNT decimal(15, 4)
, @GROUP_AMOUNT decimal(15, 4)
, @SHIPPED_CURRENCY nvarchar(3)
, @LOCAL_CURRENCY nvarchar(3)
, @LINE_DISCOUNT_AMOUNT decimal(15,4)
, @ORDER_DISCOUNT_AMOUNT decimal(15,4)
, @LINE_BONUS_AMOUNT decimal(15,4)
, @BONUS_SHARE_AMOUNT decimal(15,4)
)
returns char(32)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
FUNCTION NAME:  privy.OrderBacklogDeltaHash
DESCRIPTION:    Generates an MD5 hash over all the non-key columns (including the Uniqueifier) on stg.OrderBacklog table
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    14-JUL-2017

Additional Notes
================
-

REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		14-JUL-2017		GML		BSR-103	Created
------- ------------	------	-------	-----------------------------------------------------------------------------

**********************************************************************************************************************/
--</CommentHeader>

begin
	declare	@OutputValue char(32)

	select
		@OutputValue = convert(nvarchar(32), hashbytes('MD5'
						, convert(nvarchar(max)
							, coalesce(cast(@Uniqueifier as nvarchar(30)), 'Uniqueifier')
							+ coalesce(cast(@SYSTEM_ID as varchar(30)), 'SYSTEM_ID')
							+ coalesce(nullif(@ORDER_NUMBER, ''), 'INVOICE_NUMBER')
							+ coalesce(nullif(@ORDER_LINE_NUMBER, ''), 'INVOICE_LINE_NUMBER')
							+ coalesce(nullif(@SHIPPING_DOCUMENT, ''), 'SHIPPING_DOCUMENT')
							-----------------------------------------------------------------------------------------------------------------------
							+ coalesce(convert(varchar(24), @EXPECTED_INVOICE_DATE, 120), 'EXPECTED_INVOICE_DATE')
							-----------------------------------------------------------------------------------------------------------------------
							+ coalesce(nullif(@ORDER_TYPE, ''), 'ORDER_TYPE')
							+ coalesce(nullif(@OrderTypeName, ''), 'OrderTypeName')
							-----------------------------------------------------------------------------------------------------------------------
							+ coalesce(nullif(@LOCAL_SITE_SOLD, ''), 'SITE_SOLD')
							+ coalesce(cast(@SITE_ID as nvarchar(30)), 'SITE_ID')
							-----------------------------------------------------------------------------------------------------------------------
							+ coalesce(nullif(@ITEM_NO, ''), 'ITEM_NO')
							+ coalesce(cast(@ITEM_CATEGORY_ID as varchar(30)), 'ITEM_CATEGORY_ID')
							+ coalesce(cast(@ENV_CATEGORY_ID as nvarchar(30)), 'ENV_CATEGORY_ID')
							-----------------------------------------------------------------------------------------------------------------------
							+ coalesce(nullif(@SOLD_TO_CUSTOMER_NO, ''), 'SOLD_TO')
							+ coalesce(nullif(@SHIP_TO_CUSTOMER_NO, ''), 'SHIP_TO')
							-----------------------------------------------------------------------------------------------------------------------
							+ coalesce(nullif(@SALESPERSON_ID, ''), 'SALESPERSON_ID')
							+ coalesce(nullif(@SALESPERSON_NAME, ''), 'SALESPERSON_NAME')
							-----------------------------------------------------------------------------------------------------------------------
							+ coalesce(cast(@SHIPPED_QUANTITY as nvarchar(30)), 'ORDER_QUANTITY')
							+ coalesce(@SHIPPED_UOM, 'ORDER_UOM') 
							+ coalesce(cast(@STATISTIC_QUANTITY as nvarchar(30)), 'STATISTIC_QUANTITY')
							+ coalesce( @STATISTIC_UOM, 'STATISTIC_UOM')
							+ coalesce(cast(@QUANTITY as nvarchar(30)), 'QUANTITY')
							-----------------------------------------------------------------------------------------------------------------------
							+ coalesce(nullif(@LOCAL_UOM, ''), 'UOM')
							+ coalesce(nullif(@LOCAL_UOM_HARMONIZED, ''), 'HARMONIZED_UOM')
							+ coalesce(cast(@LOCAL_UOM_FACTOR as nvarchar(30)), 'FACTOR')
							-----------------------------------------------------------------------------------------------------------------------
							+ coalesce(cast(@SHIPPED_AMOUNT as nvarchar(30)), 'ORDER_AMOUNT')
							+ coalesce(cast(@LOCAL_AMOUNT as nvarchar(30)), 'LOCAL_AMOUNT')
							+ coalesce(cast(@GROUP_AMOUNT as nvarchar(30)), 'GROUP_AMOUNT')
							+ coalesce(@SHIPPED_CURRENCY, 'ORDER_CURRENCY')
							+ coalesce(@LOCAL_CURRENCY, 'LOCAL_CURRENCY')
							-----------------------------------------------------------------------------------------------------------------------
							+ coalesce(cast(@LINE_DISCOUNT_AMOUNT as nvarchar(30)), 'LINE_DISCOUNT_AMOUNT')
							+ coalesce(cast(@ORDER_DISCOUNT_AMOUNT as nvarchar(30)), 'ORDER_DISCOUNT_AMOUNT')
							+ coalesce(cast(@LINE_BONUS_AMOUNT as nvarchar(30)), 'LINE_BONUS_AMOUNT')
							+ coalesce(cast(@BONUS_SHARE_AMOUNT as nvarchar(30)), 'BONUS_SHARE_AMOUNT')) collate SQL_Latin1_General_CP1_CI_AS), 2)
							-----------------------------------------------------------------------------------------------------------------------
	return @OutputValue
end
go