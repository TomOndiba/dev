CREATE TABLE [stg].[OrderBacklogControl]
(
  OrderBacklogKey int not null
, PreviousDeltaHash char(32) not null
, IsDeleted char(1) not null
, LastTouchedOn datetime not null
, constraint PK_stg_OrderBacklogControl primary key clustered (OrderBacklogKey)
)
