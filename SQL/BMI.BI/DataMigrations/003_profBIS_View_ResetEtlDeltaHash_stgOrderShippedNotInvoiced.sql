--!
--! 003_profBIS_View_ResetEtlDeltaHash_stgOrderShippedNotInvoiced.sql
--!
use profBIS_View
go
--!
--! We need to re-set all DeltaHash values as the logic has changed (provided there are no differences now
--!
/*
alter table stg.OrderShippedNotInvoicedControl add constraint PK_stg_OrderShippedNotInvoicedControl primary key clustered (OrderShippedNotInvoicedKey)
go
create nonclustered index NCI_stg_OrderShippedNotInvoicedControl_ExtractFilter on stg.OrderShippedNotInvoicedControl (OrderShippedNotInvoicedKey, PreviousDeltaHash, IsDeleted);
go
alter table stg.OrderShippedNotInvoiced add constraint PK_stg_OrderShippedNotInvoiced primary key clustered (OrderShippedNotInvoicedKey)
go
alter table stg.OrderShippedNotInvoiced add constraint AK_stg_OrderShippedNotInvoiced_REC_ID unique nonclustered (REC_ID)
go
create nonclustered index NCI_stg_OrderShippedNotInvoiced_ExtractFilter on stg.OrderShippedNotInvoiced (OrderShippedNotInvoicedKey, EtlDeltaHash, IsDeleted, Uniqueifier)
go
create nonclustered index NCI_stg_OrderShippedNotInvoiced_ExpectedUniqueKeys on stg.OrderShippedNotInvoiced (SYSTEM_ID, OrderShippedNotInvoiced_NUMBER, ORDER_NUMBER, OrderShippedNotInvoiced_LINE_NUMBER, ORDER_LINE_NUMBER, OrderShippedNotInvoiced_DATE, EtlUpdatedOn)
go
*/
if exists
	(
		select
			top 1 1
		from
			stg.OrderShippedNotInvoiced as i
		inner join stg.OrderShippedNotInvoicedControl as ic
			on ic.OrderShippedNotInvoicedKey = i.OrderShippedNotInvoicedKey
		where
			i.EtlDeltaHash <> ic.PreviousDeltaHash
	)
	raiserror('Failed to reset delta hash with new logic as not all hash values match at the start of the process', 16, 1);
go

begin try
	begin tran;

		update
			stg.OrderShippedNotInvoiced
		set
			EtlDeltaHash = privy.OrderShippedNotInvoicedDeltaHash
					(
					  Uniqueifier
					, SYSTEM_ID
					, OrderShippedNotInvoiced_NUMBER
					, ORDER_NUMBER
					, OrderShippedNotInvoiced_LINE_NUMBER
					, ORDER_LINE_NUMBER
					, OrderShippedNotInvoiced_DATE
					, OrderShippedNotInvoiced_TYPE
					, OrderShippedNotInvoicedTypeName
					, LOCAL_SITE_SOLD
					, SITE_ID
					, ITEM_NO
					, ITEM_CATEGORY_ID
					, ENV_CATEGORY_ID
					, SOLD_TO_CUSTOMER_NO
					, SHIP_TO_CUSTOMER_NO
					, SALESPERSON_ID
					, SALESPERSON_NAME
					, DELIVERY_DATE
					, EXPECTED_PAYMENT_DATE
					, ACTUAL_PAYMENT_DATE
					, LOCAL_DELIVERY_TERM
					, LOCAL_DELIVERY_TERM_TEXT
					, PAYMENT_TERM_ID
					, LOCAL_PAYMENT_TERM
					, LOCAL_PAYMENT_TERM_TEXT
					, OrderShippedNotInvoiced_QUANTITY
					, OrderShippedNotInvoiced_UOM
					, STATISTIC_QUANTITY
					, STATISTIC_UOM
					, QUANTITY
					, LOCAL_UOM
					, LOCAL_UOM_HARMONIZED
					, LOCAL_UOM_FACTOR
					, OrderShippedNotInvoiced_AMOUNT
					, LOCAL_AMOUNT
					, GROUP_AMOUNT
					, OrderShippedNotInvoiced_CURRENCY
					, LOCAL_CURRENCY
					, LINE_DISCOUNT_AMOUNT
					, OrderShippedNotInvoiced_DISCOUNT_AMOUNT
					, LINE_BONUS_AMOUNT
					, BONUS_SHARE_AMOUNT
					, STD_COST
					, STD_FREIGHT
					)
		--! Stop SQL Prompt throwing spurious errors about no WHERE clause in an update statement
		where
			1 = 1;

		update
			tgt
		set
			tgt.PreviousDeltaHash = src.EtlDeltaHash
		from
			stg.OrderShippedNotInvoiced as src
		inner join stg.OrderShippedNotInvoicedControl as tgt
			on tgt.OrderShippedNotInvoicedKey = src.OrderShippedNotInvoicedKey
		--! Stop SQL Prompt throwing spurious errors about no WHERE clause in an update statement
		where
			1 = 1;

	--! Check that everything was updated correctly
	if exists
		(
			select
				top 1 1
			from
				stg.OrderShippedNotInvoiced as i
			inner join stg.OrderShippedNotInvoicedControl as ic
				on ic.OrderShippedNotInvoicedKey = i.OrderShippedNotInvoicedKey
			where
				i.EtlDeltaHash <> ic.PreviousDeltaHash
		)
		raiserror('Reset delta hash with new values failed as not all hash values match at the end of the process', 16, 1);

	if @@trancount > 0 commit tran ;
end try
begin catch
	if @@trancount > 0 rollback tran;
	select error_number(), error_message()
end catch
go