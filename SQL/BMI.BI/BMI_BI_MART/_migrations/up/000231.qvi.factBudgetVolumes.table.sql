if objectpropertyex(object_id(N'qvi.factBudgetVolumes'), N'IsUserTable') is not null
  drop table qvi.factBudgetVolumes ;
go

create table qvi.factBudgetVolumes
(
  BudgetVolumeKey int not null
, EtlDeltaHash char(32) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
, IsDeleted char(1) not null
, LineCount int not null
, BusinessUnitKey int not null
, ProductCategoryKey int not null
, Jan_YTD decimal(28, 4) null
, Feb_YTD decimal(28, 4) null
, Mar_YTD decimal(28, 4) null
, Apr_YTD decimal(28, 4) null
, May_YTD decimal(28, 4) null
, Jun_YTD decimal(28, 4) null
, Jul_YTD decimal(28, 4) null
, Aug_YTD decimal(28, 4) null
, Sep_YTD decimal(28, 4) null
, Oct_YTD decimal(28, 4) null
, Nov_YTD decimal(28, 4) null
, Dec_YTD decimal(28, 4) null
)
with (heap)
go
