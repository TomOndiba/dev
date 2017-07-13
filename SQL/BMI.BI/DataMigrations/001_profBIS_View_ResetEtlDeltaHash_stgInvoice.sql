--!
--! 001_profBIS_View_ResetEtlDeltaHash_stgInvoice.sql
--!
use profBIS_View
go

--!
--! We need to re-set all DeltaHash values as the logic has changed (provided there are no differences now
--!
/*
drop table test.InvoiceControl;
drop table test.Invoice;
go
select * into test.InvoiceControl from stg.InvoiceControl ;
go
select * into test.Invoice from stg.Invoice ;
go

alter table test.InvoiceControl add constraint PK_stg_InvoiceControl primary key clustered (InvoiceKey)
go
create nonclustered index NCI_stg_InvoiceControl_ExtractFilter on test.InvoiceControl (InvoiceKey, PreviousDeltaHash, IsDeleted);
go
alter table test.Invoice add constraint PK_stg_Invoice primary key clustered (InvoiceKey)
go
alter table test.Invoice add constraint AK_stg_Invoice_REC_ID unique nonclustered (REC_ID)
go
create nonclustered index NCI_stg_Invoice_ExtractFilter on test.Invoice (InvoiceKey, EtlDeltaHash, IsDeleted, Uniqueifier)
go
create nonclustered index NCI_stg_Invoice_ExpectedUniqueKeys on test.Invoice (SYSTEM_ID, INVOICE_NUMBER, ORDER_NUMBER, INVOICE_LINE_NUMBER, ORDER_LINE_NUMBER, INVOICE_DATE, EtlUpdatedOn)
go
alter table test.Invoice add constraint DF_test_Invoice_Uniqueifier default (1) for Uniqueifier;
go
alter table test.Invoice add DuplicateCount int not null constraint DF_test_Invoice_DuplicateCount default (1)
go

*/
if exists
	(
		select
			top 1 1
		from
			test.Invoice as i
		inner join test.InvoiceControl as ic
			on ic.InvoiceKey = i.InvoiceKey
		where
			i.EtlDeltaHash <> ic.PreviousDeltaHash
	)
	raiserror('Failed to reset delta hash with new logic as not all hash values match at the start of the process', 16, 1);
go

begin try
	begin tran;

		update
			test.Invoice
		set
			  EtlDeltaHash = privy.InvoiceDeltaHash
					(
					  Uniqueifier
					, SYSTEM_ID
					, INVOICE_NUMBER
					, ORDER_NUMBER
					, INVOICE_LINE_NUMBER
					, ORDER_LINE_NUMBER
					, INVOICE_DATE
					, INVOICE_TYPE
					, InvoiceTypeName
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
					, INVOICE_QUANTITY
					, INVOICE_UOM
					, STATISTIC_QUANTITY
					, STATISTIC_UOM
					, QUANTITY
					, LOCAL_UOM
					, LOCAL_UOM_HARMONIZED
					, LOCAL_UOM_FACTOR
					, INVOICE_AMOUNT
					, LOCAL_AMOUNT
					, GROUP_AMOUNT
					, INVOICE_CURRENCY
					, LOCAL_CURRENCY
					, LINE_DISCOUNT_AMOUNT
					, INVOICE_DISCOUNT_AMOUNT
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
			test.Invoice as src
		inner join test.InvoiceControl as tgt
			on tgt.InvoiceKey = src.InvoiceKey
		--! Stop SQL Prompt throwing spurious errors about no WHERE clause in an update statement
		where
			1 = 1;

	--! Check that everything was updated correctly
	if exists
		(
			select
				top 1 1
			from
				test.Invoice as i
			inner join test.InvoiceControl as ic
				on ic.InvoiceKey = i.InvoiceKey
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
