CREATE TABLE [stg].[OrderBacklog]
(
  OrderBacklogKey int not null identity(100, 1)
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
, ORDER_NUMBER nvarchar(50) not null
, ORDER_LINE_NUMBER nvarchar(50) not null
, Uniqueifier bigint not null
-----------------------------------------------------------
, EXPECTED_INVOICE_DATE datetime not null
, ORDER_TYPE nvarchar(1) not null
, OrderTypeName nvarchar(50) not null
, LOCAL_SITE_SOLD nvarchar(50) not null
, SITE_ID int null
, ITEM_NO nvarchar(20) not null
, ITEM_CATEGORY_ID int null
, ENV_CATEGORY_ID int null
, SOLD_TO_CUSTOMER_NO nvarchar(50) not null
, SHIP_TO_CUSTOMER_NO nvarchar(50) not null
, SALESPERSON_ID nvarchar(50) not null
, SALESPERSON_NAME nvarchar(100) not null
, ORDER_QUANTITY decimal(12, 2) null
, ORDER_UOM nvarchar(20) not null
, STATISTIC_QUANTITY decimal(12, 2) null
, STATISTIC_UOM nvarchar(20) not null
, QUANTITY decimal(12, 2) null
, LOCAL_UOM nvarchar(20) not null
, LOCAL_UOM_HARMONIZED nvarchar(20) not null
, LOCAL_UOM_FACTOR decimal(11, 4) null
, ORDER_AMOUNT decimal(15, 4) null
, LOCAL_AMOUNT decimal(15, 4) null
, GROUP_AMOUNT decimal(15, 4) null
, ORDER_CURRENCY nvarchar(3) not null
, LOCAL_CURRENCY nvarchar(3) not null
, LINE_DISCOUNT_AMOUNT decimal(15, 4) null
, ORDER_DISCOUNT_AMOUNT decimal(15, 4) null
, LINE_BONUS_AMOUNT decimal(15, 4) null
, BONUS_SHARE_AMOUNT decimal(15, 4) null
-----------------------------------------------------------------------------------------------------------------------
, constraint PK_stg_OrderBacklog primary key clustered (OrderBacklogKey)
, constraint AK_stg_OrderBacklog_UniqueifiedBusinessKey unique nonclustered (SYSTEM_ID, ORDER_NUMBER, ORDER_LINE_NUMBER, Uniqueifier)
, constraint CK_stg_OrderBacklog_IsDeleted check (IsDeleted = 'Y' or IsDeleted = 'N')
) on [default] ;
go
