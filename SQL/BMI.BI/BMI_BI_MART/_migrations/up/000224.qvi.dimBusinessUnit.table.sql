if objectpropertyex(object_id(N'qvi.dimBusinessUnit'), N'IsUserTable') is not null
  drop table qvi.dimBusinessUnit ;
go

create table qvi.dimBusinessUnit
(
  BusinessUnitKey int not null
, IsDeleted char(1) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
, NativeBusinessUnitKey nvarchar(50) not null
, StrategicBusinessUnitCode nvarchar(20) not null
, SalesCenterSbuCode nvarchar(20) not null
, BusinessUnitName nvarchar(100) not null
, RegionId int null
, RegionName nvarchar(50) not null
, RegionDescription nvarchar(1000) not null
)
with (heap)
go
