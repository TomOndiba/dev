CREATE TABLE [stg].[ProductCategoryControl]
(
  ProductCategoryKey int not null
, PreviousDeltaHash char(32) not null
, IsDeleted char(1) not null
, LastTouchedOn datetime not null
, constraint PK_stg_ProductCategoryControl primary key clustered (ProductCategoryKey)
)
