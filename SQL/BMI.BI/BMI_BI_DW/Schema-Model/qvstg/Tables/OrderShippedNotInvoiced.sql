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
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory reference to the database-specific unique identifier for the original source system of this data record.', 'SCHEMA', N'qvstg', 'TABLE', N'OrderShippedNotInvoiced', 'COLUMN', N'DataSourceKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for this record being added.', 'SCHEMA', N'qvstg', 'TABLE', N'OrderShippedNotInvoiced', 'COLUMN', N'EtlCreatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process first added this record.', 'SCHEMA', N'qvstg', 'TABLE', N'OrderShippedNotInvoiced', 'COLUMN', N'EtlCreatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that last marked this record deleted/inactive; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'qvstg', 'TABLE', N'OrderShippedNotInvoiced', 'COLUMN', N'EtlDeletedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last marked this record deleted/inactive; not usually re-set to null if the record is subsequently re-activated/un-deleted.', 'SCHEMA', N'qvstg', 'TABLE', N'OrderShippedNotInvoiced', 'COLUMN', N'EtlDeletedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the module or mapping within the ETL process that was responsible for the last update for this record; will be the same as EtlCreatedBy when the record is first added.', 'SCHEMA', N'qvstg', 'TABLE', N'OrderShippedNotInvoiced', 'COLUMN', N'EtlUpdatedBy'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The ETL system date and time that the ETL process last updated this record; will be the same as EtlCreatedOn when the record is first added.', 'SCHEMA', N'qvstg', 'TABLE', N'OrderShippedNotInvoiced', 'COLUMN', N'EtlUpdatedOn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indicates that this record is marked as or has been physically deleted in the source system of record.', 'SCHEMA', N'qvstg', 'TABLE', N'OrderShippedNotInvoiced', 'COLUMN', N'IsDeleted'
GO
