--!
--! 001.BMI_BI_MART_PROD.deploy.sql
--!
if schema_id('utils') is null
	exec(N'create schema [utils] authorization [dbo];');
go

if schema_id('qvi') is null
	exec(N'create schema [qvi] authorization [dbo];');
go

if schema_id('pbi') is null
	exec(N'create schema [pbi] authorization [dbo];');
go

if objectpropertyex(object_id(N'dbo.dimDate'), N'IsUserTable') is not null
  drop table dbo.dimDate ;
go
create table dbo.dimDate
(
  DateKey int not null
, ActualDate date null
, DateNameEU varchar(30) not null
, DateNameUS varchar(30) not null
, EnglishMonthCode char(3) not null
, EnglishMonthName varchar(10) not null
, EnglishDayCode char(3) not null
, EnglishDayName varchar(10) not null
, CalendarYear int null
, CalendarQuarter tinyint null
, MonthNumberInYear tinyint null
, WeekNumberInYear tinyint null
, DayNumberInYear smallint null
, DayNumberInMonth tinyint null
, DayNumberInWeek tinyint null
, YearMonth varchar(10) not null
, YearQuarter varchar(10) not null
, IsWeekend varchar(10) not null
, IsLastDayInMonth varchar(10) not null
, MondayWeekCommencing date null
, WorkDaysInMonthTotal tinyint null
, WorkDaysInMonthToDate tinyint null
, FiscalPeriod tinyint null
, FiscalQuarter tinyint null
, FiscalYear int null
, FiscalPeriodCode char(3) not null
, FiscalPeriodName varchar(10) not null
, FiscalYearPeriod varchar(10) not null
, FiscalYearQuarter varchar(10) not null
, WorkDaysInFiscalPeriodTotal tinyint null
, WorkDaysInFiscalPeriodToDate tinyint null
)
with (heap)
go

create index NCI_dimDate_DateKey on dbo.dimDate (DateKey);
go

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

if objectpropertyex(object_id(N'qvi.dimProduct'), N'IsUserTable') is not null
  drop table qvi.dimProduct ;
go

create table qvi.dimProduct
(
  ProductKey int not null
, IsDeleted char(1) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
-----------------------------------------------------------------------------------------------------------------------
, DataSourceKey int not null
, NativeProductKey nvarchar (50) not null
-----------------------------------------------------------------------------------------------------------------------
, ProductNumber nvarchar(50) not null
, ProductName nvarchar(100) not null
, ProductTypeId int null
, ProductTypeName nvarchar(50) not null
, ProductGnit nvarchar(50) not null
, ProductDescription1 nvarchar(100) not null
, ProductDescription2 nvarchar(100) not null
, LocalProductGroup1 nvarchar(50) not null
, LocalProductGroup2 nvarchar(50) not null
, LocalProductGroup3 nvarchar(50) not null
, LocalProductGroup4 nvarchar(50) not null
, LocalProductGroup5 nvarchar(50) not null
-----------------------------------------------------------------------------------------------------------------------
, NativeProductCategoryKey nvarchar (100) not null
, ProductCategoryBaseLevel nvarchar(200) not null
, ProductCategoryLevel1 nvarchar(200) not null
, ProductCategoryLevel2 nvarchar(200) not null
, ProductCategoryLevel3 nvarchar(200) not null
, ProductCategoryLevel4 nvarchar(200) not null
, ProductCategoryLevel5 nvarchar(200) not null
-----------------------------------------------------------------------------------------------------------------------
, EnglishProductName nvarchar(100) null
, EnglishProductTypeName nvarchar(50) null
, EnglishProductDescription1 nvarchar(100) null
, EnglishProductDescription2 nvarchar(100) null
, EnglishConfidenceScore int not null
)
with (heap)
go

--create index NCI_qvi_dimProduct_ProductKey on qvi.dimProduct (ProductKey);
--go
create index NCI_qvi_dimProduct_ProductKeyLookup on qvi.dimProduct (ProductKey, EtlCreatedOn, EtlCreatedBy, EtlDeletedOn, EtlDeletedBy) ;
go

if objectpropertyex(object_id(N'qvi.dimCustomer'), N'IsUserTable') is not null
  drop table qvi.dimCustomer ;
go

create table qvi.dimCustomer
(
  CustomerKey int not null
, IsDeleted char(1) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
-----------------------------------------------------------------------------------------------------------------------
, DataSourceKey int not null
, NativeCustomerKey nvarchar (50) not null
-----------------------------------------------------------------------------------------------------------------------
, CustomerNumber nvarchar(50) not null
, CustomerName nvarchar(100) not null
, CustomerAddress1 nvarchar(100) not null
, CustomerAddress2 nvarchar(100) not null
, CustomerAddress3 nvarchar(100) not null
, CustomerZipCode nvarchar(100) not null
, CustomerCity nvarchar(100) not null
, CustomerCountry nvarchar(100) not null
, CustomerVatNumber nvarchar(50) not null
, CustomerTypeId int null
, CustomerTypeName nvarchar(100) not null
, CustomerGroup1 nvarchar(100) not null
, CustomerGroup2 nvarchar(100) not null
, CustomerGroup3 nvarchar(100) not null
, CustomerGroup4 nvarchar(100) not null
, CustomerGroup5 nvarchar(100) not null
, CategoryIsMapped char(1) not null
, NativeCustomerCategoryKey nvarchar(100) not null
, CustomerCategoryBaseLevel nvarchar(200) not null
, CustomerCategoryLevel1 nvarchar(100) not null
, CustomerCategoryLevel2 nvarchar(100) not null
, CustomerCategoryLevel3 nvarchar(100) not null
, CustomerCategoryLevel4 nvarchar(100) not null
, CustomerCategoryLevel5 nvarchar(100) not null
, CustomerCategoryLevel6 nvarchar(100) not null
, CustomerCategoryLevel7 nvarchar(100) not null
, CustomerCategoryLevel8 nvarchar(100) not null
)
with (heap)
go

create index NCI_qvi_dimCustomer_CustomerKey on qvi.dimCustomer (CustomerKey);
go

if objectpropertyex(object_id(N'qvi.dimPaymentTerm'), N'IsUserTable') is not null
  drop table qvi.dimPaymentTerm ;
go

create table qvi.dimPaymentTerm
(
  PaymentTermKey int not null
, IsDeleted char(1) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
, NativePaymentTermKey nvarchar (50) not null
, PaymentTermName nvarchar(100) not null
, PaymentTermDays int null
, PaymentTermDescription nvarchar(500) not null
)
with (heap)
go

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

if objectpropertyex(object_id(N'qvi.factOrderShippedNotInvoiced'), N'IsUserTable') is not null
  drop table qvi.factOrderShippedNotInvoiced ;
go

create table qvi.factOrderShippedNotInvoiced
(
  OrderShippedNotInvoicedKey int not null
, IsDeleted char(1) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
, DataSourceKey int not null
, QlikViewOrderShippedNotInvoicedKey nvarchar(50) not null
, LineCount int not null
, OrderNumber nvarchar(50) not null
, OrderLineNumber int not null
, NativeOrderLineNumber nvarchar(50) not null
, NativeShippingDocumentKey nvarchar(50) not null
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
, ShippedQuantityValue decimal(12, 2) null
, ShippedQuantityUnitOfMeasure nvarchar(20) not null
, StatisticQuantityValue decimal(12, 2) null
, StatisticQuantityUnitOfMeasure nvarchar(20) not null
, Quantity decimal(12, 2) null
, LocalUnitOfMeasure nvarchar(20) not null
, LocalUnitOfMeasureHarmonised nvarchar(20) not null
, LocalUnitOfMeasureFactor decimal(11, 4) null
, ShippedAmount decimal(15, 4) null
, LocalAmount decimal(15, 4) null
, GroupAmountEUR decimal(15, 4) null
, ShippedCurrency nvarchar(3) not null
, LocalCurrency nvarchar(3) not null
, LineDiscountAmount decimal(15, 4) null
, OrderDiscountAmount decimal(15, 4) null
, LineBonusAmount decimal(15, 4) null
, BonusShareAmount decimal(15, 4) null
)
with (heap)
go

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

if objectpropertyex(object_id(N'qvi.dimProductCategory'), N'IsUserTable') is not null
  drop table qvi.dimProductCategory ;
go

create table qvi.dimProductCategory
(
  ProductCategoryKey int not null
, IsDeleted char(1) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
, NativeProductCategoryKey nvarchar(50) not null
, ProductCategoryId int not null
, ProductCategoryName nvarchar(100) not null
, NodeDepth tinyint not null
, Level3Id int not null
, Level3Name nvarchar(100) not null
, Level2Id int not null
, Level2Name nvarchar(100) not null
, Level1Id int not null
, Level1Name nvarchar(100) not null
, ProductCategoryDescription nvarchar(500) not null
)
with (heap)
go


if objectpropertyex(object_id(N'qvi.factBudgetSales'), N'IsUserTable') is not null
  drop table qvi.factBudgetSales ;
go

create table qvi.factBudgetSales
(
  BudgetSaleKey int not null
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
, BudgetMonthDateKey int not null
, InstallationServices decimal(28,4) null
, ProducedGoods decimal(28,4) null
, GroupGoods decimal(28,4) null
, CommercialGoods decimal(28,4) null
, ExternalSales decimal(28,4) null
, IC_Transf_SBU decimal(28,4) null
, IC_Transf_Region decimal(28,4) null
, IC_Transf_Abroad decimal(28,4) null
, IC_Transf_US decimal(28,4) null
, Total_IC_Sales decimal(28,4) null
, TotalSalesAndTransfers decimal(28,4) null
)
with (heap)
go

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

if objectpropertyex(object_id(N'pbi.dimActualDeliveryDate'), N'IsView') = 1
	drop view pbi.dimActualDeliveryDate
go
set quoted_identifier on;
set ansi_nulls on;
go
create view [pbi].[dimActualDeliveryDate]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.dimActualDeliveryDate
DESCRIPTION:    Exposes date information for use with factInvoice.ActualDeliveryDateKey
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    21-JUN-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		21-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------


**********************************************************************************************************************/
--</CommentHeader>

	select
		  DateKey as [ActualDeliveryDateKey]
		, ActualDate as [ActualDeliveryDate]
		, DateNameEU as [ActualDeliveryDateNameEU]
		, DateNameUS as [ActualDeliveryDateNameUS]
		, EnglishMonthCode as [ActualDeliveryDateEnglishMonthCode]
		, EnglishMonthName as [ActualDeliveryDateEnglishMonthName]
		, EnglishDayCode as [ActualDeliveryDateEnglishDayCode]
		, EnglishDayName as [ActualDeliveryDateEnglishDayName]
		, CalendarYear as [ActualDeliveryDateCalendarYear]
		, CalendarQuarter as [ActualDeliveryDateCalendarQuarter]
		, MonthNumberInYear as [ActualDeliveryDateMonthNumberInYear]
		, WeekNumberInYear as [ActualDeliveryDateWeekNumberInYear]
		, DayNumberInYear as [ActualDeliveryDateDayNumberInYear]
		, DayNumberInMonth as [ActualDeliveryDateDayNumberInMonth]
		, DayNumberInWeek as [ActualDeliveryDateDayNumberInWeek]
		, YearMonth as [ActualDeliveryDateYearMonth]
		, YearQuarter as [ActualDeliveryDateYearQuarter]
		, IsWeekend as [ActualDeliveryDateIsWeekend]
		, IsLastDayInMonth as [ActualDeliveryDateIsLastDayInMonth]
		, MondayWeekCommencing as [ActualDeliveryDateMondayWeekCommencing]
		, WorkDaysInMonthTotal as [ActualDeliveryDateWorkDaysInMonthTotal]
		, WorkDaysInMonthToDate as [ActualDeliveryDateWorkDaysInMonthToDate]
		, FiscalPeriod as [ActualDeliveryFiscalPeriod]
		, FiscalQuarter as [ActualDeliveryFiscalQuarter]
		, FiscalYear as [ActualDeliveryFiscalYear]
		, FiscalPeriodCode as [ActualDeliveryFiscalPeriodCode]
		, FiscalPeriodName as [ActualDeliveryFiscalPeriodName]
		, FiscalYearPeriod as [ActualDeliveryFiscalYearPeriod]
		, FiscalYearQuarter as [ActualDeliveryFiscalYearQuarter]
		, WorkDaysInFiscalPeriodTotal as [ActualDeliveryWorkDaysInFiscalPeriodTotal]
		, WorkDaysInFiscalPeriodToDate as [ActualDeliveryWorkDaysInFiscalPeriodToDate]
	from
		dbo.dimDate
go

if objectpropertyex(object_id(N'pbi.dimActualPaymentDate'), N'IsView') = 1
	drop view pbi.dimActualPaymentDate
go
set quoted_identifier on;
set ansi_nulls on;
go
create view [pbi].[dimActualPaymentDate]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.dimActualPaymentDate
DESCRIPTION:    Exposes date information for use with factInvoice.ActualPaymentDateKey
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    21-JUN-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		21-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------


**********************************************************************************************************************/
--</CommentHeader>

	select
		  DateKey as [ActualPaymentDateKey]
		, ActualDate as [ActualPaymentDate]
		, DateNameEU as [ActualPaymentDateNameEU]
		, DateNameUS as [ActualPaymentDateNameUS]
		, EnglishMonthCode as [ActualPaymentDateEnglishMonthCode]
		, EnglishMonthName as [ActualPaymentDateEnglishMonthName]
		, EnglishDayCode as [ActualPaymentDateEnglishDayCode]
		, EnglishDayName as [ActualPaymentDateEnglishDayName]
		, CalendarYear as [ActualPaymentDateCalendarYear]
		, CalendarQuarter as [ActualPaymentDateCalendarQuarter]
		, MonthNumberInYear as [ActualPaymentDateMonthNumberInYear]
		, WeekNumberInYear as [ActualPaymentDateWeekNumberInYear]
		, DayNumberInYear as [ActualPaymentDateDayNumberInYear]
		, DayNumberInMonth as [ActualPaymentDateDayNumberInMonth]
		, DayNumberInWeek as [ActualPaymentDateDayNumberInWeek]
		, YearMonth as [ActualPaymentDateYearMonth]
		, YearQuarter as [ActualPaymentDateYearQuarter]
		, IsWeekend as [ActualPaymentDateIsWeekend]
		, IsLastDayInMonth as [ActualPaymentDateIsLastDayInMonth]
		, MondayWeekCommencing as [ActualPaymentDateMondayWeekCommencing]
		, WorkDaysInMonthTotal as [ActualPaymentDateWorkDaysInMonthTotal]
		, WorkDaysInMonthToDate as [ActualPaymentDateWorkDaysInMonthToDate]
		, FiscalPeriod as [ActualPaymentDateFiscalPeriod]
		, FiscalQuarter as [ActualPaymentDateFiscalQuarter]
		, FiscalYear as [ActualPaymentDateFiscalYear]
		, FiscalPeriodCode as [ActualPaymentDateFiscalPeriodCode]
		, FiscalPeriodName as [ActualPaymentDateFiscalPeriodName]
		, FiscalYearPeriod as [ActualPaymentDateFiscalYearPeriod]
		, FiscalYearQuarter as [ActualPaymentDateFiscalYearQuarter]
		, WorkDaysInFiscalPeriodTotal as [ActualPaymentDateWorkDaysInFiscalPeriodTotal]
		, WorkDaysInFiscalPeriodToDate as [ActualPaymentDateWorkDaysInFiscalPeriodToDate]
	from
		dbo.dimDate
go


if objectpropertyex(object_id(N'pbi.dimBudgetMonth'), N'IsView') = 1
	drop view pbi.dimBudgetMonth
go
set quoted_identifier on;
set ansi_nulls on;
go
create view [pbi].[dimBudgetMonth]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.dimBudgetMonth
DESCRIPTION:    Exposes date information for use with factInvoice.InvoiceDateKey
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    20-JUN-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		20-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------


**********************************************************************************************************************/
--</CommentHeader>

	select
		  min(DateKey) as [BudgetMonthKey]
		, FiscalPeriod as [BudgetFiscalPeriod]
		, FiscalQuarter as [BudgetFiscalQuarter]
		, FiscalYear as [BudgetFiscalYear]
		, FiscalPeriodCode as [BudgetFiscalPeriodCode]
		, FiscalPeriodName as [BudgetFiscalPeriodName]
		, FiscalYearPeriod as [BudgetFiscalYearPeriod]
		, FiscalYearQuarter as [BudgetFiscalYearQuarter]
		, WorkDaysInFiscalPeriodTotal as [BudgetWorkDaysInFiscalPeriodTotal]
	from
		dbo.dimDate
	group by
		  FiscalPeriod
		, FiscalQuarter
		, FiscalYear
		, FiscalPeriodCode
		, FiscalPeriodName
		, FiscalYearPeriod
		, FiscalYearQuarter
		, WorkDaysInFiscalPeriodTotal
go


if objectpropertyex(object_id(N'pbi.dimBusinessUnit'), N'IsView') = 1
	drop view pbi.dimBusinessUnit
go
set quoted_identifier on;
set ansi_nulls on;
go
create view [pbi].[dimBusinessUnit]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.dimBusinessUnit
DESCRIPTION:    Exposes current state of the Business Unit dimension imported from QlikView (no history available)
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    16-JUN-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		16-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------


**********************************************************************************************************************/
--</CommentHeader>

	select
		s.BusinessUnitKey
	  , s.SalesCenterSbuCode as [SBU]
	  , s.BusinessUnitName
	  , s.RegionName
	  , s.RegionDescription
	  , cast('19000101 00:00:00' as datetime) as [RowValidFromUTC]
	  , cast('99991231 23:59:59' as datetime) as [RowValidToUTC]
	  , cast('Y' as char(1)) as [IsCurrent]
	  , s.IsDeleted
	from
		qvi.dimBusinessUnit as s
go

if objectpropertyex(object_id(N'pbi.dimCustomerShippedTo'), N'IsView') = 1
	drop view pbi.dimCustomerShippedTo
go
set quoted_identifier on;
set ansi_nulls on;
go
create view [pbi].[dimCustomerShippedTo]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.dimCustomerShippedTo
DESCRIPTION:    Exposes current state of the Customer dimension imported from QlikView (no history available)
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    12-JUN-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		12-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------


**********************************************************************************************************************/
--</CommentHeader>

	select
		  c.CustomerKey
		, c.CustomerNumber
		, c.CustomerName
		, c.CustomerAddress1
		, c.CustomerAddress2
		, c.CustomerAddress3
		, c.CustomerZipCode
		, c.CustomerCity
		, c.CustomerCountry
		, c.CustomerVatNumber
		, c.CustomerTypeId
		, c.CustomerTypeName
		, c.CustomerGroup1
		, c.CustomerGroup2
		, c.CustomerGroup3
		, c.CustomerGroup4
		, c.CustomerGroup5
		, c.CategoryIsMapped
		, c.CustomerCategoryBaseLevel
		, c.CustomerCategoryLevel1
		, c.CustomerCategoryLevel2
		, c.CustomerCategoryLevel3
		, c.CustomerCategoryLevel4
		, c.CustomerCategoryLevel5
		, c.CustomerCategoryLevel6
		, c.CustomerCategoryLevel7
		, c.CustomerCategoryLevel8
		, cast('19000101 00:00:00' as datetime) as [RowValidFromUTC]
		, cast('99991231 23:59:59' as datetime) as [RowValidToUTC]
		, cast('Y' as char(1)) as [IsCurrent]
		, c.IsDeleted
	from
		qvi.dimCustomer as c
go

if objectpropertyex(object_id(N'pbi.dimCustomerSoldTo'), N'IsView') = 1
	drop view pbi.dimCustomerSoldTo
go
set quoted_identifier on;
set ansi_nulls on;
go
create view [pbi].[dimCustomerSoldTo]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.dimCustomerSoldTo
DESCRIPTION:    Exposes current state of the Customer dimension imported from QlikView (no history available)
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    20-JUN-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		20-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------


**********************************************************************************************************************/
--</CommentHeader>

	select
		  c.CustomerKey
		, c.CustomerNumber
		, c.CustomerName
		, c.CustomerAddress1
		, c.CustomerAddress2
		, c.CustomerAddress3
		, c.CustomerZipCode
		, c.CustomerCity
		, c.CustomerCountry
		, c.CustomerVatNumber
		, c.CustomerTypeId
		, c.CustomerTypeName
		, c.CustomerGroup1
		, c.CustomerGroup2
		, c.CustomerGroup3
		, c.CustomerGroup4
		, c.CustomerGroup5
		, c.CategoryIsMapped
		, c.CustomerCategoryBaseLevel
		, c.CustomerCategoryLevel1
		, c.CustomerCategoryLevel2
		, c.CustomerCategoryLevel3
		, c.CustomerCategoryLevel4
		, c.CustomerCategoryLevel5
		, c.CustomerCategoryLevel6
		, c.CustomerCategoryLevel7
		, c.CustomerCategoryLevel8
		, cast('19000101 00:00:00' as datetime) as [RowValidFromUTC]
		, cast('99991231 23:59:59' as datetime) as [RowValidToUTC]
		, cast('Y' as char(1)) as [IsCurrent]
		, c.IsDeleted
	from
		qvi.dimCustomer as c
go

if objectpropertyex(object_id(N'pbi.dimExpectedPaymentDate'), N'IsView') = 1
	drop view pbi.dimExpectedPaymentDate
go
set quoted_identifier on;
set ansi_nulls on;
go
create view [pbi].[dimExpectedPaymentDate]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.dimExpectedPaymentDate
DESCRIPTION:    Exposes date information for use with factInvoice.ExpectedPaymentDateKey
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    21-JUN-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		21-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------


**********************************************************************************************************************/
--</CommentHeader>

	select
		  DateKey as [ExpectedPaymentDateKey]
		, ActualDate as [ExpectedPaymentDate]
		, DateNameEU as [ExpectedPaymentDateNameEU]
		, DateNameUS as [ExpectedPaymentDateNameUS]
		, EnglishMonthCode as [ExpectedPaymentDateEnglishMonthCode]
		, EnglishMonthName as [ExpectedPaymentDateEnglishMonthName]
		, EnglishDayCode as [ExpectedPaymentDateEnglishDayCode]
		, EnglishDayName as [ExpectedPaymentDateEnglishDayName]
		, CalendarYear as [ExpectedPaymentDateCalendarYear]
		, CalendarQuarter as [ExpectedPaymentDateCalendarQuarter]
		, MonthNumberInYear as [ExpectedPaymentDateMonthNumberInYear]
		, WeekNumberInYear as [ExpectedPaymentDateWeekNumberInYear]
		, DayNumberInYear as [ExpectedPaymentDateDayNumberInYear]
		, DayNumberInMonth as [ExpectedPaymentDateDayNumberInMonth]
		, DayNumberInWeek as [ExpectedPaymentDateDayNumberInWeek]
		, YearMonth as [ExpectedPaymentDateYearMonth]
		, YearQuarter as [ExpectedPaymentDateYearQuarter]
		, IsWeekend as [ExpectedPaymentDateIsWeekend]
		, IsLastDayInMonth as [ExpectedPaymentDateIsLastDayInMonth]
		, MondayWeekCommencing as [ExpectedPaymentDateMondayWeekCommencing]
		, WorkDaysInMonthTotal as [ExpectedPaymentDateWorkDaysInMonthTotal]
		, WorkDaysInMonthToDate as [ExpectedPaymentDateWorkDaysInMonthToDate]
		, FiscalPeriod as [ExpectedPaymentDateFiscalPeriod]
		, FiscalQuarter as [ExpectedPaymentDateFiscalQuarter]
		, FiscalYear as [ExpectedPaymentDateFiscalYear]
		, FiscalPeriodCode as [ExpectedPaymentDateFiscalPeriodCode]
		, FiscalPeriodName as [ExpectedPaymentDateFiscalPeriodName]
		, FiscalYearPeriod as [ExpectedPaymentDateFiscalYearPeriod]
		, FiscalYearQuarter as [ExpectedPaymentDateFiscalYearQuarter]
		, WorkDaysInFiscalPeriodTotal as [ExpectedPaymentDateWorkDaysInFiscalPeriodTotal]
		, WorkDaysInFiscalPeriodToDate as [ExpectedPaymentDateWorkDaysInFiscalPeriodToDate]
	from
		dbo.dimDate
go

if objectpropertyex(object_id(N'pbi.dimInvoiceDate'), N'IsView') = 1
	drop view pbi.dimInvoiceDate
go
set quoted_identifier on;
set ansi_nulls on;
go
create view [pbi].[dimInvoiceDate]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.dimInvoiceDate
DESCRIPTION:    Exposes date information for use with factInvoice.InvoiceDateKey
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    20-JUN-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		20-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------


**********************************************************************************************************************/
--</CommentHeader>

	select
		  DateKey as [InvoiceDateKey]
		, ActualDate as [InvoiceDate]
		, DateNameEU as [InvoiceDateDateNameEU]
		, DateNameUS as [InvoiceDateDateNameUS]
		, EnglishMonthCode as [InvoiceDateEnglishMonthCode]
		, EnglishMonthName as [InvoiceDateEnglishMonthName]
		, EnglishDayCode as [InvoiceDateEnglishDayCode]
		, EnglishDayName as [InvoiceDateEnglishDayName]
		, CalendarYear as [InvoiceDateCalendarYear]
		, CalendarQuarter as [InvoiceDateCalendarQuarter]
		, MonthNumberInYear as [InvoiceDateMonthNumberInYear]
		, WeekNumberInYear as [InvoiceDateWeekNumberInYear]
		, DayNumberInYear as [InvoiceDateDayNumberInYear]
		, DayNumberInMonth as [InvoiceDateDayNumberInMonth]
		, DayNumberInWeek as [InvoiceDateDayNumberInWeek]
		, YearMonth as [InvoiceDateYearMonth]
		, YearQuarter as [InvoiceDateYearQuarter]
		, IsWeekend as [InvoiceDateIsWeekend]
		, IsLastDayInMonth as [InvoiceDateIsLastDayInMonth]
		, MondayWeekCommencing as [InvoiceDateMondayWeekCommencing]
		, WorkDaysInMonthTotal as [InvoiceDateWorkDaysInMonthTotal]
		, WorkDaysInMonthToDate as [InvoiceDateWorkDaysInMonthToDate]
		, FiscalPeriod as [InvoiceDateFiscalPeriod]
		, FiscalQuarter as [InvoiceDateFiscalQuarter]
		, FiscalYear as [InvoiceDateFiscalYear]
		, FiscalPeriodCode as [InvoiceDateFiscalPeriodCode]
		, FiscalPeriodName as [InvoiceDateFiscalPeriodName]
		, FiscalYearPeriod as [InvoiceDateFiscalYearPeriod]
		, FiscalYearQuarter as [InvoiceDateFiscalYearQuarter]
		, WorkDaysInFiscalPeriodTotal as [InvoiceDateWorkDaysInFiscalPeriodTotal]
		, WorkDaysInFiscalPeriodToDate as [InvoiceDateWorkDaysInFiscalPeriodToDate]
	from
		dbo.dimDate
go

if objectpropertyex(object_id(N'pbi.dimPaymentTerm'), N'IsView') = 1
	drop view pbi.dimPaymentTerm
go
set quoted_identifier on;
set ansi_nulls on;
go
create view [pbi].[dimPaymentTerm]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.dimPaymentTerm
DESCRIPTION:    Exposes current state of the PaymentTerm dimension imported from QlikView (no history available)
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    12-JUN-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		12-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------


**********************************************************************************************************************/
--</CommentHeader>

	select
		  PaymentTermKey
		, PaymentTermName
		, PaymentTermDays
		, PaymentTermDescription
		, cast('19000101 00:00:00' as datetime) as [RowValidFromUTC]
		, cast('99991231 23:59:59' as datetime) as [RowValidToUTC]
		, cast('Y' as char(1)) as [IsCurrent]
		, IsDeleted
	from
		qvi.dimPaymentTerm
go

if objectpropertyex(object_id(N'pbi.dimProduct'), N'IsView') = 1
	drop view pbi.dimProduct
go
set quoted_identifier on;
set ansi_nulls on;
go
create view [pbi].[dimProduct]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.dimProduct
DESCRIPTION:    Exposes current state of the Product dimension imported from QlikView (no history available)
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    12-JUN-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		12-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------


**********************************************************************************************************************/
--</CommentHeader>

	select
		  p.ProductKey
		, p.ProductNumber
		, p.ProductName
		, p.ProductTypeId
		, p.ProductTypeName
		, p.ProductGnit
		, p.ProductDescription1
		, p.ProductDescription2
		, p.LocalProductGroup1
		, p.LocalProductGroup2
		, p.LocalProductGroup3
		, p.LocalProductGroup4
		, p.LocalProductGroup5
		, p.NativeProductCategoryKey
		, p.ProductCategoryBaseLevel
		, p.ProductCategoryLevel1
		, p.ProductCategoryLevel2
		, p.ProductCategoryLevel3
		, p.ProductCategoryLevel4
		, p.ProductCategoryLevel5
		, p.EnglishProductName
		, p.EnglishProductTypeName
		, p.EnglishProductDescription1
		, p.EnglishProductDescription2
		, p.EnglishConfidenceScore
		, cast('19000101 00:00:00' as datetime) as [RowValidFromUTC]
		, cast('99991231 23:59:59' as datetime) as [RowValidToUTC]
		, cast('Y' as char(1)) as [IsCurrent]
		, p.IsDeleted
	from
		qvi.dimProduct as p
go

if objectpropertyex(object_id(N'pbi.dimProductCategory'), N'IsView') = 1
	drop view pbi.dimProductCategory
go
set quoted_identifier on;
set ansi_nulls on;
go
create view [pbi].[dimProductCategory]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.dimProductCategory
DESCRIPTION:    Exposes current state of the Product Category dimension imported from QlikView (no history available)
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    19-JUN-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		19-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------


**********************************************************************************************************************/
--</CommentHeader>

	select
		  s.ProductCategoryKey
		, ProductCategoryId
		, ProductCategoryName
		, NodeDepth
		, Level3Id
		, Level3Name
		, Level2Id
		, Level2Name
		, Level1Id
		, Level1Name
		, ProductCategoryDescription 
		, cast('19000101 00:00:00' as datetime) as [RowValidFromUTC]
		, cast('99991231 23:59:59' as datetime) as [RowValidToUTC]
		, cast('Y' as char(1)) as [IsCurrent]
		, s.IsDeleted
	from
		qvi.dimProductCategory as s
go

if objectpropertyex(object_id(N'pbi.dimPromisedDeliveryDate'), N'IsView') = 1
	drop view pbi.dimPromisedDeliveryDate
go
set quoted_identifier on;
set ansi_nulls on;
go
create view [pbi].[dimPromisedDeliveryDate]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.dimPromisedDeliveryDate
DESCRIPTION:    Exposes date information for use with factOrder.PromisedDeliveryDateKey (when implemented)
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    21-JUN-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		21-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------


**********************************************************************************************************************/
--</CommentHeader>

	select
		  DateKey as [PromisedDeliveryDateKey]
		, ActualDate as [PromisedDeliveryDate]
		, DateNameEU as [PromisedDeliveryDateNameEU]
		, DateNameUS as [PromisedDeliveryDateNameUS]
		, EnglishMonthCode as [PromisedDeliveryDateEnglishMonthCode]
		, EnglishMonthName as [PromisedDeliveryDateEnglishMonthName]
		, EnglishDayCode as [PromisedDeliveryDateEnglishDayCode]
		, EnglishDayName as [PromisedDeliveryDateEnglishDayName]
		, CalendarYear as [PromisedDeliveryDateCalendarYear]
		, CalendarQuarter as [PromisedDeliveryDateCalendarQuarter]
		, MonthNumberInYear as [PromisedDeliveryDateMonthNumberInYear]
		, WeekNumberInYear as [PromisedDeliveryDateWeekNumberInYear]
		, DayNumberInYear as [PromisedDeliveryDateDayNumberInYear]
		, DayNumberInMonth as [PromisedDeliveryDateDayNumberInMonth]
		, DayNumberInWeek as [PromisedDeliveryDateDayNumberInWeek]
		, YearMonth as [PromisedDeliveryDateYearMonth]
		, YearQuarter as [PromisedDeliveryDateYearQuarter]
		, IsWeekend as [PromisedDeliveryDateIsWeekend]
		, IsLastDayInMonth as [PromisedDeliveryDateIsLastDayInMonth]
		, MondayWeekCommencing as [PromisedDeliveryDateMondayWeekCommencing]
		, WorkDaysInMonthTotal as [PromisedDeliveryDateWorkDaysInMonthTotal]
		, WorkDaysInMonthToDate as [PromisedDeliveryDateWorkDaysInMonthToDate]
		, FiscalPeriod as [PromisedDeliveryDateFiscalPeriod]
		, FiscalQuarter as [PromisedDeliveryDateFiscalQuarter]
		, FiscalYear as [PromisedDeliveryDateFiscalYear]
		, FiscalPeriodCode as [PromisedDeliveryDateFiscalPeriodCode]
		, FiscalPeriodName as [PromisedDeliveryDateFiscalPeriodName]
		, FiscalYearPeriod as [PromisedDeliveryDateFiscalYearPeriod]
		, FiscalYearQuarter as [PromisedDeliveryDateFiscalYearQuarter]
		, WorkDaysInFiscalPeriodTotal as [PromisedDeliveryDateWorkDaysInFiscalPeriodTotal]
		, WorkDaysInFiscalPeriodToDate as [PromisedDeliveryDateWorkDaysInFiscalPeriodToDate]
	from
		dbo.dimDate
go

if objectpropertyex(object_id(N'pbi.dimSite'), N'IsView') = 1
	drop view pbi.dimSite
go
set quoted_identifier on;
set ansi_nulls on;
go
create view [pbi].[dimSite]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.dimSite
DESCRIPTION:    Exposes current state of the Site dimension imported from QlikView (no history available)
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    12-JUN-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		12-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------


**********************************************************************************************************************/
--</CommentHeader>

	select
		s.SiteKey
	  , s.SiteName
	  , s.SiteDescription
	  , s.BusinessUnitKey
	  , s.SalesCenterSbuCode as [SBU]
	  , s.BusinessUnitName
	  , s.RegionName
	  , s.RegionDescription
	  , s.SourceSystemName
	  , cast('19000101 00:00:00' as datetime) as [RowValidFromUTC]
	  , cast('99991231 23:59:59' as datetime) as [RowValidToUTC]
	  , cast('Y' as char(1)) as [IsCurrent]
	  , s.IsDeleted
	from
		qvi.dimSite as s
go

if objectpropertyex(object_id(N'pbi.factBudgetSales'), N'IsView') = 1
	drop view pbi.factBudgetSales
go
set quoted_identifier on;
set ansi_nulls on;
go
create view [pbi].[factBudgetSales]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.factBudgetSales
DESCRIPTION:    Exposes current state of the BudgetSales facts imported from QlikView (no history available)
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    20-JUN-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		20-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------


**********************************************************************************************************************/
--</CommentHeader>

	select
		  BudgetSaleKey
		, LineCount
		, BusinessUnitKey
		, BudgetMonthDateKey
		, InstallationServices
		, ProducedGoods
		, GroupGoods
		, CommercialGoods
		, ExternalSales
		, IC_Transf_SBU
		, IC_Transf_Region
		, IC_Transf_Abroad
		, IC_Transf_US
		, Total_IC_Sales
		, TotalSalesAndTransfers
		, IsDeleted
	from
		qvi.factBudgetSales 
go

if objectpropertyex(object_id(N'pbi.factBudgetVolumes'), N'IsView') = 1
	drop view pbi.factBudgetVolumes
go
set quoted_identifier on;
set ansi_nulls on;
go
create view [pbi].[factBudgetVolumes]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.factBudgetVolumes
DESCRIPTION:    Exposes current state of the BudgetVolume facts imported from QlikView (no history available)
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    21-JUN-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		21-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------


**********************************************************************************************************************/
--</CommentHeader>

	select
		  BudgetVolumeKey
		, LineCount
		, BusinessUnitKey
		, ProductCategoryKey
		, Jan_YTD
		, Feb_YTD
		, Mar_YTD
		, Apr_YTD
		, May_YTD
		, Jun_YTD
		, Jul_YTD
		, Aug_YTD
		, Sep_YTD
		, Oct_YTD
		, Nov_YTD
		, Dec_YTD
		, IsDeleted
	from
		qvi.factBudgetVolumes
go

if objectpropertyex(object_id(N'pbi.factInvoice'), N'IsView') = 1
	drop view pbi.factInvoice
go
set quoted_identifier on;
set ansi_nulls on;
go
create view [pbi].[factInvoice]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.factInvoice
DESCRIPTION:    Exposes current state of the Invoice facts imported from QlikView (no history available)
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    13-JUN-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		13-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------


**********************************************************************************************************************/
--</CommentHeader>

	select
		  i.InvoiceKey
		, i.LineCount
		, i.InvoiceDateKey
		, i.InvoiceDate
		, i.InvoiceNumber
		, i.InvoiceLineNumber
		, i.NativeInvoiceLineNumber
		, i.OrderNumber
		, i.OrderLineNumber
		, i.NativeOrderLineNumber
		, i.NativeInvoiceType
		, i.InvoiceTypeName
		, i.LocalSellingSite
		, i.SiteKey
		, i.ProductKey
		, i.SoldToCustomerKey
		, i.ShippedToCustomerKey
		, i.NativeSalesPersonId
		, i.NativeSalesPersonName
		, i.DeliveryDateKey as [ActualDeliveryDateKey]
		, i.DeliveryDate as [ActualDeliveryDate]
		, i.ExpectedPaymentDateKey
		, i.ExpectedPaymentDate
		, i.ActualPaymentDateKey
		, i.ActualPaymentDate
		, i.LocalDeliveryTerm
		, i.LocalDeliveryTermText
		, i.PaymentTermKey
		, i.LocalPaymentTerm
		, i.LocalPaymentTermText
		, i.InvoiceQuantityValue
		, i.InvoiceQuantityUnitOfMeasure
		, i.StatisticQuantityValue
		, i.StatisticQuantityUnitOfMeasure
		, i.Quantity
		, i.LocalUnitOfMeasure
		, i.LocalUnitOfMeasureHarmonised
		, i.LocalUnitOfMeasureFactor
		, i.InvoiceAmount
		, i.LocalAmount
		, i.GroupAmountEUR
		, i.InvoiceCurrency
		, i.LocalCurrency
		, i.LineDiscountAmount
		, i.InvoiceDiscountAmount
		, i.LineBonusAmount
		, i.BonusShareAmount
		, i.StandardCost
		, i.StandardFreight
		--! Quick and dirty hack for Bob's Gross-to-Net Sales Report
		, cast(case when LocalCurrency <> InvoiceCurrency and LocalAmount > 0 and InvoiceAmount > 0 then LocalAmount / InvoiceAmount else 1 end as decimal(28,4)) as [InvoiceRate]
		, i.IsDeleted
	from
		qvi.factInvoice as i
go


if objectpropertyex(object_id(N'pbi.factOrderBacklog'), N'IsView') = 1
	drop view pbi.factOrderBacklog
go
set quoted_identifier on;
set ansi_nulls on;
go
create view [pbi].[factOrderBacklog]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.factOrderBacklog
DESCRIPTION:    Exposes current state of the Orders on backlog, i.e. promised but past or not delivered (imported
				from QlikView - no history available)
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    15-JUN-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		15-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------


**********************************************************************************************************************/
--</CommentHeader>

	select
		  osni.OrderBacklogKey
		, osni.LineCount
		, osni.OrderNumber
		, osni.OrderLineNumber
		, osni.NativeOrderLineNumber
		, osni.ExpectedInvoiceDateKey
		, osni.ExpectedInvoiceDate
		, osni.NativeOrderType
		, osni.OrderTypeName
		, osni.LocalSellingSite
		, osni.SiteKey
		, osni.ProductKey
		, osni.SoldToCustomerKey
		, osni.ShippedToCustomerKey
		, osni.NativeSalesPersonId
		, osni.NativeSalesPersonName
		, osni.OrderQuantityValue
		, osni.OrderQuantityUnitOfMeasure
		, osni.StatisticQuantityValue
		, osni.StatisticQuantityUnitOfMeasure
		, osni.Quantity
		, osni.LocalUnitOfMeasure
		, osni.LocalUnitOfMeasureHarmonised
		, osni.LocalUnitOfMeasureFactor
		, osni.OrderAmount
		, osni.LocalAmount
		, osni.GroupAmountEUR
		, osni.OrderCurrency
		, osni.LocalCurrency
		, osni.LineDiscountAmount
		, osni.OrderDiscountAmount
		, osni.LineBonusAmount
		, osni.BonusShareAmount
		--! Quick and dirty hack for Bob's Gross-to-Net Sales Report
		, cast(case when LocalCurrency <> OrderCurrency and LocalAmount > 0 and OrderAmount > 0 then LocalAmount / OrderAmount else 1 end as decimal(28,4)) as [InvoiceRate]
		, osni.IsDeleted
	from
		qvi.factOrderBacklog as osni
go


if objectpropertyex(object_id(N'pbi.factOrderShippedNotInvoiced'), N'IsView') = 1
	drop view pbi.factOrderShippedNotInvoiced
go
set quoted_identifier on;
set ansi_nulls on;
go
create view [pbi].[factOrderShippedNotInvoiced]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.factOrderShippedNotInvoiced
DESCRIPTION:    Exposes current state of the Orders that have been shipped but not invoiced (imported from QlikView
				- no history available)
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    14-JUN-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		14-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------


**********************************************************************************************************************/
--</CommentHeader>

	select
		  osni.OrderShippedNotInvoicedKey
		, osni.LineCount
		, osni.OrderNumber
		, osni.OrderLineNumber
		, osni.NativeOrderLineNumber
		, osni.NativeShippingDocumentKey
		, osni.ExpectedInvoiceDateKey
		, osni.ExpectedInvoiceDate
		, osni.NativeOrderType
		, osni.OrderTypeName
		, osni.LocalSellingSite
		, osni.SiteKey
		, osni.ProductKey
		, osni.SoldToCustomerKey
		, osni.ShippedToCustomerKey
		, osni.NativeSalesPersonId
		, osni.NativeSalesPersonName
		, osni.ShippedQuantityValue
		, osni.ShippedQuantityUnitOfMeasure
		, osni.StatisticQuantityValue
		, osni.StatisticQuantityUnitOfMeasure
		, osni.Quantity
		, osni.LocalUnitOfMeasure
		, osni.LocalUnitOfMeasureHarmonised
		, osni.LocalUnitOfMeasureFactor
		, osni.ShippedAmount
		, osni.LocalAmount
		, osni.GroupAmountEUR
		, osni.ShippedCurrency
		, osni.LocalCurrency
		, osni.LineDiscountAmount
		, osni.OrderDiscountAmount
		, osni.LineBonusAmount
		, osni.BonusShareAmount
		--! Quick and dirty hack for Bob's Gross-to-Net Sales Report
		, cast(case when LocalCurrency <> ShippedCurrency and LocalAmount > 0 and ShippedAmount > 0 then LocalAmount / ShippedAmount else 1 end as decimal(28,4)) as [InvoiceRate]
		, osni.IsDeleted
	from
		qvi.factOrderShippedNotInvoiced as osni
go


if objectpropertyex(object_id(N'pbi.factSaleForecastTotal'), N'IsView') = 1
	drop view pbi.factSaleForecastTotal
go
set quoted_identifier on;
set ansi_nulls on;
go
create view [pbi].[factSaleForecastTotal]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
VIEW NAME:      pbi.factSaleForecastTotal
DESCRIPTION:    Exposes current state of the Invoice facts imported from QlikView (no history available)
AUTHOR:         Greg M. Lucas
ORIGIN DATE:    20-JUN-2017

Additional Notes
================


REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		20-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------


**********************************************************************************************************************/
--</CommentHeader>

select
	  SiteKey
	, ProductKey
	, SoldToCustomerKey
	, ShippedToCustomerKey
	, sum(TotalGroupAmountEUR) as [TotalGroupAmountEUR]
from
	(
			select
				  i.SiteKey
				, i.ProductKey
				, i.SoldToCustomerKey
				, i.ShippedToCustomerKey
				, sum(coalesce(i.GroupAmountEUR, 0)) as [TotalGroupAmountEUR]
			from
				qvi.factInvoice as i
			where
				i.IsDeleted = 'N'
			group by
				  i.SiteKey
				, i.ProductKey
				, i.SoldToCustomerKey
				, i.ShippedToCustomerKey
		union
			select
				  osni.SiteKey
				, osni.ProductKey
				, osni.SoldToCustomerKey
				, osni.ShippedToCustomerKey
				, sum(coalesce(osni.GroupAmountEUR, 0)) as [TotalGroupAmountEUR]
			from
				qvi.factOrderShippedNotInvoiced as osni
			where
				osni.IsDeleted = 'N'
			group by
				  osni.SiteKey
				, osni.ProductKey
				, osni.SoldToCustomerKey
				, osni.ShippedToCustomerKey
		union
			select
				  ob.SiteKey
				, ob.ProductKey
				, ob.SoldToCustomerKey
				, ob.ShippedToCustomerKey
				, sum(coalesce(ob.GroupAmountEUR, 0)) as [TotalGroupAmountEUR]
			from
				qvi.factOrderBacklog as ob
			where
				ob.IsDeleted = 'N'
			group by
				  ob.SiteKey
				, ob.ProductKey
				, ob.SoldToCustomerKey
				, ob.ShippedToCustomerKey
	) as x
group by
	  SiteKey
	, ProductKey
	, SoldToCustomerKey
	, ShippedToCustomerKey
go


