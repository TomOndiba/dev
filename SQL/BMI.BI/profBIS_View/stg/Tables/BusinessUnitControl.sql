CREATE TABLE [stg].[BusinessUnitControl]
(
  BusinessUnitKey int not null
, PreviousDeltaHash char(32) not null
, IsDeleted char(1) not null
, LastTouchedOn datetime not null
, constraint PK_stg_BusinessUnitControl primary key clustered (BusinessUnitKey)
)
