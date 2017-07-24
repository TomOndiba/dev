--!
--! 003_profBIS_View_ResetEtlDeltaHash_stgOrderShippedNotInvoiced.sql
--!
use profBIS_View
go
--!
--! We need to re-set all DeltaHash values as the logic has changed (provided there are no differences now
--!
/*
drop procedure test.OrderShippedNotInvoicedRefresh;
go
drop table test.OrderShippedNotInvoicedControl;
go
drop table test.OrderShippedNotInvoiced;
go
drop schema [test];
go
create schema [test] authorization [dbo];
go
select * into test.OrderShippedNotInvoicedControl from stg.OrderShippedNotInvoicedControl ;
go
select * into test.OrderShippedNotInvoiced from stg.OrderShippedNotInvoiced ;
go

alter table test.OrderShippedNotInvoicedControl add constraint PK_test_OrderShippedNotInvoicedControl primary key clustered (OrderShippedNotInvoicedKey)
go
create nonclustered index NCI_test_OrderShippedNotInvoicedControl_ExtractFilter on test.OrderShippedNotInvoicedControl (OrderShippedNotInvoicedKey, PreviousDeltaHash, IsDeleted);
go
alter table test.OrderShippedNotInvoiced add constraint PK_test_OrderShippedNotInvoiced primary key clustered (OrderShippedNotInvoicedKey)
go
alter table test.OrderShippedNotInvoiced add constraint AK_test_OrderShippedNotInvoiced_REC_ID unique nonclustered (REC_ID)
go
create nonclustered index NCI_test_OrderShippedNotInvoiced_ExtractFilter on test.OrderShippedNotInvoiced (OrderShippedNotInvoicedKey, EtlDeltaHash, IsDeleted, Uniqueifier)
go
create nonclustered index NCI_test_OrderShippedNotInvoiced_ExpectedUniqueKeys on test.OrderShippedNotInvoiced (SYSTEM_ID, ORDER_NUMBER, ORDER_LINE_NUMBER, SHIPPING_DOCUMENT, EXPECTED_INVOICE_DATE, EtlUpdatedOn)
go
alter table test.OrderShippedNotInvoiced add constraint DF_test_OrderShippedNotInvoiced_Uniqueifier default (1) for Uniqueifier;
go
alter table test.OrderShippedNotInvoiced add DuplicateCount int not null constraint DF_test_OrderShippedNotInvoiced_DuplicateCount default (1)
go

backup log profBIS_View to disk = 'NUL:'

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
					, ORDER_NUMBER
					, ORDER_LINE_NUMBER
					, SHIPPING_DOCUMENT
					, EXPECTED_INVOICE_DATE
					, ORDER_TYPE
					, OrderTypeName
					, LOCAL_SITE_SOLD
					, SITE_ID
					, ITEM_NO
					, ITEM_CATEGORY_ID
					, ENV_CATEGORY_ID
					, SOLD_TO_CUSTOMER_NO
					, SHIP_TO_CUSTOMER_NO
					, SALESPERSON_ID
					, SALESPERSON_NAME
					, SHIPPED_QUANTITY
					, SHIPPED_UOM
					, STATISTIC_QUANTITY
					, STATISTIC_UOM
					, QUANTITY
					, LOCAL_UOM
					, LOCAL_UOM_HARMONIZED
					, LOCAL_UOM_FACTOR
					, SHIPPED_AMOUNT
					, LOCAL_AMOUNT
					, GROUP_AMOUNT
					, SHIPPED_CURRENCY
					, LOCAL_CURRENCY
					, LINE_DISCOUNT_AMOUNT
					, ORDER_DISCOUNT_AMOUNT
					, LINE_BONUS_AMOUNT
					, BONUS_SHARE_AMOUNT
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

