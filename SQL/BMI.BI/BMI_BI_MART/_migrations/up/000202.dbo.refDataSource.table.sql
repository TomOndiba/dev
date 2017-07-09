if objectpropertyex(object_id(N'dbo.refDataSource'), N'IsUserTable') is not null
  drop table dbo.refDataSource ;
go

create table dbo.refDataSource
(
  DataSourceKey int not null
, DataSourceCode nvarchar(20) not null
, DataSourceName nvarchar(50) not null
, DataSourceGroup nvarchar(50) not null
, HostCountry nvarchar(50) not null
, DataCountries nvarchar(100) not null
, Narrative nvarchar(500) not null
, QlikViewSourceSystemId int null
, IsActive char(1) not null
)
with (heap)
go
