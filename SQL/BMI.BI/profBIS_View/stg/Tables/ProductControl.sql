create table [stg].[ProductControl]
(
  ProductKey int not null
, PreviousDeltaHash char(32) not null
, IsDeleted char(1) not null
, LastTouchedOn datetime not null
, constraint PK_stg_ProductControl primary key clustered (ProductKey)
) on [DEFAULT] ;
go
--create nonclustered index [NCI_stg_Product_ExtractFilter]
--    on [stg].[Product](ProductKey, EtlDeltaHash, IsDeleted);
--go