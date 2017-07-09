if objectpropertyex(object_id(N'qvi.dimProductCategory'), N'IsUserTable') is not null
  drop table qvi.dimProductCategory ;
go

create table qvi.dimProductCategory
(
  ProductCategoryKey int not null
, IsDeleted char(1) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
, NativeProductCategoryKey nvarchar(50) not null
, ProductCategoryId int not null
, ProductCategoryName nvarchar(100) not null
, NodeDepth tinyint not null
, Level3Id int not null
, Level3Name nvarchar(100) not null
, Level2Id int not null
, Level2Name nvarchar(100) not null
, Level1Id int not null
, Level1Name nvarchar(100) not null
, ProductCategoryDescription nvarchar(500) not null
)
with (heap)
go
