--!
--! 002_profBIS_View_ResetEtlDeltaHash_stgOrderBacklog.sql
--!
use profBIS_View
go
--!
--! We need to re-set all DeltaHash values as the logic has changed (provided there are no differences now
--!
/*
alter table stg.OrderBacklogControl add constraint PK_stg_OrderBacklogControl primary key clustered (OrderBacklogKey)
go
create nonclustered index NCI_stg_OrderBacklogControl_ExtractFilter on stg.OrderBacklogControl (OrderBacklogKey, PreviousDeltaHash, IsDeleted);
go
alter table stg.OrderBacklog add constraint PK_stg_OrderBacklog primary key clustered (OrderBacklogKey)
go
alter table stg.OrderBacklog add constraint AK_stg_OrderBacklog_REC_ID unique nonclustered (REC_ID)
go
create nonclustered index NCI_stg_OrderBacklog_ExtractFilter on stg.OrderBacklog (OrderBacklogKey, EtlDeltaHash, IsDeleted, Uniqueifier)
go
create nonclustered index NCI_stg_OrderBacklog_ExpectedUniqueKeys on stg.OrderBacklog (SYSTEM_ID, OrderBacklog_NUMBER, ORDER_NUMBER, OrderBacklog_LINE_NUMBER, ORDER_LINE_NUMBER, OrderBacklog_DATE, EtlUpdatedOn)
go
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
					, OrderBacklog_NUMBER
					, ORDER_NUMBER
					, OrderBacklog_LINE_NUMBER
					, ORDER_LINE_NUMBER
					, OrderBacklog_DATE
					, OrderBacklog_TYPE
					, OrderBacklogTypeName
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
					, OrderBacklog_QUANTITY
					, OrderBacklog_UOM
					, STATISTIC_QUANTITY
					, STATISTIC_UOM
					, QUANTITY
					, LOCAL_UOM
					, LOCAL_UOM_HARMONIZED
					, LOCAL_UOM_FACTOR
					, OrderBacklog_AMOUNT
					, LOCAL_AMOUNT
					, GROUP_AMOUNT
					, OrderBacklog_CURRENCY
					, LOCAL_CURRENCY
					, LINE_DISCOUNT_AMOUNT
					, OrderBacklog_DISCOUNT_AMOUNT
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