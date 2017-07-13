create table [stg].[Invoice]
(
  InvoiceKey int not null identity(100, 1)
, EtlDeltaHash char(32) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
, IsDeleted char(1) not null
-----------------------------------------------------------
, REC_ID uniqueidentifier not null -- QlikView surrogate key
-----------------------------------------------------------
--! This is effectively the business key that the ETL process will lookup
, SYSTEM_ID int not null
, INVOICE_DATE datetime not null
, INVOICE_NUMBER nvarchar(20) not null
, INVOICE_LINE_NUMBER nvarchar(20) not null
, ORDER_NUMBER nvarchar(20) not null
, ORDER_LINE_NUMBER nvarchar(20) not null
, Uniqueifier bigint not null constraint DF_test_Invoice_Uniqueifier default (1)
-----------------------------------------------------------
, INVOICE_TYPE nvarchar(1) not null
, InvoiceTypeName nvarchar(29) not null
, LOCAL_SITE_SOLD nvarchar(20) not null
, SITE_ID int not null
, ITEM_NO nvarchar(50) not null
, ITEM_CATEGORY_ID int null
, ENV_CATEGORY_ID int null
, SOLD_TO_CUSTOMER_NO nvarchar(20) not null
, SHIP_TO_CUSTOMER_NO nvarchar(20) not null
, SALESPERSON_ID nvarchar(20) not null
, SALESPERSON_NAME nvarchar(100) not null
, DELIVERY_DATE datetime null
, EXPECTED_PAYMENT_DATE datetime null
, ACTUAL_PAYMENT_DATE datetime null
, LOCAL_DELIVERY_TERM nvarchar(20) not null
, LOCAL_DELIVERY_TERM_TEXT nvarchar(100) not null
, PAYMENT_TERM_ID int null
, LOCAL_PAYMENT_TERM nvarchar(20) not null
, LOCAL_PAYMENT_TERM_TEXT nvarchar(100) not null
, INVOICE_QUANTITY decimal(12, 2) null
, INVOICE_UOM nvarchar(20) not null
, STATISTIC_QUANTITY decimal(12, 2) null
, STATISTIC_UOM nvarchar(20) not null
, QUANTITY decimal(12, 2) null
, LOCAL_UOM nvarchar(20) not null
, LOCAL_UOM_HARMONIZED nvarchar(20) not null
, LOCAL_UOM_FACTOR decimal(11, 4) null
, INVOICE_AMOUNT decimal(15, 4) null
, LOCAL_AMOUNT decimal(15, 4) null
, GROUP_AMOUNT decimal(15, 4) null
, INVOICE_CURRENCY nvarchar(3) not null
, LOCAL_CURRENCY nvarchar(3) null
, LINE_DISCOUNT_AMOUNT decimal(15, 4) null
, INVOICE_DISCOUNT_AMOUNT decimal(15, 4) null
, LINE_BONUS_AMOUNT decimal(15, 4) null
, BONUS_SHARE_AMOUNT decimal(15, 4) null
, STD_COST decimal(15, 4) null
, STD_FREIGHT decimal(15, 4) null
, DuplicateCount int not null constraint DF_test_Invoice_DuplicateCount default (1)
-----------------------------------------------------------------------------------------------------------------------
, constraint PK_stg_Invoice primary key clustered (InvoiceKey)
, constraint AK_stg_Invoice_REC_ID unique nonclustered (REC_ID)
, constraint CK_stg_Invoice_IsDeleted check (IsDeleted = 'Y' or IsDeleted = 'N')
) on [default] ;
go

create nonclustered index NCI_stg_Invoice_ExtractFilter on stg.Invoice (InvoiceKey, EtlDeltaHash, IsDeleted, Uniqueifier)
go
create nonclustered index NCI_stg_Invoice_ExpectedUniqueKeys on stg.Invoice
	(SYSTEM_ID, INVOICE_NUMBER, ORDER_NUMBER, INVOICE_LINE_NUMBER, ORDER_LINE_NUMBER, INVOICE_DATE, EtlUpdatedOn)
go