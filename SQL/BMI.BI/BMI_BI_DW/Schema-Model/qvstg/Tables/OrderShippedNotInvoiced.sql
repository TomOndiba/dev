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
ALTER TABLE [qvstg].[OrderShippedNotInvoiced] ADD CONSTRAINT [CK_qvstg_OrderShippedNotInvoiced_IsDeleted] CHECK (([IsDeleted]='Y' OR [IsDeleted]='N'))
GO
ALTER TABLE [qvstg].[OrderShippedNotInvoiced] ADD CONSTRAINT [PK_qvstg_OrderShippedNotInvoiced] PRIMARY KEY CLUSTERED  ([OrderShippedNotInvoicedKey])
GO
ALTER TABLE [qvstg].[OrderShippedNotInvoiced] ADD CONSTRAINT [AK_qvstg_OrderShippedNotInvoiced_DataSourceKey_QlikViewOrderShippedNotInvoicedKey] UNIQUE NONCLUSTERED  ([DataSourceKey], [QlikViewOrderShippedNotInvoicedKey])
GO
