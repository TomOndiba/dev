-- <Migration ID="ae53bbf8-0274-4933-8ebc-44b442241eb4" />
GO

PRINT N'Creating role AppDevelopersDEV'
GO
CREATE ROLE [AppDevelopersDEV]
AUTHORIZATION [dbo]
GO
PRINT N'Creating role AppDevelopersPROD'
GO
CREATE ROLE [AppDevelopersPROD]
AUTHORIZATION [dbo]
GO
PRINT N'Creating role AppDevelopersTEST'
GO
CREATE ROLE [AppDevelopersTEST]
AUTHORIZATION [dbo]
GO
PRINT N'Creating role AppSupportReadOnly'
GO
CREATE ROLE [AppSupportReadOnly]
AUTHORIZATION [dbo]
GO
PRINT N'Creating role BatchManagers'
GO
CREATE ROLE [BatchManagers]
AUTHORIZATION [dbo]
GO
PRINT N'Creating role BusinessAnalystsDEV'
GO
CREATE ROLE [BusinessAnalystsDEV]
AUTHORIZATION [dbo]
GO
PRINT N'Creating role BusinessAnalystsPROD'
GO
CREATE ROLE [BusinessAnalystsPROD]
AUTHORIZATION [dbo]
GO
PRINT N'Creating role BusinessAnalystsTEST'
GO
CREATE ROLE [BusinessAnalystsTEST]
AUTHORIZATION [dbo]
GO
PRINT N'Creating role CodeReviewers'
GO
CREATE ROLE [CodeReviewers]
AUTHORIZATION [dbo]
GO
PRINT N'Creating role DataFeedReaders'
GO
CREATE ROLE [DataFeedReaders]
AUTHORIZATION [dbo]
GO
PRINT N'Creating role DataFeedWriters'
GO
CREATE ROLE [DataFeedWriters]
AUTHORIZATION [dbo]
GO
PRINT N'Creating role DataFeeds'
GO
CREATE ROLE [DataFeeds]
AUTHORIZATION [dbo]
GO
PRINT N'Creating role DeploymentManagers'
GO
CREATE ROLE [DeploymentManagers]
AUTHORIZATION [dbo]
GO
PRINT N'Creating role EtlDevelopersDEV'
GO
CREATE ROLE [EtlDevelopersDEV]
AUTHORIZATION [dbo]
GO
PRINT N'Creating role EtlDevelopersPROD'
GO
CREATE ROLE [EtlDevelopersPROD]
AUTHORIZATION [dbo]
GO
PRINT N'Creating role EtlDevelopersTEST'
GO
CREATE ROLE [EtlDevelopersTEST]
AUTHORIZATION [dbo]
GO
PRINT N'Creating role PowerBiReporters'
GO
CREATE ROLE [PowerBiReporters]
AUTHORIZATION [dbo]
GO
PRINT N'Creating role SqlDevelopersDEV'
GO
CREATE ROLE [SqlDevelopersDEV]
AUTHORIZATION [dbo]
GO
PRINT N'Creating role SqlDevelopersPROD'
GO
CREATE ROLE [SqlDevelopersPROD]
AUTHORIZATION [dbo]
GO
PRINT N'Creating role SqlDevelopersTEST'
GO
CREATE ROLE [SqlDevelopersTEST]
AUTHORIZATION [dbo]
GO
PRINT N'Altering members of role CodeReviewers'
GO
EXEC sp_addrolemember N'CodeReviewers', N'EtlDevelopersDEV'
GO
PRINT N'Altering members of role db_datareader'
GO
EXEC sp_addrolemember N'db_datareader', N'AppDevelopersDEV'
GO
EXEC sp_addrolemember N'db_datareader', N'AppDevelopersTEST'
GO
EXEC sp_addrolemember N'db_datareader', N'AppSupportReadOnly'
GO
EXEC sp_addrolemember N'db_datareader', N'BusinessAnalystsDEV'
GO
EXEC sp_addrolemember N'db_datareader', N'BusinessAnalystsTEST'
GO
EXEC sp_addrolemember N'db_datareader', N'DeploymentManagers'
GO
EXEC sp_addrolemember N'db_datareader', N'EtlDevelopersDEV'
GO
EXEC sp_addrolemember N'db_datareader', N'EtlDevelopersTEST'
GO
EXEC sp_addrolemember N'db_datareader', N'SqlDevelopersDEV'
GO
EXEC sp_addrolemember N'db_datareader', N'SqlDevelopersPROD'
GO
EXEC sp_addrolemember N'db_datareader', N'SqlDevelopersTEST'
GO
PRINT N'Altering members of role db_datawriter'
GO
EXEC sp_addrolemember N'db_datawriter', N'AppDevelopersDEV'
GO
EXEC sp_addrolemember N'db_datawriter', N'DeploymentManagers'
GO
EXEC sp_addrolemember N'db_datawriter', N'SqlDevelopersDEV'
GO
EXEC sp_addrolemember N'db_datawriter', N'SqlDevelopersTEST'
GO
PRINT N'Altering members of role db_ddladmin'
GO
EXEC sp_addrolemember N'db_ddladmin', N'SqlDevelopersTEST'
GO
PRINT N'Altering members of role db_owner'
GO
EXEC sp_addrolemember N'db_owner', N'DeploymentManagers'
GO
EXEC sp_addrolemember N'db_owner', N'SqlDevelopersDEV'
GO
PRINT N'Creating schemas'
GO
CREATE SCHEMA [etl]
AUTHORIZATION [dbo]
GO
CREATE SCHEMA [log4]
AUTHORIZATION [dbo]
GO
CREATE SCHEMA [log4Private]
AUTHORIZATION [dbo]
GO
CREATE SCHEMA [log4Utils]
AUTHORIZATION [dbo]
GO
CREATE SCHEMA [pbi]
AUTHORIZATION [dbo]
GO
CREATE SCHEMA [qvstg]
AUTHORIZATION [dbo]
GO
CREATE SCHEMA [stg]
AUTHORIZATION [dbo]
GO
CREATE SCHEMA [utils]
AUTHORIZATION [dbo]
GO
PRINT N'Creating sequences'
GO
CREATE SEQUENCE [dbo].[ReferenceTypeHistorySequence]
AS bigint
START WITH 100001
INCREMENT BY 2
MINVALUE 1001
MAXVALUE 9223372036854775805
NO CYCLE
NO CACHE
GO
CREATE SEQUENCE [dbo].[ReferenceTypeKeySequence]
AS bigint
START WITH 100102
INCREMENT BY 2
MINVALUE 1002
MAXVALUE 9223372036854775806
NO CYCLE
NO CACHE
GO
PRINT N'Creating [qvstg].[Invoice]'
GO
CREATE TABLE [qvstg].[Invoice]
(
[InvoiceKey] [int] NOT NULL,
[IsDeleted] [char] (1) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NULL,
[EtlDeletedBy] [varchar] (200) NULL,
[DataSourceKey] [int] NOT NULL,
[QlikViewInvoiceKey] [nvarchar] (50) NOT NULL,
[LineCount] [int] NOT NULL,
[InvoiceDateKey] [int] NOT NULL,
[InvoiceDate] [datetime] NOT NULL,
[InvoiceNumber] [nvarchar] (20) NOT NULL,
[InvoiceLineNumber] [int] NOT NULL,
[NativeInvoiceLineNumber] [nvarchar] (20) NOT NULL,
[OrderNumber] [nvarchar] (20) NOT NULL,
[OrderLineNumber] [int] NOT NULL,
[NativeOrderLineNumber] [nvarchar] (20) NOT NULL,
[NativeInvoiceType] [nvarchar] (1) NOT NULL,
[InvoiceTypeName] [nvarchar] (29) NOT NULL,
[LocalSellingSite] [nvarchar] (20) NOT NULL,
[SiteKey] [int] NOT NULL,
[ProductKey] [int] NOT NULL,
[SoldToCustomerKey] [int] NOT NULL,
[ShippedToCustomerKey] [int] NOT NULL,
[NativeSalesPersonId] [nvarchar] (20) NOT NULL,
[NativeSalesPersonName] [nvarchar] (100) NOT NULL,
[DeliveryDateKey] [int] NOT NULL,
[DeliveryDate] [datetime] NULL,
[ExpectedPaymentDateKey] [int] NOT NULL,
[ExpectedPaymentDate] [datetime] NULL,
[ActualPaymentDateKey] [int] NOT NULL,
[ActualPaymentDate] [datetime] NULL,
[LocalDeliveryTerm] [nvarchar] (20) NOT NULL,
[LocalDeliveryTermText] [nvarchar] (100) NOT NULL,
[PaymentTermKey] [int] NOT NULL,
[LocalPaymentTerm] [nvarchar] (20) NOT NULL,
[LocalPaymentTermText] [nvarchar] (100) NOT NULL,
[InvoiceQuantityValue] [decimal] (12, 2) NULL,
[InvoiceQuantityUnitOfMeasure] [nvarchar] (20) NOT NULL,
[StatisticQuantityValue] [decimal] (12, 2) NULL,
[StatisticQuantityUnitOfMeasure] [nvarchar] (20) NOT NULL,
[Quantity] [decimal] (12, 2) NULL,
[LocalUnitOfMeasure] [nvarchar] (20) NOT NULL,
[LocalUnitOfMeasureHarmonised] [nvarchar] (20) NOT NULL,
[LocalUnitOfMeasureFactor] [decimal] (11, 4) NULL,
[InvoiceAmount] [decimal] (15, 4) NULL,
[LocalAmount] [decimal] (15, 4) NULL,
[GroupAmountEUR] [decimal] (15, 4) NULL,
[InvoiceCurrency] [nvarchar] (3) NOT NULL,
[LocalCurrency] [nvarchar] (3) NOT NULL,
[LineDiscountAmount] [decimal] (15, 4) NULL,
[InvoiceDiscountAmount] [decimal] (15, 4) NULL,
[LineBonusAmount] [decimal] (15, 4) NULL,
[BonusShareAmount] [decimal] (15, 4) NULL,
[StandardCost] [decimal] (15, 4) NULL,
[StandardFreight] [decimal] (15, 4) NULL
)
GO
PRINT N'Creating primary key [PK_qvstg_Invoice] on [qvstg].[Invoice]'
GO
ALTER TABLE [qvstg].[Invoice] ADD CONSTRAINT [PK_qvstg_Invoice] PRIMARY KEY CLUSTERED  ([InvoiceKey])
GO
PRINT N'Adding constraints to [qvstg].[Invoice]'
GO
ALTER TABLE [qvstg].[Invoice] ADD CONSTRAINT [AK_qvstg_Invoice_UniqueifiedBusinessKey] UNIQUE NONCLUSTERED  ([DataSourceKey], [InvoiceNumber], [OrderNumber], [NativeInvoiceLineNumber], [NativeOrderLineNumber])
GO
PRINT N'Adding constraints to [qvstg].[Invoice]'
GO
ALTER TABLE [qvstg].[Invoice] ADD CONSTRAINT [AK_qvstg_Invoice_DataSourceKey_QlikViewInvoiceKey] UNIQUE NONCLUSTERED  ([DataSourceKey], [QlikViewInvoiceKey])
GO
PRINT N'Creating [qvstg].[Site]'
GO
CREATE TABLE [qvstg].[Site]
(
[SiteKey] [int] NOT NULL,
[IsDeleted] [char] (1) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NULL,
[EtlDeletedBy] [varchar] (200) NULL,
[NativeSiteKey] [nvarchar] (50) NOT NULL,
[SiteName] [nvarchar] (100) NOT NULL,
[SiteDescription] [nvarchar] (1000) NOT NULL,
[BusinessUnitKey] [int] NOT NULL,
[StrategicBusinessUnitCode] [nvarchar] (20) NOT NULL,
[SalesCenterSbuCode] [nvarchar] (20) NOT NULL,
[BusinessUnitName] [nvarchar] (100) NOT NULL,
[RegionId] [int] NULL,
[RegionName] [nvarchar] (50) NOT NULL,
[RegionDescription] [nvarchar] (1000) NOT NULL,
[DataSourceKey] [int] NULL,
[SourceSystemId] [int] NULL,
[SourceSystemName] [nvarchar] (100) NOT NULL
)
GO
PRINT N'Creating primary key [PK_qvstg_Site] on [qvstg].[Site]'
GO
ALTER TABLE [qvstg].[Site] ADD CONSTRAINT [PK_qvstg_Site] PRIMARY KEY CLUSTERED  ([SiteKey])
GO
PRINT N'Adding constraints to [qvstg].[Site]'
GO
ALTER TABLE [qvstg].[Site] ADD CONSTRAINT [AK_qvstg_Site_NativeSiteKey] UNIQUE NONCLUSTERED  ([NativeSiteKey])
GO
PRINT N'Creating [qvstg].[PaymentTerm]'
GO
CREATE TABLE [qvstg].[PaymentTerm]
(
[PaymentTermKey] [int] NOT NULL,
[IsDeleted] [char] (1) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NULL,
[EtlDeletedBy] [varchar] (200) NULL,
[NativePaymentTermKey] [nvarchar] (50) NOT NULL,
[PaymentTermName] [nvarchar] (100) NOT NULL,
[PaymentTermDays] [int] NULL,
[PaymentTermDescription] [nvarchar] (500) NOT NULL
)
GO
PRINT N'Creating primary key [PK_qvstg_PaymentTerm] on [qvstg].[PaymentTerm]'
GO
ALTER TABLE [qvstg].[PaymentTerm] ADD CONSTRAINT [PK_qvstg_PaymentTerm] PRIMARY KEY CLUSTERED  ([PaymentTermKey])
GO
PRINT N'Adding constraints to [qvstg].[PaymentTerm]'
GO
ALTER TABLE [qvstg].[PaymentTerm] ADD CONSTRAINT [AK_qvstg_PaymentTerm_NativePaymentTermKey] UNIQUE NONCLUSTERED  ([NativePaymentTermKey])
GO
PRINT N'Creating [qvstg].[Customer]'
GO
CREATE TABLE [qvstg].[Customer]
(
[CustomerKey] [int] NOT NULL,
[IsDeleted] [char] (1) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NULL,
[EtlDeletedBy] [varchar] (200) NULL,
[DataSourceKey] [int] NULL,
[NativeCustomerKey] [nvarchar] (50) NOT NULL,
[CustomerNumber] [nvarchar] (50) NOT NULL,
[CustomerName] [nvarchar] (100) NOT NULL,
[CustomerAddress1] [nvarchar] (100) NOT NULL,
[CustomerAddress2] [nvarchar] (100) NOT NULL,
[CustomerAddress3] [nvarchar] (100) NOT NULL,
[CustomerZipCode] [nvarchar] (100) NOT NULL,
[CustomerCity] [nvarchar] (100) NOT NULL,
[CustomerCountry] [nvarchar] (100) NOT NULL,
[CustomerVatNumber] [nvarchar] (50) NOT NULL,
[CustomerTypeId] [int] NULL,
[CustomerTypeName] [nvarchar] (100) NOT NULL,
[CustomerGroup1] [nvarchar] (100) NOT NULL,
[CustomerGroup2] [nvarchar] (100) NOT NULL,
[CustomerGroup3] [nvarchar] (100) NOT NULL,
[CustomerGroup4] [nvarchar] (100) NOT NULL,
[CustomerGroup5] [nvarchar] (100) NOT NULL,
[CategoryIsMapped] [char] (1) NOT NULL,
[NativeCustomerCategoryKey] [nvarchar] (100) NOT NULL,
[CustomerCategoryBaseLevel] [nvarchar] (200) NOT NULL,
[CustomerCategoryLevel1] [nvarchar] (100) NOT NULL,
[CustomerCategoryLevel2] [nvarchar] (100) NOT NULL,
[CustomerCategoryLevel3] [nvarchar] (100) NOT NULL,
[CustomerCategoryLevel4] [nvarchar] (100) NOT NULL,
[CustomerCategoryLevel5] [nvarchar] (100) NOT NULL,
[CustomerCategoryLevel6] [nvarchar] (100) NOT NULL,
[CustomerCategoryLevel7] [nvarchar] (100) NOT NULL,
[CustomerCategoryLevel8] [nvarchar] (100) NOT NULL
)
GO
PRINT N'Creating primary key [PK_qvstg_Customer] on [qvstg].[Customer]'
GO
ALTER TABLE [qvstg].[Customer] ADD CONSTRAINT [PK_qvstg_Customer] PRIMARY KEY CLUSTERED  ([CustomerKey])
GO
PRINT N'Adding constraints to [qvstg].[Customer]'
GO
ALTER TABLE [qvstg].[Customer] ADD CONSTRAINT [AK_qvstg_Customer_DataSourceKey_NativeCustomerKey] UNIQUE NONCLUSTERED  ([DataSourceKey], [NativeCustomerKey])
GO
PRINT N'Creating [qvstg].[Product]'
GO
CREATE TABLE [qvstg].[Product]
(
[ProductKey] [int] NOT NULL,
[IsDeleted] [char] (1) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NULL,
[EtlDeletedBy] [varchar] (200) NULL,
[DataSourceKey] [int] NOT NULL,
[NativeProductKey] [nvarchar] (50) NOT NULL,
[ProductNumber] [nvarchar] (50) NOT NULL,
[ProductName] [nvarchar] (100) NOT NULL,
[ProductTypeId] [int] NULL,
[ProductTypeName] [nvarchar] (50) NOT NULL,
[ProductGnit] [nvarchar] (50) NOT NULL,
[ProductDescription1] [nvarchar] (100) NOT NULL,
[ProductDescription2] [nvarchar] (100) NOT NULL,
[LocalProductGroup1] [nvarchar] (50) NOT NULL,
[LocalProductGroup2] [nvarchar] (50) NOT NULL,
[LocalProductGroup3] [nvarchar] (50) NOT NULL,
[LocalProductGroup4] [nvarchar] (50) NOT NULL,
[LocalProductGroup5] [nvarchar] (50) NOT NULL,
[NativeProductCategoryKey] [nvarchar] (100) NOT NULL,
[ProductCategoryBaseLevel] [nvarchar] (200) NOT NULL,
[ProductCategoryLevel1] [nvarchar] (200) NOT NULL,
[ProductCategoryLevel2] [nvarchar] (200) NOT NULL,
[ProductCategoryLevel3] [nvarchar] (200) NOT NULL,
[ProductCategoryLevel4] [nvarchar] (200) NOT NULL,
[ProductCategoryLevel5] [nvarchar] (200) NOT NULL
)
GO
PRINT N'Creating primary key [PK_qvstg_Product] on [qvstg].[Product]'
GO
ALTER TABLE [qvstg].[Product] ADD CONSTRAINT [PK_qvstg_Product] PRIMARY KEY CLUSTERED  ([ProductKey])
GO
PRINT N'Adding constraints to [qvstg].[Product]'
GO
ALTER TABLE [qvstg].[Product] ADD CONSTRAINT [AK_qvstg_Product_DataSourceKey_NativeProductKey] UNIQUE NONCLUSTERED  ([DataSourceKey], [NativeProductKey])
GO
PRINT N'Creating [qvstg].[BudgetSales]'
GO
CREATE TABLE [qvstg].[BudgetSales]
(
[BudgetSaleKey] [int] NOT NULL IDENTITY(100, 1),
[EtlDeltaHash] [char] (32) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NULL,
[EtlDeletedBy] [varchar] (200) NULL,
[IsDeleted] [char] (1) NOT NULL,
[LineCount] [int] NOT NULL,
[BusinessUnitKey] [int] NOT NULL,
[BudgetMonthDateKey] [int] NOT NULL,
[InstallationServices] [decimal] (28, 4) NULL,
[ProducedGoods] [decimal] (28, 4) NULL,
[GroupGoods] [decimal] (28, 4) NULL,
[CommercialGoods] [decimal] (28, 4) NULL,
[ExternalSales] [decimal] (28, 4) NULL,
[IC_Transf_SBU] [decimal] (28, 4) NULL,
[IC_Transf_Region] [decimal] (28, 4) NULL,
[IC_Transf_Abroad] [decimal] (28, 4) NULL,
[IC_Transf_US] [decimal] (28, 4) NULL,
[Total_IC_Sales] [decimal] (28, 4) NULL,
[TotalSalesAndTransfers] [decimal] (28, 4) NULL
)
GO
PRINT N'Creating primary key [PK_qvstg_BudgetSale] on [qvstg].[BudgetSales]'
GO
ALTER TABLE [qvstg].[BudgetSales] ADD CONSTRAINT [PK_qvstg_BudgetSale] PRIMARY KEY CLUSTERED  ([BudgetSaleKey])
GO
PRINT N'Adding constraints to [qvstg].[BudgetSales]'
GO
ALTER TABLE [qvstg].[BudgetSales] ADD CONSTRAINT [AK_qvstg_BudgetSale_BusinessUnitKey_BudgetMonthDateKey] UNIQUE NONCLUSTERED  ([BusinessUnitKey], [BudgetMonthDateKey])
GO
PRINT N'Creating index [NCI_qvstg_BudgetSale_LoadFilter] on [qvstg].[BudgetSales]'
GO
CREATE NONCLUSTERED INDEX [NCI_qvstg_BudgetSale_LoadFilter] ON [qvstg].[BudgetSales] ([BusinessUnitKey], [BudgetMonthDateKey], [EtlDeltaHash], [IsDeleted])
GO
PRINT N'Creating [qvstg].[BudgetVolumes]'
GO
CREATE TABLE [qvstg].[BudgetVolumes]
(
[BudgetVolumesKey] [int] NOT NULL IDENTITY(100, 1),
[EtlDeltaHash] [char] (32) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NULL,
[EtlDeletedBy] [varchar] (200) NULL,
[IsDeleted] [char] (1) NOT NULL,
[LineCount] [int] NOT NULL,
[BusinessUnitKey] [int] NOT NULL,
[ProductCategoryKey] [int] NOT NULL,
[Jan_YTD] [decimal] (28, 4) NULL,
[Feb_YTD] [decimal] (28, 4) NULL,
[Mar_YTD] [decimal] (28, 4) NULL,
[Apr_YTD] [decimal] (28, 4) NULL,
[May_YTD] [decimal] (28, 4) NULL,
[Jun_YTD] [decimal] (28, 4) NULL,
[Jul_YTD] [decimal] (28, 4) NULL,
[Aug_YTD] [decimal] (28, 4) NULL,
[Sep_YTD] [decimal] (28, 4) NULL,
[Oct_YTD] [decimal] (28, 4) NULL,
[Nov_YTD] [decimal] (28, 4) NULL,
[Dec_YTD] [decimal] (28, 4) NULL
)
GO
PRINT N'Creating primary key [PK_qvstg_BudgetVolumes] on [qvstg].[BudgetVolumes]'
GO
ALTER TABLE [qvstg].[BudgetVolumes] ADD CONSTRAINT [PK_qvstg_BudgetVolumes] PRIMARY KEY CLUSTERED  ([BudgetVolumesKey])
GO
PRINT N'Adding constraints to [qvstg].[BudgetVolumes]'
GO
ALTER TABLE [qvstg].[BudgetVolumes] ADD CONSTRAINT [AK_qvstg_BudgetVolumes_BusinessUnitKey_ProductCategoryKey] UNIQUE NONCLUSTERED  ([BusinessUnitKey], [ProductCategoryKey])
GO
PRINT N'Creating index [NCI_qvstg_BudgetVolumes_LoadFilter] on [qvstg].[BudgetVolumes]'
GO
CREATE NONCLUSTERED INDEX [NCI_qvstg_BudgetVolumes_LoadFilter] ON [qvstg].[BudgetVolumes] ([BusinessUnitKey], [ProductCategoryKey], [EtlDeltaHash], [IsDeleted])
GO
PRINT N'Creating [dbo].[DataSource]'
GO
CREATE TABLE [dbo].[DataSource]
(
[DataSourceKey] [int] NOT NULL CONSTRAINT [DF_DataSource_DataSourceKey] DEFAULT (NEXT VALUE FOR [dbo].[ReferenceTypeKeySequence]),
[DataSourceCode] [nvarchar] (20) NOT NULL,
[DataSourceName] [nvarchar] (50) NOT NULL,
[DataSourceGroup] [nvarchar] (50) NOT NULL,
[HostCountry] [nvarchar] (50) NOT NULL CONSTRAINT [DF_DataSource_HostCountry] DEFAULT (''),
[DataCountries] [nvarchar] (100) NOT NULL CONSTRAINT [DF_DataSource_DataCountries] DEFAULT (''),
[Narrative] [nvarchar] (500) NOT NULL CONSTRAINT [DF_DataSource_Narrative] DEFAULT (''),
[QlikViewSourceSystemId] [int] NULL,
[IsActive] [char] (1) NOT NULL CONSTRAINT [DF_DataSource_IsActive] DEFAULT ('Y')
)
GO
PRINT N'Creating primary key [PK_DataSource] on [dbo].[DataSource]'
GO
ALTER TABLE [dbo].[DataSource] ADD CONSTRAINT [PK_DataSource] PRIMARY KEY CLUSTERED  ([DataSourceKey])
GO
PRINT N'Adding constraints to [dbo].[DataSource]'
GO
ALTER TABLE [dbo].[DataSource] ADD CONSTRAINT [AK_DataSource_Code] UNIQUE NONCLUSTERED  ([DataSourceCode])
GO
PRINT N'Adding constraints to [dbo].[DataSource]'
GO
ALTER TABLE [dbo].[DataSource] ADD CONSTRAINT [AK_DataSource_Name] UNIQUE NONCLUSTERED  ([DataSourceName])
GO
PRINT N'Creating [log4Private].[JournalControl]'
GO
CREATE TABLE [log4Private].[JournalControl]
(
[ModuleName] [varchar] (255) NOT NULL,
[OnOffSwitch] [varchar] (3) NOT NULL
)
GO
PRINT N'Creating primary key [PK_JournalControl] on [log4Private].[JournalControl]'
GO
ALTER TABLE [log4Private].[JournalControl] ADD CONSTRAINT [PK_JournalControl] PRIMARY KEY CLUSTERED  ([ModuleName])
GO
PRINT N'Creating [dbo].[dimDate]'
GO
CREATE TABLE [dbo].[dimDate]
(
[DateKey] [int] NOT NULL,
[ActualDate] [date] NULL,
[DateNameEU] [varchar] (30) NOT NULL,
[DateNameUS] [varchar] (30) NOT NULL,
[EnglishMonthCode] [char] (3) NOT NULL,
[EnglishMonthName] [varchar] (10) NOT NULL,
[EnglishDayCode] [char] (3) NOT NULL,
[EnglishDayName] [varchar] (10) NOT NULL,
[CalendarYear] [int] NULL,
[CalendarQuarter] [tinyint] NULL,
[MonthNumberInYear] [tinyint] NULL,
[WeekNumberInYear] [tinyint] NULL,
[DayNumberInYear] [smallint] NULL,
[DayNumberInMonth] [tinyint] NULL,
[DayNumberInWeek] [tinyint] NULL,
[YearMonth] [varchar] (10) NOT NULL,
[YearQuarter] [varchar] (10) NOT NULL,
[IsWeekend] [varchar] (10) NOT NULL,
[IsLastDayInMonth] [varchar] (10) NOT NULL,
[MondayWeekCommencing] [date] NULL,
[WorkDaysInMonthTotal] [tinyint] NULL,
[WorkDaysInMonthToDate] [tinyint] NULL,
[FiscalPeriod] [tinyint] NULL,
[FiscalQuarter] [tinyint] NULL,
[FiscalYear] [int] NULL,
[FiscalPeriodCode] [char] (3) NOT NULL,
[FiscalPeriodName] [varchar] (10) NOT NULL,
[FiscalYearPeriod] [varchar] (10) NOT NULL,
[FiscalYearQuarter] [varchar] (10) NOT NULL,
[WorkDaysInFiscalPeriodTotal] [tinyint] NULL,
[WorkDaysInFiscalPeriodToDate] [tinyint] NULL
)
GO
PRINT N'Creating primary key [PK_dimDate] on [dbo].[dimDate]'
GO
ALTER TABLE [dbo].[dimDate] ADD CONSTRAINT [PK_dimDate] PRIMARY KEY CLUSTERED  ([DateKey])
GO
PRINT N'Creating [qvstg].[ProductCategory]'
GO
CREATE TABLE [qvstg].[ProductCategory]
(
[ProductCategoryKey] [int] NOT NULL,
[IsDeleted] [char] (1) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NULL,
[EtlDeletedBy] [varchar] (200) NULL,
[NativeProductCategoryKey] [nvarchar] (50) NOT NULL,
[ProductCategoryId] [int] NOT NULL,
[ProductCategoryName] [nvarchar] (100) NOT NULL,
[NodeDepth] [tinyint] NOT NULL,
[Level3Id] [int] NOT NULL,
[Level3Name] [nvarchar] (100) NOT NULL,
[Level2Id] [int] NOT NULL,
[Level2Name] [nvarchar] (100) NOT NULL,
[Level1Id] [int] NOT NULL,
[Level1Name] [nvarchar] (100) NOT NULL,
[ProductCategoryDescription] [nvarchar] (500) NOT NULL
)
GO
PRINT N'Creating primary key [PK_qvstg_ProductCategory] on [qvstg].[ProductCategory]'
GO
ALTER TABLE [qvstg].[ProductCategory] ADD CONSTRAINT [PK_qvstg_ProductCategory] PRIMARY KEY CLUSTERED  ([ProductCategoryKey])
GO
PRINT N'Adding constraints to [qvstg].[ProductCategory]'
GO
ALTER TABLE [qvstg].[ProductCategory] ADD CONSTRAINT [AK_qvstg_ProductCategory_NativeProductCategoryKey] UNIQUE NONCLUSTERED  ([NativeProductCategoryKey])
GO
PRINT N'Creating [qvstg].[OrderBacklog]'
GO
CREATE TABLE [qvstg].[OrderBacklog]
(
[OrderBacklogKey] [int] NOT NULL,
[IsDeleted] [char] (1) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NULL,
[EtlDeletedBy] [varchar] (200) NULL,
[DataSourceKey] [int] NOT NULL,
[QlikViewOrderBacklogKey] [nvarchar] (50) NOT NULL,
[LineCount] [int] NOT NULL,
[OrderNumber] [nvarchar] (50) NOT NULL,
[OrderLineNumber] [int] NOT NULL,
[NativeOrderLineNumber] [nvarchar] (50) NOT NULL,
[ExpectedInvoiceDateKey] [int] NOT NULL,
[ExpectedInvoiceDate] [datetime] NOT NULL,
[NativeOrderType] [nvarchar] (1) NOT NULL,
[OrderTypeName] [nvarchar] (50) NOT NULL,
[LocalSellingSite] [nvarchar] (50) NOT NULL,
[SiteKey] [int] NOT NULL,
[ProductKey] [int] NOT NULL,
[SoldToCustomerKey] [int] NOT NULL,
[ShippedToCustomerKey] [int] NOT NULL,
[NativeSalesPersonId] [nvarchar] (50) NOT NULL,
[NativeSalesPersonName] [nvarchar] (100) NOT NULL,
[OrderQuantityValue] [decimal] (12, 2) NULL,
[OrderQuantityUnitOfMeasure] [nvarchar] (20) NOT NULL,
[StatisticQuantityValue] [decimal] (12, 2) NULL,
[StatisticQuantityUnitOfMeasure] [nvarchar] (20) NOT NULL,
[Quantity] [decimal] (12, 2) NULL,
[LocalUnitOfMeasure] [nvarchar] (20) NOT NULL,
[LocalUnitOfMeasureHarmonised] [nvarchar] (20) NOT NULL,
[LocalUnitOfMeasureFactor] [decimal] (11, 4) NULL,
[OrderAmount] [decimal] (15, 4) NULL,
[LocalAmount] [decimal] (15, 4) NULL,
[GroupAmountEUR] [decimal] (15, 4) NULL,
[OrderCurrency] [nvarchar] (3) NOT NULL,
[LocalCurrency] [nvarchar] (3) NOT NULL,
[LineDiscountAmount] [decimal] (15, 4) NULL,
[OrderDiscountAmount] [decimal] (15, 4) NULL,
[LineBonusAmount] [decimal] (15, 4) NULL,
[BonusShareAmount] [decimal] (15, 4) NULL
)
GO
PRINT N'Creating primary key [PK_qvstg_OrderBacklog] on [qvstg].[OrderBacklog]'
GO
ALTER TABLE [qvstg].[OrderBacklog] ADD CONSTRAINT [PK_qvstg_OrderBacklog] PRIMARY KEY CLUSTERED  ([OrderBacklogKey])
GO
PRINT N'Adding constraints to [qvstg].[OrderBacklog]'
GO
ALTER TABLE [qvstg].[OrderBacklog] ADD CONSTRAINT [AK_qvstg_OrderBacklog_UniqueifiedBusinessKey] UNIQUE NONCLUSTERED  ([DataSourceKey], [OrderNumber], [NativeOrderLineNumber])
GO
PRINT N'Adding constraints to [qvstg].[OrderBacklog]'
GO
ALTER TABLE [qvstg].[OrderBacklog] ADD CONSTRAINT [AK_qvstg_OrderBacklog_DataSourceKey_QlikViewOrderBacklogKey] UNIQUE NONCLUSTERED  ([DataSourceKey], [QlikViewOrderBacklogKey])
GO
PRINT N'Creating [qvstg].[OrderShippedNotInvoiced]'
GO
CREATE TABLE [qvstg].[OrderShippedNotInvoiced]
(
[OrderShippedNotInvoicedKey] [int] NOT NULL,
[IsDeleted] [char] (1) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NULL,
[EtlDeletedBy] [varchar] (200) NULL,
[DataSourceKey] [int] NOT NULL,
[QlikViewOrderShippedNotInvoicedKey] [nvarchar] (50) NOT NULL,
[LineCount] [int] NOT NULL,
[OrderNumber] [nvarchar] (50) NOT NULL,
[OrderLineNumber] [int] NOT NULL,
[NativeOrderLineNumber] [nvarchar] (50) NOT NULL,
[NativeShippingDocumentKey] [nvarchar] (50) NOT NULL,
[ExpectedInvoiceDateKey] [int] NOT NULL,
[ExpectedInvoiceDate] [datetime] NOT NULL,
[NativeOrderType] [nvarchar] (1) NOT NULL,
[OrderTypeName] [nvarchar] (50) NOT NULL,
[LocalSellingSite] [nvarchar] (50) NOT NULL,
[SiteKey] [int] NOT NULL,
[ProductKey] [int] NOT NULL,
[SoldToCustomerKey] [int] NOT NULL,
[ShippedToCustomerKey] [int] NOT NULL,
[NativeSalesPersonId] [nvarchar] (50) NOT NULL,
[NativeSalesPersonName] [nvarchar] (100) NOT NULL,
[ShippedQuantityValue] [decimal] (12, 2) NULL,
[ShippedQuantityUnitOfMeasure] [nvarchar] (20) NOT NULL,
[StatisticQuantityValue] [decimal] (12, 2) NULL,
[StatisticQuantityUnitOfMeasure] [nvarchar] (20) NOT NULL,
[Quantity] [decimal] (12, 2) NULL,
[LocalUnitOfMeasure] [nvarchar] (20) NOT NULL,
[LocalUnitOfMeasureHarmonised] [nvarchar] (20) NOT NULL,
[LocalUnitOfMeasureFactor] [decimal] (11, 4) NULL,
[ShippedAmount] [decimal] (15, 4) NULL,
[LocalAmount] [decimal] (15, 4) NULL,
[GroupAmountEUR] [decimal] (15, 4) NULL,
[ShippedCurrency] [nvarchar] (3) NOT NULL,
[LocalCurrency] [nvarchar] (3) NOT NULL,
[LineDiscountAmount] [decimal] (15, 4) NULL,
[OrderDiscountAmount] [decimal] (15, 4) NULL,
[LineBonusAmount] [decimal] (15, 4) NULL,
[BonusShareAmount] [decimal] (15, 4) NULL
)
GO
PRINT N'Creating primary key [PK_qvstg_OrderShippedNotInvoiced] on [qvstg].[OrderShippedNotInvoiced]'
GO
ALTER TABLE [qvstg].[OrderShippedNotInvoiced] ADD CONSTRAINT [PK_qvstg_OrderShippedNotInvoiced] PRIMARY KEY CLUSTERED  ([OrderShippedNotInvoicedKey])
GO
PRINT N'Adding constraints to [qvstg].[OrderShippedNotInvoiced]'
GO
ALTER TABLE [qvstg].[OrderShippedNotInvoiced] ADD CONSTRAINT [AK_qvstg_OrderShippedNotInvoiced_UniqueifiedBusinessKey] UNIQUE NONCLUSTERED  ([DataSourceKey], [OrderNumber], [NativeOrderLineNumber], [NativeShippingDocumentKey])
GO
PRINT N'Adding constraints to [qvstg].[OrderShippedNotInvoiced]'
GO
ALTER TABLE [qvstg].[OrderShippedNotInvoiced] ADD CONSTRAINT [AK_qvstg_OrderShippedNotInvoiced_DataSourceKey_QlikViewOrderShippedNotInvoicedKey] UNIQUE NONCLUSTERED  ([DataSourceKey], [QlikViewOrderShippedNotInvoicedKey])
GO
PRINT N'Creating [qvstg].[BusinessUnit]'
GO
CREATE TABLE [qvstg].[BusinessUnit]
(
[BusinessUnitKey] [int] NOT NULL,
[IsDeleted] [char] (1) NOT NULL,
[EtlCreatedOn] [datetime] NOT NULL,
[EtlCreatedBy] [varchar] (200) NOT NULL,
[EtlUpdatedOn] [datetime] NOT NULL,
[EtlUpdatedBy] [varchar] (200) NOT NULL,
[EtlDeletedOn] [datetime] NULL,
[EtlDeletedBy] [varchar] (200) NULL,
[NativeBusinessUnitKey] [nvarchar] (50) NOT NULL,
[StrategicBusinessUnitCode] [nvarchar] (20) NOT NULL,
[SalesCenterSbuCode] [nvarchar] (20) NOT NULL,
[BusinessUnitName] [nvarchar] (100) NOT NULL,
[RegionId] [int] NULL,
[RegionName] [nvarchar] (50) NOT NULL,
[RegionDescription] [nvarchar] (1000) NOT NULL
)
GO
PRINT N'Creating primary key [PK_qvstg_BusinessUnit] on [qvstg].[BusinessUnit]'
GO
ALTER TABLE [qvstg].[BusinessUnit] ADD CONSTRAINT [PK_qvstg_BusinessUnit] PRIMARY KEY CLUSTERED  ([BusinessUnitKey])
GO
PRINT N'Adding constraints to [qvstg].[BusinessUnit]'
GO
ALTER TABLE [qvstg].[BusinessUnit] ADD CONSTRAINT [AK_qvstg_BusinessUnit_NativeBusinessUnitKey] UNIQUE NONCLUSTERED  ([NativeBusinessUnitKey])
GO
PRINT N'Creating [log4Private].[SqlException]'
GO
CREATE TABLE [log4Private].[SqlException]
(
[ExceptionId] [int] NOT NULL IDENTITY(1, 1),
[UtcDate] [datetime] NOT NULL CONSTRAINT [DF_SqlException_UtcDate] DEFAULT (getutcdate()),
[SystemDate] [datetime] NOT NULL CONSTRAINT [DF_SqlException_SystemDate] DEFAULT (getdate()),
[ErrorContext] [nvarchar] (512) NOT NULL,
[ErrorNumber] [int] NOT NULL,
[ErrorSeverity] [int] NOT NULL,
[ErrorState] [int] NOT NULL,
[ErrorProcedure] [nvarchar] (128) NOT NULL,
[ErrorLine] [int] NOT NULL,
[ErrorMessage] [nvarchar] (max) NOT NULL,
[ErrorDatabase] [nvarchar] (128) NOT NULL,
[SessionIdent] [int] NOT NULL,
[ServerName] [nvarchar] (128) NOT NULL,
[HostName] [nvarchar] (128) NOT NULL,
[ProgramName] [nvarchar] (128) NOT NULL,
[NTDomain] [nvarchar] (128) NOT NULL,
[NTUsername] [nvarchar] (128) NOT NULL,
[LoginName] [nvarchar] (128) NOT NULL,
[OriginalLoginName] [nvarchar] (128) NOT NULL,
[SessionLoginTime] [datetime] NULL
)
GO
PRINT N'Creating primary key [PK_SqlException] on [log4Private].[SqlException]'
GO
ALTER TABLE [log4Private].[SqlException] ADD CONSTRAINT [PK_SqlException] PRIMARY KEY CLUSTERED  ([ExceptionId])
GO
PRINT N'Creating [log4Private].[Severity]'
GO
CREATE TABLE [log4Private].[Severity]
(
[SeverityId] [int] NOT NULL,
[SeverityName] [varchar] (128) NOT NULL
)
GO
PRINT N'Creating primary key [PK_Severity] on [log4Private].[Severity]'
GO
ALTER TABLE [log4Private].[Severity] ADD CONSTRAINT [PK_Severity] PRIMARY KEY CLUSTERED  ([SeverityId])
GO
PRINT N'Adding constraints to [log4Private].[Severity]'
GO
ALTER TABLE [log4Private].[Severity] ADD CONSTRAINT [UQ_Severity_SeverityName] UNIQUE NONCLUSTERED  ([SeverityName])
GO
PRINT N'Creating [log4Private].[Journal]'
GO
CREATE TABLE [log4Private].[Journal]
(
[JournalId] [int] NOT NULL IDENTITY(1, 1),
[UtcDate] [datetime] NOT NULL CONSTRAINT [DF_Journal_UtcDate] DEFAULT (getutcdate()),
[SystemDate] [datetime] NOT NULL CONSTRAINT [DF_Journal_SystemDate] DEFAULT (getdate()),
[Task] [varchar] (128) NOT NULL CONSTRAINT [DF_Journal_Task] DEFAULT (''),
[FunctionName] [varchar] (256) NOT NULL,
[StepInFunction] [varchar] (128) NOT NULL,
[MessageText] [varchar] (512) NOT NULL,
[SeverityId] [int] NOT NULL,
[ExceptionId] [int] NULL,
[SessionId] [int] NOT NULL,
[ServerName] [nvarchar] (128) NOT NULL,
[DatabaseName] [nvarchar] (128) NOT NULL,
[HostName] [nvarchar] (128) NULL,
[ProgramName] [nvarchar] (128) NULL,
[NTDomain] [nvarchar] (128) NULL,
[NTUsername] [nvarchar] (128) NULL,
[LoginName] [nvarchar] (128) NULL,
[OriginalLoginName] [nvarchar] (128) NULL,
[SessionLoginTime] [datetime] NULL
)
GO
PRINT N'Creating primary key [PK_Journal] on [log4Private].[Journal]'
GO
ALTER TABLE [log4Private].[Journal] ADD CONSTRAINT [PK_Journal] PRIMARY KEY CLUSTERED  ([JournalId])
GO
PRINT N'Creating [log4Private].[JournalDetail]'
GO
CREATE TABLE [log4Private].[JournalDetail]
(
[JournalId] [int] NOT NULL,
[ExtraInfo] [varchar] (max) NULL
)
GO
PRINT N'Creating primary key [PK_JournalDetail] on [log4Private].[JournalDetail]'
GO
ALTER TABLE [log4Private].[JournalDetail] ADD CONSTRAINT [PK_JournalDetail] PRIMARY KEY CLUSTERED  ([JournalId])
GO
PRINT N'Creating [stg].[SSIS_STG_BUDGET_2017_Volume]'
GO
CREATE TABLE [stg].[SSIS_STG_BUDGET_2017_Volume]
(
[NativeBusinessUnit] [nvarchar] (200) NOT NULL,
[NativeProductCategory] [nvarchar] (200) NOT NULL,
[BusinessUnitKey] [int] NOT NULL,
[ProductCategoryKey] [int] NOT NULL,
[Jan_YTD] [decimal] (38, 16) NULL,
[Feb_YTD] [decimal] (38, 16) NULL,
[Mar_YTD] [decimal] (38, 16) NULL,
[Apr_YTD] [decimal] (38, 16) NULL,
[May_YTD] [decimal] (38, 16) NULL,
[Jun_YTD] [decimal] (38, 16) NULL,
[Jul_YTD] [decimal] (38, 16) NULL,
[Aug_YTD] [decimal] (38, 16) NULL,
[Sep_YTD] [decimal] (38, 16) NULL,
[Oct_YTD] [decimal] (38, 16) NULL,
[Nov_YTD] [decimal] (38, 16) NULL,
[Dec_YTD] [decimal] (38, 16) NULL
)
GO
PRINT N'Creating primary key [PK_stg_SSIS_STG_BUDGET_2017_Volume] on [stg].[SSIS_STG_BUDGET_2017_Volume]'
GO
ALTER TABLE [stg].[SSIS_STG_BUDGET_2017_Volume] ADD CONSTRAINT [PK_stg_SSIS_STG_BUDGET_2017_Volume] PRIMARY KEY CLUSTERED  ([NativeBusinessUnit], [NativeProductCategory])
GO
PRINT N'Creating [stg].[SSIS_STG_BUDGET_2017_Sales]'
GO
CREATE TABLE [stg].[SSIS_STG_BUDGET_2017_Sales]
(
[NativeBusinessUnit] [nvarchar] (200) NOT NULL,
[NativeMonthCode] [char] (3) NOT NULL,
[NativeRegionName] [nvarchar] (200) NOT NULL,
[BusinessUnitKey] [int] NOT NULL,
[DateKey] [int] NOT NULL,
[InstallationServices_10000] [decimal] (38, 16) NULL,
[ProducedGoods_10100] [decimal] (38, 16) NULL,
[GroupGoods_10200] [decimal] (38, 16) NULL,
[CommercialGoods_10300] [decimal] (38, 16) NULL,
[ExternalSales_11890] [decimal] (38, 16) NULL,
[IC_Transf_SBU_11000] [decimal] (38, 16) NULL,
[IC_Transf_Region_11100] [decimal] (38, 16) NULL,
[IC_Transf_Abroad_11200] [decimal] (38, 16) NULL,
[IC_Transf_US_11300] [decimal] (38, 16) NULL,
[Total_IC_Sales] [decimal] (38, 16) NULL,
[TotalSalesAndTransfers_11990] [decimal] (38, 16) NULL
)
GO
PRINT N'Creating primary key [PK_stg_SSIS_STG_BUDGET_2017_Sales] on [stg].[SSIS_STG_BUDGET_2017_Sales]'
GO
ALTER TABLE [stg].[SSIS_STG_BUDGET_2017_Sales] ADD CONSTRAINT [PK_stg_SSIS_STG_BUDGET_2017_Sales] PRIMARY KEY CLUSTERED  ([NativeBusinessUnit], [NativeMonthCode])
GO
PRINT N'Creating [stg].[SSIS_STG_BUDGET_2017_VolumeCheck]'
GO
CREATE TABLE [stg].[SSIS_STG_BUDGET_2017_VolumeCheck]
(
[RegionName] [nvarchar] (200) NOT NULL,
[ProductGroup] [nvarchar] (200) NOT NULL,
[Jan_YTD] [decimal] (38, 16) NULL,
[Feb_YTD] [decimal] (38, 16) NULL,
[Mar_YTD] [decimal] (38, 16) NULL,
[Apr_YTD] [decimal] (38, 16) NULL,
[May_YTD] [decimal] (38, 16) NULL,
[Jun_YTD] [decimal] (38, 16) NULL,
[Jul_YTD] [decimal] (38, 16) NULL,
[Aug_YTD] [decimal] (38, 16) NULL,
[Sep_YTD] [decimal] (38, 16) NULL,
[Oct_YTD] [decimal] (38, 16) NULL,
[Nov_YTD] [decimal] (38, 16) NULL,
[Dec_YTD] [decimal] (38, 16) NULL
)
GO
PRINT N'Creating primary key [PK_stg_SSIS_STG_BUDGET_2017_VolumeCheck] on [stg].[SSIS_STG_BUDGET_2017_VolumeCheck]'
GO
ALTER TABLE [stg].[SSIS_STG_BUDGET_2017_VolumeCheck] ADD CONSTRAINT [PK_stg_SSIS_STG_BUDGET_2017_VolumeCheck] PRIMARY KEY CLUSTERED  ([RegionName], [ProductGroup])
GO
PRINT N'Creating [stg].[SSIS_BUDGET_RegionLookup]'
GO
CREATE TABLE [stg].[SSIS_BUDGET_RegionLookup]
(
[RegionCode] [varchar] (8) NOT NULL,
[RegionName] [varchar] (50) NOT NULL,
[RegionLookup] [varchar] (50) NOT NULL
)
GO
PRINT N'Creating primary key [PK_stg_SSIS_BUDGET_RegionLookup] on [stg].[SSIS_BUDGET_RegionLookup]'
GO
ALTER TABLE [stg].[SSIS_BUDGET_RegionLookup] ADD CONSTRAINT [PK_stg_SSIS_BUDGET_RegionLookup] PRIMARY KEY CLUSTERED  ([RegionCode])
GO
PRINT N'Adding constraints to [stg].[SSIS_BUDGET_RegionLookup]'
GO
ALTER TABLE [stg].[SSIS_BUDGET_RegionLookup] ADD CONSTRAINT [AK_stg_SSIS_BUDGET_RegionLookup_RegionLookup] UNIQUE NONCLUSTERED  ([RegionLookup])
GO
PRINT N'Adding constraints to [stg].[SSIS_BUDGET_RegionLookup]'
GO
ALTER TABLE [stg].[SSIS_BUDGET_RegionLookup] ADD CONSTRAINT [AK_stg_SSIS_BUDGET_RegionLookup_RegionName] UNIQUE NONCLUSTERED  ([RegionName])
GO
PRINT N'Creating [stg].[SSIS_BUDGET_ProductCategoryLookup]'
GO
CREATE TABLE [stg].[SSIS_BUDGET_ProductCategoryLookup]
(
[ProductCategoryGroupId] [int] NOT NULL,
[ProductCategoryId] [int] NOT NULL,
[ProductCategoryName] [varchar] (50) NOT NULL,
[QlikViewCategoryLevel4Name] [varchar] (50) NOT NULL,
[QlikViewCategoryLevel4Id] [int] NULL,
[QlikViewCategoryLevel3Name] [varchar] (50) NOT NULL,
[QlikViewCategoryLevel3Id] [int] NULL,
[MatchConfidence] [tinyint] NOT NULL
)
GO
PRINT N'Creating primary key [PK_SSIS_BUDGET_ProductCategoryLookup] on [stg].[SSIS_BUDGET_ProductCategoryLookup]'
GO
ALTER TABLE [stg].[SSIS_BUDGET_ProductCategoryLookup] ADD CONSTRAINT [PK_SSIS_BUDGET_ProductCategoryLookup] PRIMARY KEY CLUSTERED  ([ProductCategoryId])
GO
PRINT N'Adding constraints to [stg].[SSIS_BUDGET_ProductCategoryLookup]'
GO
ALTER TABLE [stg].[SSIS_BUDGET_ProductCategoryLookup] ADD CONSTRAINT [AK_stg_SSIS_BUDGET_ProductCategoryLookup_Name] UNIQUE NONCLUSTERED  ([ProductCategoryName])
GO
PRINT N'Creating [stg].[SSIS_BUDGET_ProductCategoryGroupLookup]'
GO
CREATE TABLE [stg].[SSIS_BUDGET_ProductCategoryGroupLookup]
(
[ProductCategoryGroupId] [int] NOT NULL,
[ProductCategoryGroupName] [varchar] (50) NOT NULL,
[QlikViewCategoryLevel2Name] [varchar] (50) NOT NULL,
[QlikViewCategoryLevel2Id] [int] NULL
)
GO
PRINT N'Creating primary key [PK_stg_SSIS_BUDGET_ProductCategoryGroupLookup] on [stg].[SSIS_BUDGET_ProductCategoryGroupLookup]'
GO
ALTER TABLE [stg].[SSIS_BUDGET_ProductCategoryGroupLookup] ADD CONSTRAINT [PK_stg_SSIS_BUDGET_ProductCategoryGroupLookup] PRIMARY KEY CLUSTERED  ([ProductCategoryGroupId])
GO
PRINT N'Adding constraints to [stg].[SSIS_BUDGET_ProductCategoryGroupLookup]'
GO
ALTER TABLE [stg].[SSIS_BUDGET_ProductCategoryGroupLookup] ADD CONSTRAINT [AK_stg_SSIS_BUDGET_ProductCategoryGroupLookup_Name] UNIQUE NONCLUSTERED  ([ProductCategoryGroupName])
GO
PRINT N'Creating [stg].[SSIS_BUDGET_BusinessUnitLookup]'
GO
CREATE TABLE [stg].[SSIS_BUDGET_BusinessUnitLookup]
(
[RegionCode] [varchar] (8) NOT NULL,
[SBU] [varchar] (8) NOT NULL,
[BusinessUnitName] [varchar] (50) NOT NULL,
[BusinessUnitLookup] [varchar] (50) NOT NULL
)
GO
PRINT N'Creating primary key [PK_SSIS_BUDGET_BusinessUnitLookup] on [stg].[SSIS_BUDGET_BusinessUnitLookup]'
GO
ALTER TABLE [stg].[SSIS_BUDGET_BusinessUnitLookup] ADD CONSTRAINT [PK_SSIS_BUDGET_BusinessUnitLookup] PRIMARY KEY CLUSTERED  ([SBU])
GO
PRINT N'Adding constraints to [stg].[SSIS_BUDGET_BusinessUnitLookup]'
GO
ALTER TABLE [stg].[SSIS_BUDGET_BusinessUnitLookup] ADD CONSTRAINT [AK_stg_SSIS_BUDGET_BusinessUnitLookup__BusinessUnitLookup] UNIQUE NONCLUSTERED  ([BusinessUnitLookup])
GO
PRINT N'Adding constraints to [stg].[SSIS_BUDGET_BusinessUnitLookup]'
GO
ALTER TABLE [stg].[SSIS_BUDGET_BusinessUnitLookup] ADD CONSTRAINT [AK_stg_SSIS_BUDGET_BusinessUnitLookup_BusinessUnitName] UNIQUE NONCLUSTERED  ([BusinessUnitName])
GO
PRINT N'Creating [stg].[SSIS_LAND_BUDGET_2017_Volume]'
GO
CREATE TABLE [stg].[SSIS_LAND_BUDGET_2017_Volume]
(
[RecordId] [int] NOT NULL IDENTITY(1, 1),
[BusinessUnit] [nvarchar] (500) NULL,
[ProductGroup] [nvarchar] (500) NULL,
[Jan_YTD] [nvarchar] (500) NULL,
[Feb_YTD] [nvarchar] (500) NULL,
[Mar_YTD] [nvarchar] (500) NULL,
[Apr_YTD] [nvarchar] (500) NULL,
[May_YTD] [nvarchar] (500) NULL,
[Jun_YTD] [nvarchar] (500) NULL,
[Jul_YTD] [nvarchar] (500) NULL,
[Aug_YTD] [nvarchar] (500) NULL,
[Sep_YTD] [nvarchar] (500) NULL,
[Oct_YTD] [nvarchar] (500) NULL,
[Nov_YTD] [nvarchar] (500) NULL,
[Dec_YTD] [nvarchar] (500) NULL
)
GO
PRINT N'Creating [stg].[SSIS_STG_BUDGET_2017_SalesCheck]'
GO
CREATE TABLE [stg].[SSIS_STG_BUDGET_2017_SalesCheck]
(
[RegionName] [nvarchar] (200) NOT NULL,
[MonthCode] [char] (3) NOT NULL,
[InstallationServices_10000] [decimal] (38, 16) NULL,
[ProducedGoods_10100] [decimal] (38, 16) NULL,
[GroupGoods_10200] [decimal] (38, 16) NULL,
[CommercialGoods_10300] [decimal] (38, 16) NULL,
[ExternalSales_11890] [decimal] (38, 16) NULL,
[IC_Transf_SBU_11000] [decimal] (38, 16) NULL,
[IC_Transf_Region_11100] [decimal] (38, 16) NULL,
[IC_Transf_Abroad_11200] [decimal] (38, 16) NULL,
[IC_Transf_US_11300] [decimal] (38, 16) NULL,
[Total_IC_Sales] [decimal] (38, 16) NULL,
[TotalSalesAndTransfers_11990] [decimal] (38, 16) NULL
)
GO
PRINT N'Creating primary key [PK_stg_SSIS_STG_BUDGET_2017_SalesCheck] on [stg].[SSIS_STG_BUDGET_2017_SalesCheck]'
GO
ALTER TABLE [stg].[SSIS_STG_BUDGET_2017_SalesCheck] ADD CONSTRAINT [PK_stg_SSIS_STG_BUDGET_2017_SalesCheck] PRIMARY KEY CLUSTERED  ([RegionName], [MonthCode])
GO
PRINT N'Creating [stg].[SSIS_LAND_BUDGET_2017_Sales]'
GO
CREATE TABLE [stg].[SSIS_LAND_BUDGET_2017_Sales]
(
[RecordId] [int] NOT NULL IDENTITY(1, 1),
[MonthCode] [char] (3) NOT NULL,
[RowHeader] [nvarchar] (500) NULL,
[InstallationServices_10000] [nvarchar] (500) NULL,
[ProducedGoods_10100] [nvarchar] (500) NULL,
[GroupGoods_10200] [nvarchar] (500) NULL,
[CommercialGoods_10300] [nvarchar] (500) NULL,
[ExternalSales_11890] [nvarchar] (500) NULL,
[IC_Transf_SBU_11000] [nvarchar] (500) NULL,
[IC_Transf_Region_11100] [nvarchar] (500) NULL,
[IC_Transf_Abroad_11200] [nvarchar] (500) NULL,
[IC_Transf_US_11300] [nvarchar] (500) NULL,
[Total_IC_Sales] [nvarchar] (500) NULL,
[TotalSalesAndTransfers_11990] [nvarchar] (500) NULL
)
GO
PRINT N'Adding constraints to [dbo].[DataSource]'
GO
ALTER TABLE [dbo].[DataSource] ADD CONSTRAINT [CK_DataSource_IsActive] CHECK (([IsActive]='Y' OR [IsActive]='N'))
GO
PRINT N'Adding constraints to [log4Private].[JournalControl]'
GO
ALTER TABLE [log4Private].[JournalControl] ADD CONSTRAINT [CK_JournalControl_OnOffSwitch] CHECK (([OnOffSwitch]='OFF' OR [OnOffSwitch]='ON'))
GO
PRINT N'Adding constraints to [qvstg].[BudgetSales]'
GO
ALTER TABLE [qvstg].[BudgetSales] ADD CONSTRAINT [CK_qvstg_BudgetSale_IsDeleted] CHECK (([IsDeleted]='Y' OR [IsDeleted]='N'))
GO
PRINT N'Adding constraints to [qvstg].[BudgetVolumes]'
GO
ALTER TABLE [qvstg].[BudgetVolumes] ADD CONSTRAINT [CK_qvstg_BudgetVolumes_IsDeleted] CHECK (([IsDeleted]='Y' OR [IsDeleted]='N'))
GO
PRINT N'Adding constraints to [qvstg].[BusinessUnit]'
GO
ALTER TABLE [qvstg].[BusinessUnit] ADD CONSTRAINT [CK_qvstg_BusinessUnit_IsDeleted] CHECK (([IsDeleted]='Y' OR [IsDeleted]='N'))
GO
PRINT N'Adding constraints to [qvstg].[Customer]'
GO
ALTER TABLE [qvstg].[Customer] ADD CONSTRAINT [CK_qvstg_Customer_IsDeleted] CHECK (([IsDeleted]='Y' OR [IsDeleted]='N'))
GO
PRINT N'Adding constraints to [qvstg].[Invoice]'
GO
ALTER TABLE [qvstg].[Invoice] ADD CONSTRAINT [CK_qvstg_Invoice_IsDeleted] CHECK (([IsDeleted]='Y' OR [IsDeleted]='N'))
GO
PRINT N'Adding constraints to [qvstg].[OrderBacklog]'
GO
ALTER TABLE [qvstg].[OrderBacklog] ADD CONSTRAINT [CK_qvstg_OrderBacklog_IsDeleted] CHECK (([IsDeleted]='Y' OR [IsDeleted]='N'))
GO
PRINT N'Adding constraints to [qvstg].[OrderShippedNotInvoiced]'
GO
ALTER TABLE [qvstg].[OrderShippedNotInvoiced] ADD CONSTRAINT [CK_qvstg_OrderShippedNotInvoiced_IsDeleted] CHECK (([IsDeleted]='Y' OR [IsDeleted]='N'))
GO
PRINT N'Adding constraints to [qvstg].[PaymentTerm]'
GO
ALTER TABLE [qvstg].[PaymentTerm] ADD CONSTRAINT [CK_qvstg_PaymentTerm_IsDeleted] CHECK (([IsDeleted]='Y' OR [IsDeleted]='N'))
GO
PRINT N'Adding constraints to [qvstg].[ProductCategory]'
GO
ALTER TABLE [qvstg].[ProductCategory] ADD CONSTRAINT [CK_qvstg_ProductCategory_IsDeleted] CHECK (([IsDeleted]='Y' OR [IsDeleted]='N'))
GO
PRINT N'Adding constraints to [qvstg].[Product]'
GO
ALTER TABLE [qvstg].[Product] ADD CONSTRAINT [CK_qvstg_Product_IsDeleted] CHECK (([IsDeleted]='Y' OR [IsDeleted]='N'))
GO
PRINT N'Adding constraints to [qvstg].[Site]'
GO
ALTER TABLE [qvstg].[Site] ADD CONSTRAINT [CK_qvstg_Site_IsDeleted] CHECK (([IsDeleted]='Y' OR [IsDeleted]='N'))
GO
PRINT N'Adding foreign keys to [log4Private].[JournalDetail]'
GO
ALTER TABLE [log4Private].[JournalDetail] ADD CONSTRAINT [FK_JournalDetail_Journal] FOREIGN KEY ([JournalId]) REFERENCES [log4Private].[Journal] ([JournalId]) ON DELETE CASCADE
GO
PRINT N'Adding foreign keys to [log4Private].[Journal]'
GO
ALTER TABLE [log4Private].[Journal] ADD CONSTRAINT [FK_Journal_Severity] FOREIGN KEY ([SeverityId]) REFERENCES [log4Private].[Severity] ([SeverityId])
GO
ALTER TABLE [log4Private].[Journal] ADD CONSTRAINT [FK_Journal_SqlException] FOREIGN KEY ([ExceptionId]) REFERENCES [log4Private].[SqlException] ([ExceptionId])
GO
PRINT N'Adding foreign keys to [stg].[SSIS_BUDGET_BusinessUnitLookup]'
GO
ALTER TABLE [stg].[SSIS_BUDGET_BusinessUnitLookup] ADD CONSTRAINT [FK_SSIS_BUDGET_BusinessUnitLookup_Region] FOREIGN KEY ([RegionCode]) REFERENCES [stg].[SSIS_BUDGET_RegionLookup] ([RegionCode])
GO
PRINT N'Adding foreign keys to [stg].[SSIS_BUDGET_ProductCategoryLookup]'
GO
ALTER TABLE [stg].[SSIS_BUDGET_ProductCategoryLookup] ADD CONSTRAINT [FK_SSIS_BUDGET_ProductCategoryLookup_ProductCategoryGroup] FOREIGN KEY ([ProductCategoryGroupId]) REFERENCES [stg].[SSIS_BUDGET_ProductCategoryGroupLookup] ([ProductCategoryGroupId])
GO
PRINT N'Creating extended properties'
GO
EXEC sp_addextendedproperty N'MS_Description', N'This table records all Data Warehouse-specific data sources corresponding to the source of e.g. SAP-GBR, SAP-AUT, M3-ESP, M3-FRA etc', 'SCHEMA', N'dbo', 'TABLE', N'DataSource', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'The country or countries represented by the data contained in this data source', 'SCHEMA', N'dbo', 'TABLE', N'DataSource', 'COLUMN', N'DataCountries'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Data Warehouse-specific short-code identifier for the originating data source of this record, that is, the ERP system behind QlikView (aka Source System) - corresponds to the schema name in the landing/staging area', 'SCHEMA', N'dbo', 'TABLE', N'DataSource', 'COLUMN', N'DataSourceCode'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Display heading to allow multiple data sources to be displayed under the same heading e.g. France might include M3-FRA, FRA-CEGID-COMP and FRA-CEGID-POLY', 'SCHEMA', N'dbo', 'TABLE', N'DataSource', 'COLUMN', N'DataSourceGroup'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Data Warehouse-specific unique identifier (primary key) for a data source (aka Source System)', 'SCHEMA', N'dbo', 'TABLE', N'DataSource', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Data Warehouse-specific, business-friendly unique name for a data source (aka Source System)', 'SCHEMA', N'dbo', 'TABLE', N'DataSource', 'COLUMN', N'DataSourceName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The country where the data source is hosted, the country business unit that "owns" the data', 'SCHEMA', N'dbo', 'TABLE', N'DataSource', 'COLUMN', N'HostCountry'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as deleted or otherwise inactive', 'SCHEMA', N'dbo', 'TABLE', N'DataSource', 'COLUMN', N'IsActive'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Detailed description (if any) of this data source', 'SCHEMA', N'dbo', 'TABLE', N'DataSource', 'COLUMN', N'Narrative'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Optional identifier of a source system as detailed in the QlikView database (Icopal_profBIS)', 'SCHEMA', N'dbo', 'TABLE', N'DataSource', 'COLUMN', N'QlikViewSourceSystemId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'This table represents the date dimension used in EDW and records all past, present and future dates along with their attributes for eaxmple, day of the week, month, quarter, year etc', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Optional - will always be populated for real dates but may be NULL (or an extreme like 01-Jan-1900 or 31-Dec-9999) for special cases', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'ActualDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Numeric representation of the quarter in the calendar year when ActualDate is populated - otherwise NULL', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'CalendarQuarter'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Numeric representation of the year when ActualDate is populated - otherwise NULL', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'CalendarYear'
GO
EXEC sp_addextendedproperty N'MS_Description', N'database-specific unique identifier for a date. Except for the special cases (unknown, not happened etc) the number will be an eight digit integer formatted to represent YYYYMMDD for readability', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'DateKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'When ActualDate is populated will usually be string in the standard EU date format of MM/DD/YYYY but may be some other text for special case dates', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'DateNameEU'
GO
EXEC sp_addextendedproperty N'MS_Description', N'When ActualDate is populated will usually be string in the standard US date format of DD/MM/YYYY but may be some other text for special case dates', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'DateNameUS'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Numeric representation of the day number in the month when ActualDate is populated - otherwise NULL', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'DayNumberInMonth'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Numeric representation of the day number in the week when ActualDate is populated - otherwise NULL', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'DayNumberInWeek'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Numeric representation of the day number in the calendar year when ActualDate is populated - otherwise NULL', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'DayNumberInYear'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Three letter abbreviation of English day name in English or other text for special cases', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'EnglishDayCode'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Full English day name or other text for special cases', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'EnglishDayName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Three letter abbreviation of English month name or other text for special cases', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'EnglishMonthCode'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Full English month name or other text for special cases', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'EnglishMonthName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'When ActualDate is populated will be the 4-4-5 financial period/month number (1-12), otherwise null', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'FiscalPeriod'
GO
EXEC sp_addextendedproperty N'MS_Description', N'When ActualDate is populated will be a string representation of the 4-4-5 financial period/month code (JAN-DEC)', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'FiscalPeriodCode'
GO
EXEC sp_addextendedproperty N'MS_Description', N'When ActualDate is populated will be a string representation of the 4-4-5 financial period/month full name (January-December)', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'FiscalPeriodName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'When ActualDate is populated will be the 4-4-5 financial quarter number (1-4), otherwise null', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'FiscalQuarter'
GO
EXEC sp_addextendedproperty N'MS_Description', N'When ActualDate is populated will be the 4-4-5 financial year reprsented as a four-digit number (should be the same as calendar year), otherwise null', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'FiscalYear'
GO
EXEC sp_addextendedproperty N'MS_Description', N'When ActualDate is populated will be a string representation of the 4-4-5 financial year and month in the form YYYY-MM - may be some other text for special cases', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'FiscalYearPeriod'
GO
EXEC sp_addextendedproperty N'MS_Description', N'When ActualDate is populated will be a string representation of the 4-4-5 financial year and quarter in the form YYYY-QN - may be some other text for special cases', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'FiscalYearQuarter'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Typically Y (Yes) or N (No) if Actual Date is populated, otherwise some other text for special cases', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'IsLastDayInMonth'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Typically Weekend or Weekday if Actual Date is populated, otherwise some other text for special cases', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'IsWeekend'
GO
EXEC sp_addextendedproperty N'MS_Description', N'When ActualDate is populated will be the date of the Monday in the week,  in which ActualDate falls - otherwise NULL.', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'MondayWeekCommencing'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Numeric representation of the month number in the calendar year when ActualDate is populated - otherwise NULL', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'MonthNumberInYear'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Numeric representation of the week number in the calendar year when ActualDate is populated - otherwise NULL', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'WeekNumberInYear'
GO
EXEC sp_addextendedproperty N'MS_Description', N'When ActualDate is populated will be the total number of normal working days to date in the month indicated by ActualDate, otherwise 0', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'WorkDaysInMonthToDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'When ActualDate is populated will be the number of normal working days in the month indicated by ActualDate, otherwise 0', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'WorkDaysInMonthTotal'
GO
EXEC sp_addextendedproperty N'MS_Description', N'When ActualDate is populated will be string representation of calendar year and month in the form YYYY-MM - may be some other text for special cases', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'YearMonth'
GO
EXEC sp_addextendedproperty N'MS_Description', N'When ActualDate is populated will be string representation of calendar year and quarter in the form YYYY-QN - may be some other text for special cases', 'SCHEMA', N'dbo', 'TABLE', N'dimDate', 'COLUMN', N'YearQuarter'
GO
PRINT N'Altering permissions on SCHEMA:: [INFORMATION_SCHEMA]'
GO
GRANT SELECT ON SCHEMA:: [INFORMATION_SCHEMA] TO [DataFeedReaders]
GO
GRANT SELECT ON SCHEMA:: [INFORMATION_SCHEMA] TO [DataFeeds]
GO
GRANT SELECT ON SCHEMA:: [INFORMATION_SCHEMA] TO [DataFeedWriters]
GO
PRINT N'Altering permissions on SCHEMA:: [dbo]'
GO
GRANT SELECT ON SCHEMA:: [dbo] TO [DataFeedReaders]
GO
GRANT SELECT ON SCHEMA:: [dbo] TO [DataFeeds]
GO
GRANT SELECT ON SCHEMA:: [dbo] TO [DataFeedWriters]
GO
PRINT N'Altering permissions on SCHEMA:: [etl]'
GO
GRANT SELECT ON SCHEMA:: [etl] TO [AppDevelopersPROD]
GO
GRANT SELECT ON SCHEMA:: [etl] TO [BatchManagers]
GO
GRANT SELECT ON SCHEMA:: [etl] TO [BusinessAnalystsPROD]
GO
GRANT SELECT ON SCHEMA:: [etl] TO [DataFeedWriters]
GO
GRANT EXECUTE ON SCHEMA:: [etl] TO [DataFeedWriters]
GO
GRANT SELECT ON SCHEMA:: [etl] TO [EtlDevelopersDEV]
GO
GRANT INSERT ON SCHEMA:: [etl] TO [EtlDevelopersDEV]
GO
GRANT DELETE ON SCHEMA:: [etl] TO [EtlDevelopersDEV]
GO
GRANT UPDATE ON SCHEMA:: [etl] TO [EtlDevelopersDEV]
GO
GRANT EXECUTE ON SCHEMA:: [etl] TO [EtlDevelopersDEV]
GO
GRANT SELECT ON SCHEMA:: [etl] TO [EtlDevelopersPROD]
GO
GRANT SELECT ON SCHEMA:: [etl] TO [EtlDevelopersTEST]
GO
GRANT UPDATE ON SCHEMA:: [etl] TO [EtlDevelopersTEST]
GO
GRANT EXECUTE ON SCHEMA:: [etl] TO [EtlDevelopersTEST]
GO
PRINT N'Altering permissions on SCHEMA:: [log4]'
GO
GRANT EXECUTE ON SCHEMA:: [log4] TO [public]
GO
PRINT N'Altering permissions on SCHEMA:: [log4Private]'
GO
GRANT SELECT ON SCHEMA:: [log4Private] TO [BatchManagers]
GO
PRINT N'Altering permissions on SCHEMA:: [log4Utils]'
GO
GRANT EXECUTE ON SCHEMA:: [log4Utils] TO [public]
GO
PRINT N'Altering permissions on SCHEMA:: [pbi]'
GO
GRANT SELECT ON SCHEMA:: [pbi] TO [PowerBiReporters]
GO
PRINT N'Altering permissions on SCHEMA:: [qvstg]'
GO
GRANT SELECT ON SCHEMA:: [qvstg] TO [AppDevelopersPROD]
GO
GRANT SELECT ON SCHEMA:: [qvstg] TO [BatchManagers]
GO
GRANT SELECT ON SCHEMA:: [qvstg] TO [BusinessAnalystsPROD]
GO
GRANT SELECT ON SCHEMA:: [qvstg] TO [DataFeedReaders]
GO
GRANT EXECUTE ON SCHEMA:: [qvstg] TO [DataFeedReaders]
GO
GRANT ALTER ON SCHEMA:: [qvstg] TO [DataFeeds]
GO
GRANT SELECT ON SCHEMA:: [qvstg] TO [DataFeeds]
GO
GRANT INSERT ON SCHEMA:: [qvstg] TO [DataFeeds]
GO
GRANT UPDATE ON SCHEMA:: [qvstg] TO [DataFeeds]
GO
GRANT EXECUTE ON SCHEMA:: [qvstg] TO [DataFeeds]
GO
GRANT ALTER ON SCHEMA:: [qvstg] TO [DataFeedWriters]
GO
GRANT SELECT ON SCHEMA:: [qvstg] TO [DataFeedWriters]
GO
GRANT INSERT ON SCHEMA:: [qvstg] TO [DataFeedWriters]
GO
GRANT UPDATE ON SCHEMA:: [qvstg] TO [DataFeedWriters]
GO
GRANT EXECUTE ON SCHEMA:: [qvstg] TO [DataFeedWriters]
GO
GRANT ALTER ON SCHEMA:: [qvstg] TO [EtlDevelopersDEV]
GO
GRANT SELECT ON SCHEMA:: [qvstg] TO [EtlDevelopersDEV]
GO
GRANT INSERT ON SCHEMA:: [qvstg] TO [EtlDevelopersDEV]
GO
GRANT DELETE ON SCHEMA:: [qvstg] TO [EtlDevelopersDEV]
GO
GRANT UPDATE ON SCHEMA:: [qvstg] TO [EtlDevelopersDEV]
GO
GRANT EXECUTE ON SCHEMA:: [qvstg] TO [EtlDevelopersDEV]
GO
GRANT SELECT ON SCHEMA:: [qvstg] TO [EtlDevelopersPROD]
GO
GRANT SELECT ON SCHEMA:: [qvstg] TO [EtlDevelopersTEST]
GO
GRANT INSERT ON SCHEMA:: [qvstg] TO [EtlDevelopersTEST]
GO
GRANT DELETE ON SCHEMA:: [qvstg] TO [EtlDevelopersTEST]
GO
GRANT UPDATE ON SCHEMA:: [qvstg] TO [EtlDevelopersTEST]
GO
PRINT N'Altering permissions on SCHEMA:: [stg]'
GO
GRANT SELECT ON SCHEMA:: [stg] TO [AppDevelopersPROD]
GO
GRANT SELECT ON SCHEMA:: [stg] TO [BatchManagers]
GO
GRANT SELECT ON SCHEMA:: [stg] TO [BusinessAnalystsPROD]
GO
GRANT SELECT ON SCHEMA:: [stg] TO [DataFeedReaders]
GO
GRANT EXECUTE ON SCHEMA:: [stg] TO [DataFeedReaders]
GO
GRANT ALTER ON SCHEMA:: [stg] TO [DataFeedWriters]
GO
GRANT SELECT ON SCHEMA:: [stg] TO [DataFeedWriters]
GO
GRANT INSERT ON SCHEMA:: [stg] TO [DataFeedWriters]
GO
GRANT UPDATE ON SCHEMA:: [stg] TO [DataFeedWriters]
GO
GRANT EXECUTE ON SCHEMA:: [stg] TO [DataFeedWriters]
GO
GRANT ALTER ON SCHEMA:: [stg] TO [EtlDevelopersDEV]
GO
GRANT SELECT ON SCHEMA:: [stg] TO [EtlDevelopersDEV]
GO
GRANT INSERT ON SCHEMA:: [stg] TO [EtlDevelopersDEV]
GO
GRANT DELETE ON SCHEMA:: [stg] TO [EtlDevelopersDEV]
GO
GRANT UPDATE ON SCHEMA:: [stg] TO [EtlDevelopersDEV]
GO
GRANT EXECUTE ON SCHEMA:: [stg] TO [EtlDevelopersDEV]
GO
GRANT SELECT ON SCHEMA:: [stg] TO [EtlDevelopersPROD]
GO
GRANT SELECT ON SCHEMA:: [stg] TO [EtlDevelopersTEST]
GO
GRANT INSERT ON SCHEMA:: [stg] TO [EtlDevelopersTEST]
GO
GRANT DELETE ON SCHEMA:: [stg] TO [EtlDevelopersTEST]
GO
GRANT UPDATE ON SCHEMA:: [stg] TO [EtlDevelopersTEST]
GO
