CREATE TABLE [stg].[SiteControl]
(
  SiteKey int not null
, PreviousDeltaHash char(32) not null
, IsDeleted char(1) not null
, LastTouchedOn datetime not null
, constraint PK_stg_SiteControl primary key clustered (SiteKey)
) on [DEFAULT] ;
go
