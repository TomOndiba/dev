if objectpropertyex(object_id(N'qvi.dimPaymentTerm'), N'IsUserTable') is not null
  drop table qvi.dimPaymentTerm ;
go

create table qvi.dimPaymentTerm
(
  PaymentTermKey int not null
, IsDeleted char(1) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
, NativePaymentTermKey nvarchar (50) not null
, PaymentTermName nvarchar(100) not null
, PaymentTermDays int null
, PaymentTermDescription nvarchar(500) not null
)
with (heap)
go
