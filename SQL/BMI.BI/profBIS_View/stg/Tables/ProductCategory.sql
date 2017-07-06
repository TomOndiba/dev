CREATE TABLE [stg].[ProductCategory]
(
  ProductCategoryKey int not null identity(100, 1)
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
, NativeProductCategoryKey nvarchar(50) not null
-----------------------------------------------------------------------------------------------------------------------
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
, constraint PK_stg_ProductCategory primary key clustered (ProductCategoryKey)
, constraint AK_stg_ProductCategory_NativeProductCategoryKey unique nonclustered (NativeProductCategoryKey)
, constraint CK_stg_ProductCategory_IsDeleted check (IsDeleted = 'Y' or IsDeleted = 'N' )
)
