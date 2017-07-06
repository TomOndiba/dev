CREATE TABLE [stg].[PaymentTermControl]
(
  PaymentTermKey int not null
, PreviousDeltaHash char(32) not null
, IsDeleted char(1) not null
, LastTouchedOn datetime not null
, constraint PK_stg_PaymentTermControl primary key clustered (PaymentTermKey)
) on [DEFAULT] ;
go
