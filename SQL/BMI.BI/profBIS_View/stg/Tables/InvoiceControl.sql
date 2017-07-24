create table [stg].[InvoiceControl]
(
  InvoiceKey int not null
, PreviousDeltaHash char(32) not null
, IsDeleted char(1) not null
, LastTouchedOn datetime not null
, constraint PK_stg_InvoiceControl primary key clustered (InvoiceKey)
) on [DEFAULT] ;
go
create nonclustered index [NCI_stg_InvoiceControl_ExtractFilter]
    on [stg].[InvoiceControl] (InvoiceKey, PreviousDeltaHash, IsDeleted);
go