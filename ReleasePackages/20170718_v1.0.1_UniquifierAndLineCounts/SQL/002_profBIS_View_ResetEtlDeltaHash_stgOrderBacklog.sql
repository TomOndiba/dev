--!
--! 002_profBIS_View_ResetEtlDeltaHash_stgOrderBacklog.sql
--!
use profBIS_View
go
--!
--! We need to re-set all DeltaHash values as the logic has changed (provided there are no differences now
--!
/*
drop procedure test.OrderBacklogRefresh;
go
drop table test.OrderBacklogControl;
go
drop table test.OrderBacklog;
go
drop schema [test];
go
create schema [test] authorization [dbo];
go
select * into test.OrderBacklogControl from stg.OrderBacklogControl ;
go
select * into test.OrderBacklog from stg.OrderBacklog ;
go

alter table test.OrderBacklogControl add constraint PK_test_OrderBacklogControl primary key clustered (OrderBacklogKey)
go
create nonclustered index NCI_test_OrderBacklogControl_ExtractFilter on test.OrderBacklogControl (OrderBacklogKey, PreviousDeltaHash, IsDeleted);
go
alter table test.OrderBacklog add constraint PK_test_OrderBacklog primary key clustered (OrderBacklogKey)
go
alter table test.OrderBacklog add constraint AK_test_OrderBacklog_REC_ID unique nonclustered (REC_ID)
go
create nonclustered index NCI_test_OrderBacklog_ExtractFilter on test.OrderBacklog (OrderBacklogKey, EtlDeltaHash, IsDeleted, Uniqueifier)
go
create nonclustered index NCI_test_OrderBacklog_ExpectedUniqueKeys on test.OrderBacklog (SYSTEM_ID, ORDER_NUMBER, ORDER_LINE_NUMBER, EXPECTED_INVOICE_DATE, EtlUpdatedOn)
go
alter table test.OrderBacklog add constraint DF_test_OrderBacklog_Uniqueifier default (1) for Uniqueifier;
go
alter table test.OrderBacklog add DuplicateCount int not null constraint DF_test_OrderBacklog_DuplicateCount default (1)
go

backup log profBIS_View to disk = 'NUL:'

*/


if exists
	(
		select
			top 1 1
		from
			stg.OrderBacklog as i
		inner join stg.OrderBacklogControl as ic
			on ic.OrderBacklogKey = i.OrderBacklogKey
		where
			i.EtlDeltaHash <> ic.PreviousDeltaHash
	)
	raiserror('Failed to reset delta hash with new logic as not all hash values match at the start of the process', 16, 1);
go

begin try
	begin tran;

		update
			stg.OrderBacklog
		set
			  EtlDeltaHash = privy.OrderBacklogDeltaHash
					(
					  Uniqueifier
					, SYSTEM_ID
					, ORDER_NUMBER
					, ORDER_LINE_NUMBER
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
					, ORDER_QUANTITY
					, ORDER_UOM
					, STATISTIC_QUANTITY
					, STATISTIC_UOM
					, QUANTITY
					, LOCAL_UOM
					, LOCAL_UOM_HARMONIZED
					, LOCAL_UOM_FACTOR
					, ORDER_AMOUNT
					, LOCAL_AMOUNT
					, GROUP_AMOUNT
					, ORDER_CURRENCY
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
			stg.OrderBacklog as src
		inner join stg.OrderBacklogControl as tgt
			on tgt.OrderBacklogKey = src.OrderBacklogKey
		--! Stop SQL Prompt throwing spurious errors about no WHERE clause in an update statement
		where
			1 = 1;

	--! Check that everything was updated correctly
	if exists
		(
			select
				top 1 1
			from
				stg.OrderBacklog as i
			inner join stg.OrderBacklogControl as ic
				on ic.OrderBacklogKey = i.OrderBacklogKey
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

