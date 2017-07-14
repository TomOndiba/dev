create function [privy].[InvoiceDeltaHash]
(
  @Uniqueifier bigint
, @SYSTEM_ID int
, @INVOICE_NUMBER nvarchar(20)
, @INVOICE_LINE_NUMBER nvarchar(20)
, @ORDER_NUMBER nvarchar(20)
, @ORDER_LINE_NUMBER nvarchar(20)
, @INVOICE_DATE datetime
, @INVOICE_TYPE nvarchar(1)
, @InvoiceTypeName nvarchar(29)
, @LOCAL_SITE_SOLD nvarchar(20)
, @SITE_ID int
, @ITEM_NO nvarchar(50)
, @ITEM_CATEGORY_ID int
, @ENV_CATEGORY_ID int
, @SOLD_TO_CUSTOMER_NO nvarchar(20)
, @SHIP_TO_CUSTOMER_NO nvarchar(20)
, @SALESPERSON_ID nvarchar(20)
, @SALESPERSON_NAME nvarchar(100)
, @DELIVERY_DATE datetime
, @EXPECTED_PAYMENT_DATE datetime
, @ACTUAL_PAYMENT_DATE datetime
, @LOCAL_DELIVERY_TERM nvarchar(20)
, @LOCAL_DELIVERY_TERM_TEXT nvarchar(100)
, @PAYMENT_TERM_ID int
, @LOCAL_PAYMENT_TERM nvarchar(20)
, @LOCAL_PAYMENT_TERM_TEXT nvarchar(100)
, @INVOICE_QUANTITY decimal(12, 2)
, @INVOICE_UOM nvarchar(20)
, @STATISTIC_QUANTITY decimal(12, 2)
, @STATISTIC_UOM nvarchar(20)
, @QUANTITY decimal(12, 2)
, @LOCAL_UOM nvarchar(20)
, @LOCAL_UOM_HARMONIZED nvarchar(20)
, @LOCAL_UOM_FACTOR decimal(11, 4)
, @INVOICE_AMOUNT decimal(15, 4)
, @LOCAL_AMOUNT decimal(15, 4)
, @GROUP_AMOUNT decimal(15, 4)
, @INVOICE_CURRENCY nvarchar(3)
, @LOCAL_CURRENCY nvarchar(3)
, @LINE_DISCOUNT_AMOUNT decimal(15, 4)
, @INVOICE_DISCOUNT_AMOUNT decimal(15, 4)
, @LINE_BONUS_AMOUNT decimal(15, 4)
, @BONUS_SHARE_AMOUNT decimal(15, 4)
, @STD_COST decimal(15, 4)
, @STD_FREIGHT decimal(15, 4)
)
returns char(32)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
FUNCTION NAME:  privy.InvoiceDeltaHash
DESCRIPTION:    Generates an MD5 hash over all the non-key columns (including the Uniqueifier) on stg.Invoice table
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    12-JUL-2017

Additional Notes
================
-

REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		12-JUL-2017		GML		BSR-101	Created
------- ------------	------	-------	-----------------------------------------------------------------------------

**********************************************************************************************************************/
--</CommentHeader>

begin
	declare	@OutputValue char(32)

	select
		@OutputValue = convert(nvarchar(32), hashbytes('MD5'
						, coalesce(cast(@Uniqueifier as nvarchar(30)), 'Uniqueifier')
							+ coalesce(cast(@SYSTEM_ID as varchar(30)), 'SYSTEM_ID')
							+ coalesce(nullif(@INVOICE_NUMBER, ''), 'INVOICE_NUMBER')
							+ coalesce(nullif(@INVOICE_LINE_NUMBER, ''), 'INVOICE_LINE_NUMBER')
							+ coalesce(nullif(@ORDER_NUMBER, ''), 'ORDER_NUMBER')
							+ coalesce(nullif(@ORDER_LINE_NUMBER, ''), 'ORDER_LINE_NUMBER')
							+ coalesce(convert(varchar(24), @INVOICE_DATE, 120), 'INVOICE_DATE')
							+ coalesce(nullif(@INVOICE_TYPE, ''), 'INVOICE_TYPE')
							+ coalesce(nullif(@InvoiceTypeName, ''), 'InvoiceTypeName')
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
							+ coalesce(convert(char(19), @DELIVERY_DATE, 120), 'DELIVERY_DATE')
							+ coalesce(convert(char(19), @EXPECTED_PAYMENT_DATE, 120), 'EXPECTED_PAYMENT_DATE')
							+ coalesce(convert(char(19), @ACTUAL_PAYMENT_DATE, 120), 'ACTUAL_PAYMENT_DATE')
							+ coalesce(nullif(@LOCAL_DELIVERY_TERM, ''), 'DELIVERY_TERM')
							+ coalesce(nullif(@LOCAL_DELIVERY_TERM_TEXT, ''), 'DELIVERY_TERM_TEXT')
							+ coalesce(cast(@PAYMENT_TERM_ID as varchar(30)), 'PAYMENTTERM_ID')
							+ coalesce(nullif(@LOCAL_PAYMENT_TERM, ''), 'PAYMENT_TERM')
							+ coalesce(nullif(@LOCAL_PAYMENT_TERM_TEXT, ''), 'PAYMENT_TERM_TEXT')
							-----------------------------------------------------------------------------------------------------------------------
							+ coalesce(cast(@INVOICE_QUANTITY as nvarchar(30)), 'INVOICE_QUANTITY')
							+ coalesce(nullif(@INVOICE_UOM, ''), 'INVOICE_UOM') 
							+ coalesce(cast(@STATISTIC_QUANTITY as nvarchar(30)), 'STATISTIC_QUANTITY')
							+ coalesce(nullif(@STATISTIC_UOM, ''), 'STATISTIC_UOM')
							+ coalesce(cast(@QUANTITY as nvarchar(30)), 'QUANTITY')
							-----------------------------------------------------------------------------------------------------------------------
							+ coalesce(nullif(@LOCAL_UOM, ''), 'UOM')
							+ coalesce(nullif(@LOCAL_UOM_HARMONIZED, ''), 'HARMONIZED_UOM')
							+ coalesce(cast(@LOCAL_UOM_FACTOR as nvarchar(30)), 'FACTOR')
							-----------------------------------------------------------------------------------------------------------------------
							+ coalesce(cast(@INVOICE_AMOUNT as nvarchar(30)), 'INVOICE_AMOUNT')
							+ coalesce(cast(@LOCAL_AMOUNT as nvarchar(30)), 'LOCAL_AMOUNT')
							+ coalesce(cast(@GROUP_AMOUNT as nvarchar(30)), 'GROUP_AMOUNT')
							+ coalesce(nullif(@INVOICE_CURRENCY, ''), 'INVOICE_CURRENCY')
							+ coalesce(nullif(@LOCAL_CURRENCY, ''), 'LOCAL_CURRENCY')
							-----------------------------------------------------------------------------------------------------------------------
							+ coalesce(cast(@LINE_DISCOUNT_AMOUNT as nvarchar(30)), 'LINE_DISCOUNT_AMOUNT')
							+ coalesce(cast(@INVOICE_DISCOUNT_AMOUNT as nvarchar(30)), 'INVOICE_DISCOUNT_AMOUNT')
							+ coalesce(cast(@LINE_BONUS_AMOUNT as nvarchar(30)), 'LINE_BONUS_AMOUNT')
							+ coalesce(cast(@BONUS_SHARE_AMOUNT as nvarchar(30)), 'BONUS_SHARE_AMOUNT')
							+ coalesce(cast(@STD_COST as nvarchar(30)), 'STD_COST')
							+ coalesce(cast(@STD_FREIGHT as nvarchar(30)), 'STD_FREIGHT')), 2)
							-----------------------------------------------------------------------------------------------------------------------
	return @OutputValue
end
go