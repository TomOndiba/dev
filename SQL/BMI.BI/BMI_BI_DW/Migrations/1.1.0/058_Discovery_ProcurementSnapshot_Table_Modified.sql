-- <Migration ID="6b0d1683-0ab8-474c-b41d-7b3b386d334d" />
GO

PRINT N'Altering [discovery].[ProcurementSnapshot]'
GO
ALTER TABLE [discovery].[ProcurementSnapshot] ADD
[ItemDescription] [nvarchar] (255) NULL,
[ConversionRate] [decimal] (15, 9) NULL,
[alternative] [nvarchar] (255) NULL,
[OrderedQtyConverted] [nvarchar] (255) NULL,
[ReceivedQuantityConverted] [nvarchar] (255) NULL,
[ApprovedQtyConverted] [nvarchar] (255) NULL,
[RejectedQtyConverted] [nvarchar] (255) NULL,
[StoredQtyConverted] [nvarchar] (255) NULL
GO
ALTER TABLE [discovery].[ProcurementSnapshot] ALTER COLUMN [product_category_direct] [int] NULL
GO
ALTER TABLE [discovery].[ProcurementSnapshot] ALTER COLUMN [EntryDate] [decimal] (8, 0) NULL
GO
ALTER TABLE [discovery].[ProcurementSnapshot] ALTER COLUMN [DataSource] [varchar] (14) NULL
GO
ALTER TABLE [discovery].[ProcurementSnapshot] ALTER COLUMN [DataSourceKey] [int] NOT NULL
GO
