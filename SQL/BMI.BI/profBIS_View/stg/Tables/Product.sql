CREATE TABLE [stg].[Product]
(
  ProductKey int not null identity(100,1)
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
, NativeProductKey nvarchar (50) not null -- was ITEM_KEY
-----------------------------------------------------------------------------------------------------------------------
, ProductNumber nvarchar(50) not null -- was ITEM_TYPE
, ProductName nvarchar(100) not null -- was ITEM_NAME
, ProductTypeId int null
, ProductTypeName nvarchar(50) not null -- was ITEM_TYPE
, ProductGnit nvarchar(50) not null -- was ITEM_GNIT ???
, ProductDescription1 nvarchar(100) not null
, ProductDescription2 nvarchar(100) not null
, LocalProductGroup1 nvarchar(50) not null -- was LOCAL_ITEM_GROUP_1
, LocalProductGroup2 nvarchar(50) not null -- was LOCAL_ITEM_GROUP_2
, LocalProductGroup3 nvarchar(50) not null -- was LOCAL_ITEM_GROUP_3
, LocalProductGroup4 nvarchar(50) not null -- was LOCAL_ITEM_GROUP_4
, LocalProductGroup5 nvarchar(50) not null -- was LOCAL_ITEM_GROUP_5
-----------------------------------------------------------------------------------------------------------------------
, NativeProductCategoryKey nvarchar (100) not null -- was ITEM_CATEGORY_ID_KEY
, ProductCategoryBaseLevel nvarchar(200) not null -- was ITEM_CATEGORY_WITH_BUDGET
, ProductCategoryLevel1Id int null
, ProductCategoryLevel1 nvarchar(200) not null -- was ITEM_CATEGORY_LEVEL_1
, ProductCategoryLevel2Id int null
, ProductCategoryLevel2 nvarchar(200) not null -- was ITEM_CATEGORY_LEVEL_2
, ProductCategoryLevel3Id int null
, ProductCategoryLevel3 nvarchar(200) not null -- was ITEM_CATEGORY_LEVEL_3
, ProductCategoryLevel4Id int null
, ProductCategoryLevel4 nvarchar(200) not null -- was ITEM_CATEGORY_LEVEL_4
, ProductCategoryLevel5Id int null
, ProductCategoryLevel5 nvarchar(200) not null -- was ITEM_CATEGORY_LEVEL_5
, ProductCategoryLevel6Id int null
, ProductCategoryLevel6 nvarchar(200) not null -- was ITEM_CATEGORY_LEVEL_5
-----------------------------------------------------------------------------------------------------------------------
, constraint PK_stg_Product primary key clustered (ProductKey)
, constraint AK_stg_Product_QlikViewSourceSystemId_NativeProductKey unique nonclustered (QlikViewSourceSystemId, NativeProductKey)
, constraint CK_stg_Product_IsDeleted check (IsDeleted = 'Y' OR IsDeleted = 'N')
);
go
create nonclustered index [NCI_stg_Product_ExtractFilter]
    on [stg].[Product](ProductKey, EtlDeltaHash, IsDeleted);
go


