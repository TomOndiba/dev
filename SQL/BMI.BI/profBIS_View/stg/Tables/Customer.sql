create table stg.Customer
(
  CustomerKey int not null identity(100, 1)
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
, QlikViewSourceSystemId int not null
, NativeCustomerKey nvarchar(50) not null
-----------------------------------------------------------------------------------------------------------------------
, CustomerNumber nvarchar(50) not null
, CustomerName nvarchar(100) null
, CustomerAddress1 nvarchar(100) null
, CustomerAddress2 nvarchar(100) null
, CustomerAddress3 nvarchar(100) null
, CustomerZipCode nvarchar(100) null
, CustomerCity nvarchar(100) null
, CustomerCountry nvarchar(100) null
, CustomerVatNumber nvarchar(50) null
, CustomerTypeId int null
, CustomerTypeName nvarchar(100) null
, CustomerGroup1 nvarchar(100) null
, CustomerGroup2 nvarchar(100) null
, CustomerGroup3 nvarchar(100) null
, CustomerGroup4 nvarchar(100) null
, CustomerGroup5 nvarchar(100) null
-----------------------------------------------------------------------------------------------------------------------
, CategoryIsMapped char(1) not null
, NativeCustomerCategoryKey nvarchar(100) not null
, CustomerCategoryBaseLevel nvarchar(200) not null
, CustomerCategoryLevel1 nvarchar(100) null
, CustomerCategoryLevel2 nvarchar(100) null
, CustomerCategoryLevel3 nvarchar(100) null
, CustomerCategoryLevel4 nvarchar(100) null
, CustomerCategoryLevel5 nvarchar(100) null
, CustomerCategoryLevel6 nvarchar(100) null
, CustomerCategoryLevel7 nvarchar(100) null
, CustomerCategoryLevel8 nvarchar(100) null
-----------------------------------------------------------------------------------------------------------------------
, constraint PK_stg_Customer primary key clustered (CustomerKey)
, constraint AK_stg_Customer_QlikViewSourceSystemId_NativeCustomerKey unique nonclustered (QlikViewSourceSystemId, NativeCustomerKey)
, constraint CK_stg_Customer_IsDeleted check (IsDeleted = 'Y' or IsDeleted = 'N')
, constraint CK_stg_Customer_CategoryIsMapped check (CategoryIsMapped = 'Y' or IsDeleted = 'N')
) ;
go
create nonclustered index [NCI_stg_Customer_ExtractFilter]
    on [stg].[Customer](CustomerKey, EtlDeltaHash, IsDeleted);
go

