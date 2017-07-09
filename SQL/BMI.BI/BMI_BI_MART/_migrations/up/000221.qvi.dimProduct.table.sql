if objectpropertyex(object_id(N'qvi.dimProduct'), N'IsUserTable') is not null
  drop table qvi.dimProduct ;
go

create table qvi.dimProduct
(
  ProductKey int not null
, IsDeleted char(1) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
-----------------------------------------------------------------------------------------------------------------------
, DataSourceKey int not null
, NativeProductKey nvarchar (50) not null
-----------------------------------------------------------------------------------------------------------------------
, ProductNumber nvarchar(50) not null
, ProductName nvarchar(100) not null
, ProductTypeId int null
, ProductTypeName nvarchar(50) not null
, ProductGnit nvarchar(50) not null
, ProductDescription1 nvarchar(100) not null
, ProductDescription2 nvarchar(100) not null
, LocalProductGroup1 nvarchar(50) not null
, LocalProductGroup2 nvarchar(50) not null
, LocalProductGroup3 nvarchar(50) not null
, LocalProductGroup4 nvarchar(50) not null
, LocalProductGroup5 nvarchar(50) not null
-----------------------------------------------------------------------------------------------------------------------
, NativeProductCategoryKey nvarchar (100) not null
, ProductCategoryBaseLevel nvarchar(200) not null
, ProductCategoryLevel1 nvarchar(200) not null
, ProductCategoryLevel2 nvarchar(200) not null
, ProductCategoryLevel3 nvarchar(200) not null
, ProductCategoryLevel4 nvarchar(200) not null
, ProductCategoryLevel5 nvarchar(200) not null
-----------------------------------------------------------------------------------------------------------------------
, EnglishProductName nvarchar(100) null
, EnglishProductTypeName nvarchar(50) null
, EnglishProductDescription1 nvarchar(100) null
, EnglishProductDescription2 nvarchar(100) null
, EnglishConfidenceScore int not null
)
with (heap)
go

--create index NCI_qvi_dimProduct_ProductKey on qvi.dimProduct (ProductKey);
--go
create index NCI_qvi_dimProduct_ProductKeyLookup on qvi.dimProduct (ProductKey, EtlCreatedOn, EtlCreatedBy, EtlDeletedOn, EtlDeletedBy) ;
go