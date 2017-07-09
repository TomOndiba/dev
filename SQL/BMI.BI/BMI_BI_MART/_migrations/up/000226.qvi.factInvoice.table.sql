if objectpropertyex(object_id(N'qvi.factInvoice'), N'IsUserTable') is not null
  drop table qvi.factInvoice ;
go

create table qvi.factInvoice
(
  InvoiceKey int not null
, IsDeleted char(1) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
, DataSourceKey int not null
, QlikViewInvoiceKey nvarchar(50) not null
, LineCount int not null
, InvoiceDateKey int not null
, InvoiceDate datetime not null
, InvoiceNumber nvarchar(20) not null
, InvoiceLineNumber int not null
, NativeInvoiceLineNumber nvarchar(20) not null
, OrderNumber nvarchar(20) not null
, OrderLineNumber int not null
, NativeOrderLineNumber nvarchar(20) not null
, NativeInvoiceType nvarchar(1) not null
, InvoiceTypeName nvarchar(29) not null
, LocalSellingSite nvarchar(20) not null
, SiteKey int not null
, ProductKey int not null
, SoldToCustomerKey int not null
, ShippedToCustomerKey int not null
, NativeSalesPersonId nvarchar(20) not null
, NativeSalesPersonName nvarchar(100) not null
, DeliveryDateKey int not null
, DeliveryDate datetime null
, ExpectedPaymentDateKey int not null
, ExpectedPaymentDate datetime null
, ActualPaymentDateKey int not null
, ActualPaymentDate datetime null
, LocalDeliveryTerm nvarchar(20) not null
, LocalDeliveryTermText nvarchar(100) not null
, PaymentTermKey int not null
, LocalPaymentTerm nvarchar(20) not null
, LocalPaymentTermText nvarchar(100) not null
, InvoiceQuantityValue decimal(12, 2) null
, InvoiceQuantityUnitOfMeasure nvarchar(20) not null
, StatisticQuantityValue decimal(12, 2) null
, StatisticQuantityUnitOfMeasure nvarchar(20) not null
, Quantity decimal(12, 2) null
, LocalUnitOfMeasure nvarchar(20) not null
, LocalUnitOfMeasureHarmonised nvarchar(20) not null
, LocalUnitOfMeasureFactor decimal(11, 4) null
, InvoiceAmount decimal(15, 4) null
, LocalAmount decimal(15, 4) null
, GroupAmountEUR decimal(15, 4) null
, InvoiceCurrency nvarchar(3) not null
, LocalCurrency nvarchar(3) not null
, LineDiscountAmount decimal(15, 4) null
, InvoiceDiscountAmount decimal(15, 4) null
, LineBonusAmount decimal(15, 4) null
, BonusShareAmount decimal(15, 4) null
, StandardCost decimal(15, 4) null
, StandardFreight decimal(15, 4) null
)
with (heap)
go
