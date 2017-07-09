if objectpropertyex(object_id(N'qvi.dimCustomer'), N'IsUserTable') is not null
  drop table qvi.dimCustomer ;
go

create table qvi.dimCustomer
(
  CustomerKey int not null
, IsDeleted char(1) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
-----------------------------------------------------------------------------------------------------------------------
, DataSourceKey int not null
, NativeCustomerKey nvarchar (50) not null
-----------------------------------------------------------------------------------------------------------------------
, CustomerNumber nvarchar(50) not null
, CustomerName nvarchar(100) not null
, CustomerAddress1 nvarchar(100) not null
, CustomerAddress2 nvarchar(100) not null
, CustomerAddress3 nvarchar(100) not null
, CustomerZipCode nvarchar(100) not null
, CustomerCity nvarchar(100) not null
, CustomerCountry nvarchar(100) not null
, CustomerVatNumber nvarchar(50) not null
, CustomerTypeId int null
, CustomerTypeName nvarchar(100) not null
, CustomerGroup1 nvarchar(100) not null
, CustomerGroup2 nvarchar(100) not null
, CustomerGroup3 nvarchar(100) not null
, CustomerGroup4 nvarchar(100) not null
, CustomerGroup5 nvarchar(100) not null
, CategoryIsMapped char(1) not null
, NativeCustomerCategoryKey nvarchar(100) not null
, CustomerCategoryBaseLevel nvarchar(200) not null
, CustomerCategoryLevel1 nvarchar(100) not null
, CustomerCategoryLevel2 nvarchar(100) not null
, CustomerCategoryLevel3 nvarchar(100) not null
, CustomerCategoryLevel4 nvarchar(100) not null
, CustomerCategoryLevel5 nvarchar(100) not null
, CustomerCategoryLevel6 nvarchar(100) not null
, CustomerCategoryLevel7 nvarchar(100) not null
, CustomerCategoryLevel8 nvarchar(100) not null
)
with (heap)
go

create index NCI_qvi_dimCustomer_CustomerKey on qvi.dimCustomer (CustomerKey);
go