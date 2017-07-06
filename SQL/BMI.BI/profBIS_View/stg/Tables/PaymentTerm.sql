CREATE TABLE [stg].[PaymentTerm]
(
  PaymentTermKey int not null identity(100,1)
, EtlDeltaHash char(32) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
, IsDeleted char(1) not null
-----------------------------------------------------------------------------------------------------------------------
--! This is effectively the business key that the ETL process will lookup
, NativePaymentTermKey nvarchar (50) not null
-----------------------------------------------------------------------------------------------------------------------
, PaymentTermName nvarchar(100) not null
, PaymentTermDays int null
, PaymentTermDescription nvarchar(500) not null
-----------------------------------------------------------------------------------------------------------------------
, constraint PK_stg_PaymentTerm primary key clustered (PaymentTermKey)
, constraint AK_stg_PaymentTerm_NativePaymentTermKey unique nonclustered (NativePaymentTermKey)
, constraint CK_stg_PaymentTerm_IsDeleted check (IsDeleted = 'Y' OR IsDeleted = 'N')
)
