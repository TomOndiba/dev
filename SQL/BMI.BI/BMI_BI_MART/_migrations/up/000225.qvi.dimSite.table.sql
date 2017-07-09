if objectpropertyex(object_id(N'qvi.dimSite'), N'IsUserTable') is not null
  drop table qvi.dimSite ;
go

create table qvi.dimSite
(
  SiteKey int not null
, IsDeleted char(1) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
, NativeSiteKey nvarchar(50) not null
, SiteName nvarchar(100) not null
, SiteDescription nvarchar(1000) not null
, BusinessUnitKey int not null
, StrategicBusinessUnitCode nvarchar(20) not null
, SalesCenterSbuCode nvarchar(20) not null
, BusinessUnitName nvarchar(100) not null
, RegionId int null
, RegionName nvarchar(50) not null
, RegionDescription nvarchar(1000) not null
, DataSourceKey int null
, SourceSystemId int null
, SourceSystemName nvarchar(100) not null
)
with (heap)
go
