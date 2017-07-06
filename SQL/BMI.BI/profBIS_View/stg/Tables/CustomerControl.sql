create table [stg].[CustomerControl]
(
  CustomerKey int not null
, PreviousDeltaHash char(32) not null
, IsDeleted char(1) not null
, LastTouchedOn datetime not null
, constraint PK_stg_CustomerControl primary key clustered (CustomerKey)
) on [DEFAULT] ;
go
--create nonclustered index [NCI_stg_Customer_ExtractFilter]
--    on [stg].[Customer](CustomerKey, EtlDeltaHash, IsDeleted);
--go
