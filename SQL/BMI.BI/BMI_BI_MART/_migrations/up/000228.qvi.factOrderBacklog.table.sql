if objectpropertyex(object_id(N'qvi.factOrderBacklog'), N'IsUserTable') is not null
  drop table qvi.factOrderBacklog ;
go

create table qvi.factOrderBacklog
(
  OrderBacklogKey int not null
, IsDeleted char(1) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
, DataSourceKey int not null
, QlikViewOrderBacklogKey nvarchar(50) not null
, LineCount int not null
, OrderNumber nvarchar(50) not null
, OrderLineNumber int not null
, NativeOrderLineNumber nvarchar(50) not null
, ExpectedInvoiceDateKey int not null
, ExpectedInvoiceDate datetime not null
, NativeOrderType nvarchar(1) not null
, OrderTypeName nvarchar(50) not null
, LocalSellingSite nvarchar(50) not null
, SiteKey int not null
, ProductKey int not null
, SoldToCustomerKey int not null
, ShippedToCustomerKey int not null
, NativeSalesPersonId nvarchar(50) not null
, NativeSalesPersonName nvarchar(100) not null
, OrderQuantityValue decimal(12, 2) null
, OrderQuantityUnitOfMeasure nvarchar(20) not null
, StatisticQuantityValue decimal(12, 2) null
, StatisticQuantityUnitOfMeasure nvarchar(20) not null
, Quantity decimal(12, 2) null
, LocalUnitOfMeasure nvarchar(20) not null
, LocalUnitOfMeasureHarmonised nvarchar(20) not null
, LocalUnitOfMeasureFactor decimal(11, 4) null
, OrderAmount decimal(15, 4) null
, LocalAmount decimal(15, 4) null
, GroupAmountEUR decimal(15, 4) null
, OrderCurrency nvarchar(3) not null
, LocalCurrency nvarchar(3) not null
, LineDiscountAmount decimal(15, 4) null
, OrderDiscountAmount decimal(15, 4) null
, LineBonusAmount decimal(15, 4) null
, BonusShareAmount decimal(15, 4) null
)
with (heap)
go
